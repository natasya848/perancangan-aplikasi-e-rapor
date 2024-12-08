<?php

namespace App\Models;

use CodeIgniter\Model;

class ModelCatatan extends Model
{
    protected $table = 'rapor'; 
    protected $primaryKey = 'id_rapor'; 
    protected $allowedFields = ['nis', 'catatan']; 
    protected $useTimestamps = true; 

    // Corrected the typo from 'ppublic' to 'public'
    public function getCatatanByNis($nis)
    {
        // Query to get the catatan for the specific nis
        $builder = $this->db->table('rapor')
            ->select('rapor.catatan')
            ->join('siswa', 'siswa.nis = rapor.nis', 'inner')
            ->where('siswa.nis', $nis);

        // Execute and return the result
        return $builder->get()->getRowArray(); // or getResultArray() depending on what you want to return
    }
}

// 	public function saveCatatan($nis, $catatan)
// {
//     $existingCatatan = $this->where('nis', $nis)->first();
    
//     if ($existingCatatan) {
//         return $this->update($existingCatatan['id_rapor'], ['catatan' => $catatan]);
//     } else {
//         return $this->save(['nis' => $nis, 'catatan' => $catatan]);
//     }
// }

