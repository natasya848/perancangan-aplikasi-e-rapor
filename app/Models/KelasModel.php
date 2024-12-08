<?php

namespace App\Models;

use CodeIgniter\Model;

class KelasModel extends Model
{
    protected $table = 'kelas'; // Adjust table name if necessary
    protected $primaryKey = 'id_kelas';
    protected $allowedFields = ['nama_kelas'];
    
    // Optional: Add methods if necessary
}
