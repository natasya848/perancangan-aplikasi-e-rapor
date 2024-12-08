<main id="main" class="main">

    <div class="pagetitle">
      <h1>User</h1>
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
              <h5 class="card-title">User</h5>

  <!-- <a href="<?= base_url('home/tusr') ?>"><button class="btn btn-outline-warning"><i class="bi bi-plus"></i>Tambah</button></a> -->

<div class="table-responsive">
  <table class="table table-bordered table-striped" id="dataTable" width="100%" cellspacing="0">  
    <thead>
      <tr>
        <th width="3%">No</th>
        <th>Username</th>
        <th>Password</th>
        <th>Level</th>
        <?php
        if (session()->get('level')==1) {
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
               <td><?= $value->username ?></td>
               <td><?= $value->password ?></td>
               <td><?= $value->level ?></td>
               <?php
                if (session()->get('level')==1) {
                ?>
               <td>
                  <link rel="stylesheet" type="text/css" href="<?=base_url('fontawesome/css/fontawesome.min.css');?>">
                  <link rel="stylesheet" type="text/css" href="<?=base_url('fontawesome/css/all.css');?>">
                  <a href="<?= base_url('home/edit_user/'.$value->id_user) ?>" class="btn btn-outline-warning"><i class="bi bi-key"></i>
                   </a>
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
