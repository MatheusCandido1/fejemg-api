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
            ->selectRaw('cores.id as id,  cores.name as name_nuc, format(SUM(projects.billing),2) as fat_nuc, sum(projects.project_quantity) as fat_proj')
            ->join('junior_enterprises','junior_enterprises.core_id', '=', 'cores.id')
            ->join('junior_enterprise_project','junior_enterprises.id', '=', 'junior_enterprise_project.junior_enterprise_id')
            ->join('projects','junior_enterprise_project.project_id', '=', 'projects.id')
            ->where(DB::raw('YEAR(projects.signature_date)'),'=', $year)
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


    public function getLeadersBattle($id, $year) {
        $currentMonth = Carbon::now()->month;

        $result = DB::table('junior_enterprises as ej')
        ->selectRaw('ej.id as id_ej, truncate((sum(projects.billing) / (junior_enterprise_goals.billing) * 100),6) as porc_fat, truncate((sum(projects.project_quantity) / (junior_enterprise_goals.projects) * 100),6) as porc_proj,  truncate(((junior_enterprise_goals.members_performing) / (junior_enterprise_goals.members_performing_goal) * 100),6) as porc_mem')  
        ->join('junior_enterprise_project','junior_enterprise_project.junior_enterprise_id','=','ej.id')
        ->join('projects','projects.id','=','junior_enterprise_project.project_id')
        ->join('junior_enterprise_goals','junior_enterprise_goals.junior_enterprise_id','=','ej.id')    
        ->join('cores','cores.id','=','ej.core_id')
        ->where('ej.core_id','=', $id)
        ->where('junior_enterprise_goals.year', '=', $year)
        ->where(DB::raw('YEAR(projects.signature_date)'), '=', $year)
        ->groupBy('ej.id')
        ->get();


        $leaders['ac'] = 0;
        $leaders['green'] = 0;
        $leaders['yellow'] = 0;
        $leaders['red'] = 0;

        
        $newResult = collect(['id']);

        for($i = 0; $i < sizeof($result); $i++) {
            $newResult[$i] = $result[$i];
            $newResult[$i]->porc = min( ((float) number_format( $result[$i]->porc_mem,3,'.','')), ((float) number_format( $result[$i]->porc_fat,3,'.','')),((float) number_format( $result[$i]->porc_proj,3,'.','')));

        if($newResult[$i]->porc >= 100){
            $leaders['ac'] = $leaders['ac'] + 1;
        }

        if($newResult[$i]->porc >= ($currentMonth * 8.33333) && $newResult[$i]->porc  < 100){
            $leaders['green'] = $leaders['green'] + 1;
        }

        if($newResult[$i]->porc >= ($currentMonth * 8.33333) && $newResult[$i]->porc  < ($currentMonth+1) * 8.3333){
            $leaders['yellow'] = $leaders['yellow'] + 1;
        }

        if($newResult[$i]->porc < ($currentMonth * 8.3333)){
            $leaders['red'] = $leaders['red'] + 1;
        }
        }

        return response()->json([
            'success_message' => 'Resultados!',
            'success_data' => $leaders
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

        if($newResult[$i]->porc >= ($currentMonth * 8.33333) && $newResult[$i]->porc  < ($currentMonth-1) * 8.3333){
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
