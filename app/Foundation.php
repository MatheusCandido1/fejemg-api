<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Foundation extends Model
{
    public function junior_enterprises()
    {
        return $this->hasMany('App\JuniorEnterprise');
    }
}
