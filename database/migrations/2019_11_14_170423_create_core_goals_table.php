<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCoreGoalsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('core_goals', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('year');
            $table->integer('growth');
            $table->boolean('mandala');
            $table->integer('connected');
            $table->integer('quantity');
            $table->integer('ies');
            $table->integer('junior_ies');
            $table->integer('impact');
            $table->integer('nps');
            $table->bigInteger('core_id');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('core_goals');
    }
}
