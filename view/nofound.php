<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title><?= $data['page_tag']; ?></title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="<?= _THEME_ ?>ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="<?= _THEME_ ?>base/vendor.bundle.base.css">
  <link rel="stylesheet" href="<?= _THEME_ ?>sweetalert2/sweetalert2.min.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="<?= _THEME_ ?>css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="<?= _THEME_ ?>images/MP.png" />
  <script src="<?= _THEME_ ?>sweetalert2/sweetalert2.all.min.js"></script>
</head>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-center py-5 px-4 px-sm-5">
              <div class="brand-logo">
                <img src="<?= _THEME_ ?>images/MP.png" alt="logo">
              </div>
              <h4 class="text-center">Tu link de recuperacion ha expirado</h4>
              <h6 class="font-weight-light text-center">Vuelve a enviar el link para proceder a la recuperación de tu contraseña</h6>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>

</body>

</html>
