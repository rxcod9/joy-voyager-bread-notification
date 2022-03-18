<?php

return [

    /*
     * If enabled for voyager-bread-notification package.
     */
    'enabled' => env('VOYAGER_BREAD_NOTIFICATION_ENABLED', true),

    /*
     * The config_key for voyager-bread-notification package.
     */
    'config_key' => env('VOYAGER_BREAD_NOTIFICATION_CONFIG_KEY', 'joy-voyager-bread-notification'),

    /*
     * The route_prefix for voyager-bread-notification package.
     */
    'route_prefix' => env('VOYAGER_BREAD_NOTIFICATION_ROUTE_PREFIX', 'joy-voyager-bread-notification'),

    /*
    |--------------------------------------------------------------------------
    | Controllers config
    |--------------------------------------------------------------------------
    |
    | Here you can specify voyager controller settings
    |
    */

    'controllers' => [
        'namespace' => 'Joy\\VoyagerBreadNotification\\Http\\Controllers',
    ],
];
