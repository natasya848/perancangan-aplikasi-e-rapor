<?php

namespace App\Controllers;
use CodeIgniter\Controllers;
use App\Models\M_belajar;
use App\Models\ModelSiswa;
use App\Models\ModelNilai;
use App\Models\ModelCatatan;
use App\Models\ModelRapor;
use App\Models\ModelBlok;
use App\Models\UserModel;
use Dompdf\Dompdf;
use Dompdf\Options;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\writer\Xlsx;

class Home extends BaseController
{
    protected $db;
    protected $ModelSiswa;
    protected $ModelNilai;
    protected $ModelRapor;
    protected $ModelCatatan;

    public function __construct()
    {
        $this->db = \Config\Database::connect();

        $this->ModelSiswa = new ModelSiswa();
        $this->ModelNilai = new ModelNilai();
        $this->ModelRapor = new \App\Models\ModelRapor(); 
        $this->ModelCatatan = new ModelCatatan();
        $this->userModel = new UserModel();
    }

    public function index()
    {
        return view('welcome_message');
    }

    public function login()
    {
        echo view ('pages-login.php');
    }
    
    public function aksi_login ()
    {     
        $a=$this->request->getpost('email');
        $b=$this->request->getpost('pswd');
        $Joyce = new M_belajar;
        $data = array(
            'username' => $a,
            'password' => MD5($b),  
        );
        $cek= $Joyce->getWhere('user', $data);
            if ($cek != null) {
                session()->set('id',$cek->id_user); 
                session()->set('u',$cek->username); 
                session()->set('level',$cek->level); 

            return redirect()->to('home/dashboard');
            }else{
                return redirect()->to('home/login');
        }
    }
        
    public function logout()
    {
        session()->destroy();
        return redirect()->to('home/login');
    }

    public function dashboard()
    {
        if (session()->get('id')>0) {
            echo view('header');
            echo view('menu');
            echo view('dashboard');
            echo view('footer');
        }else{
            return redirect()->to('home/login');
        }
    }

    public function profile()
    {
        $Joyce = new M_belajar();
        $Wendy['takdirestui']= $Joyce->tampil1('user');
        echo view('header');
        echo view('menu');
        echo view('profile', $Wendy); 
        echo view('footer');
    }

    public function guru()
    {
        if (session()->get('level') == 1 || session()->get('level') == 2 || session()->get('level') == 3 || session()->get('level') == 4) {
        $Joyce = new M_belajar();
        $Wendy['takdirestui'] = $Joyce->getGuru(); 
        echo view('header');
        echo view('menu');
        echo view('guru', $Wendy); 
        echo view('footer');
    } else if (session()->get('level') > 0) {
        return redirect()->to('home/error');
    } else {
        return redirect()->to('home/login');
        }   
    }

    public function hapus_guru($id)
    {
        $db = \Config\Database::connect();
        $builder = $db->table('guru');
        $builder->select('id_user');
        $builder->where('id_guru', $id);
        $guru = $builder->get()->getRow();

        if ($guru) {
        $db->table('guru')->where('id_guru', $id)->delete();
        $db->table('user')->where('id_user', $guru->id_user)->delete();

        return redirect()->to('home/guru')->with('success', 'Data guru dan user berhasil dihapus.');
    } else {
        return redirect()->to('home/guru')->with('error', 'Data guru tidak ditemukan.');
        }
    }

    public function edit_guru($id)
    {
        $db = \Config\Database::connect();
        $builder = $db->table('guru');
        $builder->select('guru.*, user.username as email, user.level');
        $builder->join('user', 'guru.id_user = user.id_user', 'left');
        $builder->where('guru.id_guru', $id);
        $query = $builder->get();

        $data['takdirestui'] = $query->getRow();

        if (!$data['takdirestui']) {
            return redirect()->to('home/guru')->with('error', 'Data guru tidak ditemukan.');
        }

        echo view('header');
        echo view('menu');
        echo view('edit3', $data);
        echo view('footer');
    }

    public function simpan_guru()
    {
        $db = \Config\Database::connect();
        $id_user = $this->request->getPost('id_user');
        $dataUser = [
            'username' => $this->request->getPost('email'), 
            'level' => $this->request->getPost('level'),  
        ];

        $db->table('user')->where('id_user', $id_user)->update($dataUser);
        return redirect()->to('home/guru')->with('success', 'Data email dan level berhasil diperbarui.');
    }

    public function tguru()
    {
        if ($this->request->getMethod() == 'post') {
        $Joyce = new M_belajar();
        $guruData = [
            'nama_guru' => $this->request->getPost('nama_guru'),
            'nip' => $this->request->getPost('nip'),
            'alamat' => $this->request->getPost('alamat'),
            'jenis_kelamin' => $this->request->getPost('jenis_kelamin'),
        ];

        $userData = [
            'nama_user' => $this->request->getPost('nama_guru'), 
            'username' => $this->request->getPost('email'), 
            'password' => password_hash($this->request->getPost('password'), PASSWORD_DEFAULT), 
            'level' => $this->request->getPost('level'), 
        ];

        if ($Joyce->insertGuru($guruData, $userData)) {
                return redirect()->to('home/guru')->with('success', 'Data guru berhasil ditambahkan');
            } else {
                return redirect()->back()->with('error', 'Gagal menambahkan data guru');
            }
        }

        echo view('header');
        echo view('menu');
        echo view('tguru'); 
        echo view('footer');
    } 

// public function simpan_tguru()
// {
//  $a = $this->request->getPost('nip');
//     $b = $this->request->getPost('nama_guru');
//     $c = $this->request->getPost('alamat'); 
//     $d = $this->request->getPost('jenis_kelamin'); 
//     $e = $this->request->getPost('email');
//     $f = $this->request->getPost('password');
//     $g = $this->request->getPost('level'); 
    
//     $data = [
//         "nip" => $a,
//         "nama_guru" => $b,
//         "alamat" => $c,
//         "jenis_kelamin" => $d,
//         "username" => $e,
//         "password" => $f,
//         "level" => $g
//     ];
    
//     $Joyce = new M_belajar();
//     $Joyce->insert($data);
    
//     return redirect()->to('home/guru');
// }

    public function siswa()
    {
        if (session()->get('level') == 1 || session()->get('level') == 2 || session()->get('level') == 3 || session()->get('level') == 4) {
        $Joyce = new M_belajar;
        $Wendy['takdirestui'] = $Joyce->getSiswaData();  
        if (empty($Wendy['takdirestui'])) {
            log_message('error', 'Data siswa tidak ditemukan');
            return redirect()->to('home/error');
        }

        echo view('header');
        echo view('menu');
        echo view('siswa', $Wendy);  
        echo view('footer');
        } else if (session()->get('level') > 0) {
            return redirect()->to('home/error');
        } else {
            return redirect()->to('home/login');
        }
    }

    public function hapus_siswa($id) 
    {
        $Joyce= new M_belajar;
        $wece= array('id_siswa' => $id);
        $Wendy['takdirestui']= $Joyce->hapus('siswa',$wece);
            return redirect()->to('Home/siswa');
    }

    public function edit_siswa($id_siswa)
    {
        $studentModel = new \App\Models\M_belajar();
        $kelasModel = new \App\Models\KelasModel();
        $rombelModel = new \App\Models\RombelModel();

        $student = $studentModel->find($id_siswa);
        $kelas = $kelasModel->findAll();

        if ($kelas) {
            $rombel = $rombelModel->whereIn('id_kelas', array_column($kelas, 'id_kelas'))->findAll();
        } else {
            $rombel = [];
        }

        echo view('header');
        echo view('menu');
        echo view('edit2', [
            'student' => $student,
            'kelas' => $kelas,
            'rombel' => $rombel,
        ]);
        echo view('footer');
    }

    public function simpan_siswa($id_siswa)
    {
        if ($id_siswa === null) {
            echo "No ID provided.";
            exit();
        }

        $data = [
            'id_kelas' => $this->request->getPost('id_kelas'),
            'id_rombel' => $this->request->getPost('id_rombel'),
        ];

        $studentModel = new \App\Models\M_belajar();
        $updated = $studentModel->update($id_siswa, $data);

        if ($updated) {
            log_message('info', 'Data berhasil diperbarui untuk ID Siswa: ' . $id_siswa);
            return redirect()->to('/siswa')->with('message', 'Data berhasil diperbarui!');
        } else {
            log_message('error', 'Gagal memperbarui data untuk ID Siswa: ' . $id_siswa);
            return redirect()->back()->with('error', 'Data gagal diperbarui!');
        }
    }

    public function tsiswa()
    {
        if ($this->request->getMethod() == 'post') {
        $userModel = new UserModel();
        $ModelSiswa = new ModelSiswa();

        $userData = [
            'nama_user' => $this->request->getPost('nama_siswa'),
            'username'  => $this->request->getPost('email'),
            'password'  => password_hash($this->request->getPost('password'), PASSWORD_DEFAULT),
            'level'     => $this->request->getPost('level'),
        ];

        $db = \Config\Database::connect();
        $db->transStart();

        try {
            $userId = $userModel->insert($userData);
            if (!$userId) {
                throw new \Exception("Gagal menyimpan data user");
            }

            $siswaData = [
                'nis'            => $this->request->getPost('nis'),
                'nama_siswa'     => $this->request->getPost('nama_siswa'),
                'id_kelas'       => $this->request->getPost('id_kelas'),
                'id_rombel'      => $this->request->getPost('id_rombel'),
                'tanggal_lahir'  => $this->request->getPost('tanggal_lahir'),
                'alamat'         => $this->request->getPost('alamat'),
                'jenis_kelamin'  => $this->request->getPost('jeniskel'),
                'id_user'        => $userId, 
            ];

            if (!$ModelSiswa->insert($siswaData)) {
                throw new \Exception("Gagal menyimpan data siswa");
            }

            $db->transCommit();
            return redirect()->to('home/siswa')->with('success', 'Data siswa berhasil ditambahkan');
        } catch (\Exception $e) {
            $db->transRollback();
            log_message('error', 'Kesalahan saat menyimpan data: ' . $e->getMessage());
            return redirect()->back()->with('error', 'Gagal menambahkan data siswa');
            }
        }

        $kelas = $this->db->table('kelas')->get()->getResultArray();
        $rombel = $this->db->table('rombel')
            ->join('kelas', 'kelas.id_kelas = rombel.id_kelas')
            ->get()->getResultArray();

        echo view('header');
        echo view('menu');
        echo view('tsiswa', ['kelas' => $kelas, 'rombel' => $rombel]);
        echo view('footer');
    }

    public function simpan_tsiswa()
    {
        $userData = [
            'nama_user' => $this->request->getPost('nama_siswa'), // Nama untuk user
            'username' => $this->request->getPost('username'),    // Email sebagai username
            'password' => password_hash($this->request->getPost('password'), PASSWORD_DEFAULT),
            'level'    => $this->request->getPost('level'),       // Level pengguna
        ];

        $this->db->transStart(); 

        $this->db->table('user')->insert($userData);
        $id_user = $this->db->insertID(); 

        if (!$id_user) {
            $this->db->transRollback();
            return redirect()->back()->with('error', 'Gagal menyimpan data user');
        }

        $siswaData = [
            'nis'            => $this->request->getPost('nis'),
            'nama_siswa'     => $this->request->getPost('nama_siswa'),
            'id_kelas'       => $this->request->getPost('id_kelas'),
            'id_rombel'      => $this->request->getPost('id_rombel'),
            'tanggal_lahir'  => $this->request->getPost('tanggal_lahir'),
            'alamat'         => $this->request->getPost('alamat'),
            'jenis_kelamin'  => $this->request->getPost('jeniskel'),
            'id_user'        => $id_user, 
        ];

        $this->db->table('siswa')->insert($siswaData);

        if ($this->db->transStatus() === false) {
            $this->db->transRollback();
            return redirect()->back()->with('error', 'Gagal menyimpan data siswa');
        }

        $this->db->transCommit();
            return redirect()->to('home/siswa')->with('success', 'Data siswa berhasil ditambahkan');
        }

    public function mapel()
    {
        if (session()->get('level')==1 || session()->get('level')==2 || session()->get('level')==4) {   $Joyce= new M_belajar;
        $where=('id_mapel');
        $Wendy['takdirestui']= $Joyce->tampil('mapel', $where);
            echo view('header');
            echo view('menu');
            echo view('mapel',$Wendy);
            echo view('footer');

        }else if (session()->get('level')>0) {
            return redirect()->to('home/error');
        }else{
            return redirect()->to('home/login');
        }
    }

    public function hapus_mapel($id) 
    {
        $Joyce= new M_belajar;
        $wece= array('id_mapel' => $id);
        $Wendy['takdirestui']= $Joyce->hapus('mapel',$wece);
            return redirect()->to('Home/mapel');
    }
    
    public function edit_mapel($id)
    {
        $Joyce= new M_belajar;
        $wece= array('id_mapel' => $id);
        $Wendy['takdirestui']= $Joyce->getWhere('mapel',$wece);
            echo view('header');
            echo view('menu');
            echo view('edit4',$Wendy);
            echo view('footer');
    }

    function simpan_mapel()
    {
        $a=$this->request->getpost('namaa');
        $id=$this->request->getpost('idm');
        $Joyce= new M_belajar;
        $wece= array('id_mapel' => $id);
        $data= array(
            "nama_mapel"=>$a
        );
        $Joyce->edit('mapel',$data,$wece);
            return redirect()->to('home/mapel');
    }

    public function tmapel()
    {
        $Joyce= new M_belajar;
        $where=('id_mapel');
        $Wendy['takdirestui']= $Joyce->tampil('mapel', $where);
            echo view('header');
            echo view('menu');
            echo view('tmapel',$Wendy);
            echo view('footer');
    }

    public function simpan_tmapel()
    {
        $a=$this->request->getpost('namaa');
        $data= array(
            "nama_mapel"=>$a
        );
        $Joyce=new M_belajar;
        $Joyce->tambah('mapel',$data);
            return redirect()->to('home/mapel');
    }

//     public function kelas()
//     {
//         if (session()->get('level') == 1 || session()->get('level') == 2 || session()->get('level') == 3) {
//         $Joyce = new M_belajar;
//         $Wendy['takdirestui'] = $Joyce->join('rombel', 'kelas', 'rombel.id_kelas = kelas.id_kelas');
//         echo view('header');
//         echo view('menu');
//         echo view('kelas', $Wendy);
//         echo view('footer');
//     } else if (session()->get('level') > 0) {
//         return redirect()->to('home/error');
//     } else {
//         return redirect()->to('home/login');
//     }
// }

    public function nilai()
    {
        if (session()->get('level')==1 || session()->get('level')==3 || session()->get('level')==4) { $Joyce= new M_belajar;
            $Wendy['takdirestui'] = $Joyce->join('siswa', 'kelas', 'siswa.id_kelas = kelas.id_kelas')
                                      ->join('rombel', 'siswa.id_rombel = rombel.id_rombel')
                                      ->get()
                                      ->getResult(); 
            echo view('header');
            echo view('menu');
            echo view('nilai',$Wendy);
            echo view('footer');
        }else if (session()->get('level')>0) {
            return redirect()->to('home/error');
        }else{
            return redirect()->to('home/login');
        }
    }
        
    public function tnilai()
    {
        $Joyce = new M_belajar();

            if ($this->request->getMethod() === 'post') {
            $id_siswa = $this->request->getPost('siswa');
            $rombongan_belajar = $this->request->getPost('gridRadios');
            $id_mapel = $this->request->getPost('mapel');
            $id_blok = $this->request->getPost('blok');
            $nilai = $this->request->getPost('nilai');

            $rombel = $Joyce->get_rombel_by_name($rombongan_belajar);
            if (!$rombel) {
                return redirect()->back()->with('error', 'Rombel tidak ditemukan');
            }

            $jadwal = $Joyce->get_jadwal_by_rombel_mapel_blok($rombel->id_rombel, $id_mapel, $id_blok);
            if (!$jadwal) {
                return redirect()->back()->with('error', 'Jadwal tidak ditemukan');
            }

            $data = [
                'id_siswa' => $id_siswa,
                'id_jadwal' => $jadwal->id_jadwal,
                'nilai' => $nilai,
            ];

            if ($Joyce->save_nilai($data)) {
                return redirect()->back()->with('success', 'Data nilai berhasil disimpan');
            } else {
                return redirect()->back()->with('error', 'Gagal menyimpan data nilai');
            }
        }

        $Wendy['siswa'] = $Joyce->get_siswa();
        $Wendy['takdirestui'] = $Joyce->get_mapel();
        $Wendy['blok'] = $Joyce->get_blok();
        $Wendy['semester'] = $Joyce->get_semester();
        $Wendy['rombel'] = $Joyce->get_all_rombels();  

        echo view('header');
        echo view('menu');
        echo view('tnilai', $Wendy);
        echo view('footer');
    }

    public function simpan_tnilai() 
    {
        $id_siswa = $this->request->getPost('siswa');
        $rombongan_belajar = $this->request->getPost('gridRadios'); 
        $id_mapel = $this->request->getPost('mapel');
        $id_blok = $this->request->getPost('blok');
        $nilai = $this->request->getPost('nilai');
        $rombel = $this->db->table('rombel')
                            ->where('nama_rombel', $rombongan_belajar)
                            ->get()
                            ->getRow();
        if (!$rombel) {
            return redirect()->back()->with('error', 'Rombel tidak ditemukan');
        }

        $jadwal = $this->db->table('jadwal')
                            ->where('id_rombel', $rombel->id_rombel)
                            ->where('id_mapel', $id_mapel)
                            ->where('id_blok', $id_blok)
                            ->get()
                            ->getRow();

        if (!$jadwal) {
            return redirect()->back()->with('error', 'Jadwal tidak ditemukan untuk kombinasi yang dipilih');
        }

        $data = [
            'id_siswa' => $id_siswa,
            'id_jadwal' => $jadwal->id_jadwal,
            'nilai' => $nilai,
        ];

        $this->db->table('nilai')->insert($data);

        return redirect()->back()->with('success', 'Data nilai berhasil disimpan');
    }
    
public function nilai_siswa($nis = null)
{
    $data['siswa'] = $this->ModelSiswa->getSiswaByNis($nis);
log_message('debug', 'Data siswa: ' . print_r($data['siswa'], true));

    if ($data['siswa'] === null) {
        return redirect()->to('home')->with('error', 'Siswa tidak ditemukan.');
    }

    $data['nilai'] = $this->ModelNilai->getNilaiWithJoinByNis($nis);

    $data['catatan'] = $this->ModelRapor->where('nis', $nis)->first();

    if ($this->request->getMethod() === 'post') {
        $catatan = $this->request->getPost('catatan');

        if ($data['catatan']) {
            $this->ModelRapor->update($data['catatan']['id_rapor'], ['catatan' => $catatan]);
        } else {
            $this->ModelRapor->save(['nis' => $nis, 'catatan' => $catatan]);
        }

        return redirect()->to("home/nilai_siswa/{$nis}");
    }

    echo view('header');
    echo view('menu');
    echo view('nilai_siswa', $data);
    echo view('footer');
}

public function inputCatatan()
{
    $nis = $this->request->getPost('nis');
    $catatan = $this->request->getPost('catatan');

    if (empty($nis) || empty($catatan)) {
        return redirect()->back()->with('error', 'NIS atau Catatan tidak boleh kosong.');
    }

    $existingCatatan = $this->ModelRapor->where('nis', $nis)->first();
    
    if ($existingCatatan) {
        $this->ModelRapor->update($existingCatatan['id_rapor'], ['catatan' => $catatan]);
    } else {
        $this->ModelRapor->save(['nis' => $nis, 'catatan' => $catatan]);
    }

    return redirect()->to('home/nilai_siswa/' . $nis)->with('success', 'Catatan berhasil disimpan.');
}

    public function hapus_nilai($id) 
    {
        $Joyce= new M_belajar;
        $wece= array('id_nilai' => $id);
        $Wendy['takdirestui']= $Joyce->hapus('nilai',$wece);
        return redirect()->to('Home/nilai_siswa');
    }
       
 public function edit_nilai($id = null)
{
    $modelNilai = new \App\Models\ModelNilai();
    $nilai = $modelNilai->getNilaiWithJoin($id);

    if ($nilai) {
        return view('edit6', ['nilai' => $nilai]);
    } else {
        return redirect()->to('home/nilai_siswa')->with('error', 'Data tidak ditemukan');
    }
}

    public function simpan_nilai()
    {
        $Joyce = new M_belajar();
        $id_nilai = $this->request->getPost('idn');
        $id_siswa = $this->request->getPost('siswa');
        $rombel = $this->request->getPost('gridRadios');
        $id_mapel = $this->request->getPost('mapel');
        $id_guru = $this->request->getPost('guru');
        $id_blok = $this->request->getPost('blok');
        $sesi = $this->request->getPost('sesi');
        $nilai = $this->request->getPost('nilai');

        $rombel = $Joyce->get_rombel_by_name($rombel);
        if (!$rombel) {
            return redirect()->back()->with('error', 'Rombel tidak ditemukan');
        }

        $jadwal = $Joyce->get_jadwal_by_rombel_mapel_blok($rombel->id_rombel, $id_mapel, $id_blok);
        if (!$jadwal) {
            return redirect()->back()->with('error', 'Jadwal tidak ditemukan');
        }

        $data = [
            'id_siswa' => $id_siswa,
            'id_jadwal' => $jadwal->id_jadwal,
            'id_guru' => $id_guru,
            'sesi' => $sesi,
            'nilai' => $nilai,
        ];

        if ($Joyce->update_nilai($id_nilai, $data)) {
        die('checkpoint');  
            return redirect()->to(base_url('home/nilai_siswa'))->with('success', 'Data nilai berhasil diperbarui');
        }

    }

    public function user()
    {
        if (session()->get('level')==1) {
        $Joyce= new M_belajar;
        $Wendy['takdirestui']= $Joyce->tampil1('user');
            echo view('header');
            echo view('menu');
            echo view('user',$Wendy);
            echo view('footer');

        }else if (session()->get('level')>0) {
            return redirect()->to('home/error');
        }else{
            return redirect()->to('home/login');
        }
    }
        
    public function hapus_user($id) 
    {
        $Joyce= new M_belajar;
        $wece= array('id_user' => $id);
        $Wendy['takdirestui']= $Joyce->hapus('user',$wece);
        return redirect()->to('Home/user');
    }
        
    public function edit_user ($id)
    {
        $Joyce= new M_belajar;
        $wece= array('id_user' => $id);
        $data = array(
            
            "password"=>MD5('1111'),
            
            
        );

       $Joyce->edit('user',$data,$wece);
        return redirect()->to('home/user');

    }
        
    function simpan_user()
    {
        $a=$this->request->getpost('user');
        $b=$this->request->getpost('pw');
        $c=$this->request->getpost('level');
        $id=$this->request->getpost('idu');
        $Joyce= new M_belajar;
        $wece= array('id_user' => $id);
        $data= array(
            "username"=>$a,
            "password"=>$b,
            "level"=>$c
        );

        $Joyce->edit('user',$data,$wece);
        return redirect()->to('home/user');
    }
        
    // public function tusr()
    // {
    //     $Joyce= new M_belajar;
    //     $Wendy['takdirestui']= $Joyce->tampil1('user');
    //         echo view('header');
    //         echo view('menu');
    //         echo view('tusr',$Wendy);
    //         echo view('footer');
    // }
        
    // public function simpan_tusr()
    // {
    //     $a=$this->request->getpost('user');
    //     $b=$this->request->getpost('pw');
    //     $c=$this->request->getpost('level');
    //     $data= array(
    //         "username"=>$a,
    //         "password"=>$b,
    //         "level"=>$c
    //     );
    //     $Joyce=new M_belajar;
    //     $Joyce->tambah('user',$data);
    //     return redirect()->to('home/user');
    // }

    public function lpn() 
    {
        if ($this->request->getMethod() === 'post') {
            $id_siswa = $this->request->getPost('id_siswa');
            $id_blok = $this->request->getPost('id_blok');
        }

        $ModelSiswa = new \App\Models\ModelSiswa();
        $blokModel = new \App\Models\BlokModel();
    
        $siswaResult = $ModelSiswa->findAll();  
        $blokResult = $blokModel->findAll();    

        echo view('header');
        echo view('menu');
        echo view('lpn', ['siswaResult' => $siswaResult, 'blokResult' => $blokResult]);
        echo view('footer');
    }

    public function lnilai() 
    {
        if ($this->request->getMethod() === 'get') {
            $id_siswa = $this->request->getGet('id_siswa');
            $id_blok = $this->request->getGet('id_blok');
        
        if (!$id_siswa || !$id_blok) {
            return redirect()->to('/home/lnilai')->with('error', 'ID Siswa dan ID Blok tidak ditemukan.');
        }

        $conn = mysqli_connect("localhost", "root", "", "erapor", 4306);
        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());
        }

        $siswaQuery = "
            SELECT s.*, k.nama_kelas, r.nama_rombel
            FROM siswa s
            LEFT JOIN kelas k ON s.id_kelas = k.id_kelas
            LEFT JOIN rombel r ON s.id_rombel = r.id_rombel
            WHERE s.id_siswa = ?";
        
        $stmtSiswa = mysqli_prepare($conn, $siswaQuery);
        mysqli_stmt_bind_param($stmtSiswa, 's', $id_siswa);
        mysqli_stmt_execute($stmtSiswa);
        $siswaResult = mysqli_stmt_get_result($stmtSiswa);

        if (!$siswaResult || mysqli_num_rows($siswaResult) == 0) {
            mysqli_close($conn);
            return redirect()->to('/home/lnilai')->with('error', 'Data Siswa tidak ditemukan.');
        }

        $siswa = mysqli_fetch_assoc($siswaResult);

        $nilaiQuery = "
            SELECT n.nilai, j.id_mapel, m.nama_mapel
            FROM nilai n
            JOIN jadwal j ON n.id_jadwal = j.id_jadwal
            JOIN mapel m ON j.id_mapel = m.id_mapel
            WHERE n.id_siswa = ? AND j.id_blok = ?";
        
        $stmtNilai = mysqli_prepare($conn, $nilaiQuery);
        mysqli_stmt_bind_param($stmtNilai, 'ss', $id_siswa, $id_blok);
        mysqli_stmt_execute($stmtNilai);
        $nilaiResult = mysqli_stmt_get_result($stmtNilai);

        if (!$nilaiResult || mysqli_num_rows($nilaiResult) == 0) {
            mysqli_close($conn);
            return redirect()->to('/home/lnilai')->with('error', 'Data Nilai tidak ditemukan.');
        }

        $catatanQuery = "SELECT catatan FROM rapor WHERE nis = ?";
        $stmtCatatan = mysqli_prepare($conn, $catatanQuery);
        mysqli_stmt_bind_param($stmtCatatan, 's', $siswa['nis']);
        mysqli_stmt_execute($stmtCatatan);
        $catatanResult = mysqli_stmt_get_result($stmtCatatan);
        $catatan = mysqli_fetch_assoc($catatanResult); 
            
            $data = [
                'siswa' => $siswa,
                'nilai' => mysqli_fetch_all($nilaiResult, MYSQLI_ASSOC),
                'catatan' => $catatan 
            ];

        mysqli_close($conn);
        return view('lnilai', $data); 
        }
    }

public function lnilaipdf($id_siswa = null, $id_blok = null)
{
    $id_siswa = $id_siswa ?? $this->request->uri->getSegment(3);
    $id_blok = $id_blok ?? $this->request->uri->getSegment(4);

    if (!$id_siswa || !$id_blok) {
        throw new \InvalidArgumentException("ID siswa dan ID blok wajib diisi.");
    }

    $siswaModel = new ModelSiswa();
    $blokModel = new ModelBlok();

    $siswa = $siswaModel->find($id_siswa);
    $blok = $blokModel->find($id_blok);

    if (!$siswa) {
        throw new \Exception("Data siswa tidak ditemukan.");
    }

    if (!$blok) {
        throw new \Exception("Data blok tidak ditemukan.");
    }

    $nilaiModel = new \App\Models\ModelNilai();
    $query = $nilaiModel->select('nilai.*, jadwal.id_blok, blok.kode_blok')
                        ->join('jadwal', 'nilai.id_jadwal = jadwal.id_jadwal')
                        ->join('blok', 'jadwal.id_blok = blok.id_blok')
                        ->where('nilai.id_siswa', $id_siswa)
                        ->where('jadwal.id_blok', $id_blok)
                        ->get();

    if ($query->getNumRows() === 0) {
        throw new \Exception("Data nilai tidak ditemukan.");
    }

    $nilai = $query->getResult();
    $totalNilai = array_sum(array_column($nilai, 'nilai'));
    $rataRata = count($nilai) > 0 ? $totalNilai / count($nilai) : 0;

    $html = view('lnilaipdf', [
        'siswa' => $siswa,
        'nilai' => $nilai,
        'rataRata' => $rataRata,
        'kkm' => 75, 
    ]);

    $dompdf = new Dompdf();
    $dompdf->loadHtml($html);
    $dompdf->setPaper('A4', 'portrait');
    $dompdf->render();

   $output = $dompdf->output();
file_put_contents('path/to/save/rapor_siswa.pdf', $output);

    header("Content-Type: application/pdf");
    header("Content-Disposition: inline; filename=rapor_siswa.pdf");

    $dompdf->stream('rapor_siswa.pdf', ['Attachment' => false]);
}


public function someOtherFunction()
{
    $id_siswa = 2711;
    $id_blok = 557;

    return $this->lnilaipdf($id_siswa, $id_blok);
}


}