<?php

namespace Joy\VoyagerBreadNotification\Database\Seeders;

use Illuminate\Database\Seeder;
use TCG\Voyager\Facades\Voyager;

class DataTypesTableSeeder extends Seeder
{
    /**
     * Auto generated seed file.
     */
    public function run()
    {
        $dataType = $this->dataType('slug', 'notifications');
        if (!$dataType->exists) {
            $dataType->fill([
                'name'                  => 'notifications',
                'display_name_singular' => __('joy-voyager-bread-notification::seeders.data_types.notification.singular'),
                'display_name_plural'   => __('joy-voyager-bread-notification::seeders.data_types.notification.plural'),
                'icon'                  => 'voyager-bread voyager-bread-notification voyager-bell',
                'model_name'            => Voyager::modelClass('Notification'),
                // 'policy_name'           => 'Joy\\VoyagerBreadNotification\\Policies\\NotificationPolicy',
                // 'controller'            => 'Joy\\VoyagerBreadNotification\\Http\\Controllers\\VoyagerBreadNotificationController',
                'generate_permissions'  => 1,
                'description'           => '',
            ])->save();
        }
    }

    /**
     * [dataType description].
     *
     * @param [type] $field [description]
     * @param [type] $for   [description]
     *
     * @return [type] [description]
     */
    protected function dataType($field, $for)
    {
        return Voyager::model('DataType')->firstOrNew([$field => $for]);
    }
}
