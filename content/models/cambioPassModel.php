<?php
namespace content\models;
use content\libraries\core\Conexion;
use PDO;
use content\libraries\core\builder;

class cambioPassModel extends Conexion{
    private $pass2;
    private $id_usuario;

    public function __construct(){
        parent::conect();
    }
    public function getpass2(){
        return $this->pass2;
    }
    public function getid_usuario(){
        return $this->id_usuario;
    }
    

    public function setpass2( $pass2){
        $this->pass2=$pass2;
    }
    public function setid_usuario( $id_usuario){
        $this->id_usuario=$id_usuario;
    }
    
    public function estado_usuario($id_usuario){
        $id= $id_usuario;
        $estado = 1;
        $consulta="UPDATE usuarios SET 
                    estado=:estado
                    WHERE id=:id;
                
                ";
                $consulta=Conexion::conect()->prepare($consulta);
                $consulta->bindParam(':estado', $estado, PDO::PARAM_STR);
                $consulta->bindParam(':id', $id, PDO::PARAM_INT);
                $consulta->execute();
    }
    
    public function cambio(cambioPassModel $p){
        try {
            $contraseña= builder::encriptar($p->getpass2());
            $id_usuario=$p->getid_usuario();
            $estado = 1;
            $consulta="UPDATE usuarios SET
                    clave=:clave,
                    estado=:estado
                    WHERE id=:id;
                ";
                $consulta=Conexion::conect()->prepare($consulta);
                $consulta->bindParam(':estado', $estado, PDO::PARAM_STR);
                $consulta->bindParam(':clave', $contraseña, PDO::PARAM_STR);
                $consulta->bindParam(':id', $id_usuario, PDO::PARAM_INT);
                $consulta->execute();
                echo "cambio_existoso";
                return true;
           
                
            

        } catch (Exception $e) {

            die($e->getMessage());
        }
    }
    function existe($id_usuario, $clave){
       $consulta= Conexion::conect()->prepare("SELECT * FROM usuarios WHERE id=?;");
       $consulta->bindParam(1, $id_usuario, PDO::PARAM_INT);
       $consulta->execute();
       $r=$consulta->fetch(PDO::FETCH_OBJ);
       $claveActual = $r->clave;
       if(password_verify($clave, $claveActual)){
            return true;
        }else{
            return false;
        }



}
}
?>