<?php

namespace App\Models;
use CodeIgniter\Model;

class ModelNilai extends Model
{
    protected $table = 'nilai';
    protected $primaryKey = 'id_nilai';
    protected $allowedFields = ['nis', 'id_rombel', 'id_mapel', 'id_guru', 'id_tahun', 'nilai'];
    
     public function __construct()
    {
        parent::__construct();
        $this->db = \Config\Database::connect();  // Ensuring connection is available
    }
    
    public function getSiswaById($id_siswa)
{
    $builder = $this->db->table('siswa');
    return $builder->getWhere(['id_siswa' => $id_siswa])->getRowArray();
}

    public function getNilaiWithJoinById($id)
{
    return $this->db->table('nilai')
        ->join('siswa', 'siswa.nis = nilai.nis')
        ->where('nilai.id', $id)
        ->get()->getResult();
}

    public function getNilaiByBlokSiswa($id_siswa, $id_blok) 
    {
        $this->db->select('n.nilai, m.nama_mapel');
        $this->db->from('nilai n');
        $this->db->join('jadwal j', 'n.id_jadwal = j.id_jadwal');
        $this->db->join('mapel m', 'j.id_mapel = m.id_mapel');
        $this->db->where('n.id_siswa', $id_siswa);
        $this->db->where('j.id_blok', $id_blok);
        return $this->db->get()->result_array(); 
    }

     public function getNilaiBySiswaAndBlok($id_siswa, $id_blok)
    {
        return $this->where('id_siswa', $id_siswa)
                    ->where('id_blok', $id_blok)
                    ->findAll();
    }

    public function getSiswaByNis($nis)
    {
        $query = $this->db->table('siswa')->where('nis', $nis)->get();
        
        if ($query->getNumRows() > 0) {
            return $query->getFirstRow('array'); 
        } else {
            return null;
        }
    }

    public function getNilaiWithJoin($nis)
    {
        $siswaModel = new \App\Models\ModelSiswa();

    $siswa = $siswaModel->getSiswaByNis($nis);
    
        $query = $this->db->table('nilai')
            ->select('siswa.nis, siswa.nama_siswa, rombel.nama_rombel, mapel.nama_mapel, guru.nama_guru, blok.kode_blok, jadwal.sesi, tahun_ajaran.nama_tahun, semester.kode_semester, nilai.nilai')
            ->join('siswa', 'siswa.id_siswa = nilai.id_siswa', 'inner')
            ->join('jadwal', 'jadwal.id_jadwal = nilai.id_jadwal', 'inner')
            ->join('mapel', 'mapel.id_mapel = jadwal.id_mapel', 'left')
            ->join('guru', 'guru.id_guru = jadwal.id_guru', 'left')
            ->join('blok', 'blok.id_blok = jadwal.id_blok', 'left')
            ->join('rombel', 'rombel.id_rombel = jadwal.id_rombel', 'left')
            ->join('tahun_ajaran', 'tahun_ajaran.id_tahunajaran = jadwal.id_tahunajaran', 'left')
            ->join('semester', 'semester.id_semester = jadwal.id_semester', 'left')  // JOIN untuk semester
            ->where('siswa.nis', $nis)
            ->get();

        log_message('debug', 'Query: ' . $this->db->getLastQuery());

        if ($query === false) 
        {
            log_message('error', 'Query failed: ' . $this->db->getLastQuery());
            return null;
        }

        if ($query->getNumRows() > 0) {
            return $query->getResultArray();
        } else {
            return null;
        }
    }

    public function getNilaiWithJoinByNis($nis)
{
    return $this->db->table('nilai')
        ->select('siswa.nis, siswa.nama_siswa, rombel.nama_rombel, mapel.nama_mapel, guru.nama_guru, blok.kode_blok, jadwal.sesi, tahun_ajaran.nama_tahun, semester.kode_semester, nilai.nilai')
        ->join('siswa', 'siswa.id_siswa = nilai.id_siswa', 'inner')
        ->join('jadwal', 'jadwal.id_jadwal = nilai.id_jadwal', 'inner')
        ->join('mapel', 'mapel.id_mapel = jadwal.id_mapel', 'left')
        ->join('guru', 'guru.id_guru = jadwal.id_guru', 'left')
        ->join('blok', 'blok.id_blok = jadwal.id_blok', 'left')
        ->join('rombel', 'rombel.id_rombel = jadwal.id_rombel', 'left')
        ->join('tahun_ajaran', 'tahun_ajaran.id_tahunajaran = jadwal.id_tahunajaran', 'left')
        ->join('semester', 'semester.id_semester = jadwal.id_semester', 'left')
        ->where('siswa.nis', $nis)
        ->get()->getResultArray();
}
}
