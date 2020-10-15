<?php

namespace App\Http\Controllers;

use App\Federation;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

use Carbon\Carbon;
class FederationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {
            $federations = Federation::all();

            return response()->json([
                'success_message' => 'Federações recuperadas com sucesso!',
                'success_data' => $federations
            ], 200);
        }
        catch(\Exception $e){
            return response()->json([
                'error_type' => 'Erro no servidor',
                'error_message' => 'Aconteceu um erro interno',
                'error_description' => $e->getMessage()
            ], 500);
        }
    }

    public function GetFederationProjects($year) {
        try {
            $resultsResults = DB::table('projects')
            ->selectRaw('date_format(projects.signature_date, "%b") as x , sum(projects.project_quantity) as y')  
            ->join('junior_enterprise_project','projects.id','=','junior_enterprise_project.project_id')
            ->join('junior_enterprises','junior_enterprises.id','=','junior_enterprise_project.junior_enterprise_id')
            ->where(DB::raw('YEAR(projects.signature_date)'), '=', $year)
            ->groupBy(DB::raw('MONTH(projects.signature_date)'))
            ->get();

            $goal =  new Federation();
            $goal = collect($goal->getFederationProjectsByMonth($year)->first());
            
            $newResult = collect([]);

            if(sizeof($resultsResults) > 0) {
                for($i = 0; $i < 12; $i++){
                    $newResult[$i] = $resultsResults[$i];
                }
    
                for($i = 0; $i < 12; $i++){
                    if($i === 0){
                        $newResult[$i]->y = $resultsResults[$i]->y + 0;
                    }
                    else{
                    $newResult[$i]->y = $resultsResults[$i]->y + $resultsResults[$i - 1]->y;
                    }
                }
            }

            $results['project_results'] = $newResult;
            $results['project_goal'] = $goal->map(function($value, $key) {
                return ['x'=>$key, 'y'=>$value];
            })->values();
               
            return response()->json([
                'success_message' => 'Federação recuperada com sucesso!',
                'success_data' => $results
            ], 200);
        
        }
        catch(\Exception $e){
            return response()->json([
                'error_type' => 'Erro no servidor',
                'error_message' => 'Aconteceu um erro interno',
                'error_description' => $e->getMessage()
            ], 500);
        }  
    }

    public function GetFederationBilling($year) {
        try {
            $results[] = '';


            $resultResults = DB::table('projects')
            ->selectRaw('date_format(projects.signature_date, "%b") as x , sum(projects.billing) as y')  
            ->join('junior_enterprise_project','projects.id','=','junior_enterprise_project.project_id')
            ->join('junior_enterprises','junior_enterprises.id','=','junior_enterprise_project.junior_enterprise_id')
            ->where(DB::raw('YEAR(projects.signature_date)'), '=', $year)
            ->groupBy(DB::raw('MONTH(projects.signature_date)'))
            ->get();


            $newResult = collect([]);
            
            if(sizeof($resultResults) > 0) {
                for($i = 0; $i < 12; $i++){
                    $newResult[$i] = $resultResults[$i];
                }
    
                for($i = 0; $i < 12; $i++){
                    if($i === 0){
                        $newResult[$i]->y = $newResult[$i]->y + 0;
                    }
                    else{
                    $newResult[$i]->y = $newResult[$i]->y + $newResult[$i - 1]->y;
                    }
                    $newResult[$i]->y = (float) number_format( $newResult[$i]->y,2,'.','');

                }
            } 

            $federation_goal =  new Federation();
            $goal = collect($federation_goal->getFederationGoalByMonth($year)->first());


            $results['billing_results'] = $resultResults;
            $results['billing_goal'] = $goal->map(function($value, $key) {
                return ['x'=>$key, 'y'=>(float) number_format( $value,2,'.','')];
            })->values();


            return response()->json([
                'success_message' => 'Federação recuperada com sucesso!',
                'success_data' => $results
            ], 200);

        } catch(\Exception $e){
            return response()->json([
                'error_type' => 'Erro no servidor',
                'error_message' => 'Aconteceu um erro interno',
                'error_description' => $e->getMessage()
            ], 500);
        }
    }

    public function GetLeadersBattle($year) {
        $currentMonth = Carbon::now()->month;

        $result = DB::table('junior_enterprises as ej')
        ->selectRaw('ej.id as id_ej, ej.name as name, foundations.name as ies, cores.id as core_id, cores.name as core, cores.color as color, truncate((sum(projects.billing) / (junior_enterprise_goals.billing) * 100),6) as porc_fat, truncate((sum(projects.project_quantity) / (junior_enterprise_goals.projects) * 100),6) as porc_proj,  truncate(((junior_enterprise_goals.members_performing) / (junior_enterprise_goals.members_performing_goal) * 100),6) as porc_mem')  
        ->join('junior_enterprise_project','junior_enterprise_project.junior_enterprise_id','=','ej.id')
        ->join('projects','projects.id','=','junior_enterprise_project.project_id')
        ->join('junior_enterprise_goals','junior_enterprise_goals.junior_enterprise_id','=','ej.id')  
        ->join('cores','cores.id','=','ej.core_id')  
        ->join('foundations','foundations.id','=','ej.foundation_id')  
        ->where('junior_enterprise_goals.year', '=', $year)
        ->where(DB::raw('YEAR(projects.signature_date)'), '=', $year)
        ->groupBy('ej.id')
        ->get();


        $leaders['ac'] = 0;
        $leaders['green'] = 0;
        $leaders['yellow'] = 0;
        $leaders['red'] = 0;
        $ejs['ac'] = [];
        $ejs['green'] =[];
        $ejs['yellow'] =[];
        $ejs['red'] =[];

        
        $newResult = collect(['id']);

        for($i = 0; $i < sizeof($result); $i++) {
            $newResult[$i] = $result[$i];
            $newResult[$i]->porc = min( ((float) number_format( $result[$i]->porc_mem,3,'.','')), ((float) number_format( $result[$i]->porc_fat,3,'.','')),((float) number_format( $result[$i]->porc_proj,3,'.','')));

        if($newResult[$i]->porc >= 100){
            $leaders['ac'] = $leaders['ac'] + 1;
            $ejs['ac'][] = [
                'id' => $newResult[$i]->id_ej,
                'name' => $newResult[$i]->name,
                'ies' =>  $newResult[$i]->ies,
                'core' => [
                    'id' => $newResult[$i]->core_id,
                    'name' => $newResult[$i]->core,
                    'color' => $newResult[$i]->color
                ]
            ];
            
        }

        if($newResult[$i]->porc >= ($currentMonth * 8.33333) && $newResult[$i]->porc  < 100){
            $leaders['green'] = $leaders['green'] + 1;
            $ejs['green'][] = [
                'id' => $newResult[$i]->id_ej,
                'name' => $newResult[$i]->name,
                'ies' =>  $newResult[$i]->ies,
                'core' => [
                    'id' => $newResult[$i]->core_id,
                    'name' => $newResult[$i]->core,
                    'color' => $newResult[$i]->color
                ]
            ];
        }

        if($newResult[$i]->porc >= (($currentMonth-1) * 8.33333) && $newResult[$i]->porc  < ($currentMonth) * 8.3333){
            $leaders['yellow'] = $leaders['yellow'] + 1;
            $ejs['yellow'][] = [
                'id' => $newResult[$i]->id_ej,
                'name' => $newResult[$i]->name,
                'ies' =>  $newResult[$i]->ies,
                'core' => [
                    'id' => $newResult[$i]->core_id,
                    'name' => $newResult[$i]->core,
                    'color' => $newResult[$i]->color
                ]
            ];
        }

        if($newResult[$i]->porc < ($currentMonth * 8.3333)){
            $leaders['red'] = $leaders['red'] + 1;
            $ejs['red'][] = [
                'id' => $newResult[$i]->id_ej,
                'name' => $newResult[$i]->name,
                'ies' =>  $newResult[$i]->ies,
                'core' => [
                    'id' => $newResult[$i]->core_id,
                    'name' => $newResult[$i]->core,
                    'color' => $newResult[$i]->color
                ]
            ];
        }
        }

        return response()->json([
            'success_message' => 'Resultados!',
            'success_data' => $leaders,
            'ejs' => $ejs
        ], 200);
    }

    public function GetClusterByLight($year) {
        $currentMonth = Carbon::now()->month;

        $result = DB::table('junior_enterprises as ej')
        ->selectRaw('ej.name,junior_enterprise_goals.cluster as cluster, truncate((sum(projects.billing) / (junior_enterprise_goals.billing) * 100),6) as porc_fat, truncate((sum(projects.project_quantity) / (junior_enterprise_goals.projects) * 100),6) as porc_proj,  truncate(((junior_enterprise_goals.members_performing) / (junior_enterprise_goals.members_performing_goal) * 100),6) as porc_mem')  
        ->join('junior_enterprise_project','junior_enterprise_project.junior_enterprise_id','=','ej.id')
        ->join('projects','projects.id','=','junior_enterprise_project.project_id')
        ->join('junior_enterprise_goals','junior_enterprise_goals.junior_enterprise_id','=','ej.id')   
        ->where('junior_enterprise_goals.year', '=', $year)
        ->where(DB::raw('YEAR(projects.signature_date)'), '=', $year)
        ->groupBy('ej.name')
        ->get();

        $leaders['ac'] = [0,0,0,0,0];
        $leaders['green'] = [0,0,0,0,0];
        $leaders['yellow'] = [0,0,0,0,0];
        $leaders['red'] = [0,0,0,0,0];

        $newResult = collect();
        for($i = 0; $i < sizeof($result); $i++) {
            $newResult[$i] = $result[$i];
            $newResult[$i]->porc = min( ((float) number_format( $result[$i]->porc_mem,3,'.','')), ((float) number_format( $result[$i]->porc_fat,3,'.','')),((float) number_format( $result[$i]->porc_proj,3,'.','')));

        if($newResult[$i]->porc >= 100) {
            for($x = 1; $x < 6; $x++){
                if($newResult[$i]->cluster == $x){
                    $leaders['ac'][$x-1] =  $leaders['ac'][$x-1] + 1;
                }
            }
                
        }

        if($newResult[$i]->porc >= ($currentMonth * 8.33333) && $newResult[$i]->porc  < 100){
            for($x = 1; $x < 6; $x++){
                if($newResult[$i]->cluster == $x){
                    $leaders['green'][$x-1] =  $leaders['green'][$x-1] + 1;
                }
            }
        }

        if($newResult[$i]->porc >= (($currentMonth-1) * 8.33333) && $newResult[$i]->porc  < ($currentMonth) * 8.3333){
            for($x = 1; $x < 6; $x++){
                if($newResult[$i]->cluster == $x){
                    $leaders['yellow'][$x-1] =  $leaders['yellow'][$x-1] + 1;
                }
            }      
            }

        if($newResult[$i]->porc < ($currentMonth * 8.3333)){
            for($x = 1; $x < 6; $x++){
                if($newResult[$i]->cluster == $x){
                    $leaders['red'][$x-1] =  $leaders['red'][$x-1] + 1;
                }
            } 
            }
        }

        return response()->json([
            'success_message' => 'Resultados!',
            'success_data' => $leaders
        ], 200);
    }

    public function GetLightByCore($year) {
        $currentMonth = Carbon::now()->month;
        $core = DB::table('cores')
        ->selectRaw('cores.id as core_id, count(junior_enterprises.id) as ej_quantity, cores.name as core_name, cores.color as core_color, cores.image as core_image')
        ->join('junior_enterprises','junior_enterprises.core_id','=','cores.id')
        ->orderBy('cores.id', 'ASC')->groupBy('cores.name')
        ->get();
        
            $result = DB::table('junior_enterprises as ej')
            ->selectRaw('ej.core_id as core ,ej.name,junior_enterprise_goals.cluster as cluster, truncate((sum(projects.billing) / (junior_enterprise_goals.billing) * 100),6) as porc_fat, truncate((sum(projects.project_quantity) / (junior_enterprise_goals.projects) * 100),6) as porc_proj,  truncate(((junior_enterprise_goals.members_performing) / (junior_enterprise_goals.members_performing_goal) * 100),6) as porc_mem')  
            ->join('junior_enterprise_project','junior_enterprise_project.junior_enterprise_id','=','ej.id')
            ->join('projects','projects.id','=','junior_enterprise_project.project_id')
            ->join('junior_enterprise_goals','junior_enterprise_goals.junior_enterprise_id','=','ej.id')    
            ->join('cores','cores.id','=','ej.core_id')
            ->where('junior_enterprise_goals.year', '=', $year)
            ->where(DB::raw('YEAR(projects.signature_date)'), '=', $year)
            ->groupBy('ej.name')
            ->get();

            $leaders['ac'] = [0,0,0,0,0,0,0];
        $leaders['green'] = [0,0,0,0,0,0,0];
        $leaders['yellow'] = [0,0,0,0,0,0,0];
        $leaders['red'] = [0,0,0,0,0,0,0];


        $newResult = collect();
        for($i = 0; $i < sizeof($result); $i++) {
            $newResult[$i] = $result[$i];
            $newResult[$i]->porc = min( ((float) number_format( $result[$i]->porc_mem,3,'.','')), ((float) number_format( $result[$i]->porc_fat,3,'.','')),((float) number_format( $result[$i]->porc_proj,3,'.','')));

       if($newResult[$i]->porc >= 100) {
            for($x = 1; $x < 8; $x++){
                if($newResult[$i]->core == $x){
                    $leaders['ac'][$x-1] =  $leaders['ac'][$x-1] + 1;
                }
            }
                
        }

        if($newResult[$i]->porc >= ($currentMonth * 8.33333) && $newResult[$i]->porc  < 100){
            for($x = 1; $x < 8; $x++){
                if($newResult[$i]->core == $x){
                    $leaders['green'][$x-1] =  $leaders['green'][$x-1] + 1;
                }
            }
        }

        if($newResult[$i]->porc >= (($currentMonth-1) * 8.33333) && $newResult[$i]->porc  < ($currentMonth) * 8.3333){
            for($x = 1; $x < 8; $x++){
                if($newResult[$i]->core == $x){
                    $leaders['yellow'][$x-1] =  $leaders['yellow'][$x-1] + 1;
                }
            }      
            }

        if($newResult[$i]->porc < ($currentMonth * 8.3333)){
            for($x = 1; $x < 8; $x++){
                if($newResult[$i]->core == $x){
                    $leaders['red'][$x-1] =  $leaders['red'][$x-1] + 1;
                }
            } 
            }
        } 


        return response()->json([
            'success_message' => 'Resultados!',
            'success_data' => $leaders,
            'core' => $core
        ], 200);
    }

    public function GetBillingByCore($year) {
        $resultResults = DB::table('cores')
        ->selectRaw('cores.name as x, SUM(projects.billing) as y')
        ->join('junior_enterprises','junior_enterprises.core_id', '=', 'cores.id')
        ->join('core_goals','cores.id','=','core_goals.core_id')
        ->join('junior_enterprise_project','junior_enterprises.id', '=', 'junior_enterprise_project.junior_enterprise_id')
        ->join('projects','junior_enterprise_project.project_id', '=', 'projects.id')
        ->where(DB::raw('YEAR(projects.signature_date)'),'=', $year)
        ->where('core_goals.year','=', $year)
        ->groupBy('cores.name')
        ->orderBy('cores.id','asc')
        ->get();
        
        
        $newResult = collect([]);
            
            if(sizeof($resultResults) > 0) {
                for($i = 0; $i < 7; $i++){
                    $newResult[$i] = $resultResults[$i];
                }
    
                for($i = 0; $i < 7; $i++){
                    $newResult[$i]->y = (float) number_format($newResult[$i]->y,2,'.','');
                }
            } 

            $colors = [];

            $core = DB::table('cores')
            ->selectRaw('cores.id as core_id, count(junior_enterprises.id) as ej_quantity, cores.name as core_name, cores.color as core_color, cores.image as core_image')
            ->join('junior_enterprises','junior_enterprises.core_id','=','cores.id')
            ->orderBy('cores.id', 'ASC')->groupBy('cores.name')
            ->get();

            for($p = 0; $p < 7; $p++){
                $colors[$p] = $core[$p]->core_color;
            }
            

        return response()->json([
            'success_message' => 'Resultados recuperados com sucesso!',
            'core' => $colors,
            'success_data' => $newResult
            
        ], 200);
    }

    public function GetEjsConnected($year) {
        $currentMonth = Carbon::now()->month;

        $result = DB::table('junior_enterprises as ej')
        ->selectRaw('ej.id as id_ej, junior_enterprise_goals.cluster as cluster, ej.name as name, foundations.name as ies, cores.id as core_id, cores.name as core, cores.color as color, truncate((sum(projects.billing) / (junior_enterprise_goals.billing) * 100),6) as porc_fat, truncate((sum(projects.project_quantity) / (junior_enterprise_goals.projects) * 100),6) as porc_proj,  truncate(((junior_enterprise_goals.members_performing) / (junior_enterprise_goals.members_performing_goal) * 100),6) as porc_mem, truncate(((junior_enterprise_goals.current_shared_actions) / (junior_enterprise_goals.shared_actions))*100,6) as porc_shared,truncate(((junior_enterprise_goals.current_members_events) / (junior_enterprise_goals.members_events))*100,6) as porc_event')  
        ->join('junior_enterprise_project','junior_enterprise_project.junior_enterprise_id','=','ej.id')
        ->join('projects','projects.id','=','junior_enterprise_project.project_id')
        ->join('junior_enterprise_goals','junior_enterprise_goals.junior_enterprise_id','=','ej.id')  
        ->join('cores','cores.id','=','ej.core_id')  
        ->join('foundations','foundations.id','=','ej.foundation_id')  
        ->where('junior_enterprise_goals.year', '=', $year)
        ->where(DB::raw('YEAR(projects.signature_date)'), '=', $year)
        ->groupBy('ej.id')
        ->get();


        $leaders['ac'] = 0;
        $leaders['green'] = 0;
        $leaders['yellow'] = 0;
        $leaders['red'] = 0;
        $ejs = [];

        $newResult = collect(['id']);

        for($i = 0; $i < sizeof($result); $i++) {
            $newResult[$i] = $result[$i];
            $newResult[$i]->porc = min( ((float) number_format( $result[$i]->porc_mem,3,'.','')), ((float) number_format( $result[$i]->porc_fat,3,'.','')),((float) number_format( $result[$i]->porc_proj,3,'.','')));
            $newResult[$i]->porc_connected = min( ((float) number_format($result[$i]->porc_shared,3,'.','')), ((float) number_format($result[$i]->porc_event,3,'.','')));
            if($newResult[$i]->porc >= 100 && $newResult[$i]->porc_connected >= 100) {
                $ejs[] = [
                    'id' => $newResult[$i]->id_ej,  
                    'name' => $newResult[$i]->name,
                    'ies' => $newResult[$i]->ies,
                    'cluster' => $newResult[$i]->cluster,
                    'core' => [
                        'id' => $newResult[$i]->core_id,
                        'name' => $newResult[$i]->core,
                        'color' => $newResult[$i]->color,
                    ],
                ];
            }
        }

        return response()->json([
            'success_message' => 'Resultados!',
            'ejs' => $ejs
        ], 200);
    }

    public function GetEjsConnectedStatus($year){
        $currentMonth = Carbon::now()->month;

        $result = DB::table('junior_enterprises as ej')
        ->selectRaw('ej.id as id_ej, junior_enterprise_goals.cluster as cluster, ej.name as name, foundations.name as ies, cores.id as core_id, cores.name as core, cores.color as color, truncate((sum(projects.billing) / (junior_enterprise_goals.billing) * 100),6) as porc_fat, truncate((sum(projects.project_quantity) / (junior_enterprise_goals.projects) * 100),6) as porc_proj,  truncate(((junior_enterprise_goals.members_performing) / (junior_enterprise_goals.members_performing_goal) * 100),6) as porc_mem, truncate(((junior_enterprise_goals.current_shared_actions) / (junior_enterprise_goals.shared_actions))*100,6) as porc_shared,truncate(((junior_enterprise_goals.current_members_events) / (junior_enterprise_goals.members_events))*100,6) as porc_event')  
        ->join('junior_enterprise_project','junior_enterprise_project.junior_enterprise_id','=','ej.id')
        ->join('projects','projects.id','=','junior_enterprise_project.project_id')
        ->join('junior_enterprise_goals','junior_enterprise_goals.junior_enterprise_id','=','ej.id')  
        ->join('cores','cores.id','=','ej.core_id')  
        ->join('foundations','foundations.id','=','ej.foundation_id')  
        ->where('junior_enterprise_goals.year', '=', $year)
        ->where(DB::raw('YEAR(projects.signature_date)'), '=', $year)
        ->groupBy('ej.id')
        ->get();

        $connected['goal'] = DB::table('federations as c')
        ->selectRaw('meta.connected')
        ->join('federation_goals as meta','c.id','=','meta.federation_id')
        ->where('c.id',1)
        ->where('meta.year','=',$year)
        ->first();


        $connected['connected'] = 0;
        $connected['green'] = 0;
        $connected['yellow'] = 0;
        $connected['red'] = 0;

        $newResult = collect(['id']);

        for($i = 0; $i < sizeof($result); $i++) {
            $newResult[$i] = $result[$i];
            $newResult[$i]->porc = min( ((float) number_format( $result[$i]->porc_mem,3,'.','')), ((float) number_format( $result[$i]->porc_fat,3,'.','')),((float) number_format( $result[$i]->porc_proj,3,'.','')));
            $newResult[$i]->porc_connected = min( ((float) number_format($result[$i]->porc_shared,3,'.','')), ((float) number_format($result[$i]->porc_event,3,'.','')));
            
            if($newResult[$i]->porc >= 100 && $newResult[$i]->porc_connected >= 100) {
                $connected['connected'] =  $connected['connected'] + 1;
            }
            if($newResult[$i]->porc_connected >= ($currentMonth * 8.33333) && $newResult[$i]->porc_connected  < 100){
                $connected['green'] =  $connected['green'] + 1;
            }
    
            if($newResult[$i]->porc_connected >= (($currentMonth-1) * 8.33333) && $newResult[$i]->porc_connected  < ($currentMonth) * 8.3333){
                $connected['yellow'] =  $connected['yellow'] + 1;
            }
    
            if($newResult[$i]->porc_connected < ($currentMonth * 8.3333)){
                $connected['red'] =  $connected['red'] + 1;
            }
        }

        $connected['porc'] = ($connected['connected'] / $connected['goal']->connected) * 100;

        return response()->json([
            'success_message' => 'Resultados!',
            'success_data' => $connected,
        ], 200);
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Federation  $federation
     * @return \Illuminate\Http\Response
     */
    public function show(Federation $federation)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Federation  $federation
     * @return \Illuminate\Http\Response
     */
    public function edit(Federation $federation)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Federation  $federation
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Federation $federation)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Federation  $federation
     * @return \Illuminate\Http\Response
     */
    public function destroy(Federation $federation)
    {
        //
    }
}
