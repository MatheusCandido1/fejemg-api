<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class JuniorEnterprise extends Model
{
    protected $table = "junior_enterprises";

    protected $fillable = [
        'name', 'email', 'about', 'associated_since', 'cnpj', 'website', 'members', 'core_id', 'foundation_id'
    ];

    public function core()
    {
        return $this->belongsTo('App\Core');
    }

    public function foundation()
    {
        return $this->belongsTo('App\Foundation');
    }


    public function services()
    {
        return $this->belongsToMany('App\Service');
    }

    public function projects()
    {
        return $this->hasMany('App\Project');
    }

    public function junior_enterprise_goals()
    {
        return $this->hasMany('App\JuniorEnterpriseGoal');
    }

    public function degrees()
    {
        return $this->belongsToMany('App\Degree');
    }

    public function getGoalByMonth($id, $year){
        return DB::table('junior_enterprises as ej')
        ->selectRaw('TRUNCATE((meta.billing/12),2) as `Jan`, TRUNCATE((meta.billing/12)*2,2) as `Fev`, TRUNCATE((meta.billing/12)*3,2) as `Mar`, TRUNCATE((meta.billing/12)*4,2) as `Abr`, TRUNCATE((meta.billing/12)*5,2) as `Mai`, TRUNCATE((meta.billing/12)*6,2) as `Jun`,TRUNCATE((meta.billing/12)*7,2) as `Jul`, TRUNCATE((meta.billing/12)*8,2) as `Ago`,TRUNCATE((meta.billing/12)*9,2) as `Set`, TRUNCATE((meta.billing/12)*10,2) as `Out`, TRUNCATE((meta.billing/12)*11,2) as `Nov`, TRUNCATE((meta.billing/12)*12,2) as `Dez`')
        ->join('junior_enterprise_goals as meta','ej.id','=','meta.junior_enterprise_id')
        ->where('ej.id','=',$id)
        ->where('meta.year','=',$year);
    }

    public function getProjectByMonth($id, $year){
        return DB::table('junior_enterprises as ej')
        ->selectRaw('ROUND((meta.projects/12),0) as `Jan`, ROUND((meta.projects/12)*2,0) as `Fev`, ROUND((meta.projects/12)*3,0) as `Mar`, ROUND((meta.projects/12)*4,0) as `Abr`, ROUND((meta.projects/12)*5,0) as `Mai`, ROUND((meta.projects/12)*6,0) as `Jun`, ROUND((meta.projects/12)*7,0) as `Jul`, ROUND((meta.projects/12)*8,0) as `Ago`, ROUND((meta.projects/12)*9,0) as `Set`, ROUND((meta.projects/12)*10,0) as `Out`, ROUND((meta.projects/12)*11,0) as `Nov`, ROUND((meta.projects/12)*12,0) as `Dez`')
        ->join('junior_enterprise_goals as meta','ej.id','=','meta.junior_enterprise_id')
        ->where('ej.id','=',$id)
        ->where('meta.year','=',$year);
    }


    public function getEjByIdAndYearWithSum($id, $year) 
    {
        return DB::table('junior_enterprises as ej')
        ->selectRaw('ej.id as id_ej, ej.name as nome_ej, cores.name as nome_nucleo, foundations.name as ies,junior_enterprise_goals.cluster as cluster, format(SUM(projects.billing),2) as soma_fat, SUM(projects.project_quantity) as soma_proj, format(junior_enterprise_goals.billing,2) as meta_fat,  junior_enterprise_goals.projects as meta_proj, truncate((sum(projects.billing) / (junior_enterprise_goals.billing) * 100),6) as porc_fat, truncate((sum(projects.project_quantity) / (junior_enterprise_goals.projects) * 100),6) as porc_proj, junior_enterprise_goals.members_performing_goal as mem_meta, junior_enterprise_goals.members_performing as mem_fat, truncate(((junior_enterprise_goals.members_performing) / (junior_enterprise_goals.members_performing_goal) * 100),6) as porc_mem, junior_enterprise_goals.shared_actions as meta_con, SUM(projects.shared_action) as soma_con, truncate((sum(projects.shared_action) / (junior_enterprise_goals.shared_actions)* 100),6) as porc_con, junior_enterprise_goals.members_events as meta_eve, junior_enterprise_goals.current_members_events as soma_eve, truncate(((junior_enterprise_goals.current_members_events) / (junior_enterprise_goals.members_events) * 100),6) as porc_eve, junior_enterprise_goals.nps as meta_nps, junior_enterprise_goals.current_nps as soma_nps,truncate(((junior_enterprise_goals.current_nps) / (junior_enterprise_goals.nps) * 100),6) as porc_nps, (junior_enterprise_goals.current_impact_projects) as soma_impacto, (junior_enterprise_goals.impact_projects) as meta_impacto, truncate(((junior_enterprise_goals.current_impact_projects) / (junior_enterprise_goals.impact_projects) * 100),6) as porc_impacto')  
        ->join('junior_enterprise_project','junior_enterprise_project.junior_enterprise_id','=','ej.id')
        ->join('projects','projects.id','=','junior_enterprise_project.project_id')
        ->join('junior_enterprise_goals','junior_enterprise_goals.junior_enterprise_id','=','ej.id')    
        ->join('cores','cores.id','=','ej.core_id')
        ->join('foundations','foundations.id','=','ej.foundation_id')
        ->where('ej.id','=', $id)
        ->where('junior_enterprise_goals.year', '=', $year)
        ->where(DB::raw('YEAR(projects.signature_date)'), '=', $year);
    }
}
