<?php
namespace content\controllers;
use content\models\preguntaSeguridadModel;
use content\libraries\core\autoload;


class preguntaSeguridadController extends autoload {
  private $model;
    function __construct()
    {
        parent::__construct();
        $this->model = new preguntaSeguridadModel;

    }

    function preguntaSeguridad(){
        
        $data['page_tag'] = "Seguridad | Market MP";
        $data['page_title'] = "Preguntas de seguridad";
        parent::getView("preguntaSeguridad", $data);
    }
    public function  listarPreguntas(){

      $respuesta = $this->model->listarPreguntas();

      foreach ($respuesta as $r){
        echo'  
        <option class="p-5" value="'.$r->id_pregunta.'">'.$r->pregunta.'</option>';
      };
    }
    public function respuesta(){
      if (!empty( $_POST['respuesta1'] && $_POST['respuesta2'] && $_POST['respuesta3'] 
      && $_POST['pregunta1'] && $_POST['pregunta2'] && $_POST['pregunta3'])) {
          if (preg_match("|^[a-zA-Z0-9]+(\s*[a-zA-Z0-9]*)*[a-zA-Z0-9]+$|", $_POST['respuesta1'] ) &&
          preg_match("|^[a-zA-Z0-9]+(\s*[a-zA-Z0-9]*)*[a-zA-Z0-9]+$|", $_POST['respuesta2'] ) &&
          preg_match("|^[a-zA-Z0-9]+(\s*[a-zA-Z0-9]*)*[a-zA-Z0-9]+$|", $_POST['respuesta3'] )) {
          $pregunta1 = $_POST['pregunta1'];
          $pregunta2 = $_POST['pregunta2'];
          $pregunta3 = $_POST['pregunta3'];
          $respuesta1 = $_POST['respuesta1'];
          $respuesta2 = $_POST['respuesta2'];
          $respuesta3 = $_POST['respuesta3'];
          $id_usuario= $_SESSION['id_usuario'];
          $p=new preguntaSeguridadModel();
          if($this->model->existe($id_usuario)){
          
          $p->setrespuesta($respuesta1);
          $p->setid_usuario($id_usuario);
          $p->setid_pregunta($pregunta1);
          $resp=$this->model->registrar($p);
          $p->setrespuesta($respuesta2);
          $p->setid_usuario($id_usuario);
          $p->setid_pregunta($pregunta2);
          $resp=$this->model->registrar($p);
          $p->setrespuesta($respuesta3);
          $p->setid_usuario($id_usuario);
          $p->setid_pregunta($pregunta3);
          $resp=$this->model->registrar($p);
          $resp=$this->model->estado_usuario($id_usuario);
          $fecha=date('Y-m-d');
              $accion='Se registro una nueva respuesta de seguridad ';
              $modulo='Seguridad';
              $this->bitacora->insertar(
                  $fecha,
                  $accion,
                  $modulo,
                  $id_usuario);
          echo json_encode($resp);
          }else{
            echo "error_respuesta_existe";
            
          }

          }
  }
  
  }


}

?>