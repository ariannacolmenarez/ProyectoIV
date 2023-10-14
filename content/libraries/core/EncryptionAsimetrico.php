<?php
    namespace content\libraries\core; 

class Encryption{
    
    

    public function __construct()
    {
        $this->generarKey();
    }
    
    public function generarKey(){
         $config = array(
       "digest_alg" => "sha512",
       "private_key_bits" => 4096,
       "private_key_type" => OPENSSL_KEYTYPE_RSA,
        );

   // Crear la clave privada
   $res = openssl_pkey_new($config);

   // Obtener la clave privada
   openssl_pkey_export($res, $privateKey);

   // Obtener la clave pública
   $publicKey = openssl_pkey_get_details($res);
   $publicKey = $publicKey["key"];
   
   //guardar
   file_put_contents('privada.pem',$privateKey); // Crea el archivo .pem de la Ilave privada
    file_put_contents('publica.pem',$publicKey); // Crea el archivo .pem de la llave pública

   // Imprimir la clave privada y pública
//   echo "Private Key: $privateKey";
//   echo "Public Key: $publicKey";
   
   
    }
    
    public function enviarKeyPub(){
        $publicKey = file_get_contents('https://joseviveresmarket.000webhostapp.com/publica.pem');
        
        $response = json_encode($publicKey);
        header('Content-Type: application/json');
        echo $response;
    }

    // public function encrypt($encrypted,$argv)
    // {
    //     $key = file_get_contents('public.pem');
    //     openssl_public_encrypt($argv[1], $encrypted, $key);
    //     echo base64_encode($encrypted);
    // }

    // public function decrypt($decrypted,$argv)
    // {
    //     $key = file_get_contents('private.pem');
    //     openssl_private_decrypt(base64_decode($argv[1]), $decrypted, $key);
    //     echo $decrypted;
    // }
}