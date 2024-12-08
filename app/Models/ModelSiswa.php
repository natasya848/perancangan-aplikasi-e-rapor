<?php

namespace App\Models;

use CodeIgniter\Model;

class ModelSiswa extends Model
{
    protected $table = 'siswa'; 
    protected $primaryKey = 'id_siswa'; 
    protected $allowedFields = ['id_siswa', 'nis', 'nama_siswa', 'id_kelas', 'id_rombel', 'tanggal_lahir', 'alamat', 'jenis_kelamin', 'id_user'];

public function getDetailedSiswaById($id_siswa)
{
    $query = $this->db->table($this->table . ' as s')
                      ->select('s.*, k.nama_kelas, r.nama_rombel')
                      ->join('kelas k', 's.id_kelas = k.id_kelas', 'left')
                      ->join('rombel r', 's.id_rombel = r.id_rombel', 'left')
                      ->where('s.id_siswa', $id_siswa)
                      ->get();

    if (!$query) {
        log_message('error', 'Query gagal: ' . $this->db->error()['message']);
        return false;
    }

    return $query->getRowArray();
}

    public function getSiswaById($id_siswa)
{
    return $this->where('id_siswa', $id_siswa)->first(); 
}


    public function getSiswaByNis($nis)
    {
        return $this->where('nis', $nis)->first();  
    }

    public function getAllSiswa()
    {
        return $this->findAll();
    }
}

