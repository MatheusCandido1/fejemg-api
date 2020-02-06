<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    public function junior_enterprises()
    {
        return $this->belongsToMany('App\JuniorEnterprise');
    }
}
