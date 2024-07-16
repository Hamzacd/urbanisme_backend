<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUrbRequestsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('urb_requests', function (Blueprint $table) {
            $table->id();
            $table->string('proprietyFile')->nullable();
            $table->string('architectFile')->nullable();
            $table->string('topographiqueFile')->nullable();
            $table->string('procurationFile')->nullable();
            $table->string('file_type')->nullable();
            $table->boolean('status')->default(0);
            $table->boolean('canceled')->default(false);
            $table->bigInteger('user_id')->unsigned()->nullable();
            $table->foreign('user_id')->references('id')->on('users')
                ->onDelete('set null')->onUpdate('cascade');
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
        Schema::dropIfExists('urb_requests');
    }
}
