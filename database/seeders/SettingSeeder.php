<?php

namespace Database\Seeders;

use App\Models\Setting;
use Illuminate\Database\Seeder;

class SettingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Setting::create(array(
            'appName' => 'Urbanisme',
            'appTitle' => 'Urbanisme for requests',
            'appLogoImage' => '',
            'appBgLoginImage' => '',
            'appAdresse' => '',
            'appPhone1' => '',
            'appPhone2' => '',
            'appFixe' => '',
        ));
    }
}
