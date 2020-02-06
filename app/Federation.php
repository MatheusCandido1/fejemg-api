<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Federation extends Model
{
    public function image()
    {
        return $this->morphOne('App\Image', 'imageable');
    }

    public function cores()
    {
        return $this->hasMany('App\Core');
    }

    public function federation_goals()
    {
        return $this->hasMany('App\FederationGoal');
    }
}
