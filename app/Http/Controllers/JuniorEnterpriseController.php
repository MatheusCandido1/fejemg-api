<?php

namespace App\Http\Controllers;

use App\JuniorEnterprise;
use Illuminate\Http\Request;

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
            $juniorenterprises = JuniorEnterprise::with('Core','Foundation')->get();

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

    public function getGoalByYear(JuniorEnterprise $juniorenterprise, $year)
    {
        try {
            $goal = $juniorenterprise->junior_enterprise_goals()->where('year', $year)->first();

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
