<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    public function projects()
    {
        return $this->belongsToMany('App\JuniorEnterpriseProject');
    }
    //
    public function ods()
    {
        return $this->belongsToMany('App\Ods');
    }
}
