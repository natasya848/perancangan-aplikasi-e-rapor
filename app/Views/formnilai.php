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
              <h5 class="card-title">Form Nilai</h5>

  <form action="<?= base_url('home/nilai') ?>" method="post">
  <div class="mb-3 mt">
    <label for="email" class="form-label">Nama: </label>
    <input type="text" class="form-control" id="nama" placeholder="Enter Nama" name="nama" value="<?= $takdirestui->nama_siswa ?> ">
  </div>
  <div class="mb-3">
    <label for="tanggal" class="form-label">Kelas: </label>
    <input type="text" class="form-control" id="jumlah" placeholder="Enter Kelas" name="kls" 
    value="<?= $takdirestui->nama_kelas ?>">
  </div>
</form>
<input type="hidden" value="<?= $takdirestui->id_siswa?>" name="idn"> 
    <button type="submit" class="btn btn-primary">Submit</button>
  
</form>
</div>

            </div>
          </div>

        </div>
      </div>
    </section>

  </main><!-- End #main -->
      