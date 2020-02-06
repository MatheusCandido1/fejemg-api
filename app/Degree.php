<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Degree extends Model
{
    public function junior_enterprises()
    {
        return $this->belongsToMany('App\JuniorEnterprise');
    }
}
