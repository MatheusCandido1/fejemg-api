<?php

use Illuminate\Database\Seeder;
use App\JuniorEnterpriseProject;
use Carbon\Carbon;

class JuniorEnterpriseProjectsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        JuniorEnterpriseProject::insert([
            ['junior_enterprise_id' => '1', 'project_id' => '1', 'created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')],
            ['junior_enterprise_id' => '2', 'project_id' => '2', 'created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')],
            ['junior_enterprise_id' => '3', 'project_id' => '3', 'created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')],
            ['junior_enterprise_id' => '4', 'project_id' => '4', 'created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')],
            ['junior_enterprise_id' => '5', 'project_id' => '5', 'created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')],
            ['junior_enterprise_id' => '1', 'project_id' => '6', 'created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')],
            ['junior_enterprise_id' => '2', 'project_id' => '7', 'created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')]
        ]);
    }
}
