<?php
$conn = mysqli_connect("localhost", "root", "", "erapor", 4306);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$id_siswa = isset($_GET['id_siswa']) ? $_GET['id_siswa'] : '';
$id_blok = isset($_GET['id_blok']) ? $_GET['id_blok'] : '';

// Ambil data siswa berdasarkan ID Siswa
$siswaQuery = "SELECT * FROM siswa WHERE id_siswa = '$id_siswa'";
$siswaResult = mysqli_query($conn, $siswaQuery);
$siswa = mysqli_fetch_assoc($siswaResult);

$nilaiQuery = "
    SELECT n.nilai, j.id_mapel, m.nama_mapel 
    FROM nilai n
    JOIN jadwal j ON n.id_jadwal = j.id_jadwal
    JOIN mapel m ON j.id_mapel = m.id_mapel
    WHERE n.id_siswa = '$id_siswa' AND j.id_blok = '$id_blok'";
$nilaiResult = mysqli_query($conn, $nilaiQuery);
$nilai = mysqli_fetch_all($nilaiResult, MYSQLI_ASSOC);

$siswaQuery = "
    SELECT s.*, k.nama_kelas, r.nama_rombel
    FROM siswa s
    LEFT JOIN kelas k ON s.id_kelas = k.id_kelas
    LEFT JOIN rombel r ON s.id_rombel = r.id_rombel
    WHERE s.id_siswa = '$id_siswa'";

$siswaResult = mysqli_query($conn, $siswaQuery);

if (!$siswaResult || mysqli_num_rows($siswaResult) == 0) {
    die("Query failed or no data found.");
}

$siswa = mysqli_fetch_assoc($siswaResult);

$persentaseAbsensi = 100;

$totalNilai = 0;
$jumlahMapel = count($nilai);
foreach ($nilai as $row) {
    $totalNilai += $row['nilai'];
}
$rataRata = $jumlahMapel > 0 ? $totalNilai / $jumlahMapel : 0;
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kartu Hasil Studi</title>
     <style>
        body { font-family: Arial, sans-serif; }
        .khs-card { width: 800px; margin: 0 auto; border: 1px solid black; padding: 20px; }
        .header { text-align: center; font-weight: bold; font-size: 16px; margin-bottom: 20px; }
        .info { display: flex; justify-content: space-between; margin-bottom: 20px; font-size: 16px; }
        .table-khs { width: 100%; border-collapse: collapse; }
        .table-khs th, .table-khs td { border: 1px solid black; padding: 8px; text-align: center; }
        .table-khs th { background-color: #f2f2f2; }
        .table-interval { margin-top: 10px; width: 100%; font-size: 14px; border-collapse: collapse; }
        .table-interval th, .table-interval td { border: 1px solid black; padding: 5px; text-align: center; }
        .table-interval, .table-absensi { margin-top: 10px; width: 100%; font-size: 14px; border-collapse: collapse; }
        .table-interval th, .table-interval td, .table-absensi th, .table-absensi td { border: 1px solid black; padding: 8px; text-align: center; }
        .table-interval th { background-color: #f2f2f2; }
        .note { margin-top: 20px; font-size: 14px; }
        .note textarea { width: 100%; height: 80px; }
        .signature { text-align: center; margin-top: 20px; }
        .separator { border-top: 1px solid black; margin: 20px 0; }
        .separator2 { border-top: 2px solid black; margin: 20px 0; }
        .table-catatan { margin-top: 20px; font-size: 16px; width: 100%; border-collapse: collapse; border: 1px solid black; }
        .table-catatan th { background-color: #f2f2f2; text-align: left; }
    </style>
</head>
<body>
    <pre><?php print_r($data); ?></pre>

    <div class="khs-card">
        <div class="header">
            KARTU HASIL STUDI (KHS)<br>
            BLOK IV SEMESTER GANJIL - TP. 2024/2025
        </div>
        <div class="separator2"></div>

        <div class="info">
            <div>
                <p><strong>NIS:</strong> <?= htmlspecialchars($siswa['nis']) ?></p>
                <p><strong>Nama:</strong> <?= htmlspecialchars($siswa['nama_siswa']) ?></p>
                <p><strong>Kelas:</strong> <?= htmlspecialchars($siswa['nama_kelas']) ?></p>
                <p><strong>Rombel:</strong> <?= htmlspecialchars($siswa['nama_rombel']) ?></p>

            </div>
        </div>

        <div class="separator"></div>

        <div><strong>Petunjuk Umum:</strong></div>
        <ol style="font-size: 16px;">
            <li>Nilai yang tertera adalah hasil pembelajaran siswa selama satu blok.</li>
            <li>Standar KKM yang ditentukan sekolah adalah 75 untuk semua mata pelajaran.</li>
            <li>KHS harus ditandatangani orang tua sebagai tanda bahwa telah diperiksa.</li>
            <li>KHS yang telah ditandatangani harus dikembalikan dalam 1 minggu.</li>
        </ol>

        <h3></h3>
        <table class="table-khs">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Mata Pelajaran</th>
                    <th>KKM</th>
                    <th>Rata-rata</th>
                </tr>
            </thead>
            <tbody>
                <?php 
                $no = 1;
                $kkm = 75;
                $totalNilai = 0;
                $jumlahMapel = count($nilai);
                foreach ($nilai as $row): 
                    $totalNilai += $row['nilai'];
                ?>
                    <tr>
                        <td><?= $no++ ?></td>
                        <td><?= htmlspecialchars($row['nama_mapel']) ?></td>
                        <td><?= $kkm ?></td>
                        <td><?= number_format($row['nilai'], 2) ?></td>
                    </tr>
                <?php endforeach; ?>
                <tr>
                    <td colspan="3"><strong>Rata-rata Nilai</strong></td>
                    <td><?= $jumlahMapel > 0 ? number_format($totalNilai / $jumlahMapel, 2) : 0 ?></td>
                </tr>
            </tbody>
        </table>

        <h3></h3>
        <table class="table-interval">
            <thead>
                <tr>
                    <th>Interval Predikat Nilai Rata-rata dengan KKM 75</th>
                </tr>
            </thead>
            <tbody>
                <tr><td>> 92 (A) Sangat Baik</td></tr>
                <tr><td>> 83 (B) Baik</td></tr>
                <tr><td>>= 75 (C) Cukup</td></tr>
                <tr><td>< 75 (D) Kurang</td></tr>
            </tbody>
        </table>

        <div class="table-absensi">
            <table width="100%">
                <tr>
                    <th>Persentase (%) Absensi</th>
                    <th>100%</th>
                </tr>
            </table>
        </div>

        <div class="signature">
            <table width="100%">
                <tr>
                    <td style="text-align: center;">Orang Tua/Wali</td>
                    <td style="text-align: center;">Wali Kelas</td>
                </tr>
                <tr>
                    <td style="height: 50px;"></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="text-align: center;"><hr style="width: 150px;"></td>
                    <td style="text-align: center;"><hr style="width: 150px;"></td>
                </tr>
            </table>
        </div>

           <div class="table-catatan">
        <h5>Catatan Wali Kelas:</h5>
        <div>
            <table width="100%">
                <tr>
                    <td>
                        <?php if (isset($catatan['catatan']) && !empty($catatan['catatan'])): ?>
                            <p><?= nl2br(htmlspecialchars($catatan['catatan'])) ?></p>
                        <?php else: ?>
                            <p><em>Catatan wali kelas belum diinput.</em></p>
                        <?php endif; ?>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <script type="text/javascript">
        window.print();
    </script>
</body>
</html>
