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

Route::get('ejs/{juniorenterprise}/meta/{year}', 'JuniorEnterpriseController@getGoalByYear');


Route::middleware(['auth:api'])->group(function () {
    Route::get('nucleos', 'CoreController@index');
    Route::get('federacoes', 'FederationController@index');
    Route::get('cursos', 'DegreeController@index');
    Route::get('instituicoes', 'FoundationController@index');
    Route::get('servicos', 'ServiceController@index');
    Route::get('ejs', 'JuniorEnterpriseController@index');
});