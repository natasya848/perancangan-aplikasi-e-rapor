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
              <h5 class="card-title">Edit Data Siswa</h5>

 <form action="<?= base_url('home/simpan_siswa') ?>" method="post">
    <input type="hidden" name="id_siswa" value="<?= $student['id_siswa'] ?>">

    <div class="mb-3">
        <label for="id_kelas" class="form-label">Nama Kelas</label>
        <select class="form-control" id="id_kelas" name="id_kelas" required>
            <?php foreach ($kelas as $kls): ?>
                <option value="<?= $kls['id_kelas']; ?>" <?= $kls['id_kelas'] == $student['id_kelas'] ? 'selected' : ''; ?>>
                    <?= $kls['nama_kelas']; ?>
                </option>
            <?php endforeach; ?>
        </select>
    </div>

    <div class="mb-3">
        <label for="id_rombel" class="form-label">Nama Rombel</label>
        <select class="form-control" id="id_rombel" name="id_rombel" required>
            <?php foreach ($rombel as $rbl): ?>
                <option value="<?= $rbl['id_rombel']; ?>" <?= $rbl['id_rombel'] == $student['id_rombel'] ? 'selected' : ''; ?>>
                    <?= $rbl['nama_rombel']; ?>
                </option>
            <?php endforeach; ?>
        </select>
    </div>

  <div class="mb-3">
    <label for="email">Email</label>
    <input type="email" class="form-control" name="email" id="email" 
           value="<?= $student['username'] ?>" required>
</div>


    <div class="text-center">
        <input type="submit" class="btn btn-outline-primary" value="Submit">
    </div>
</form>
