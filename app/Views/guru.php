<main id="main" class="main">

    <div class="pagetitle">
      <h1>Guru</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="index.html">Home</a></li>
          <li class="breadcrumb-item">Tables</li>
          <li class="breadcrumb-item active">Data</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Tampil Guru</h5>

  <a href="<?= base_url('home/tguru') ?>"><button class="btn btn-outline-warning"><i class="bi bi-plus"></i>Tambah</button></a>

<div class="table-responsive">
  <table class="table table-bordered table-striped" id="dataTable" width="100%" cellspacing="0">  
    <thead>
      <tr>
        <th scope="col">No</th>
        <th scope="col">NIP</th>
        <th scope="col">Nama Guru</th>
        <th scope="col">Alamat</th>
        <th scope="col">Jenis Kelamin</th>
        <th>Email</th>
        <th>Level</th>
          <?php
          if (session()->get('level')==1 ||session()->get('level')==2) {
            ?>
        <th>Aksi</th>
        <?php } ?>
      </tr>
    </thead>
   <tbody>
    <?php
    $no = 1;
    foreach ($takdirestui as $key => $value) {
    ?>
        <tr>
            <td><?= $no++ ?></td>
            <td><?= $value->nip ?></td>
            <td><?= $value->nama_guru ?></td>
            <td><?= $value->alamat ?></td>
            <td><?= $value->jenis_kelamin ?></td>
            <td><?= $value->email ?></td> 
             <td>
    <?= ($value->level == 3) ? 'Wali Kelas' : (($value->level == 4) ? 'Guru' : 'Lainnya') ?>
</td>

            <?php if (session()->get('level') == 1 || session()->get('level') == 2) { ?>

        <td>
            <link rel="stylesheet" type="text/css" href="<?= base_url('fontawesome/css/fontawesome.min.css'); ?>">
            <link rel="stylesheet" type="text/css" href="<?= base_url('fontawesome/css/all.css'); ?>">
            <a href="<?= base_url('home/edit_guru/' . $value->id_guru) ?>" class="btn btn-outline-success"><i class="bi bi-pencil"></i></a>
            <a href="<?= base_url('home/hapus_guru/' . $value->id_guru) ?>" class="btn btn-outline-danger"><i class="bi bi-trash"></i></a>
        </td>
        <?php } ?>
    </tr> 
    <?php } ?>
</tbody>

</table>
<!-- End Table with stripped rows -->
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->
      