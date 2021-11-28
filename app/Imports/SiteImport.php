<?php

namespace App\Imports;

use App\Cme_site;
use Maatwebsite\Excel\Concerns\ToModel;

class SiteImport implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new Cme_site([
            'nama'     => $row[0],
            'type_tower'    => $row[1],
            'alamat' => $row[2],
            'longitude' => $row[3],
            'latitude' => $row[4],
        ]);
    }
}
