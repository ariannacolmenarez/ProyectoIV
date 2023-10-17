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
              <p class="card-title text-md-center text-primary text-xl-left">Pregunta 1</p>
              <h5 class="mt-3">Seleccione*</h5>
                <div class="input-group mt-1">
                  <select class="form-select d-block w-100  rounded-0" name="pregunta1" id="pregunta1">
                  <option selected>Preguntas</option>
                  
                  </select>
                </div>
              <h5 class="mt-3">Respuesta 1*</h5>
                <div class="input-group mt-1">
                  <input type="text" class="form-control d-block w-100" id="respuesta1" name="respuesta1">
                </div>  
            </div>
          </div>
  </br>
          <div class="card">
            <div class="card-body">
              <p class="card-title text-md-center text-primary text-xl-left">Pregunta 2</p>
              <h5 class="mt-3">Seleccione*</h5>
                <div class="input-group mt-1">
                  <select class="form-select d-block w-100  rounded-0" name="pregunta2" id="pregunta2">
                  <option selected>Preguntas</option>
                  
                  </select>
                </div>
              <h5 class="mt-3">Respuesta 2*</h5>
                <div class="input-group mt-1">
                  <input type="text" class="form-control d-block w-100" id="respuesta2" name="respuesta2">
                </div>  
            </div>
          </div>
          </br>
          <div class="card">
            <div class="card-body">
              <p class="card-title text-md-center text-primary text-xl-left">Pregunta 3</p>
              <h5 class="mt-3">Seleccione*</h5>
                <div class="input-group mt-1">
                  <select class="form-select d-block w-100  rounded-0" name="pregunta3" id="pregunta3">
                  <option selected>Preguntas</option>
                  
                  </select>
                </div>
              <h5 class="mt-3">Respuesta 3*</h5>
                <div class="input-group mt-1">
                  <input type="text" class="form-control d-block w-100" id="respuesta3" name="respuesta3">
                </div>  
            </div>
          </div>
          <div class="d-grid gap-2 d-md-block w-100 mt-3">
                  <button id="button" onclick="registarRespuestas();" class="btn btn-success w-100" type="button">Guardar</button>
          </div>
  </form>
             
          
          
        </div>
  </div>
        <!-- content-wrapper ends -->    
<script src="<?= _THEME_?>js/scripts/preguntaSeguridad.js"></script>
<?php

?>

