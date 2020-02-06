<?php

use Illuminate\Database\Seeder;
use App\Project;
use Carbon\Carbon;

class ProjectsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Project::insert([
            ['signature_date' => Carbon::now()->format('Y-m-d H:i:s'), 'due_date' => Carbon::now()->format('Y-m-d H:i:s'),'working_days' => '20','project_quantity' => '2','billing' => '3000','legal_person' => '0', 'shared_action' => '0', 'guidance' => '0', 'created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')],
            ['signature_date' => Carbon::now()->format('Y-m-d H:i:s') ,'due_date' => Carbon::now()->format('Y-m-d H:i:s'),'working_days' => '30','project_quantity' => '1','billing' => '2743','legal_person' => '0', 'shared_action' => '0', 'guidance' => '0', 'created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')],
            ['signature_date' => Carbon::now()->format('Y-m-d H:i:s') ,'due_date' => Carbon::now()->format('Y-m-d H:i:s'),'working_days' => '15','project_quantity' => '2','billing' => '2321','legal_person' => '0', 'shared_action' => '0', 'guidance' => '0', 'created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')],
            ['signature_date' => Carbon::now()->format('Y-m-d H:i:s') ,'due_date' => Carbon::now()->format('Y-m-d H:i:s'),'working_days' => '90','project_quantity' => '3','billing' => '6543','legal_person' => '0', 'shared_action' => '0', 'guidance' => '0', 'created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')],
            ['signature_date' => Carbon::now()->format('Y-m-d H:i:s') ,'due_date' => Carbon::now()->format('Y-m-d H:i:s'),'working_days' => '30','project_quantity' => '1','billing' => '343','legal_person' => '0', 'shared_action' => '0', 'guidance' => '0', 'created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')],
            ['signature_date' => Carbon::now()->format('Y-m-d H:i:s') ,'due_date' => Carbon::now()->format('Y-m-d H:i:s'),'working_days' => '70','project_quantity' => '2','billing' => '43243','legal_person' => '0', 'shared_action' => '0', 'guidance' => '0', 'created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')],
            ['signature_date' => Carbon::now()->format('Y-m-d H:i:s') ,'due_date' => Carbon::now()->format('Y-m-d H:i:s'),'working_days' => '10','project_quantity' => '3','billing' => '3800','legal_person' => '0', 'shared_action' => '0', 'guidance' => '0', 'created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')]
        ]);
    }
}
