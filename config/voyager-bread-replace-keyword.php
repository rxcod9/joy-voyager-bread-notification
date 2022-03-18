<?php

return [

    /*
     * If enabled for voyager-bread-replace-keyword package.
     */
    'enabled' => env('VOYAGER_BREAD_REPLACE_KEYWORD_ENABLED', true),

    /*
     * The config_key for voyager-bread-replace-keyword package.
     */
    'config_key' => env('VOYAGER_BREAD_REPLACE_KEYWORD_CONFIG_KEY', 'joy-voyager-bread-replace-keyword'),

    /*
     * The route_prefix for voyager-bread-replace-keyword package.
     */
    'route_prefix' => env('VOYAGER_BREAD_REPLACE_KEYWORD_ROUTE_PREFIX', 'joy-voyager-bread-replace-keyword'),

    /*
    |--------------------------------------------------------------------------
    | Controllers config
    |--------------------------------------------------------------------------
    |
    | Here you can specify voyager controller settings
    |
    */

    'controllers' => [
        'namespace' => 'Joy\\VoyagerBreadReplaceKeyword\\Http\\Controllers',
    ],
];
