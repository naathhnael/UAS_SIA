<?php
include_once("conn.php");


// Ambil data dari form
$txtNoJU = strtoupper($_POST['txtNoJU']);
$txtTglJurnal = date('Y-m-d', strtotime($_POST['txtTglJurnal']));
$txtCatatan = strtoupper($_POST['txtCatatan']);

$ju_coa    = $_POST['ju_coa'];
$ju_debet  = $_POST['ju_debet'];
$ju_kredit = $_POST['ju_kredit'];

// Simpan data ke tabel t_jurnal
$sql_header = "INSERT INTO t_jurnal (no_jurnal, tgl_jurnal, catatan) VALUES (?, ?, ?)";
if ($stmt_header = $conn->prepare($sql_header))
    $stmt_header->bind_param("sss", $txtNoJU, $txtTglJurnal, $txtCatatan);
else {
    $error = $mysqli->errno . ' ' . $mysqli->error;
    echo $error;
}


if ($stmt_header->execute()) {
    // Simpan data ke tabel t_jurnal_detail
    $sql_detail = "INSERT INTO t_jurnal_detail (no_jurnal, kode_akun, debet, kredit) VALUES (?,?,?,?)";
    if ($stmt_detail = $conn->prepare($sql_detail)) {
        for ($i = 0; $i < count($ju_coa); $i++) {
            $curr_ju_coa    = $ju_coa[$i];
            $curr_ju_debet  = $ju_debet[$i] * 1;
            $curr_ju_kredit = $ju_kredit[$i] * 1;
            $stmt_detail->bind_param("ssdd", $txtNoJU, $curr_ju_coa, $curr_ju_debet, $curr_ju_kredit);
            $stmt_detail->execute();
        }
    } else {
        $error = $mysqli->errno . ' ' . $mysqli->error;
        echo $error;
    }

    echo "<h3>Jurnal $txtNoJU berhasil disimpan!</h3>";
    echo "<a href='jurnal_input.php'>Input Jurnal Umum lagi</a>";
} else {
    echo "Terjadi kesalahan: " . $stmt_header->error;
}
