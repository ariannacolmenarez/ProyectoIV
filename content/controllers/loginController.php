<?php
namespace content\controllers;
use content\libraries\core\autoload;
use content\models\usuariosModel;
use content\models\seguridadModel;
use content\libraries\core\builder;

class loginController extends autoload {
    
  
    public function login()
    {   
        if(isset($_SESSION['usuario'])){
            header("location:"._DIRECTORY_."balance");
        }
        if($_POST){
            //require_once('content/models/usuariosModel.php');
            if(isset($_GET['api'])){
                $iniciar = true;
                $p = new usuariosModel;
                $decryptedUser = builder::decrypt($_POST['usuario']);
                $decryptedPass = builder::decrypt($_POST['pass']);
                $p->setnombre($decryptedUser);
                $p->setcontrasena($decryptedPass); 
                $contrasena = $p->getcontrasena();
                $resp = $p->verificarUsuario();
                if($resp){
                    // $password=builder::desencriptar($resp->clave);
                    if(!password_verify($contrasena, $resp->clave)){
                        $mensaje = "La Contraseña es incorrecta";
                        $iniciar = false;
                    }
                
                }
                else{
                    echo "El Usuario es incorrecto";
                }
                if($iniciar){
                    echo '1';
                }
            }
            $iniciar = true;
            $mensaje = "";
            $p = new usuariosModel;
            $p->setnombre($_POST['usuario']);
            $p->setcontrasena($_POST['password']);  
            $contrasena = $p->getcontrasena();
            $resp = $p->verificarUsuario();
            
            if($resp){
                // $password=builder::desencriptar($resp->clave);
                if(!password_verify($contrasena, $resp->clave)){
                    $mensaje = "La Contraseña es incorrecta";
                    $iniciar = false;
                }
            
            }
            else{
                $mensaje = "El Usuario es incorrecto";
                $iniciar = false;
            }
            if($iniciar){
                //require_once('content/models/seguridadModel.php');
                $r = new seguridadModel;
                $permisos = $r->obtenerPermisos($resp->id_rol);
                $_SESSION['id_usuario'] = $resp->id;
                $_SESSION['usuario'] = $resp->nombre;
                $_SESSION['correo'] = $resp->correo;
                $_SESSION['permisos'] = $permisos;
                $_SESSION['rol'] = $resp->id_rol;
                header("location:"._DIRECTORY_."balance");
            }
            else{
                $data['page_tag'] = "Login | Market MP";
                $data['page_title'] = "Bienvenido(a)";
                $data['message'] = $mensaje;
                parent::getView("login", $data);
            }
        }
        else{
            $data['page_tag'] = "Login | Market MP";
            $data['page_title'] = "Bienvenido(a)";
            parent::getView("login", $data);
        }
    }

}
?>