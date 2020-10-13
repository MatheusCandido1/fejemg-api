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
        ->selectRaw('ej.id as id_ej, truncate((sum(projects.billing) / (junior_enterprise_goals.billing) * 100),6) as porc_fat, truncate((sum(projects.project_quantity) / (junior_enterprise_goals.projects) * 100),6) as porc_proj,  truncate(((junior_enterprise_goals.members_performing) / (junior_enterprise_goals.members_performing_goal) * 100),6) as porc_mem')  
        ->join('junior_enterprise_project','junior_enterprise_project.junior_enterprise_id','=','ej.id')
        ->join('projects','projects.id','=','junior_enterprise_project.project_id')
        ->join('junior_enterprise_goals','junior_enterprise_goals.junior_enterprise_id','=','ej.id')    
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
