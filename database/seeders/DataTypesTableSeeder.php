<?php

namespace Joy\VoyagerBreadReplaceKeyword\Database\Seeders;

use Illuminate\Database\Seeder;
use TCG\Voyager\Models\DataType;

class DataTypesTableSeeder extends Seeder
{
    /**
     * Auto generated seed file.
     */
    public function run()
    {
        $dataType = $this->dataType('slug', 'replace-keywords');
        if (!$dataType->exists) {
            $dataType->fill([
                'name'                  => 'replace_keywords',
                'display_name_singular' => __('joy-voyager-bread-replace-keyword::seeders.data_types.replace_keyword.singular'),
                'display_name_plural'   => __('joy-voyager-bread-replace-keyword::seeders.data_types.replace_keyword.plural'),
                'icon'                  => 'voyager-bread',
                'model_name'            => 'Joy\\VoyagerBreadReplaceKeyword\\Models\\ReplaceKeyword',
                // 'policy_name'           => 'Joy\\VoyagerBreadReplaceKeyword\\Policies\\ReplaceKeywordPolicy',
                // 'controller'            => 'Joy\\VoyagerBreadReplaceKeyword\\Http\\Controllers\\VoyagerBreadReplaceKeywordController',
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
        return DataType::firstOrNew([$field => $for]);
    }
}
