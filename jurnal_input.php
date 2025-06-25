<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Input CIF</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>

<body>
    <?php
    include_once("conn.php");
    include_once("navbar.php");


    // Ambil data coa
    $sql_coa = "select kode_akun, nama_akun FROM m_coa";
    $result_coa = $conn->query($sql_coa);
    ?>

    <div class="container">
        <h1>Input Jurnal Umum</h1>
        <p>
        <form method="POST" action="jurnal_save.php">
            <div class="mb-3">
                <label class="form-input">Nomor Jurnal</label>
                <input type="text" class="form-control" name="txtNoJU" id="txtNoJU">
            </div>
            <div class="mb-3">
                <label class="form-input">Tanggal Jurnal</label>
                <input type="date" class="form-control" name="txtTglJurnal" id="txtTglJurnal">
            </div>
            <div class="mb-3">
                <label class="form-input">Catatan</label>
                <input type="text" class="form-control" name="txtCatatan" id="txtCatatan">
            </div>
            <p>
            <div class="card">
                <div class="card-header">
                    Rincian Transaksi
                </div>
                <div class="card-body">
                    <table id="detailTable" class="table table-hover">
                        <thead>
                            <tr>
                                <th>Kode Akun</th>
                                <th>Debet</th>
                                <th>Kredit</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><select class="form-select" name="ju_coa[]" required>
                                        <option value="">-- Pilih Akun --</option>
                                        <?php
                                        if ($result_coa->num_rows > 0) {
                                            mysqli_data_seek($result_coa, 0);
                                            while ($row = $result_coa->fetch_assoc()) {
                                                echo "<option value=\"{$row['kode_akun']}\">{$row['kode_akun']} - {$row['nama_akun']}</option>";
                                            }
                                        }
                                        ?>
                                    </select></td>
                                <td><input type="number" class="form-control" name="ju_debet[]" required></td>
                                <td><input type="number" class="form-control" name="ju_kredit[]" required></td>
                                <td><button type="button" class="btn btn-danger" onclick="hapusBaris(this)">Hapus</button></td>
                            </tr>
                        </tbody>
                    </table>
                    <button type="button" class="btn btn-success" onclick="tambahBaris()">Tambah Rincian</button><br><br>
                </div>

            </div>
            <button type="submit" class="btn btn-primary">Simpan</button>
        </form>
    </div>

    <script>
        function tambahBaris() {
            const table = document.getElementById('detailTable').getElementsByTagName('tbody')[0];
            const newRow = table.insertRow();

            newRow.innerHTML = `
                <td><select class="form-select" name="ju_coa[]" required>
                                        <option value="">-- Pilih Akun --</option>
                                        <?php
                                        if ($result_coa->num_rows > 0) {
                                            mysqli_data_seek($result_coa, 0);
                                            while ($row = $result_coa->fetch_assoc()) {
                                                echo "<option value=\"{$row['kode_akun']}\">{$row['kode_akun']} - {$row['nama_akun']}</option>";
                                            }
                                        }
                                        ?>
                                    </select></td>
                                <td><input type="number" class="form-control" name="ju_debet[]" required></td>
                                <td><input type="number" class="form-control" name="ju_kredit[]" required></td>
                                <td><button type="button" class="btn btn-danger" onclick="hapusBaris(this)">Hapus</button></td>
                `;
        }

        function hapusBaris(button) {
            const row = button.parentNode.parentNode;
            row.parentNode.removeChild(row);
        }
    </script>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>

</html>