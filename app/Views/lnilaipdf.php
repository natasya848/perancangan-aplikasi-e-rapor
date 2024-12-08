
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Kartu Hasil Studi</title>
    <style>
        body { font-family: Arial, sans-serif; }
        .khs-card { width: 800px; margin: 0 auto; border: 1px solid black; padding: 20px; }
        .header { text-align: center; font-weight: bold; font-size: 16px; margin-bottom: 20px; }
        .info { display: flex; justify-content: space-between; margin-bottom: 20px; font-size: 14px; }
        .table-khs { width: 100%; border-collapse: collapse; }
        .table-khs th, .table-khs td { border: 1px solid black; padding: 8px; text-align: center; }
        .table-khs th { background-color: #f2f2f2; }
        .table-interval { margin-top: 10px; width: 100%; font-size: 14px; border-collapse: collapse; }
        .note { margin-top: 20px; font-size: 14px; }
        .signature { text-align: center; margin-top: 20px; }
        .separator { border-top: 1px solid black; margin: 20px 0; }
    </style>
</head>
<body>

    <div class="khs-card">
        <div class="header">
            KARTU HASIL STUDI (KHS)<br>
            BLOK IV SEMESTER GANJIL - TP. 2024/2025
        </div>
        <div class="separator"></div>

        <div class="info">
            <div>
                <p><strong>NIS:</strong> <?php echo htmlspecialchars($siswa['nis']); ?></p>
                <p><strong>Nama:</strong> <?php echo htmlspecialchars($siswa['nama_siswa']); ?></p>
                <p><strong>Kelas:</strong> <?php echo htmlspecialchars($siswa['nama_kelas']); ?></p>
                <p><strong>Rombel:</strong> <?php echo htmlspecialchars($siswa['nama_rombel']); ?></p>
            </div>
        </div>

        <div class="separator"></div>

        <div><strong>Petunjuk Umum:</strong></div>
        <ol style="font-size: 14px;">
            <li>Nilai yang tertera adalah hasil pembelajaran siswa selama satu blok.</li>
            <li>Standar KKM yang ditentukan sekolah adalah 75 untuk semua mata pelajaran.</li>
            <li>KHS harus ditandatangani orang tua sebagai tanda bahwa telah diperiksa.</li>
            <li>KHS yang telah ditandatangani harus dikembalikan dalam 1 minggu.</li>
        </ol>

        <table class="table-khs">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Mata Pelajaran</th>
                    <th>KKM</th>
                    <th>Nilai</th>
                </tr>
            </thead>
            <tbody>
                <?php
$no = 1;
$kkm = 75;
foreach ($nilai as $row) {
    echo '
    <tr>
        <td>' . $no++ . '</td>
        <td>' . htmlspecialchars($row->nama_mapel) . '</td>
        <td>' . $kkm . '</td>
        <td>' . number_format($row->nilai, 2) . '</td>
    </tr>';
}
?>
                <tr>
                    <td colspan="3"><strong>Rata-rata Nilai</strong></td>
                    <td><?php echo number_format($rataRata, 2); ?></td>
                </tr>
            </tbody>
        </table>

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
</div>
</body>
</html>