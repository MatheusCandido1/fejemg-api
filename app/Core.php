<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Core extends Model
{
    protected $fillable = [
        'name', 'cnpj', 'federation_id', 'image'
    ];


    public function image()
    {
        return $this->morphOne('App\Image', 'imageable');
    }

    public function federation()
    {
        return $this->belongsTo('App\Federation');
    }

    public function junior_enterprises()
    {
        return $this->hasMany('App\JuniorEnterprise');
    }
}
