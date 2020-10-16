<?php

namespace App\Http\Controllers;

use App\Core;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

use App\Helper\Helper;


class CoreController extends Controller
{


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index(){
        try {
            $cores = Core::with('Federation')->get();

            return response()->json([
                'success_message' => 'Núcleos recuperados com sucesso!',
                'success_data' => $cores
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

    public function getBillingResults($id, $year){
        try {
            $results[] = '';

            $core = DB::table('cores')
            ->selectRaw('cores.id as core_id, cores.name as core_name, cores.color as core_color, cores.image as core_image')
            ->where('cores.id','=',$id)
            ->first();

            $resultResults = DB::table('projects')
            ->selectRaw('date_format(projects.signature_date, "%b") as x , sum(projects.billing) as y')  
            ->join('junior_enterprise_project','projects.id','=','junior_enterprise_project.project_id')
            ->join('junior_enterprises','junior_enterprises.id','=','junior_enterprise_project.junior_enterprise_id')
            ->where(DB::raw('YEAR(projects.signature_date)'), '=', $year)
            ->where('junior_enterprises.core_id','=', $id)
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

            $core_goal =  new Core();
            $goal = collect($core_goal->getCoreGoalByMonth($id, $year)->first());


            $results['core'] = $core;
            $results['billing_results'] = $resultResults;
            $results['billing_goal'] = $goal->map(function($value, $key) {
                return ['x'=>$key, 'y'=>(float) number_format( $value,2,'.','')];
            })->values();


            return response()->json([
                'success_message' => 'Núcleos recuperados com sucesso!',
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

    public function getCoreProjectsByMonth($id, $year) {
        try {
            
            $results[] = '';

            $resultsResults = DB::table('projects')
            ->selectRaw('date_format(projects.signature_date, "%b") as x , sum(projects.project_quantity) as y')  
            ->join('junior_enterprise_project','projects.id','=','junior_enterprise_project.project_id')
            ->join('junior_enterprises','junior_enterprises.id','=','junior_enterprise_project.junior_enterprise_id')
            ->where(DB::raw('YEAR(projects.signature_date)'), '=', $year)
            ->where('junior_enterprises.core_id','=', $id)
            ->groupBy(DB::raw('MONTH(projects.signature_date)'))
            ->get();

            $goal =  new Core();
            $goal = collect($goal->getCoreProjectsByMonth($id, $year)->first());
            
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
                'success_message' => 'Núcleos recuperados com sucesso!',
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

    public function GetCoreResultsByYear($year)
    {
        try {
            $cores = DB::table('cores')
            ->selectRaw('cores.id as id, cores.color as core_color, format(core_goals.billing,2) as faturamento_meta, core_goals.projects as projeto_meta,  cores.name as name_nuc, format(SUM(projects.billing),2) as fat_nuc, sum(projects.project_quantity) as proj_nuc')
            ->join('junior_enterprises','junior_enterprises.core_id', '=', 'cores.id')
            ->join('core_goals','cores.id','=','core_goals.core_id')
            ->join('junior_enterprise_project','junior_enterprises.id', '=', 'junior_enterprise_project.junior_enterprise_id')
            ->join('projects','junior_enterprise_project.project_id', '=', 'projects.id')
            ->where(DB::raw('YEAR(projects.signature_date)'),'=', $year)
            ->where('core_goals.year','=', $year)
            ->groupBy('cores.name')
            ->orderBy('cores.name','asc')
            ->get();

            return response()->json([
                'success_message' => 'Núcleos recuperados com sucesso!',
                'success_data' => $cores
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

    public function GetEjsConnectedStatusByCore ($id, $year) {
        $currentMonth = Carbon::now()->month;

        $result = DB::table('junior_enterprises as ej')
        ->selectRaw('ej.id as id_ej, junior_enterprise_goals.cluster as cluster, ej.name as name, foundations.name as ies, cores.id as core_id, cores.name as core, cores.color as color, truncate((sum(projects.billing) / (junior_enterprise_goals.billing) * 100),6) as porc_fat, truncate((sum(projects.project_quantity) / (junior_enterprise_goals.projects) * 100),6) as porc_proj,  truncate(((junior_enterprise_goals.members_performing) / (junior_enterprise_goals.members_performing_goal) * 100),6) as porc_mem, truncate(((junior_enterprise_goals.current_shared_actions) / (junior_enterprise_goals.shared_actions))*100,6) as porc_shared,truncate(((junior_enterprise_goals.current_members_events) / (junior_enterprise_goals.members_events))*100,6) as porc_event')  
        ->join('junior_enterprise_project','junior_enterprise_project.junior_enterprise_id','=','ej.id')
        ->join('projects','projects.id','=','junior_enterprise_project.project_id')
        ->join('junior_enterprise_goals','junior_enterprise_goals.junior_enterprise_id','=','ej.id')  
        ->join('cores','cores.id','=','ej.core_id')  
        ->join('foundations','foundations.id','=','ej.foundation_id')  
        ->where('ej.core_id','=', $id)
        ->where('junior_enterprise_goals.year', '=', $year)
        ->where(DB::raw('YEAR(projects.signature_date)'), '=', $year)
        ->groupBy('ej.id')
        ->get();

        $connected['goal'] = DB::table('cores as c')
        ->selectRaw('meta.connected')
        ->join('core_goals as meta','c.id','=','meta.core_id')
        ->where('c.id',$id)
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

    public function getLeadersBattle($id, $year) {
        $currentMonth = Carbon::now()->month;

        $result = DB::table('junior_enterprises as ej')
        ->selectRaw('ej.id as id_ej, ej.name as name, junior_enterprise_goals.cluster as cluster, foundations.name as ies, cores.name as core, cores.color as color, truncate((sum(projects.billing) / (junior_enterprise_goals.billing) * 100),6) as porc_fat, truncate((sum(projects.project_quantity) / (junior_enterprise_goals.projects) * 100),6) as porc_proj,  truncate(((junior_enterprise_goals.members_performing) / (junior_enterprise_goals.members_performing_goal) * 100),6) as porc_mem')  
        ->join('junior_enterprise_project','junior_enterprise_project.junior_enterprise_id','=','ej.id')
        ->join('projects','projects.id','=','junior_enterprise_project.project_id')
        ->join('junior_enterprise_goals','junior_enterprise_goals.junior_enterprise_id','=','ej.id')  
        ->join('cores','cores.id','=','ej.core_id')  
        ->join('foundations','foundations.id','=','ej.foundation_id')  
        ->where('ej.core_id','=', $id)
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
                'cluster' => $newResult[$i]->cluster
            ];
        }

        if($newResult[$i]->porc >= ($currentMonth * 8.33333) && $newResult[$i]->porc  < 100){
            $leaders['green'] = $leaders['green'] + 1;
            $ejs['green'][] = [
                'id' => $newResult[$i]->id_ej,
                'name' => $newResult[$i]->name,
                'ies' =>  $newResult[$i]->ies,
                'cluster' => $newResult[$i]->cluster
            ];

        }

        if($newResult[$i]->porc >= (($currentMonth-1) * 8.33333) && $newResult[$i]->porc  < ($currentMonth) * 8.3333){
            $leaders['yellow'] = $leaders['yellow'] + 1;
            $ejs['yellow'][] = [
                'id' => $newResult[$i]->id_ej,
                'name' => $newResult[$i]->name,
                'ies' =>  $newResult[$i]->ies,
                'cluster' => $newResult[$i]->cluster
            ];

        }

        if($newResult[$i]->porc < ($currentMonth * 8.3333)){
            $leaders['red'] = $leaders['red'] + 1;
            $ejs['red'][] = [
                'id' => $newResult[$i]->id_ej,
                'name' => $newResult[$i]->name,
                'ies' =>  $newResult[$i]->ies,
                'cluster' => $newResult[$i]->cluster
            ];

        }
        }

        return response()->json([
            'success_message' => 'Resultados!',
            'success_data' => $leaders,
            'ejs' => $ejs
        ], 200);
    }

    public function GetTop5Ejs($id, $year) {
        $currentMonth = Carbon::now()->month;

        $result = DB::table('junior_enterprises as ej')
        ->selectRaw('ej.id as id_ej, ej.name as name, foundations.name as ies, cores.name as core, cores.color as color, truncate((sum(projects.billing) / (junior_enterprise_goals.billing) * 100),6) as porc_fat, truncate((sum(projects.project_quantity) / (junior_enterprise_goals.projects) * 100),6) as porc_proj,  truncate(((junior_enterprise_goals.members_performing) / (junior_enterprise_goals.members_performing_goal) * 100),6) as porc_mem')  
        ->join('junior_enterprise_project','junior_enterprise_project.junior_enterprise_id','=','ej.id')
        ->join('projects','projects.id','=','junior_enterprise_project.project_id')
        ->join('junior_enterprise_goals','junior_enterprise_goals.junior_enterprise_id','=','ej.id')  
        ->join('cores','cores.id','=','ej.core_id')  
        ->join('foundations','foundations.id','=','ej.foundation_id')  
        ->where('ej.core_id','=', $id)
        ->where('junior_enterprise_goals.year', '=', $year)
        ->where(DB::raw('YEAR(projects.signature_date)'), '=', $year)
        ->groupBy('ej.id')
        ->get();

        $ejs['list'] = [];

        
        $newResult = collect(['id']);

        for($i = 0; $i < sizeof($result); $i++) {
            $newResult[$i] = $result[$i];
            $newResult[$i]->porc = min( ((float) number_format( $result[$i]->porc_mem,3,'.','')), ((float) number_format( $result[$i]->porc_fat,3,'.','')),((float) number_format( $result[$i]->porc_proj,3,'.','')));

            if($newResult[$i]->porc >= ($currentMonth * 8.33333) && $newResult[$i]->porc  < 100){
                $ejs['list'][] = [
                    'id' => $newResult[$i]->id_ej,
                    'name' => $newResult[$i]->name,
                    'ies' =>  $newResult[$i]->ies,
                    'porc' => $newResult[$i]->porc
                ];
            }
        }

        $sorted = collect($ejs);
        return response()->json([
            'success_message' => 'Resultados!',
            'ejs' => $sorted->sortBy('porc')
        ], 200);
    }

    public function GetEjsConnectedByCore($id, $year) {
        $currentMonth = Carbon::now()->month;

        $result = DB::table('junior_enterprises as ej')
        ->selectRaw('ej.id as id_ej, junior_enterprise_goals.cluster as cluster, ej.name as name, foundations.name as ies, cores.id as core_id, cores.name as core, cores.color as color, truncate((sum(projects.billing) / (junior_enterprise_goals.billing) * 100),6) as porc_fat, truncate((sum(projects.project_quantity) / (junior_enterprise_goals.projects) * 100),6) as porc_proj,  truncate(((junior_enterprise_goals.members_performing) / (junior_enterprise_goals.members_performing_goal) * 100),6) as porc_mem, truncate(((junior_enterprise_goals.current_shared_actions) / (junior_enterprise_goals.shared_actions))*100,6) as porc_shared,truncate(((junior_enterprise_goals.current_members_events) / (junior_enterprise_goals.members_events))*100,6) as porc_event')  
        ->join('junior_enterprise_project','junior_enterprise_project.junior_enterprise_id','=','ej.id')
        ->join('projects','projects.id','=','junior_enterprise_project.project_id')
        ->join('junior_enterprise_goals','junior_enterprise_goals.junior_enterprise_id','=','ej.id')  
        ->join('cores','cores.id','=','ej.core_id')  
        ->join('foundations','foundations.id','=','ej.foundation_id')  
        ->where('ej.core_id','=',$id)
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
                    'cluster' => $newResult[$i]->cluster
                ];
            }
        }

        return response()->json([
            'success_message' => 'Resultados!',
            'ejs' => $ejs
        ], 200);
    }

    public function getClusterByLight($id, $year) {
        $currentMonth = Carbon::now()->month;

        $result = DB::table('junior_enterprises as ej')
        ->selectRaw('ej.name,junior_enterprise_goals.cluster as cluster, truncate((sum(projects.billing) / (junior_enterprise_goals.billing) * 100),6) as porc_fat, truncate((sum(projects.project_quantity) / (junior_enterprise_goals.projects) * 100),6) as porc_proj,  truncate(((junior_enterprise_goals.members_performing) / (junior_enterprise_goals.members_performing_goal) * 100),6) as porc_mem')  
        ->join('junior_enterprise_project','junior_enterprise_project.junior_enterprise_id','=','ej.id')
        ->join('projects','projects.id','=','junior_enterprise_project.project_id')
        ->join('junior_enterprise_goals','junior_enterprise_goals.junior_enterprise_id','=','ej.id')    
        ->join('cores','cores.id','=','ej.core_id')
        ->where('ej.core_id','=', $id)
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
            'success_data' => $leaders,
            'result' => $result
        ], 200);
    }

    public function GetStateCoreGoals($id, $year) {
        $state = [];
        $state['goal'] = DB::table('cores as c')
        ->selectRaw('meta.billing_by_member, meta.ies, meta.junior_ies, meta.quantity as ej_quantity')
        ->join('core_goals as meta','c.id','=','meta.core_id')
        ->where('c.id',$id)
        ->where('meta.year','=',$year)
        ->first();

      $total = DB::table('junior_enterprises as ej')
        ->selectRaw('sum(projects.billing) as total')  
        ->join('junior_enterprise_project','junior_enterprise_project.junior_enterprise_id','=','ej.id')
        ->join('projects','projects.id','=','junior_enterprise_project.project_id')
        ->join('junior_enterprise_goals','junior_enterprise_goals.junior_enterprise_id','=','ej.id')  
        ->join('cores','cores.id','=','ej.core_id')  
        ->join('foundations','foundations.id','=','ej.foundation_id')  
        ->where('ej.core_id',$id)
        ->where('junior_enterprise_goals.year', '=', $year)
        ->where(DB::raw('YEAR(projects.signature_date)'), '=', $year)
        ->first();

        $members = DB::table('junior_enterprises as ej')
        ->selectRaw('sum(ej.members) as members') 
        ->join('cores','cores.id','=','ej.core_id')  
        ->where('ej.core_id',$id)
        ->first();

        $ies = DB::table('foundations as f')
        ->selectRaw('count(distinct(f.id)) as qnt') 
        ->join('junior_enterprises','junior_enterprises.foundation_id','=','f.id')
        ->join('cores','junior_enterprises.core_id','=','cores.id')
        ->where('junior_enterprises.core_id', $id)
        ->first();

        $ies_junior = DB::table('foundations as f')
        ->selectRaw('count(distinct(f.id)) as qnt') 
        ->join('junior_enterprises','junior_enterprises.foundation_id','=','f.id')
        ->join('cores','junior_enterprises.core_id','=','cores.id')
        ->where('junior_enterprises.core_id', $id)
        ->where('f.ies_junior',1)
        ->first();

        $ej = DB::table('junior_enterprises as ej')
        ->selectRaw('count(ej.id) as qnt')  
        ->where('ej.core_id', $id)
        ->first();

        $state['result'] = [
            'billing_by_member' => number_format(($total->total / $members->members),2),
            'current_ies' => $ies->qnt,
            'current_ies_junior' => $ies_junior->qnt,
            'ej_quantity' => $ej->qnt,
        ];

        $core = DB::table('cores')
            ->selectRaw('cores.color as color')
            ->where('cores.id','=',$id)
            ->first();
        

        return response()->json([
            'success_message' => 'Resultados!',
            'success_data' => $state,
            'core' => $core
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
        try {
            $data = $request->all();

            $validator = Validator::make($request->all() , [
                'name' => 'required|string|min:3|max:40',
                'cnpj' => 'required|string|min:3|max:255'
            ], [
                'required' => 'O campo :attribute é obrigatório',
                'max' => 'O campo :attribute não deve ultrapassar :max caracteres',
                'min' => 'O campo :attribute deve ter pelo menos 3 caracteres'
            ]);
            if($validator->fails()) {
                return ['status'=>false,"validacao"=>true,"erros"=>$validator->errors()];
            }

            

            $core = Core::create([
                'name' => $data['name'],
                'cnpj' => $data['cnpj'],
                'federation_id' => 1
            ]);

            return response()->json([
                'success_message' => 'Núcleo criado com sucesso!',
                'success_data' => $core
                ], 201);

        }
        catch(\Exception $e) {
            return response()->json([
                'error_type' => 'Erro no servidor',
                'error_message' => 'Aconteceu um erro interno',
                'error_description' => $e->getMessage()
            ], 500);

        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Core  $core
     * @return \Illuminate\Http\Response
     */
    public function show(Core $core)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Core  $core
     * @return \Illuminate\Http\Response
     */
    public function edit(Core $core)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Core  $core
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Core $core)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Core  $core
     * @return \Illuminate\Http\Response
     */
    public function destroy(Core $core)
    {
        //
    }
}
