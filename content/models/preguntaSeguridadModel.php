<?php
namespace content\models;
use content\libraries\core\Conexion;
use PDO;
use content\libraries\core\builder;

class preguntaSeguridadModel extends Conexion{
    private $id_respuesta;
    private $respuesta;
    private $id_usuario;
    private $id_pregunta;

    public function __construct(){
        parent::conect();
    }
    public function getid_respuesta(){
        return $this->id_respuesta;
    }
    public function getrespuesta(){
        return $this->respuesta;
    }
    public function getid_usuario(){
        return $this->id_usuario;
    }
    public function getid_pregunta(){
        return $this->id_pregunta;
    }

    public function setid_respuesta( $id_respuesta){
        $this->id_respuesta=$id_respuesta;
    }
    public function setrespuesta( $respuesta){
        $this->respuesta=$respuesta;
    }
    public function setid_usuario( $id_usuario){
        $this->id_usuario=$id_usuario;
    }
    public function setid_pregunta( $id_pregunta){
        $this->id_pregunta=$id_pregunta;
    }
    public function estado_usuario($id_usuario){
        $id= $id_usuario;
        $estado = 2;
        $consulta="UPDATE usuarios SET 
                    estado=:estado
                    WHERE id=:id;
                
                ";
                $consulta=Conexion::conect()->prepare($consulta);
                $consulta->bindParam(':estado', $estado, PDO::PARAM_STR);
                $consulta->bindParam(':id', $id, PDO::PARAM_INT);
                $consulta->execute();
    }
    
    public function registrar(preguntaSeguridadModel $p){
        try {
            $respuesta=$p->getrespuesta();
            $id_usuario=$p->getid_usuario();
            $id_pregunta=$p->getid_pregunta();
                $consulta="INSERT INTO respuesta(
                    respuesta,
                    id_usuario,
                    id_pregunta)
                VALUES (?,?,?)";
                $consulta=Conexion::conect()->prepare($consulta);
                $consulta->bindParam(1, $respuesta, PDO::PARAM_STR);
                $consulta->bindParam(2, $id_usuario, PDO::PARAM_STR);
                $consulta->bindParam(3, $id_pregunta, PDO::PARAM_STR);
     
                $consulta->execute();
                echo "registro_existoso";
                return true;
           
                
            

        } catch (Exception $e) {

            die($e->getMessage());
        }
    }
    function existe($id_usuario){
       
        $consulta="SELECT COUNT(*) FROM respuesta WHERE id_usuario =:id_usuario";
        $consulta= Conexion::conect()->prepare($consulta);  
        $consulta->bindParam(':id_usuario', $id_usuario, PDO::PARAM_INT);
        $consulta->execute();
        $cantidadRegistros = $consulta->fetchColumn();
        if($cantidadRegistros > 0){
            return false;
        }else{
            return true;
        }
    }
    public function listarPreguntas(){
        try {
            $consulta= Conexion::conect()->prepare("SELECT * FROM pregunta_de_seguridad");
            $consulta->execute();
            return $consulta->fetchALL(PDO::FETCH_OBJ);

        } catch (Exception $e) {
            die($e->getMessage());
        }
    }


}

?>