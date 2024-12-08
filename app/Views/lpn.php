<main id="main" class="main">
    <div class="pagetitle">
        <h1>Laporan Nilai</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item">Laporan</li>
                <li class="breadcrumb-item active">Nilai</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
      
        <div class="row">
            <!-- Kolom Kiri -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Cetak Rapor Siswa</h5>
                        <div class="container">
                            <form action="<?= base_url('home/lnilai') ?>" method="get">
                                <div class="mb-3">
                                    <label for="id_siswa" class="form-label">Nama Siswa:</label>
                                    <select class="form-control" name="id_siswa" id="id_siswa" required>
                                        <?php foreach ($siswaResult as $siswa): ?>
                                            <option value="<?= $siswa['id_siswa'] ?>"><?= $siswa['nama_siswa'] ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                <div class="mb-3">
                                    <label for="id_blok" class="form-label">Pilih Blok:</label>
                                    <select class="form-control" name="id_blok" id="id_blok" required>
                                        <?php foreach ($blokResult as $blok): ?>
                                            <option value="<?= $blok['id_blok'] ?>"><?= $blok['kode_blok'] ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                                 <link rel="stylesheet" type="text/css" href="<?= base_url('fontawesome/css/fontawesome.min.css'); ?>">
        <link rel="stylesheet" type="text/css" href="<?= base_url('fontawesome/css/all.css'); ?>">
                                <input type="hidden" name="ids" value="<?= $takdirestui->id_siswa ?>">
                                <button type="submit" class="btn btn-primary ml-3"><i class="fas fa-print"></i></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Kolom Kanan -->
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">PDF Rapor Siswa</h5>
                        <div class="container">
                           <form action="<?= base_url('home/lnilaipdf/' . $siswa_id . '/' . $blok_id) ?>" method="post">
    <input type="hidden" name="id_siswa" value="<?= $id_siswa ?>">
    <input type="hidden" name="id_blok" value="<?= $id_blok ?>">

    <div class="row mb-3">
        <div class="mb-3">
            <label for="id_siswa" class="form-label">Nama Siswa:</label>
            <select class="form-control" name="id_siswa" id="id_siswa" required>
                <?php foreach ($siswaResult as $siswa): ?>
                    <option value="<?= $siswa['id_siswa'] ?>"><?= $siswa['nama_siswa'] ?></option>
                <?php endforeach; ?>
            </select>
        </div>

        <div class="mb-3">
            <label for="id_blok" class="form-label">Pilih Blok:</label>
            <select class="form-control" name="id_blok" id="id_blok" required>
                <?php foreach ($blokResult as $blok): ?>
                    <option value="<?= $blok['id_blok'] ?>"><?= $blok['kode_blok'] ?></option>
                <?php endforeach; ?>
            </select>
        </div>
    </div>
    <button type="submit" class="btn btn-danger me-2"><i class="fas fa-file-pdf"></i></button>
</form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
