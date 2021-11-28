<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cme_site extends Model
{
    //
    protected $fillable = ['nama','type_tower','alamat','longitude','latitude'];

    protected $table = 'cme_site';

    public $timestamps = false;
}
