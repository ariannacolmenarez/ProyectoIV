<?php
namespace content\controllers;
use content\models\cambioPassModel;
use content\libraries\core\autoload;


class cambioPassController extends autoload {
  private $model;
    function __construct()
    {
        parent::__construct();
        $this->model = new cambioPassModel;

    }

    function cambioPass(){
        
        $data['page_tag'] = "Seguridad | Market MP";
        $data['page_title'] = "Cambio de contraseña";
        parent::getView("cambioPass", $data);
    }
  
    public function cambio(){
      
      if (!empty( $_POST['passAntiguo'] && $_POST['pass1'] && $_POST['pass2'])) {
        
          $passAntiguo = $_POST['passAntiguo'];
          $pass2 = $_POST['pass2'];
          $id_usuario= $_SESSION['id_usuario'];

          $p=new cambioPassModel();
          if($this->model->existe($id_usuario, $passAntiguo)){
            $p->setpass2($pass2);
            $p->setid_usuario($id_usuario);

            $resp=$this->model->cambio($p);
            $resp=$this->model->estado_usuario($id_usuario);
            $fecha=date('Y-m-d');
                $accion='Se modificó la contraseña';
                $modulo='Seguridad';
                $this->bitacora->insertar(
                    $fecha,
                    $accion,
                    $modulo,
                    $id_usuario);
            echo json_encode($resp);
          }else{
            echo "error_contrasena_actual";
          }
          
          
  }else{
    return false;
  }

}
}

?>