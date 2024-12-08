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
              <h5 class="card-title">Edit Data Guru</h5>
<form action="<?= base_url('home/simpan_guru') ?>" method="post">
    <input type="hidden" name="id_user" value="<?= $takdirestui->id_user ?>">

    <div class="mb-3">
        <label for="email">Email</label>
        <input type="email" class="form-control" name="email" id="email" 
               value="<?= $takdirestui->email ?>" required>
    </div>

    <div class="mb-3">
        <label for="level">Level</label>
        <select class="form-select" name="level" id="level" required>
            <option value="3" <?= $takdirestui->level == 3 ? 'selected' : '' ?>>Wali Kelas</option>
            <option value="4" <?= $takdirestui->level == 4 ? 'selected' : '' ?>>Guru</option>
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
