<?php

namespace App\Http\Controllers;

use App\Core;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class CoreController extends Controller
{


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
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
