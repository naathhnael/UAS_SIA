<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Laporan Laba Rugi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>

<body>
    <?php
    include_once("conn.php");
    include_once("navbar.php");

    // Ambil data laba rugi
    $sql_bb = "SELECT * FROM v_aktiva";
    $result_bb = $conn->query($sql_bb);
    ?>

    <div class="container">
        <h1>Laporan Aktiva</h1>
        <table id="detailLabaRugi" class="table table-hover">
            <thead>
                <tr>
                    <th>Kode Akun</th>
                    <th>Nama Akun</th>
                    <th style='text-align: right;'>Debet</th>
                    <th style='text-align: right;'>Kredit</th>
                    <th style='text-align: right;'>Saldo</th>
                </tr>
            </thead>
            <tbody>
                <?php
                if ($result_bb->num_rows > 0) {
                    mysqli_data_seek($result_bb, 0);
                    $total_debet = 0;
                    $total_kredit = 0;
                    $total_saldo = 0;
                    while ($row = $result_bb->fetch_assoc()) {
                        $debet  = number_format($row['debet']);
                        $kredit = number_format($row['kredit']);
                        $saldo  = number_format($row['saldo']);
                        echo "
                            <tr>
                                <td>{$row['kode_akun']}</td>
                                <td>{$row['nama_akun']}</td>
                                <td align='right'>{$debet}</td>
                                <td align='right'>{$kredit}</td>
                                <td align='right'>{$saldo}</td>
                            </tr>";
                        $total_debet  += $row['debet'];
                        $total_kredit += $row['kredit'];
                        $total_saldo  += $row['saldo'];
                    }
                }
                ?>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="2" align="right"><b>Total</b></td>
                    <td align="right"><b><?= number_format($total_debet) ?></b></td>
                    <td align="right"><b><?= number_format($total_kredit) ?></b></td>
                    <td align="right"><b><?= number_format($total_debet - $total_kredit) ?></b></td>
                </tr>
            </tfoot>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>