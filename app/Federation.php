<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use Illuminate\Support\Facades\DB;
class Federation extends Model
{
    
    protected $table = "federations";

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

    public function getFederationGoalByMonth($year){
        return DB::table('federations as c')
        ->selectRaw('TRUNCATE((meta.billing/12),2) as `Jan`, TRUNCATE((meta.billing/12)*2,2) as `Fev`, TRUNCATE((meta.billing/12)*3,2) as `Mar`, TRUNCATE((meta.billing/12)*4,2) as `Abr`, TRUNCATE((meta.billing/12)*5,2) as `Mai`, TRUNCATE((meta.billing/12)*6,2) as `Jun`,TRUNCATE((meta.billing/12)*7,2) as `Jul`, TRUNCATE((meta.billing/12)*8,2) as `Ago`,TRUNCATE((meta.billing/12)*9,2) as `Set`, TRUNCATE((meta.billing/12)*10,2) as `Out`, TRUNCATE((meta.billing/12)*11,2) as `Nov`, TRUNCATE((meta.billing/12)*12,2) as `Dez`')
        ->join('federation_goals as meta','c.id','=','meta.federation_id')
        ->where('c.id',1)
        ->where('meta.year','=',$year);
    }
}
