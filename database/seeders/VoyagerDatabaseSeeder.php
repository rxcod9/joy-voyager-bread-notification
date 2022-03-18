<?php

namespace Joy\VoyagerBreadReplaceKeyword\Database\Seeders;

use Illuminate\Database\Seeder;

class VoyagerDatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->call([
            DataTypesTableSeeder::class,
            DataRowsTableSeeder::class,
            // MenusTableSeeder::class,
            MenuItemsTableSeeder::class,
            // RolesTableSeeder::class,
            PermissionsTableSeeder::class,
            PermissionRoleTableSeeder::class,
            SettingsTableSeeder::class,
            // UserSettingsPermissionsTableSeeder::class,
            PermissionRoleTableSeeder::class,
            // UserSettingsTableSeeder::class,
            ReplaceKeywordsTableSeeder::class,
        ]);
    }
}
