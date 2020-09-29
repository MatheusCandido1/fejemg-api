<?php

use Illuminate\Database\Seeder;
use App\JuniorEnterpriseGoal;
use Carbon\Carbon;

class JuniorEnterpriseGoalsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        JuniorEnterpriseGoal::insert([
        //    ['year' => '2019' ,'billing' => '18000','projects' => '15','members_performing' => '70','shared_actions' => '1','members_events' => '70', 'nps' => '45', 'impact_projects' => '4', 'junior_enterprise_id' => '1', 'created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')],
            ['year' => '2019' ,'billing' => '99200','projects' => '32','members_performing' => '75','shared_actions' => '2','members_events' => '80', 'nps' => '39', 'impact_projects' => '8', 'junior_enterprise_id' => '2', 'created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')],
            ['year' => '2019' ,'billing' => '236700','projects' => '40','members_performing' => '75','shared_actions' => '5','members_events' => '75', 'nps' => '76', 'impact_projects' => '16', 'junior_enterprise_id' => '3', 'created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')],
            ['year' => '2019' ,'billing' => '160000','projects' => '90','members_performing' => '70','shared_actions' => '5','members_events' => '75', 'nps' => '50', 'impact_projects' => '23', 'junior_enterprise_id' => '4', 'created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')],
            ['year' => '2019' ,'billing' => '110400','projects' => '27','members_performing' => '75','shared_actions' => '2','members_events' => '43', 'nps' => '50', 'impact_projects' => '7', 'junior_enterprise_id' => '5', 'created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')]
        ]);
    }
}
