<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddCurrentNpsTableJuniorEnterpriseGoals extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('junior_enteprise_goals', function (Blueprint $table) {
            $table->integer('current_nps');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('junior_enteprise_goals', function (Blueprint $table) {
            $table->dropColumn('current_nps');
        });
    }
}
