<?php

namespace App\Models;

use CodeIgniter\Model;

class ModelBlok extends Model
{
    // Nama tabel yang terkait dengan model ini
    protected $table = 'blok';  // Sesuaikan dengan nama tabel yang ada di database
    protected $primaryKey = 'id_blok'; // Tentukan primary key

    // Kolom yang bisa diisi melalui query builder
    protected $allowedFields = ['id_blok', 'kode_blok'];  // Sesuaikan dengan nama kolom yang ada di tabel

    // Aturan validasi (opsional, jika perlu)
    protected $validationRules = [
        'kode_blok' => 'required|min_length[3]|max_length[10]',
    ];

    // Menambahkan fungsi untuk mengambil data blok berdasarkan id_blok
    public function getBlokById($id_blok)
    {
        return $this->where('id_blok', $id_blok)->first();
    }
}
