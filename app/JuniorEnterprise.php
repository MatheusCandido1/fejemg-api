<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class JuniorEnterprise extends Model
{
    protected $fillable = [
        'name', 'email', 'about', 'associated_since', 'cnpj', 'website', 'members', 'core_id', 'foundation_id'
    ];
    public function image()
    {
        return $this->morphOne('App\Image', 'imageable');
    }

    public function core()
    {
        return $this->belongsTo('App\Core');
    }

    public function foundation()
    {
        return $this->belongsTo('App\Foundation');
    }


    public function services()
    {
        return $this->belongsToMany('App\Service');
    }

    public function projects()
    {
        return $this->hasMany('App\JuniorEnterpriseProject');
    }

    public function junior_enterprise_goals()
    {
        return $this->hasMany('App\JuniorEnterpriseGoal');
    }

    public function degrees()
    {
        return $this->belongsToMany('App\Degree');
    }
}
