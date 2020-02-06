<?php

use Illuminate\Database\Seeder;
use App\Core;
use Carbon\Carbon;

class CoresTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Core::insert([
            ['name' => 'Núcleo Norte' ,'federation_id' => '1','cnpj' => '00.000.000/0000-00','created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')],
            ['name' => 'Núcleo da Mata' ,'federation_id' => '1','cnpj' => '00.000.000/0000-00','created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')],
            ['name' => 'Núcleo Triângulo' ,'federation_id' => '1','cnpj' => '00.000.000/0000-00','created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')],
            ['name' => 'Núcleo Sul' ,'federation_id' => '1','cnpj' => '00.000.000/0000-00','created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')],
            ['name' => 'Núcleo Vertentes' ,'federation_id' => '1','cnpj' => '00.000.000/0000-00','created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')],
            ['name' => 'Núcleo Vale do Aço' ,'federation_id' => '1','cnpj' => '00.000.000/0000-00','created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')],
            ['name' => 'Núcleo Central' ,'federation_id' => '1','cnpj' => '00.000.000/0000-00','created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')]
        ]);
    }
}
