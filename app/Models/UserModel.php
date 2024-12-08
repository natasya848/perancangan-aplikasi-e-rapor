<?php

namespace App\Models;

use CodeIgniter\Model;

class UserModel extends Model
{
    protected $table      = 'user';
    protected $primaryKey = 'id_user';
    protected $allowedFields = ['nama_user', 'username', 'password', 'level'];

     public function getUserByUsername($username)
    {
        return $this->where('username', $username)->first();  // Menggunakan first() untuk mengambil data pertama
    }
}

