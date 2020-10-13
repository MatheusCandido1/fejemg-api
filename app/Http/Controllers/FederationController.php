<?php

namespace App\Http\Controllers;

use App\Federation;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

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
