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
              <h5 class="card-title">Edit Data User</h5>
<form action="<?= base_url('home/simpan_user'); ?>" method="post">
    <div class="mb-3 mt">
        <label for="user" class="form-label">Username: </label>
        <input type="text" class="form-control" id="user" placeholder="Enter Username" name="user" value="<?= $takdirestui->username ?>">
    </div>
    <div class="mb-3">
        <label for="pw" class="form-label">Password: </label>
        <input type="number" class="form-control" id="pw" placeholder="Enter Password" name="pw" value="<?= $takdirestui->password ?>">
    </div>
    <div class="mb-3">
        <label for="level" class="form-label">Level: </label>
        <input type="text" class="form-control" id="level" placeholder="Enter Level" name="level" value="<?= $takdirestui->level ?>">
    </div>

    <div class="text-center">
    <input type="hidden" value="" name="idur"> 
    <button type="submit" class="btn btn-outline-primary">Submit</button>
</form>
