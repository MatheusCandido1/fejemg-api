<?php

use Illuminate\Database\Seeder;
use App\JuniorEnterprise;
use Carbon\Carbon;

class JuniorEnterprisesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        JuniorEnterprise::insert([
            ['name' => 'InfoAlto', 'email' => 'contato@infoalto.com.br', 'about' => 'Empresa Junior de sistemas de informação da UFV', 'associated_since' => Carbon::now()->format('Y-m-d H:i:s'), 'cnpj' => '00.000.000/0000-00', 'website' => 'www.site.com.br', 'members' => '17', 'foundation_id' => '1', 'core_id' => '3', 'created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')],
            ['name' => 'Projet Consultoria Jr', 'email' => 'contato@Projet.com.br', 'about' => 'Empresa Junior de Engenharia de Produção', 'associated_since' => Carbon::now()->format('Y-m-d H:i:s'), 'cnpj' => '00.000.000/0000-00', 'website' => 'www.site.com.br', 'members' => '40', 'foundation_id' => '1', 'core_id' => '2', 'created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')],
            ['name' => 'Mais Consultoria', 'email' => 'contato@mais.com.br', 'about' => 'Empresa Junior de Engenharia de Produção', 'associated_since' => Carbon::now()->format('Y-m-d H:i:s'), 'cnpj' => '00.000.000/0000-00', 'website' => 'www.site.com.br', 'members' => '28', 'foundation_id' => '1', 'core_id' => '5', 'created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')],
            ['name' => 'EMAS', 'email' => 'contato@emas.com.br', 'about' => 'Empresa Junior de Engenharia Civil', 'associated_since' => Carbon::now()->format('Y-m-d H:i:s'), 'cnpj' => '00.000.000/0000-00', 'website' => 'www.site.com.br', 'members' => '63', 'foundation_id' => '1', 'core_id' => '7', 'created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')],
            ['name' => 'Unifer Jr', 'email' => 'contato@unifejr.com.br', 'about' => 'Empresa Junior de Gestão', 'associated_since' => Carbon::now()->format('Y-m-d H:i:s'), 'cnpj' => '00.000.000/0000-00', 'website' => 'www.site.com.br', 'members' => '37', 'foundation_id' => '1', 'core_id' => '4', 'created_at' => Carbon::now()->format('Y-m-d H:i:s'),'updated_at' => Carbon::now()->format('Y-m-d H:i:s')]
        ]);
    }
}
