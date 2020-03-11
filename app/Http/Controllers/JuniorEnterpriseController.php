<?php

namespace App\Http\Controllers;

use App\JuniorEnterprise;
use App\JuniorEnterpriseGoal;
use App\Service;
use App\Project;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;


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

    public function getTotalBillingByMonth($year){
        try {
             $result = DB::table('projects')
            ->selectRaw('sum(projects.billing) as x')  
            ->join('junior_enterprise_project','projects.id','=','junior_enterprise_project.project_id')
            ->join('junior_enterprises','junior_enterprises.id','=','junior_enterprise_project.junior_enterprise_id')
            ->where(DB::raw('YEAR(projects.signature_date)'), '=', $year)
            ->groupBy(DB::raw('MONTH(projects.signature_date)'))
            ->get();
            return response()->json($result, 200);
        }
        catch(\Exception $e){
            return response()->json([
                'error_type' => 'Erro no servidor',
                'error_message' => 'Aconteceu um erro interno',
                'error_description' => $e->getMessage()
            ], 500);
        }
    }

    public function UpdateGoal(Request $request, JuniorEnterpriseGoal $juniorEntepriseGoal){
        try{
        $juniorEntepriseGoal->fill($request->all());
        $juniorEntepriseGoal->save();

        return response()->json([
            'success_message' => 'EJs recuperadas com sucesso!',
            'success_data' => $request->all()
        ], 200);
        }catch(\Exception $e){
            return response()->json([
                'error_type' => 'Erro no servidor',
                'error_message' => 'Aconteceu um erro interno',
                'error_description' => $e->getMessage()
            ], 500);
        }
    }

    public function getEjById($id)
    {
        try {
            $juniorenterprises = JuniorEnterprise::with('Core','Foundation','degrees','services')
            ->join('junior_enterprise_goals','junior_enterprises.id', '=', 'junior_enterprise_goals.junior_enterprise_id')
            ->select('junior_enterprises.*','junior_enterprise_goals.cluster')
            ->where('junior_enterprises.id','=', $id)
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
            $juniorenterprises = JuniorEnterprise::with('junior_enterprise_goals')
            ->join('junior_enterprise_goals','junior_enterprises.id', '=', 'junior_enterprise_goals.junior_enterprise_id')
            ->select('junior_enterprises.*','junior_enterprise_goals.cluster')
            ->where('junior_enterprises.id','=', $id)
            ->where('junior_enterprise_goals.year', '=', $year)
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

    public function getGoalByMonth($id, $year){
        try {
            $billing =  new JuniorEnterprise();
            $billing = collect($billing->getGoalByMonth($id, $year)->first());

            return response()->json(
                $billing->map(function($value, $key) {
                    return ['x'=>$key, 'y'=>$value];
                })->values()
            );
        }
        catch(\Exception $e){
            return response()->json([
                'error_type' => 'Erro no servidor',
                'error_message' => 'Aconteceu um erro interno',
                'error_description' => $e->getMessage()
            ], 500);
        }
    }

    public function getGoalByYearWithSum($id, $year)
    {
        try {
            $goal =  new JuniorEnterprise();
            $goal = $goal->getEjByIdAndYearWithSum($id, $year)->get();

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

            

            $ej = JuniorEnterprise::create([
                'name' => $data['name'],
                'email' => $data['email'],
                'about' => $data['about'],
                'associated_since' => $data['associated_since'],
                'cnpj' => $data['cnpj'],
                'website' => $data['website'],
                'members' => $data['members'],
                'foundation_id' => $data['foundation_id'],
                'core_id' => $data['core_id'],
            ]);

            $jeGoals = new JuniorEnterpriseGoal();
            $jeGoals->year = Carbon::now()->year;
            $jeGoals->billing = 0;
            $jeGoals->projects = 0;
            $jeGoals->members_performing = 0;
            $jeGoals->shared_actions = 0;
            $jeGoals->members_events = 0;
            $jeGoals->nps = 0;
            $jeGoals->impact_projects = 0;
            $jeGoals->members_performing_goal = 0;
            $jeGoals->current_nps = 0;
            $jeGoals->cluster = 1;
            $jeGoals->current_members_events = 0;

            $jeGoals->junior_enterprise()->associate($ej);
            $jeGoals->save();

            
            $ej->services()->sync($request->services_id);
            $ej->degrees()->sync($request->degrees_id);


            return response()->json([
                'success_message' => 'EJ criada com sucesso!',
                'success_data' => $ej
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
        try{
            
        $juniorEnterprise->fill($request->only('name','email','about','associated_since','cnpj','website','members','foundation_id','core_id'));
        $juniorEnterprise->save();

        return response()->json([
            'success_message' => 'EJ atualizada com sucesso!',
            'success_data' => $juniorEnterprise
            ], 200);

        }catch(\Exception $e) {
            return response()->json([
                'error_type' => 'Erro no servidor',
                'error_message' => 'Aconteceu um erro interno',
                'error_description' => $e->getMessage()
            ], 500);

        }

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
