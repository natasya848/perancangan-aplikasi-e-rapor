<main id="main" class="main">

    <div class="pagetitle">
      <h1>Mata Pelajaran</h1>
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
              <h5 class="card-title">Tampil Mata Pelajaran</h5>

  <a href="<?= base_url('home/tmapel') ?>"><button class="btn btn-outline-warning"><i class="bi bi-plus"></i>Tambah</button></a>

<div class="table-responsive">
  <table class="table table-bordered table-striped" id="dataTable" width="100%" cellspacing="0">
    <thead>
      <tr>
        <th scope="col">No</th>
        <th scope="col">Nama Mapel</th>
          <?php
          if (session()->get('level')==1 || session()->get('level')==2 || session()->get('level')==4) {
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
               <td><?= $value->nama_mapel ?></td>
                <?php
                if (session()->get('level')==1 || session()->get('level')==2 || session()->get('level')==4) {
                ?>
               <td>
                  <link rel="stylesheet" type="text/css" href="<?=base_url('fontawesome/css/fontawesome.min.css');?>">
                  <link rel="stylesheet" type="text/css" href="<?=base_url('fontawesome/css/all.css');?>">
                    <a href="<?= base_url('home/edit_mapel/'.$value->id_mapel) ?>" class="btn btn-outline-success"><i class="bi bi-pencil"></i></a>
                   <a href= "<?= base_url('home/hapus_mapel/'.$value->id_mapel) ?>" class="btn btn-outline-danger"><i class="bi bi-trash"></i></a>
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

  </main><!-- End #main -->
      