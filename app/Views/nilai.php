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
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Tampil Nilai</h5>

<div class="panel-body">
    <a href="<?= base_url('home/tnilai') ?>"><button class="btn btn-outline-warning"><i class="bi bi-plus"></i>Input</button></a>

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
          <?php
          if (session()->get('level')==1 || session()->get('level')==2 || session()->get('level')==3 || session()->get('level')==4) {
            ?>
          <th>Nilai</th>
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
                <?php
                if (session()->get('level')==1 || session()->get('level')==2 || session()->get('level')==3 || session()->get('level')==4) {
                ?>
               <td>
                  <link rel="stylesheet" type="text/css" href="<?=base_url('fontawesome/css/fontawesome.min.css');?>">
                  <link rel="stylesheet" type="text/css" href="<?=base_url('fontawesome/css/all.css');?>">
                <a href="<?= base_url('home/nilai_siswa/' . $value->nis); ?>" class="btn btn-outline-info"><i class="bi bi-info-circle"></i></a>
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
      