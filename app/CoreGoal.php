<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CoreGoal extends Model
{
    public function core()
    {
        return $this->belongsTo('App\Core');
    }

    public function core_goals()
    {
        return $this->hasMany('App\Core');
    }
}
