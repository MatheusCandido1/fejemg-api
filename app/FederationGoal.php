<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FederationGoal extends Model
{
    public function federation()
    {
        return $this->belongsTo('App\Federation');
    }

    
}
