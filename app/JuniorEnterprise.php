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
        return $this->hasMany('App\JuniorEnterpriseProject');
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
        ->selectRaw('ej.name as nome_ej, cores.name as nome_nucleo, foundations.name as ies,junior_enterprise_goals.cluster as cluster, IFNULL(format(SUM(projects.billing),2),0) as soma_fat, IFNULL(SUM(projects.project_quantity),0) as soma_proj, IFNULL(format(junior_enterprise_goals.billing,2),0) as meta_fat,  IFNULL(junior_enterprise_goals.projects,0) as meta_proj, IFNULL(truncate((sum(projects.billing) / (junior_enterprise_goals.billing) * 100),6),0) as porc_fat, IFNULL(truncate((sum(projects.project_quantity) / (junior_enterprise_goals.projects) * 100),6),0) as porc_proj, IFNULL(junior_enterprise_goals.members_performing_goal,0) as mem_meta, IFNULL(junior_enterprise_goals.members_performing,0) as mem_fat, IFNULL(truncate(((junior_enterprise_goals.members_performing_goal) / (junior_enterprise_goals.members_performing) * 100),6),0) as porc_mem, IFNULL(junior_enterprise_goals.shared_actions,0) as meta_con, IFNULL(SUM(projects.shared_action),0) as soma_con, IFNULL(truncate((sum(projects.shared_action) / (junior_enterprise_goals.shared_actions)* 100),6),0) as porc_con, IFNULL(junior_enterprise_goals.members_events,0) as meta_eve, IFNULL(junior_enterprise_goals.current_members_events, 0) as soma_eve, IFNULL(truncate(((junior_enterprise_goals.current_members_events) / (junior_enterprise_goals.members_events) * 100),6),0) as porc_eve, IFNULL(junior_enterprise_goals.nps,0) as meta_nps, IFNULL(junior_enterprise_goals.current_nps,0) as soma_nps,IFNULL(truncate(((junior_enterprise_goals.current_nps) / (junior_enterprise_goals.nps) * 100),6),0) as porc_nps')  
        ->join('junior_enterprise_projects','ej.id','=','junior_enterprise_projects.junior_enterprise_id')
        ->join('projects','projects.id','=','junior_enterprise_projects.project_id')
        ->join('junior_enterprise_goals','junior_enterprise_goals.junior_enterprise_id','=','ej.id')
        ->join('cores','cores.id','=','ej.core_id')
        ->join('foundations','foundations.id','=','ej.foundation_id')
        ->where('ej.id','=', $id)
        ->where('junior_enterprise_goals.year', '=', $year)
        ->where(DB::raw('YEAR(projects.signature_date)'), '=', $year);
    }
}
