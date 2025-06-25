<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Buku Besar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>

<body>
    <?php
    include_once("conn.php");
    include_once("navbar.php");

    // Ambil data jurnal
    $sql_bb = "select * FROM v_buku_besar";
    $result_bb = $conn->query($sql_bb);
    ?>

    <div class="container">
        <h1>Buku Besar</h1>
        <table id="detailBukuBesar" class="table table-hover">
            <thead>
                <tr>
                    <th>No.Jurnal</th>
                    <th>Tgl.Jurnal</th>
                    <th>Catatan</th>
                    <th>Kode Akun</th>
                    <th>Nama Akun</th>
                    <th>Debet</th>
                    <th>Kredit</th>
                </tr>
            </thead>
            <tbody>
                <?php
                if ($result_bb->num_rows > 0) {
                    mysqli_data_seek($result_bb, 0);
                    $total_debet = 0;
                    $total_kredit = 0;
                    while ($row = $result_bb->fetch_assoc()) {
                        $debet  = number_format($row['debet']);
                        $kredit = number_format($row['kredit']);
                        echo "
                            <tr>
                                <td>{$row['no_jurnal']}</td>
                                <td>{$row['tgl_jurnal']}</td>
                                <td>{$row['catatan']}</td>
                                <td>{$row['kode_akun']}</td>
                                <td>{$row['nama_akun']}</td>
                                <td>{$debet}</td>
                                <td>{$kredit}</td>
                            </tr>";
                        $total_debet  += ($row['debet'] * 1);
                        $total_kredit += ($row['kredit'] * 1);
                    }
                }
                ?>
            </tbody>
            <tfoot>
                <td colspan=5 align ='right'>Total</td>
                <td align ='right'><?= $total_debet ?></td>
                <td align ='right'><?= $total_kredit ?></td>
            </tfoot>
        </table>
    </div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>

</html>