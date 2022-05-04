<?php

namespace Joy\VoyagerBreadNotification\Database\Seeders;

use Joy\VoyagerBreadNotification\Models\Notification;
use Illuminate\Database\Seeder;

class NotificationsTableSeeder extends Seeder
{
    /**
     * Auto generated seed file.
     *
     * @return void
     */
    public function run()
    {
        if (Notification::query()->count() > 0) {
            return false;
        }

        //
    }
}
