<?php

namespace App\Models;

use CodeIgniter\Model;

class M_belajar extends Model
{
    protected $table      = 'siswa';
    protected $primaryKey = 'id_siswa';
    protected $useAutoIncrement = true;
    protected $allowedFields = ['nis', 'nama_siswa', 'id_user','id_kelas', 'id_rombel', 'tanggal_lahir', 'alamat', 'jenis_kelamin'];

    public function get_siswa() 
    {
        return $this->db->table('siswa')->get()->getResult();
    }

    public function get_mapel() 
    {
        return $this->db->table('mapel')->get()->getResult();
    }

    public function get_blok() 
    {
        return $this->db->table('blok')->get()->getResult();
    }

    public function get_semester() 
    {
        return $this->db->table('semester')->get()->getResult();
    }

    public function get_all_rombels() 
    {
        return $this->db->table('rombel')->get()->getResult();
    }

    public function get_rombel_by_name($nama_rombel)
    {
        return $this->db->table('rombel')->where('nama_rombel', $nama_rombel)->get()->getRow();
    }

    public function get_jadwal_by_rombel_mapel_blok($id_rombel, $id_mapel, $id_blok) 
    {
        return $this->db->table('jadwal')
                        ->where('id_rombel', $id_rombel)
                        ->where('id_mapel', $id_mapel)
                        ->where('id_blok', $id_blok)
                        ->get()
                        ->getRow();
    }

    public function save_nilai($data) 
    {
        return $this->db->table('nilai')->insert($data);
    }

    public function get_guru()
    {
        return $this->db->table('guru')->get()->getResult();
    }

    public function get_nilai_by_id($id_nilai)
    {   
        return $this->db->table('nilai')->where('id_nilai', $id_nilai)->get()->getRow();
    }

    public function update_nilai($id_nilai, $data)
    {
        return $this->db->table('nilai')
                        ->where('id_nilai', $id_nilai)
                        ->update($data);
    }

   public function update($id = NULL, $data = NULL): bool
{
    return $this->db->table('siswa')->update($data, ['id_siswa' => $id]);
}

    public function getGuru()
{
    $query = $this->db->table('guru')
        ->select('guru.*, user.username as email, user.level')
        ->join('user', 'guru.id_user = user.id_user', 'left') 
        ->get();

    return $query->getResult(); 
}
    
    public function insertGuru(array $guruData, array $userData)
{
    $this->db->transStart(); 

    $this->db->table('user')->insert($userData);

    $id_user = $this->db->insertID();

    $guruData['id_user'] = $id_user;

    $this->db->table('guru')->insert($guruData);

    $this->db->transComplete(); 
    return $this->db->transStatus(); 
}

public function tampil($table, $by) {
    $query = $this->db->table($table)
                      ->orderBy($by, 'desc')
                      ->get();
    
    if (!$query) {
        echo "Query failed.";
    } else {
        return $query->getResult();
    }
}

    public function updateSiswa()
{
    $id_siswa = 123; 
    return $this->simpan_siswa($id_siswa);
}

    public function getSiswaData()
{
   $query = $this->db->table('siswa')
                  ->select('siswa.*, kelas.nama_kelas, rombel.nama_rombel, user.username, user.level')
                  ->join('kelas', 'siswa.id_kelas = kelas.id_kelas', 'left')
                  ->join('rombel', 'siswa.id_rombel = rombel.id_rombel', 'left')
                  ->join('user', 'siswa.id_user = user.id_user', 'left');
$result = $query->get();
if (!$result) {
    $lastQuery = $this->db->getLastQuery(); 
    log_message('error', 'Query failed: ' . $lastQuery); 
    return []; 
}

return $result->getResult();
}

	public function tampil1($table)
    {
		return $this->db->table($table)
						->get()
						->getResult();
	}

	public function tambah($table, $data) 
    {
        return $this->db->table($table)
        				->insert($data);
    }

	public function hapus($table, $data)
    {
		return $this->db->table($table)
						->delete($data);
	}

	public function getWhere($table, $where)
    {
		return $this->db->table($table)
						->getWhere($where)
						->getRow();
	}

	public function edit($table, $data, $where)
    {
		return $this->db->table($table)
						->update($data, $where);
	}

	public function join($table, $table2, $on) 
    {
        return $this->db->table($table)
                        ->join($table2, $on);
    }

	public function joinw($table,$table2,$on,$w)
    {
		return $this->db->table($table)
		->join($table2,$on)
		->where($w)
		->get()
		->getRow();
	}

	public function filter($table, $table2, $on, $filter1, $filter2, $awal,$akhir)
    {
		return $this ->db->table($table)
						 ->join($table2,$on)
						 ->where($filter1,$awal)
						 ->where($filter2,$akhir)
						 ->get()
						 ->getResult();
	}
	 
}