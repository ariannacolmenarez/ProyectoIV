<?php
    namespace content\libraries\core; 

class EncryptionAsimetrico{
    
    

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
    
    // public function enviarKeyPub(){
    //     $publicKey = file_get_contents('https://joseviveresmarket.000webhostapp.com/publica.pem');
        
    //     $response = json_encode($publicKey);
    //     header('Content-Type: application/json');
    //     echo $response;
    // }

    // public function encrypt($encrypted,$argv)
    // {
    //     $key = file_get_contents('public.pem');
    //     openssl_public_encrypt($argv[1], $encrypted, $key);
    //     echo base64_encode($encrypted);
    // }

    public function decrypt($base64EncodedText)
    {
        $privateKey = openssl_pkey_get_private(file_get_contents('https://joseviveresmarket.000webhostapp.com/privada.pem'));
        
        $decodedText = base64_decode($base64EncodedText);
        openssl_private_decrypt($decodedText, $decryptedData, $privateKey);
        //return $decryptedData;
        if($decryptedData){
           echo "paola";
        }else{
            echo "fallo";
        }
        
    }
}