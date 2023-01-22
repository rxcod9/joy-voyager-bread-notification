<?php

namespace Joy\VoyagerBreadNotification\Database\Seeders;

use Illuminate\Database\Seeder;
use TCG\Voyager\Facades\Voyager;

class NotificationsTableSeeder extends Seeder
{
    /**
     * Auto generated seed file.
     *
     * @return void
     */
    public function run()
    {
        if (Voyager::model('Notification')->query()->count() > 0) {
            return false;
        }

        //
    }
}
