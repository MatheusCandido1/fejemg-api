<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    protected $fillable = [
        'signature_date', 'due_date', 'working_days', 'project_quantity', 'billing', 'legal_person', 'shared_action', 'guidance'
    ];
    
    public function junior_enterprises()
    {
        return $this->belongsToMany('App\JuniorEnterprise');
    }
    //
    public function ods()
    {
        return $this->belongsToMany('App\Ods');
    }
}
