<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class JuniorEnterpriseGoal extends Model
{
    public function junior_enterprise()
    {
        return $this->belongsTo('App\JuniorEnterprise');
    }
}
