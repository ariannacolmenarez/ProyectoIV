<?php
namespace content\controllers;
use content\libraries\core\Conexion;
use PDO;
 class pruebaController{
     
    function prueba(){
        $configargs = array( 
            'config' => 'C:\xampp\php\extras\openssl\openssl.cnf', 
            'private_key_bits' => 2048,
            'default_md' => 'sha256');
            
            $generar=openssl_pkey_new($configargs); // Creación de las dos llaves
            
            openssl_pkey_export($generar, $keypriv, NULL, $configargs);// Exporta el contenido de la Ilave privada a la variable $keypriv
            
            $keypub=openssl_pkey_get_details($generar); // Obtiene los detalles de la llave para generar la llave pública
            
            file_put_contents('privada.key',$keypriv); // Crea el archivo .key de la Ilave privada
            file_put_contents('publica.key',$keypub['key']); // Crea el archivo .key de la llave pública

        $datos="hola maria como estas";
        echo $datos;

        $Keypublica = openssl_pkey_get_public(file_get_contents('C:\xampp\htdocs\joseViveres\publica.key')); // Extrae el contenido del archivo de la llave pública
        openssl_public_encrypt($datos, $datos_cifrados, $Keypublica); // Método para cifrar los datos

        $clave= $datos_cifrados;
        $id= 22;
          
        $consulta="UPDATE usuarios SET 
            clave=:clave
            WHERE id=:id;
        ";
        $consulta=Conexion::conect()->prepare($consulta);
        $consulta->bindParam(':clave', $clave, PDO::PARAM_STR);
        $consulta->bindParam(':id', $id, PDO::PARAM_INT);
        $consulta->execute();
        echo $clave;
        $consulta= Conexion::conect()->prepare("SELECT * FROM usuarios WHERE id=?;");
        $consulta->bindParam(1, $id, PDO::PARAM_INT);
        $consulta->execute();
        $r=$consulta->fetch(PDO::FETCH_OBJ);

        $clave1=$r->clave;

        $Keyprivada = openssl_pkey_get_private(file_get_contents('C:\xampp\htdocs\joseViveres\privada.key')); // Extrae el contenido del archivo de la llave privada
        Openssl_private_decrypt($clave1, $datos_descifrados, $Keyprivada); // Método para descrifrar los datos
        echo $datos_descifrados;


    } 
        

    
 }

 

?>