<?php

namespace App\Models;

use CodeIgniter\Model;

class ModelRapor extends Model
{
    protected $table = 'rapor';
    protected $primaryKey = 'id_rapor';
    protected $allowedFields = ['nis', 'catatan'];

    public function __construct()
    {
        parent::__construct(); 
    }

   public function saveCatatan($nis, $catatan)
{
    // Cek apakah catatan sudah ada untuk nis tersebut
    $existingCatatan = $this->where('nis', $nis)->first();
    
    if ($existingCatatan) {
        // Jika sudah ada catatan, update berdasarkan id_rapor
        return $this->update($existingCatatan['id_rapor'], ['catatan' => $catatan]);
    } else {
        // Jika belum ada, simpan catatan baru
        return $this->save(['nis' => $nis, 'catatan' => $catatan]);
    }
}

   public function getCatatanByNis($nis)
    {
        return $this->db->table($this->table)
                        ->select('catatan')
                        ->where('nis', $nis)
                        ->get()
                        ->getRowArray();
    }
}
