<?php
	namespace content\controllers;
	use content\libraries\core\autoload;
    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\SMTP;
    use PHPMailer\PHPMailer\Exception;
    use content\libraries\core\builder;
    use content\libraries\core\Conexion;
    use PDO;
    use DateTime;

require ('./assets/phpmailer/Exception.php');
require ('./assets/phpmailer/PHPMailer.php');
require ('./assets/phpmailer/SMTP.php');

class recuperarController extends autoload {
    
    
    public function recuperar(){

        // $logitudPass = 6;
        // $miPassword = substr( md5(microtime()), 1, $logitudPass);
        // $clave = strtoupper($miPassword);
        $correo = trim($_POST['email']);
        $sql= "SELECT * FROM usuarios where correo = '$correo' and estado = 1";
        $desc=Conexion::conect()->prepare($sql);
        $desc->execute();
        $cantidad=$desc->rowCount();
        $usuarios=$desc->fetch(PDO::FETCH_OBJ);
        if ($cantidad == "0") {
            $data = null;
        }else{
            $estado=1;
            //$pass=builder::encriptar($clave);   
            date_default_timezone_set('America/Caracas');
            $fechaActual = new DateTime();
            $fechaA=$fechaActual->format("Y-m-d h:i:s");
            $savePassword = ("INSERT INTO recuperacion (id_usuario, fechaHora, estado) VALUES (?,?,?)");
            $res=Conexion::conect()->prepare($savePassword);
            $res->bindParam(1, $usuarios->id, PDO::PARAM_INT, 50);
            $res->bindParam(2, $fechaA);
            $res->bindParam(3, $estado, PDO::PARAM_INT, 5);
            $res->execute();
            $mail = new PHPMailer(true);
        
            try {
                $id= builder::encriptar($usuarios->id); 
                $mail->SMTPDebug = 0;                      
                $mail->isSMTP();                                           
                $mail->Host       = 'smtp.gmail.com';                    
                $mail->SMTPAuth   = true;                                  
                $mail->Username   = 'marketmp145@gmail.com';                    
                $mail->Password   = 'btivbtnwdtfekzub';                               
                $mail->SMTPSecure = 'ssl';         
                $mail->Port       = 465;   
                $mail->CharSet = 'UTF-8';                              

                $mail->setFrom($mail->Username, 'Market MP');
                $mail->addAddress($correo);     
                $mail->addReplyTo($mail->Username, 'Información');
                $mail->isHTML(true);                                  
                $mail->Subject = 'Recuperación de Acceso - Market MP';
                $mail->Body    = '
                                <center><h1>Recuperar Contraseña</h1></center><br>
                                <center><h3>Ingresa al siguiente link para reestablecer tu contraseña de ingreso: </h3></center><br>
                                <center><a href="'._DIRECTORY_.'recuperar/reestablecer?id='.$id.'">Reestablecer Contraseña</a></center><br>
                                <center><h4>El link estará disponible durante 10 minutos</h4></center>
                                ';
                $mail->send();

            } catch (Exception $e) {
                
                echo $e;
            }
            $data=true;
        } 
        print $data;
        
    }

    public function reestablecer(){
        $id=$_GET["id"];
        $sql= "SELECT id FROM usuarios;";
        $desc=Conexion::conect()->prepare($sql);
        $desc->execute();
        $ID=$desc->fetchAll(PDO::FETCH_ASSOC);
        foreach ($ID as $key => $value) {
            if (password_verify($value['id'], $id)) {
                $usuario= $value['id'];
            }
        }

        $sql= "SELECT * FROM recuperacion WHERE id_usuario = $usuario ORDER BY fechaHora DESC LIMIT 1;";
        $desc=Conexion::conect()->prepare($sql);
        $desc->execute();
        $dateTime=$desc->fetch(PDO::FETCH_OBJ);

        date_default_timezone_set('America/Caracas');
        $fechaActual = new DateTime();
        $fechaA=$fechaActual->format("Y-m-d h:i:s");
        $fechaBd = new DateTime($dateTime->fechaHora);
        $fecha= $fechaBd->modify("+10 minute")->format("Y-m-d h:i:s");
        if ($fechaA > $fecha) {
            $data['page_tag'] = "Link expirado | Market MP";
            $data['page_title'] = "Link expirado";
            parent::getView("nofound", $data);
        }else {
            $data['page_tag'] = "Reestablecer | Market MP";
            $data['page_title'] = "Reestablecer";
            $data['id'] = $usuario;
            parent::getView("recuperar", $data);
        }

    }

    public function savePass(){
        $clave=$_POST["usuario"];
        $pass=builder::encriptar($clave);   
        $updateClave = ("UPDATE usuarios SET clave =? WHERE id =? ");
        $res=Conexion::conect()->prepare($updateClave);
        $res->bindParam(1, $pass, PDO::PARAM_STR, 50);
        $res->bindParam(2, $_POST["id"], PDO::PARAM_INT, 11);
        $res->execute();
        header("location:"._DIRECTORY_);
    }

}
?>