<?php
include "koneksi.php";

$id = $_GET['id'];

// ambil nama file gambar
$get = mysqli_query($conn, "SELECT gambar FROM products WHERE id='$id'");
$data = mysqli_fetch_array($get);
$gambar = $data['gambar'];
$target_gambar = __DIR__ . "/produk_img/" . $gambar;

if ($gambar != "" && file_exists($target_gambar)) {
    unlink($target_gambar);
}
// ------------------------------------

//hapus data dari database
$hapus = mysqli_query($conn, "DELETE FROM products WHERE id='$id'");

if ($hapus) {
    echo "<script>alert('Data Berhasil Dihapus')</script>";
    header("refresh:0, data_produk.php");
} else {
    echo "<script>alert('Data Gagal Dihapus')</script>";
    header("refresh:0, data_produk.php");
}
