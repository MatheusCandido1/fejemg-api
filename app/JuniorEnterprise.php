<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
class JuniorEnterprise extends Model
{
    protected $fillable = [
        'name', 'email', 'about', 'associated_since', 'cnpj', 'website', 'members', 'core_id', 'foundation_id'
    ];
    public function image()
    {
        return $this->morphOne('App\Image', 'imageable');
    }

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

    public function getEjByIdAndYearWithSum($id, $year) 
    {
        return DB::table('junior_enterprises as ej')
        ->selectRaw('ej.id as id_ej, ej.name as nome_ej, cores.name as nome_nucleo, foundations.name as ies,junior_enterprise_goals.cluster as cluster, format(SUM(projects.billing),2) as soma_fat, SUM(projects.project_quantity) as soma_proj, format(junior_enterprise_goals.billing,2) as meta_fat,  junior_enterprise_goals.projects as meta_proj, truncate((sum(projects.billing) / (junior_enterprise_goals.billing) * 100),6) as porc_fat, truncate((sum(projects.project_quantity) / (junior_enterprise_goals.projects) * 100),6) as porc_proj, junior_enterprise_goals.members_performing_goal as mem_meta, junior_enterprise_goals.members_performing as mem_fat, truncate(((junior_enterprise_goals.members_performing) / (junior_enterprise_goals.members_performing_goal) * 100),6) as porc_mem, junior_enterprise_goals.shared_actions as meta_con, SUM(projects.shared_action) as soma_con, truncate((sum(projects.shared_action) / (junior_enterprise_goals.shared_actions)* 100),6) as porc_con, junior_enterprise_goals.members_events as meta_eve, junior_enterprise_goals.current_members_events as soma_eve, truncate(((junior_enterprise_goals.current_members_events) / (junior_enterprise_goals.members_events) * 100),6) as porc_eve, junior_enterprise_goals.nps as meta_nps, junior_enterprise_goals.current_nps as soma_nps,truncate(((junior_enterprise_goals.current_nps) / (junior_enterprise_goals.nps) * 100),6) as porc_nps')  
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
