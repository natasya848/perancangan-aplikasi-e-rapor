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
              <h5 class="card-title">Tambah Data Nilai</h5>

    <form action="<?= base_url('home/simpan_tnilai') ?>" method="post">
    <div class="mb-3">
        <label for="siswa" class="form-label">Nama Siswa</label>
        <select class="form-control" name="siswa" required>
            <option>Pilih Siswa</option>
            <?php if (!empty($siswa)): ?>
                <?php foreach ($siswa as $value): ?>
                    <option value="<?= $value->id_siswa ?>"><?= $value->nama_siswa ?></option>
                <?php endforeach; ?>
            <?php else: ?>
                <option disabled>No data available</option>
            <?php endif; ?>
        </select>
    </div>

    <div class="mb-3"> 
  <div>
    <label for="email" class="form-label">Rombongan Belajar:</label><br> 
    <div class="form-check">
    <input class="form-check-input" type="radio" name="gridRadios" value="RPL" required>
    <label class="form-check-label" for="gridRadios1">RPL</label>
</div>
<div class="form-check">
    <input class="form-check-input" type="radio" name="gridRadios" value="AKL" required>
    <label class="form-check-label" for="gridRadios2">AKL</label>
</div>
<div class="form-check">
    <input class="form-check-input" type="radio" name="gridRadios" value="BDP" required>
    <label class="form-check-label" for="gridRadios3">BDP</label>
</div>

    </div>

    <div class="mb-3">
        <label for="mapel" class="form-label">Mata Pelajaran</label>
        <select class="form-control" name="mapel" required>
            <option>Pilih Mata Pelajaran</option>
            <?php if (!empty($takdirestui)): ?>
                <?php foreach ($takdirestui as $value): ?>
                    <option value="<?= $value->id_mapel ?>"><?= $value->nama_mapel ?></option>
                <?php endforeach; ?>
            <?php else: ?>
                <option disabled>No data available</option>
            <?php endif; ?>
        </select>
    </div>

    <div class="mb-3">
        <label for="blok" class="form-label">Blok</label>
        <select class="form-control" name="blok" required>
            <option>Pilih Blok</option>
            <?php if (!empty($blok)): ?>
                <?php foreach ($blok as $value): ?>
                    <option value="<?= $value->id_blok ?>"><?= $value->kode_blok ?></option>
                <?php endforeach; ?>
            <?php else: ?>
                <option disabled>No data available</option>
            <?php endif; ?>
        </select>
    </div>

    <div class="mb-3">
      <label for="tanggal" class="form-label">Nilai</label>
      <input type="number" class="form-control" id="tanggal" placeholder="Enter Nilai Siswa" name="nilai">
    </div>
   

       <div class="text-center">
        <input type="hidden" name="<?= csrf_token() ?>" value="<?= csrf_hash() ?>" />
            <input type="submit" class="btn btn-outline-primary" value="Submit">
        </div>

  </form>