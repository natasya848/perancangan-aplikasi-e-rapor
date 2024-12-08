<?php

$conn = mysqli_connect("localhost", "root", "", "erapor", 4306);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$result = mysqli_query($conn, "SELECT COUNT(*) AS total_siswa FROM siswa");
$row = mysqli_fetch_assoc($result);
$jumlah_siswa = $row['total_siswa'];

$result = mysqli_query($conn, "SELECT COUNT(*) AS total_guru FROM guru");
$row = mysqli_fetch_assoc($result);
$jumlah_guru = $row['total_guru'];

$result = mysqli_query($conn, "SELECT COUNT(*) AS total_mapel FROM mapel");
$row = mysqli_fetch_assoc($result);
$jumlah_mapel = $row['total_mapel'];
?>

<main id="main" class="main">
<div class="card">
            <div class="card-body">
              <h5 class="card-title">Beranda</h5>

              <nav>
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="index"><i class="bi bi-house-door"></i></a></li>
                  <li class="breadcrumb-item"><a href="#">Library</a></li>
                  <li class="breadcrumb-item active">Default</li>
                </ol>
              </nav>
            </div>
          </div>
        </div>

        <section class="section">
    <div class="row">
        <!-- Carousel Section -->
        <div class="col-lg-6">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Welcome to E-Rapor Sekolah Permata Harapan</h5>
                    <!-- Slides only carousel -->
                    <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="<?= base_url('img/ph1.jpeg') ?>" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="<?= base_url('img/ph2.jpg') ?>" class="d-block w-100" alt="...">
                            </div>
                        </div>
                    </div>
                    <!-- End Slides only carousel -->
                </div>
            </div>
        </div>

        <!-- Info Cards Section -->
        <div class="col-lg-6">
            <div class="row">
                <!-- Card: Jumlah Siswa -->
                <div class="col-md-12 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Jumlah Siswa</h5>
                            <p class="card-text"><?php echo $jumlah_siswa; ?> Siswa</p> 
                        </div>
                    </div>
                </div>

                <!-- Card: Jumlah Guru -->
                <div class="col-md-12 mb-3">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Jumlah Guru</h5>
                            <p class="card-text"><?php echo $jumlah_guru; ?> Guru</p> 
                        </div>
                    </div>
                </div>

                <!-- Card: Jumlah Mata Pelajaran -->
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Jumlah Mata Pelajaran</h5>
                            <p class="card-text"><?php echo $jumlah_mapel; ?> Mata Pelajaran</p> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


        <!-- Tambahkan konten dashboard lainnya di sini -->
    </div>

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html> 