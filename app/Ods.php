<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ods extends Model
{
    public function image()
    {
        return $this->morphOne('App\Image', 'imageable');
    }

    public function projects()
    {
        return $this->belongsToMany('App\Project');
    }
}
