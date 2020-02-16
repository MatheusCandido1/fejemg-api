<?php

namespace App\Http\Controllers;

use App\JuniorEnterprise;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class JuniorEnterpriseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {
            $juniorenterprises = JuniorEnterprise::with('Core','Foundation')
            ->join('junior_enterprise_goals','junior_enterprises.id', '=', 'junior_enterprise_goals.junior_enterprise_id')
            ->select('junior_enterprises.*','junior_enterprise_goals.cluster')
            ->get();


            return response()->json([
                'success_message' => 'EJs recuperadas com sucesso!',
                'success_data' => $juniorenterprises
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

    public function getGoalByYear($id, $year)
    {
        try {
            $goal = DB::table('junior_enterprises as ej')
            ->selectRaw('ej.name as nome_ej, cores.name as nome_nucleo, foundations.name as ies, junior_enterprise_goals.cluster as cluster, format(SUM(projects.billing),2) as soma_fat, SUM(projects.project_quantity) as soma_proj, format(junior_enterprise_goals.billing,2) as meta_fat,  junior_enterprise_goals.projects as meta_proj, truncate((sum(projects.billing) / (junior_enterprise_goals.billing) * 100),6) as porc_fat, truncate((sum(projects.project_quantity) / (junior_enterprise_goals.projects) * 100),6) as porc_proj, junior_enterprise_goals.members_performing_goal as mem_meta, junior_enterprise_goals.members_performing as mem_fat, truncate(((junior_enterprise_goals.members_performing_goal) / (junior_enterprise_goals.members_performing) * 100),6) as porc_mem, junior_enterprise_goals.shared_actions as meta_con, SUM(projects.shared_action) as soma_con, truncate((sum(projects.shared_action) / (junior_enterprise_goals.shared_actions)* 100),6) as porc_con, junior_enterprise_goals.members_events as meta_eve, junior_enterprise_goals.current_members_events as soma_eve, truncate(((junior_enterprise_goals.current_members_events) / (junior_enterprise_goals.members_events) * 100),6) as porc_eve, junior_enterprise_goals.nps as meta_nps, junior_enterprise_goals.current_nps as soma_nps,truncate(((junior_enterprise_goals.current_nps) / (junior_enterprise_goals.nps) * 100),6) as porc_nps')  
            ->join('junior_enterprise_projects','ej.id','=','junior_enterprise_projects.junior_enterprise_id')
            ->join('projects','projects.id','=','junior_enterprise_projects.project_id')
            ->join('junior_enterprise_goals','junior_enterprise_goals.junior_enterprise_id','=','ej.id')
            ->join('cores','cores.id','=','ej.core_id')
            ->join('foundations','foundations.id','=','ej.foundation_id')
            ->where('ej.id','=', $id)
            ->where('junior_enterprise_goals.year', '=', $year)
            ->where(DB::raw('YEAR(projects.signature_date)'), '=', $year)
            ->get();

            //$goal = $juniorenterprise->junior_enterprise_goals()->where('year', $year)->first();

            return response()->json([
                'success_message' => 'Meta da EJ recuperada com sucesso!',
                'success_data' => $goal
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
     * @param  \App\JuniorEnterprise  $juniorEnterprise
     * @return \Illuminate\Http\Response
     */
    public function show(JuniorEnterprise $juniorEnterprise)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\JuniorEnterprise  $juniorEnterprise
     * @return \Illuminate\Http\Response
     */
    public function edit(JuniorEnterprise $juniorEnterprise)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\JuniorEnterprise  $juniorEnterprise
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, JuniorEnterprise $juniorEnterprise)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\JuniorEnterprise  $juniorEnterprise
     * @return \Illuminate\Http\Response
     */
    public function destroy(JuniorEnterprise $juniorEnterprise)
    {
        //
    }
}
