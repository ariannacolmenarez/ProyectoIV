<?php
    namespace content\libraries\core; 
    use content\libraries\core\Conexion;
    use PDO;

    class builder extends Conexion {

    private string $encryptMethod = 'AES-256-CBC';
    private string $key;
    private string $iv;

    public function __construct()
    {
        $mykey = 'ThisIsASecuredKey';
        $myiv = 'ThisIsASecuredBlock';
        $this->key = substr(hash('sha256', $mykey), 0, 32);
        $this->iv = substr(hash('sha256', $myiv), 0, 16);
    }

    public static function encrypt(string $value): string
    {
        return openssl_encrypt(
            $value,
            $this->encryptMethod,
            $this->key,
            0,
            $this->iv
        );
    }

    public static function decrypt(string $base64Value): string
    {
        return openssl_decrypt(
            $base64Value,
            $this->encryptMethod,
            $this->key,
            0,
            $this->iv
        );
    }







        public static  function duplicados($campo,$tabla,$resultado){
            $sql= "SELECT COUNT(*) FROM $tabla where $campo = '$resultado'";
            $desc=parent::conect()->prepare($sql);
            $desc->execute();
            $cantidad=$desc->fetchColumn();

            if ($cantidad > 0) { 
                $sql= "SELECT * FROM $tabla WHERE $campo = '$resultado'";
                $consulta= parent::conect()->prepare($sql);
                $consulta->execute();
                $result=$consulta->fetch(PDO::FETCH_ASSOC);
                
                if ($result["$campo"] = $resultado && $result["estado"]== 0 ) {
                    $consulta="DELETE FROM $tabla WHERE $campo = '$resultado' and estado = 0";
                    parent::conect()->prepare($consulta)->execute(); 
                    return true;
                }else{
                    return false;
                }
                
            }else{
                return true;
            }
            
        }

        public static  function duplicado_persona($resultado,$tipo){
            $sql= "SELECT COUNT(*) FROM persona where nro_doc = '$resultado' and id_tipo_persona='$tipo'";
            $desc=parent::conect()->prepare($sql);
            $desc->execute();
            $cantidad=$desc->fetchColumn();
            
            if ($cantidad > 0) { 
                $sql= "SELECT * FROM persona WHERE nro_doc = '$resultado' and id_tipo_persona='$tipo'";
                $consulta= parent::conect()->prepare($sql);
                $consulta->execute();
                $result=$consulta->fetch(PDO::FETCH_ASSOC);
                if ($result["nro_doc"] = $resultado && $result["estado"]== 0 && $result["id_tipo_persona"]==$tipo ) {
                    $consulta="DELETE FROM persona WHERE nro_doc = '$resultado' and estado = 0 and id_tipo_persona=$tipo";
                    parent::conect()->prepare($consulta)->execute(); 
                    return true;
                }else{
                    return false;
                }
                
            }else{
                return true;
            }
            
        }

    public static function encriptar($cadena)
    {
        $salida = password_hash($cadena, PASSWORD_DEFAULT);
        return $salida;
    }

    // public static function generarKey()
    // {
    //     $configargs = array( 
    //         'config' => 'C:\xampp\php\extras\openssl\openssl.cnf', 
    //         'private_key_bits' => 2048,
    //         'default_md' => 'sha256');
            
    //         $generar=openssl_pkey_new($configargs); // Creación de las dos llaves
            
    //         openssl_pkey_export($generar, $keypriv, NULL, $configargs);// Exporta el contenido de la Ilave privada a la variable $keypriv
            
    //         $keypub=openssl_pkey_get_details($generar); // Obtiene los detalles de la llave para generar la llave pública
            
    //         file_put_contents('privada.key',$keypriv); // Crea el archivo .key de la Ilave privada
    //         file_put_contents('publica.key',$keypub['key']); // Crea el archivo .key de la llave pública

    // }

    // public static function encryct($datos)
    // {
    //     $Keypublica = openssl_pkey_get_public(file_get_contents('C:\xampp\htdocs\joseViveres\publica.key')); // Extrae el contenido del archivo de la llave pública
    //     openssl_public_encrypt($datos, $datos_cifrados, $Keypublica); // Método para cifrar los datos
    //     return $datos_cifrados;
    // }

    // public static function descryct($datos_cifrados)
    // {
        
    //     $Keyprivada = openssl_pkey_get_private(file_get_contents('C:\xampp\htdocs\joseViveres\privada.key')); // Extrae el contenido del archivo de la llave privada
    //     openssl_private_decrypt($datos_cifrados, $datos_descifrados, $Keyprivada); // Método para descrifrar los datos
    //     return $datos_descifrados;    
    // }


    
    }

?>