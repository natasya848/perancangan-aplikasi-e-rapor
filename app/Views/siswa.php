<main id="main" class="main">

    <div class="pagetitle">
      <h1>Siswa</h1>
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
              <h5 class="card-title">Tampil Siswa</h5>

<div class="panel-body">
    <a href="<?= base_url('home/tsiswa') ?>"><button class="btn btn-outline-warning"><i class="bi bi-plus"></i>Tambah</button></a>

<div class="table-responsive">
  <table class="table table-bordered table-striped" id="dataTable" width="100%" cellspacing="0">
    <thead>
      <tr>
        <th scope="col">No</th>
        <th scope="col">NIS</th>
        <th scope="col">Nama Siswa</th>
        <th scope="col">Kelas</th>
        <th scope="col">Rombel</th>
        <th scope="col">Tanggal Lahir</th>
        <th scope="col">Alamat</th>
        <th scope="col">Jenis Kelamin</th>
        <th>Email</th>
        <th>Level</th>

          <?php
          if (session()->get('level')==1 || session()->get('level')==2 || session()->get('level')==3 || session()->get('level')==4) {
            ?>
        <th>Aksi</th>
        <?php } ?>
      </tr>
    </thead>
    <tbody>

        <?php
        $no=1;
        foreach ($takdirestui as $key => $value) {
           ?>
           <tr>
               <td><?php echo $no++ ?></td>
               <td><?= $value->nis?></td>
               <td><?= $value->nama_siswa ?></td>
               <td><?= $value->nama_kelas?></td>
               <td><?= $value->nama_rombel?></td>
               <td><?= $value->tanggal_lahir ?></td>
               <td><?= $value->alamat ?></td>
               <td><?= $value->jenis_kelamin ?></td>
               <td><?= $value->username ?></td>
               <td><?= $value->level ?></td>

                <?php
                if (session()->get('level')==1 || session()->get('level')==2 || session()->get('level')==3 || session()->get('level')==4) {
                ?>
               <td>
                  <link rel="stylesheet" type="text/css" href="<?=base_url('fontawesome/css/fontawesome.min.css');?>">
                  <link rel="stylesheet" type="text/css" href="<?=base_url('fontawesome/css/all.css');?>">
                  <a href="<?= base_url('home/edit_siswa/'.$value->id_siswa) ?>" class="btn btn-outline-success"><i class="bi bi-pencil"></i></a>
                  <a href= "<?= base_url('home/hapus_siswa/'.$value->id_siswa) ?>" class="btn btn-outline-danger"><i class="bi bi-trash"></i></a>
                   
               </td>
             <?php } ?>
           </tr> 
  <?php
  }
  ?>
</tbody>
</table>
<!-- End Table with stripped rows -->

            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->


