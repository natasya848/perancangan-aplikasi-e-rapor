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
              <h5 class="card-title">Edit Data Nilai</h5>

    <form action="<?= base_url('home/simpan_nilai') ?>" method="post">
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
        <label for="mapel" class="form-label">Guru</label>
        <select class="form-control" name="mapel" required>
            <option>Pilih Guru</option>
            <?php if (!empty($guru)): ?>
                <?php foreach ($guru as $value): ?>
                    <option value="<?= $value->id_guru ?>"><?= $value->nama_guru ?></option>
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
      <label for="tanggal" class="form-label">Sesi</label>
      <input type="number" class="form-control" id="tanggal" placeholder="Enter Sesi" name="sesi">
    </div>

    <div class="mb-3">
      <label for="tanggal" class="form-label">Nilai</label>
      <input type="number" class="form-control" id="tanggal" placeholder="Enter Nilai Siswa" name="nilai">
    </div>
   

       <div class="text-center">
        <input type="hidden" value="<?= $takdirestui->id_nilai?>" name="idn"> 
            <input type="submit" class="btn btn-outline-primary" value="Submit">
        </div>

  </form>