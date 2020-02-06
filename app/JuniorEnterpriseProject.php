<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class JuniorEnterpriseProject extends Model
{
    public function junior_enterprises()
    {
        return $this->belongsToMany('App\JuniorEnterprise');
    }

    public function projects()
    {
        return $this->belongsToMany('App\Project');
    }
}
