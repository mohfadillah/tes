<?php
session_start();
include 'config/config.php';
// Jika session tidak ada, tolong redirect ke login
if (!isset($_SESSION['nama'])) {
    header("location:index.php?error=access-failed");
}

$queryPertanyaan = mysqli_query($koneksi, "SELECT jurusan.nama_jurusan, pertanyaan_wawancara. * FROM pertanyaan_wawancara LEFT JOIN jurusan ON jurusan.id = pertanyaan_wawancara.id_jurusan ORDER BY pertanyaan_wawancara.id DESC");

// delete query 
if (isset($_GET['delete'])) {
    $id = $_GET['delete'];

    // $delete = mysqli_query($koneksi, "UPDATE pertanyaan_wawancara SET deleted = 1 WHERE id = '$id'");

    $delete = mysqli_query($koneksi, "DELETE FROM pertanyaan_wawancara WHERE id='$id'");
    header('location:pertanyaan_wawancara.php?notif=delete-success');
}



// query updates
if (isset($_POST['edit'])) { 
    $id = $_POST['id'];

    $queryEdit = mysqli_query($koneksi, "UPDATE * FROM pertanyaan WHERE id='$id'");
    $dataEdit = mysqli_fetch_assoc($queryEdit);
    // ubah peserta kolom status dimana id = nilai post id
    // $ubahStatus = mysqli_query($koneksi, "UPDATE pertanyaan_waawancara SET status='$status' WHERE id='$id'");
    header("location:pertanyaan_wawancara.php?ubah-status-berhasil");
}
?>

<!DOCTYPE html>
<html lang="en">

<head>

    <?php include 'inc/head.php'; ?>

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <?php
        include 'inc/sidebar.php';
        ?>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <?php
                include 'inc/navbar.php';
                ?>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->

                    <h1 class="h3 mb-4 text-gray-800">Pertanyaan Wawancara</h1>
                    <div align="right">
                        <a href="tambah-pertanyaan.php" class="btn btn-primary mb-3">Tambah Pertanyaan</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-bordered" id="datatables">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>Jurusan</th>
                                    <th>Nama Pertanyaan</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $no = 1;
                                while ($dataPertanyaan = mysqli_fetch_assoc($queryPertanyaan)) { ?>
                                    <tr>
                                        <td><?php echo $no++ ?></td>
                                        <td><?php echo $dataPertanyaan['nama_jurusan'] ?></td>
                                        <td><?php echo $dataPertanyaan['nama_pertanyaan'] ?></td>


                                        <td>
                                            <a href="tambah-pertanyaan.php?edit=<?php echo $dataPertanyaan['id'] ?>" class="btn btn-primary btn-sm">Edit</a>
                                            <a onclick=" return confirm('Apakah anda yakin akan menghapus data ini?')" href="pertanyaan_wawancara.php?delete=<?php echo $dataPertanyaan['id'] ?>" class="btn btn-danger btn-sm">Hapus</a>
                                        </td>

                                    </tr>
                                    <?php include 'modal-ubah-status.php'; ?>
                                <?php } ?>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <?php include 'inc/footer.php'; ?>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <?php include 'inc/js.php'; ?>
</body>

</html>