<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateJuniorEnterpriseGoalsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('junior_enterprise_goals', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('year');
            $table->decimal('billing');
            $table->integer('projects');
            $table->integer('members_performing');
            $table->integer('shared_actions');
            $table->integer('members_events');
            $table->integer('nps');
            $table->integer('impact_projects');
            $table->bigInteger('junior_enterprise_id');
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
        Schema::dropIfExists('junior_enterprise_goals');
    }
}
