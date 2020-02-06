<?php

namespace App\Http\Controllers;

use App\Foundation;
use Illuminate\Http\Request;

class FoundationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {
            $foundations = Foundation::all();

            return response()->json([
                'success_message' => 'Instituições recuperadas com sucesso!',
                'success_data' => $foundations
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
     * @param  \App\Foundation  $foundation
     * @return \Illuminate\Http\Response
     */
    public function show(Foundation $foundation)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Foundation  $foundation
     * @return \Illuminate\Http\Response
     */
    public function edit(Foundation $foundation)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Foundation  $foundation
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Foundation $foundation)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Foundation  $foundation
     * @return \Illuminate\Http\Response
     */
    public function destroy(Foundation $foundation)
    {
        //
    }
}
