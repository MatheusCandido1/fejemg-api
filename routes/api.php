<?php

use App\User;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::post('/register', "UserController@register");
Route::post('/login', "UserController@login");




Route::middleware(['auth:api'])->group(function () {
    // Rotas Gerais
    Route::get('federacoes', 'FederationController@index');
    Route::get('cursos', 'DegreeController@index');
    Route::get('instituicoes', 'FoundationController@index');
    Route::get('servicos', 'ServiceController@index');
    Route::get('nucleos', 'CoreController@index');
    Route::post('/nucleos/add', "CoreController@store");
    Route::post('/ej/add', "JuniorEnterpriseController@store");
    
    Route::post('/projeto/add', "ProjectController@store");

    Route::middleware('auth:api')->put('/profile', "UserController@profile");
    // EJ
    Route::get('ejs/{id}/resultado/{year}', 'JuniorEnterpriseController@getGoalByYearWithSum');
    Route::get('ejs/{id}/metas/{year}', 'JuniorEnterpriseController@getGoalByYear');
    Route::get('ejs', 'JuniorEnterpriseController@index');
    Route::put('atualizar/meta/{juniorEntepriseGoal}', "JuniorEnterpriseController@updateGoal");
    Route::get('ejs/{id}', 'JuniorEnterpriseController@getEjById');
    Route::get('faturamento/{year}', 'JuniorEnterpriseController@getTotalBillingByMonth');
    Route::get('ejs/{id}/faturamento/{year}', 'JuniorEnterpriseController@getGoalByMonth');
    Route::get('ejs/{id}/projetos/{year}', 'JuniorEnterpriseController@getProjectByMonth');
    Route::get('ejs/{id}/resultados/{year}', 'JuniorEnterpriseController@getResultsByMonth');

    // Núcleos

    Route::get('nucleos/{id}/resultados/{year}', 'CoreController@getBillingResults');
    Route::get('nucleos/{id}/projetos/{year}', 'CoreController@getCoreProjectsByMonth');
    Route::get('nucleos/{id}/lideres/{year}', 'CoreController@getLeadersBattle');
    Route::get('nucleos/{id}/cluster/{year}', 'CoreController@getClusterByLight');
    Route::get('nucleos/{year}', 'CoreController@GetCoreResultsByYear');
    Route::get('nucleos/{id}/conectados/{year}','CoreController@GetEjsConnectedByCore');
    Route::get('nucleos/{id}/conectados/resultados/{year}','CoreController@GetEjsConnectedStatusByCore');
    Route::get('nucleos/{id}/estado/indicadores/{year}','CoreController@GetStateCoreGoals');
    Route::get('nucleos/{id}/lideres/top/{year}', 'CoreController@GetTop5Ejs');
    Route::get('nucleos/{id}/impacto/indicadores/{year}', 'CoreController@GetImpactResults');

    // Federação

    Route::get('federacao/faturamento/{year}', 'FederationController@GetFederationBilling');
    Route::get('federacao/projetos/{year}', 'FederationController@GetFederationProjects');
    Route::get('federacao/lideres/{year}','FederationController@GetLeadersBattle');
    Route::get('federacao/cluster/{year}', 'FederationController@GetClusterByLight');
    Route::get('federacao/nucleos/{year}', 'FederationController@GetLightByCore');
    Route::get('federacao/conectados/{year}','FederationController@GetEjsConnected');
    Route::get('federacao/conectados/resultados/{year}','FederationController@GetEjsConnectedStatus');
    Route::get('federacao/faturamento/nucleos/{year}', 'FederationController@GetBillingByCore');
    Route::get('federacao/estado/indicadores/{year}', 'FederationController@GetStateGoals');
    Route::get('federacao/estados/ies/{year}', 'FederationController@GetEjByIES');
    Route::get('federacao/impacto/indicadores/{year}', 'FederationController@GetImpactResults');
});