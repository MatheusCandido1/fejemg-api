<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class Core extends Model
{
    protected $table = "cores";
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

    public function getCoreGoalByMonth($id, $year){
        return DB::table('cores as c')
        ->selectRaw('TRUNCATE((meta.billing/12),2) as `Jan`, TRUNCATE((meta.billing/12)*2,2) as `Fev`, TRUNCATE((meta.billing/12)*3,2) as `Mar`, TRUNCATE((meta.billing/12)*4,2) as `Abr`, TRUNCATE((meta.billing/12)*5,2) as `Mai`, TRUNCATE((meta.billing/12)*6,2) as `Jun`,TRUNCATE((meta.billing/12)*7,2) as `Jul`, TRUNCATE((meta.billing/12)*8,2) as `Ago`,TRUNCATE((meta.billing/12)*9,2) as `Set`, TRUNCATE((meta.billing/12)*10,2) as `Out`, TRUNCATE((meta.billing/12)*11,2) as `Nov`, TRUNCATE((meta.billing/12)*12,2) as `Dez`')
        ->join('core_goals as meta','c.id','=','meta.core_id')
        ->where('c.id','=',$id)
        ->where('meta.year','=',$year);
    }
}
