<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class JuniorEnterpriseGoal extends Model
{
    protected $fillable = [
        'year', 'billing', 'projects', 'members_performing', 'shared_actions', 'members_events', 'nps', 'impact_projects', 'members_performing_goal','current_nps','cluster','current_members_events'
    ];
    public function junior_enterprise()
    {
        return $this->belongsTo('App\JuniorEnterprise');
    }
}
