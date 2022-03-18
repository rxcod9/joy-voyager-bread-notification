<?php

declare(strict_types=1);

namespace Joy\VoyagerBreadReplaceKeyword;

use Illuminate\Support\Facades\Route;
use Illuminate\Support\ServiceProvider;
use Joy\VoyagerBreadReplaceKeyword\Console\Commands\BreadReplaceKeyword;
use Joy\VoyagerBreadReplaceKeyword\Models\ReplaceKeyword as ModelsReplaceKeyword;
use TCG\Voyager\Facades\Voyager;

/**
 * Class VoyagerBreadReplaceKeywordServiceProvider
 *
 * @category  Package
 * @package   JoyVoyagerBreadReplaceKeyword
 * @author    Ramakant Gangwar <gangwar.ramakant@gmail.com>
 * @copyright 2021 Copyright (c) Ramakant Gangwar (https://github.com/rxcod9)
 * @license   http://github.com/rxcod9/joy-voyager-bread-replace-keyword/blob/main/LICENSE New BSD License
 * @link      https://github.com/rxcod9/joy-voyager-bread-replace-keyword
 */
class VoyagerBreadReplaceKeywordServiceProvider extends ServiceProvider
{
    /**
     * Boot
     *
     * @return void
     */
    public function boot()
    {
        Voyager::useModel('ReplaceKeyword', ModelsReplaceKeyword::class);

        $this->registerPublishables();

        $this->loadViewsFrom(__DIR__ . '/../resources/views', 'joy-voyager-bread-replace-keyword');

        $this->mapApiRoutes();

        $this->mapWebRoutes();

        $this->loadMigrationsFrom(__DIR__ . '/../database/migrations');

        $this->loadTranslationsFrom(__DIR__ . '/../resources/lang', 'joy-voyager-bread-replace-keyword');
    }

    /**
     * Define the "web" routes for the application.
     *
     * These routes all receive session state, CSRF protection, etc.
     */
    protected function mapWebRoutes(): void
    {
        Route::middleware('web')
            ->group(__DIR__ . '/../routes/web.php');
    }

    /**
     * Define the "api" routes for the application.
     *
     * These routes are typically stateless.
     */
    protected function mapApiRoutes(): void
    {
        Route::prefix(config('joy-voyager-bread-replace-keyword.route_prefix', 'api'))
            ->middleware('api')
            ->group(__DIR__ . '/../routes/api.php');
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->mergeConfigFrom(__DIR__ . '/../config/voyager-bread-replace-keyword.php', 'joy-voyager-bread-replace-keyword');

        if ($this->app->runningInConsole()) {
            $this->registerCommands();
        }
    }

    /**
     * Register publishables.
     *
     * @return void
     */
    protected function registerPublishables(): void
    {
        $this->publishes([
            __DIR__ . '/../config/voyager-bread-replace-keyword.php' => config_path('joy-voyager-bread-replace-keyword.php'),
        ], 'config');

        $this->publishes([
            __DIR__ . '/../resources/views' => resource_path('views/vendor/joy-voyager-bread-replace-keyword'),
        ], 'views');

        $this->publishes([
            __DIR__ . '/../resources/lang' => resource_path('lang/vendor/joy-voyager-bread-replace-keyword'),
        ], 'translations');
    }

    protected function registerCommands(): void
    {
        $this->app->singleton('command.joy.voyager.bread-replace-keyword', function () {
            return new BreadReplaceKeyword();
        });

        $this->commands([
            'command.joy.voyager.bread-replace-keyword',
        ]);
    }
}
