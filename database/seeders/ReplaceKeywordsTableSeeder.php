<?php

namespace Joy\VoyagerBreadReplaceKeyword\Database\Seeders;

use Joy\VoyagerBreadReplaceKeyword\Models\ReplaceKeyword;
use Illuminate\Database\Seeder;

class ReplaceKeywordsTableSeeder extends Seeder
{
    /**
     * Auto generated seed file.
     *
     * @return void
     */
    public function run()
    {
        if (ReplaceKeyword::query()->count() > 0) {
            return false;
        }

        $count = 100;
        ReplaceKeyword::factory()
            ->count($count)
            ->state(function (array $attributes) use ($count) {
                return [
                    'name' => 'ReplaceKeyword ' . time()
                        . ' ' . rand(1, $count)
                        . ' ' . rand(1, $count)
                        . ' ' . rand(1, $count),
                    'description' => 'ReplaceKeyword Description ' . time()
                        . ' ' . rand(1, $count)
                        . ' ' . rand(1, $count)
                        . ' ' . rand(1, $count)
                ];
            })
            ->create();
    }
}
