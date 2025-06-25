<?php
include 'conn.php';
include 'navbar.php';

// Ambil data dari tabel laporan/laba rugi/neraca yang sudah Anda punya
// Sesuaikan query sesuai struktur tabel Anda
// Misal asumsinya sbb (harus disesuaikan dengan database Anda)
$total_kas = 5000000; // Contoh isi kas
$total_kewajiban_lancar = 2000000;
$pendapatan_bersih = 10000000;
$laba_bersih = 2000000;
$total_aset = 15000000;
$total_ekuitas = 8000000;

// Hitung Rasio
$cash_ratio = $total_kewajiban_lancar != 0 ? $total_kas / $total_kewajiban_lancar : 0;
$net_profit_margin = $pendapatan_bersih != 0 ? $laba_bersih / $pendapatan_bersih : 0;
$roa = $total_aset != 0 ? $laba_bersih / $total_aset : 0;
$roe = $total_ekuitas != 0 ? $laba_bersih / $total_ekuitas : 0;
?>

<!DOCTYPE html>
<html>
<head>
    <title>Rasio Keuangan</title>
</head>
<body>
    <div class="container">
        <h2>Rasio Keuangan</h2>
        <table border="1" cellpadding="10">
            <tr>
                <th>Jenis Rasio</th>
                <th>Nilai</th>
            </tr>
            <tr>
                <td>Cash Ratio</td>
                <td><?= number_format($cash_ratio, 2) ?></td>
            </tr>
            <tr>
                <td>Net Profit Margin</td>
                <td><?= number_format($net_profit_margin * 100, 2) ?>%</td>
            </tr>
            <tr>
                <td>ROA (Return on Assets)</td>
                <td><?= number_format($roa * 100, 2) ?>%</td>
            </tr>
            <tr>
                <td>ROE (Return on Equity)</td>
                <td><?= number_format($roe * 100, 2) ?>%</td>
            </tr>
        </table>
    </div>
</body>
</html>
