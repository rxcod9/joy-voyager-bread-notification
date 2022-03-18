<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateReplaceKeywordsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('replace_keywords', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable();
            $table->text('description')->nullable();
            $table->string('image')->nullable();

            $table->bigInteger('created_by_id')->unsigned()->nullable()->default(null);
            $table->foreign('created_by_id')->references('id')->on('users')->onUpdate('cascade')->onDelete('set null');

            $table->bigInteger('modified_by_id')->unsigned()->nullable()->default(null);
            $table->foreign('modified_by_id')->references('id')->on('users')->onUpdate('cascade')->onDelete('set null');

            $table->bigInteger('assigned_to_id')->unsigned()->nullable()->default(null);
            $table->foreign('assigned_to_id')->references('id')->on('users')->onUpdate('cascade')->onDelete('set null');

            $table->bigInteger('parent_id')->unsigned()->nullable()->default(null);
            $table->foreign('parent_id')->references('id')->on('replace_keywords')->onUpdate('cascade')->onDelete('set null');

            
            $table->enum('status', ['ACTIVE', 'INACTIVE', 'EXPIRED'])->default('ACTIVE');

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
        Schema::dropIfExists('replace_keywords');
    }
}
