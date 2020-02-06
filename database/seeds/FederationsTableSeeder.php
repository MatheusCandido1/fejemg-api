<?php

use Illuminate\Database\Seeder;
use App\Federation;
use Carbon\Carbon;

class FederationsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Federation::create(['name' => 'FEJEMG' ,'cnpj' => '01.328.030/0001-94','created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')]);
    }
}
