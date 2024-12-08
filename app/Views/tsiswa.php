<main id="main" class="main">

    <div class="pagetitle">
        <h1>Tambah Siswa</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                <li class="breadcrumb-item">Forms</li>
                <li class="breadcrumb-item active">Tambah Siswa</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-12">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Form Tambah Siswa</h5>

                        <!-- Form Input Siswa -->
                        <form action="<?= base_url('home/tsiswa') ?>" method="POST">
                            <div class="row mb-3">
                                <label for="nis" class="col-sm-2 col-form-label">NIS</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="nis" name="nis" required>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="nama" class="col-sm-2 col-form-label">Nama Siswa</label>
                                <div class="col-sm-10">
                                 <input type="text" class="form-control" id="nama" name="nama_siswa" required>
                                </div>
                            </div>
<div class="row mb-3">
    <label for="id_kelas" class="col-sm-2 col-form-label">Kelas</label>
    <div class="col-sm-10">
        <select class="form-select" id="id_kelas" name="id_kelas" required>
            <?php if (is_array($kelas) && !empty($kelas)): ?>
                <?php foreach ($kelas as $kelasItem): ?>
                    <option value="<?= $kelasItem['id_kelas'] ?>"><?= $kelasItem['nama_kelas'] ?></option>
                <?php endforeach; ?>
            <?php else: ?>
                <option disabled>No classes available</option>
            <?php endif; ?>
        </select>
    </div>
</div>

<div class="row mb-3">
    <label for="id_rombel" class="col-sm-2 col-form-label">Rombel</label>
    <div class="col-sm-10">
        <select class="form-select" id="id_rombel" name="id_rombel" required>
            <?php if (is_array($rombel) && !empty($rombel)): ?>
                <?php foreach ($rombel as $rombelItem): ?>
                    <option value="<?= $rombelItem['id_rombel'] ?>"><?= $rombelItem['nama_rombel'] ?></option>
                <?php endforeach; ?>
            <?php else: ?>
                <option disabled>No rombel available</option>
            <?php endif; ?>
        </select>
    </div>
</div>

                            <div class="row mb-3">
                                <label for="tanggal_lahir" class="col-sm-2 col-form-label">Tanggal Lahir</label>
                                <div class="col-sm-10">
                                    <input type="date" class="form-control" id="tanggal_lahir" name="tanggal_lahir" required>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="alamat" class="col-sm-2 col-form-label">Alamat</label>
                                <div class="col-sm-10">
                                    <textarea class="form-control" id="alamat" name="alamat" required></textarea>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="jeniskel" class="col-sm-2 col-form-label">Jenis Kelamin</label>
                                <div class="col-sm-10">
                                    <select class="form-select" id="jeniskel" name="jeniskel" required>
                                        <option value="L">Laki-Laki</option>
                                        <option value="P">Perempuan</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="email" class="col-sm-2 col-form-label">Email</label>
                                <div class="col-sm-10">
                                    <input type="email" class="form-control" id="email" name="email" required>
                                </div>
                            </div>

                            <div class="row mb-3">
    <label for="password" class="col-sm-2 col-form-label">Password</label>
    <div class="col-sm-10">
        <input type="password" class="form-control" id="password" name="password" required>
    </div>
</div>


                            <div class="row mb-3">
                                <label for="level" class="col-sm-2 col-form-label">Level</label>
                                <div class="col-sm-10">
                                    <select class="form-select" id="level" name="level" required>
                                        <option value="5">Siswa</option> 
                                    </select>
                                </div>
                            </div>

                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Simpan</button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </section>

</main><!-- End #main -->
