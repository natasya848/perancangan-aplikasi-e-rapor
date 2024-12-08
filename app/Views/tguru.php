<main id="main" class="main">

    <div class="pagetitle">
      <h1>Guru</h1>
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
              <h5 class="card-title">Tambah Data Guru</h5>

              <form action="<?= base_url('home/tguru') ?>" method="post">

                <div class="mb-3">
                    <label for="nip">NIP</label>
        <input type="text" class="form-control" name="nip" id="nip" required>
    </div>
                <div class="mb-3">
        <label for="nama_guru">Nama Guru</label>
        <input type="text" class="form-control" name="nama_guru" id="nama_guru" required>
    </div>
                <div class="mb-3">
        <label for="alamat">Alamat</label>
        <input type="text" class="form-control" name="alamat" id="alamat" required>
    </div>

              <div class="mb-3">
        <label for="jenis_kelamin">Jenis Kelamin</label>
        <select name="jenis_kelamin" id="jenis_kelamin" class="form-control" required>
            <option value="Laki-Laki">Laki-Laki</option>
            <option value="Perempuan">Perempuan</option>
        </select>
    </div>

<div class="mb-3">
        <label for="email">Email</label>
        <input type="email" class="form-control" name="email" id="email" required>
    </div>

                 <div class="mb-3">
        <label for="password">Password</label>
        <input type="password" class="form-control" name="password" id="password" required>
    </div>

     <div class="mb-3">
        <label for="level">Level</label>
        <select name="level" id="level" class="form-control" required>
            <option value="3">Wali Kelas</option>
            <option value="4">Guru</option>
        </select>
    </div>
                <div class="text-center">
                  <input type="submit" class="btn btn-outline-primary" value="Submit">
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
</main>
