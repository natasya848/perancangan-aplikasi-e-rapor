<?php

namespace App\Models;

use CodeIgniter\Model;

class RombelModel extends Model
{
    protected $table = 'rombel'; // Adjust table name if necessary
    protected $primaryKey = 'id_rombel';
    protected $allowedFields = ['nama_rombel'];

    // Optional: Add methods if necessary
}
