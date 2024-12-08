<?php

namespace App\Models;

use CodeIgniter\Model;

class BlokModel extends Model {
    protected $table = 'blok';  
    protected $primaryKey = 'id_blok';  
    protected $allowedFields = ['id_blok', 'nama_blok'];  
}


?>