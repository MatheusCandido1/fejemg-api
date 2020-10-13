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


Route::middleware('auth:api')->put('/profile', "UserController@profile");

Route::get('ejs/{id}/resultado/{year}', 'JuniorEnterpriseController@getGoalByYearWithSum');
Route::get('ejs/{id}/metas/{year}', 'JuniorEnterpriseController@getGoalByYear');
Route::get('ejs', 'JuniorEnterpriseController@index');
Route::put('atualizar/meta/{juniorEntepriseGoal}', "JuniorEnterpriseController@updateGoal");
Route::get('ejs/{id}', 'JuniorEnterpriseController@getEjById');
Route::get('faturamento/{year}', 'JuniorEnterpriseController@getTotalBillingByMonth');
Route::get('ejs/{id}/faturamento/{year}', 'JuniorEnterpriseController@getGoalByMonth');
Route::get('ejs/{id}/projetos/{year}', 'JuniorEnterpriseController@getProjectByMonth');
Route::get('ejs/{id}/resultados/{year}', 'JuniorEnterpriseController@getResultsByMonth');
Route::get('nucleos/{id}/resultados/{year}', 'CoreController@getBillingResults');
Route::get('nucleos/{id}/projetos/{year}', 'CoreController@getCoreProjectsByMonth');

Route::get('nucleos/{id}/lideres/{year}', 'CoreController@getLeadersBattle');
Route::get('nucleos/{id}/cluster/{year}', 'CoreController@getClusterByLight');

Route::get('nucleos/{year}', 'CoreController@GetCoreResultsByYear');

Route::get('federacao/faturamento/{year}', 'FederationController@GetFederationBilling');
Route::get('federacao/projetos/{year}', 'FederationController@GetFederationProjects');

Route::get('federacao/lideres/{year}','FederationController@GetLeadersBattle');
Route::get('federacao/cluster/{year}', 'FederationController@GetClusterByLight');
Route::get('federacao/nucleos/{year}', 'FederationController@GetLightByCore');

Route::middleware(['auth:api'])->group(function () {
    Route::get('federacoes', 'FederationController@index');
    Route::get('cursos', 'DegreeController@index');
    Route::get('instituicoes', 'FoundationController@index');
    Route::get('servicos', 'ServiceController@index');
    Route::get('nucleos', 'CoreController@index');
    Route::post('/nucleos/add', "CoreController@store");
    Route::post('/ej/add', "JuniorEnterpriseController@store");
    
    Route::post('/projeto/add', "ProjectController@store");
});