    <!-- partial -->
    
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row py-0">
                <div class="col-lg-8 col-sm-4 col-6 grid-margin mb-0">
                  <h2 class="font-weight-bold text-dark pt-2 m-0"><?= $data['page_title']; ?></h2>
                </br>
                </div>
                
          </div>
          <form id="userform">
          <div class="card">
            <div class="card-body">
              <p class="card-title text-md-center text-primary text-xl-left">LLene el formulario</p>
              
              <h5 class="mt-3">Contraseña actual*</h5>
                <div class="input-group mt-1">
                  <input type="text" class="form-control d-block w-100" id="passAntiguo" name="passAntiguo">
                </div>  
            
            <h5 class="mt-3">Nueva Contraseña*</h5>
                <div class="input-group mt-1">
                  <input type="text" class="form-control d-block w-100" id="pass1" name="pass1">
                </div>  
            
            <h5 class="mt-3">Repita la contraseña*</h5>
                <div class="input-group mt-1">
                  <input type="text" class="form-control d-block w-100" id="pass2" name="pass2">
                </div>  
            
          
  
          <div class="d-grid gap-2 d-md-block w-100 mt-3">
                  <button id="button" onclick="actualizarPass();" class="btn btn-success w-100" type="button">Guardar</button>
          </div>
  </form>
             
          
          
        </div>
  </div>
        <!-- content-wrapper ends -->    
<script src="<?= _THEME_?>js/scripts/cambioPass.js"></script>
<?php

?>

