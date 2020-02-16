<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddCurrentMembersEventTableJuniorEnterpriseGoals extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('junior_enterprise_goals', function (Blueprint $table) {
            $table->integer('current_members_events');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('junior_enterprise_goals', function (Blueprint $table) {
            $table->dropColumn('current_members_events');
        });
    }
}
