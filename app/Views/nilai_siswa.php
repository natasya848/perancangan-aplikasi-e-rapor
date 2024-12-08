<main id="main" class="main">
    <div class="pagetitle">
        <h1>Nilai</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item">Tables</li>
                <li class="breadcrumb-item active">Data</li>
            </ol>
        </nav>
       <div class="mb-3">
    <label for="nis" class="form-label">NIS</label>
    <input type="text" class="form-control" id="nis" name="nis" value="<?= $siswa['nis'] ?>" readonly>
</div>
<div class="mb-3">
    <label for="nama" class="form-label">Nama Siswa</label>
    <input type="text" class="form-control" id="nama" name="nama" value="<?= $siswa['nama_siswa'] ?>" readonly>
</div>
    </div>

    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Nilai Siswa</h5>

  <div class="table-responsive">
    <table class="table table-bordered table-striped" id="dataTable" width="100%" cellspacing="0">
      <thead>
        <tr>
          <th scope="col">No</th>
          <th scope="col">Rombongan Belajar</th>
          <th scope="col">Mata Pelajaran</th>
          <th scope="col">Guru</th>
          <th scope="col">Blok</th>
          <th scope="col">Semester</th>
          <th scope="col">Tahun Ajaran</th>
          <th scope="col">Sesi</th>
          <th scope="col">Nilai</th>
          <th scope="col">Predikat</th>
          <th scope="col">Aksi</th>
        </tr>
      </thead>
      <tbody>
  <?php
  $no=1;
  if (!empty($nilai)) {
      foreach ($nilai as $value) {
  ?>
          <tr>
            <td><?= $no++ ?></td>
            <td><?= $value['nama_rombel'] ?></td>
            <td><?= $value['nama_mapel'] ?></td>
            <td><?= $value['nama_guru'] ?></td>
            <td><?= $value['kode_blok'] ?></td>
            <td><?= $value['kode_semester'] ?></td>
            <td><?= $value['nama_tahun'] ?></td>
            <td><?= $value['sesi'] ?></td>
            <td><?= $value['nilai'] ?></td>
            <td><?= $value['nilai'] >= 92 ? 'A' : ($value['nilai'] >= 83 ? 'B' : ($value['nilai'] >= 75 ? 'C' : 'D')) ?></td>
              <td>
                  <link rel="stylesheet" type="text/css" href="<?= base_url('fontawesome/css/fontawesome.min.css'); ?>">
                  <link rel="stylesheet" type="text/css" href="<?= base_url('fontawesome/css/all.css'); ?>">
                  <a href="<?= base_url('home/edit_nilai/'.$value['id_nilai']) ?>" class="btn btn-outline-success"><i class="bi bi-pencil"></i></a>
                  <a href="<?= base_url('home/hapus_nilai/'.$value['id_nilai']) ?>" class="btn btn-outline-danger"><i class="bi bi-trash"></i></a>
              </td>
          </tr>
  <?php
      }
  } else {
      echo '<tr><td colspan="6" class="text-center">Data nilai tidak ditemukan</td></tr>';
  }
  ?>
</tbody>

    </table>
  </div>
  </div>
  </div>
  </div>
  </div>
</section>
    
   <section class="section">
    <div class="row">
        <div class="col-lg-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Catatan Wali Kelas</h5>
                    <div class="mb-3">
                        <?php if (isset($catatan) && !empty($catatan)) : ?>
                            <p><?= nl2br(htmlspecialchars($catatan['catatan'])) ?></p>
                        <?php else: ?>
                            <p>Catatan Wali Kelas: Tidak ada catatan.</p>
                        <?php endif; ?>
                    </div>

                    <!-- Formulir hanya satu kali -->
                    <form action="<?= base_url('home/inputCatatan') ?>" method="post">
                        <input type="hidden" name="nis" value="<?= $siswa['nis'] ?>">
                        <div class="mb-3">
                            <textarea name="catatan" class="form-control" rows="4" placeholder="Tuliskan catatan di sini..."><?= isset($catatan) ? htmlspecialchars($catatan['catatan']) : '' ?></textarea>
                        </div>
                        <button type="submit" class="btn btn-outline-primary">Simpan Catatan</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
            <a href="<?= base_url('home/nilai') ?>"><button class="btn btn-outline-secondary"><i class="bi bi-chevron-left"></i> Back</button></a>

</main>