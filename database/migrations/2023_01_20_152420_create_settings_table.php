<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSettingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('settings', function (Blueprint $table) {
            $table->id();
            $table->string('appName')->default('Urbanisme');
            $table->string('appTitle')->default('Urbanisme');
            $table->string('appLogoImage')->nullable();
            $table->string('appBgLoginImage')->nullable();
            $table->longText('appAdresse')->nullable();
            $table->string('appPhone1')->nullable();
            $table->string('appPhone2')->nullable();
            $table->string('appFixe')->nullable();
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
        Schema::dropIfExists('settings');
    }
}
