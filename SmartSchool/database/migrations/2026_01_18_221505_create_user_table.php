<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('users', function (Blueprint $table) {
            //user data
            $table->integer('id')->primary()->autoIncrement();
            $table->char('name', length:100)->nullable(false);
            $table->char('surname', length:100)->nullable(false);
            $table->char('username', length:50)->nullable(false)->unique();
            $table->char('email', length:150)->nullable(false)->unique();
            $table->char('password', length:255)->nullable(false);
            //user log info
            $table->boolean('is_active')->default(true);
            $table->timestamp('email_verified_at')->nullable(true);
            $table->timestamp('last_login_at')->nullable(true);
            $table->char(column: 'last_login_ip', length:45)->nullable(true);
            $table->integer('failed_attempts')->default(0);
            $table->text('notes')->nullable(true);
            //user created
            $table->timestamps(precision:0);
        });


        Schema::create('roles', function (Blueprint $table) {
            $table->integer('id')->primary()->autoIncrement();
            $table->char('name', length:50)->nullable(false)->unique();
            $table->char('description', length:255)->nullable(true);
        });
        
         Schema::create('role_users', function (Blueprint $table) {
            $table->unsignedinteger('user_id')->nullable(false);
            $table->unsignedinteger('role_id')->nullable(false);
            $table->timestamp('assigned_at')->useCurrent();
            $table->primary('user_id','role_id');
            $table->foreign('user_id')->references('id')->on('users');
            $table->foreign('role_id')->references('id')->on('roles');
         });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('user');
        Schema::dropIfExists('roles');
        Schema::dropIfExists('role_users');
    }
};
