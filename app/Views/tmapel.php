<main id="main" class="main">

    <div class="pagetitle">
      <h1>Mata Pelajaran</h1>
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
              <h5 class="card-title">Tambah Mata Pelajaran</h5>

		<form action="<?= base_url('home/simpan_tmapel') ?>" method="post">
		<div class="mb-3">
			<label for="nik" class="form-label">Nama Mata Pelajaran</label>
			<input type="text" class="form-control" id="nik" placeholder="Enter Nama Mapel" name="namaa">
		</div>

		   <div class="text-center">
		   	<input type="hidden" value="" name="idm"> 
            <input type="submit" class="btn btn-outline-primary" value="Submit">
        </div>

	</form>