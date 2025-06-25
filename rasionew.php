<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Rasio Keuangan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>

<body>
   <?php
include 'conn.php';
include 'navbar.php';

// Ambil kas dan setara kas
$kas_q = mysqli_query($conn, "SELECT saldo FROM v_aktiva WHERE kode_akun = '111'");
$bank_q = mysqli_query($conn, "SELECT saldo FROM v_aktiva WHERE kode_akun = '112'");
$kas = mysqli_fetch_assoc($kas_q)['saldo'] ?? 0;
$setara_kas = mysqli_fetch_assoc($bank_q)['saldo'] ?? 0;

// Ambil utang lancar (Hutang Usaha)
$hutang_q = mysqli_query($conn, "SELECT saldo FROM v_passiva WHERE kode_akun = '211'");
$utang_lancar = mysqli_fetch_assoc($hutang_q)['saldo'] ?? 1; // agar tidak divide by zero

// Ambil total aset
$aset_q = mysqli_query($conn, "SELECT SUM(saldo) AS total_aset FROM v_aktiva");
$total_aset = mysqli_fetch_assoc($aset_q)['total_aset'] ?? 1;

// Ambil modal (ekuitas tanpa laba rugi)
$modal_q = mysqli_query($conn, "SELECT saldo FROM v_passiva WHERE kode_akun = '221'");
$modal = mysqli_fetch_assoc($modal_q)['saldo'] ?? 1;

// Ambil laba rugi final dari akun kode_akun 230
$laba_q = mysqli_query($conn, "SELECT saldo FROM v_passiva WHERE kode_akun = '230'");
$laba_bersih = mysqli_fetch_assoc($laba_q)['saldo'] ?? 0;

// Penjualan dari akun Penjualan
$penjualan_q = mysqli_query($conn, "SELECT saldo FROM v_laba_rugi WHERE nama_akun = 'Penjualan'");
$penjualan = mysqli_fetch_assoc($penjualan_q)['saldo'] ?? 1;

// Hitung total ekuitas (modal + laba bersih)
$ekuitas = $modal + $laba_bersih;

// Hitung rasio
$cash_ratio = ($kas + $setara_kas) / $utang_lancar * 100;
$net_profit_margin = $laba_bersih / $penjualan * 100;
$roa = $laba_bersih / $total_aset * 100;
$roe = $laba_bersih / $ekuitas * 100;
?>


    <div class="container">
        <h1>Rasio Keuangan</h1>
        <table id="detailLabaRugi" class="table table-hover">
                 <tr>
            <th>Nama Rasio</th>
            <th>Nilai (%)</th>
        </tr>
        <tr>
                <td>Cash Ratio</td>
                <td><?= number_format($cash_ratio, 2) ?>%</td>
            </tr>
            <tr>
                <td>Net Profit Margin</td>
                <td><?= number_format($net_profit_margin, 2) ?>%</td>
            </tr>
            <tr>
                <td>ROA (Return on Assets)</td>
                <td><?= number_format($roa, 2) ?>%</td>
            </tr>
            <tr>
                <td>ROE (Return on Equity)</td>
                <td><?= number_format($roe, 2) ?>%</td>
            </tr>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>