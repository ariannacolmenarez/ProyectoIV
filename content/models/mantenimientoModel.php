<?php
namespace content\models;
use content\libraries\core\Conexion;
use PDO;

class mantenimientoModel extends Conexion{
	
	public function __construct(){
		parent::conect();
	}
    public function respaldo_automatico(){
        $host = 'localhost';
$usuario = 'root';
$contrasena = '';
$base_de_datos = 'joseviveresbd';

try {
    // Crear una instancia de PDO y establecer la conexión
    $conexion = new PDO("mysql:host=$host;dbname=$base_de_datos", $usuario, $contrasena);
    $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Carpeta donde se guardarán los archivos de respaldo
    $carpeta_respaldos = 'C:/xampp/htdocs/joseviveres/database/respaldo_automatico/';

    // Crear la carpeta si no existe
    if (!is_dir($carpeta_respaldos)) {
        mkdir($carpeta_respaldos);
    }

    // Consulta para obtener la lista de tablas en la base de datos
    $consulta_tablas = "SHOW TABLES";
    $resultado_tablas = $conexion->query($consulta_tablas);

    // Iterar a través de las tablas y guardarlas en archivos separados
    while ($fila = $resultado_tablas->fetch(PDO::FETCH_ASSOC)) {
        $nombre_tabla = $fila['Tables_in_joseviveresbd'];
        $archivo_respaldo = $carpeta_respaldos . $nombre_tabla . '.sql';

        // Consulta para obtener la estructura de la tabla
        $consulta_estructura = "SHOW CREATE TABLE $nombre_tabla";
        $resultado_estructura = $conexion->query($consulta_estructura);
        $fila_estructura = $resultado_estructura->fetch(PDO::FETCH_ASSOC);
        $estructura_tabla = $fila_estructura['Create Table'];

        // Consulta para obtener los datos de la tabla
        $consulta_datos = "SELECT * FROM $nombre_tabla";
        $resultado_datos = $conexion->query($consulta_datos);

        // Crear una huella digital de la estructura y datos
        $huella_digital_nueva = md5($estructura_tabla);
        while ($fila_datos = $resultado_datos->fetch(PDO::FETCH_ASSOC)) {
            $linea_datos = implode(", ", array_map(function($valor) use ($conexion) {
                return "'" . $conexion->quote($valor) . "'";
            }, $fila_datos));
            $huella_digital_nueva .= md5($linea_datos);
        }

        // Comprobar si el archivo ya existe localmente
        if (file_exists($archivo_respaldo)) {
            // Obtener la huella digital anterior
            $huella_digital_anterior = file_get_contents($archivo_respaldo . '.md5');

            // Comprobar si las huellas digitales son idénticas
            if ($huella_digital_anterior === $huella_digital_nueva) {
                continue; // No reemplazar si las huellas digitales son iguales
            }
        }

        // Guardar la estructura y los datos en el archivo de respaldo
        file_put_contents($archivo_respaldo, $estructura_tabla);

        $resultado_datos = $conexion->query($consulta_datos); // Reiniciar el resultado de datos
        while ($fila_datos = $resultado_datos->fetch(PDO::FETCH_ASSOC)) {
            $linea_datos = implode(", ", array_map(function($valor) use ($conexion) {
                return "'" . $conexion->quote($valor) . "'";
            }, $fila_datos));
            file_put_contents($archivo_respaldo, "INSERT INTO $nombre_tabla VALUES ($linea_datos);" . PHP_EOL, FILE_APPEND);
        }

        // Guardar la nueva huella digital
        file_put_contents($archivo_respaldo . '.md5', $huella_digital_nueva);
    }

    // Cerrar la conexión a la base de datos
    $conexion = null;

    echo "Respaldo completo realizado con éxito.";
} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
}
    }

    public function respaldo(){
	 	$dir = "database/";
            $day=date("d");
            $mont=date("m");
            $year=date("Y");
            $hora=date("H-i-s");
            $fecha=$day.'_'.$mont.'_'.$year;
            $error = false;
            $con=mysqli_connect("localhost", "root", "","joseviveresbd");
            $r = $con->query("SELECT NOW() AS f_actual");
            $a = $r->fetch_assoc();
            $fechaA = $a['f_actual'];
            
            $DataBASE=$fecha."_(".$hora."_hrs).sql";
            $error = 0;
            $tables=array();
            $triggers=array();
            $result=mysqli_query($con, 'SET CHARACTER SET utf8');
            $result=mysqli_query($con, 'SHOW TABLES');
            $sql='SET FOREIGN_KEY_CHECKS=0;'."\nSET @usuario_id=1;\n\n";
            $sql.= "SET CHARACTER SET utf8; \n";
            
            if($result){
                while($row=mysqli_fetch_row($result)){
                $tables[] = $row[0];
                }
                foreach($tables as $table){
                    if($table[0]=='v' && $table[1]=="_"){
                        $sql.="\n";
                    }else{
                        $result=mysqli_query($con,'SELECT * FROM '.$table);
                        if($result){
                            $numFields=mysqli_num_fields($result);
                            $sql.='TRUNCATE TABLE '.$table.';';
                            $sql.="\n";
                            for ($i=0; $i < $numFields; $i++){
                                while($row=mysqli_fetch_row($result)){
                                    $sql.='INSERT INTO '.$table.' VALUES(';
                                    for($j=0; $j<$numFields; $j++){
                                        $row[$j]=addslashes($row[$j]);
                                        $row[$j]=str_replace("\n","\\n",$row[$j]);
                                        if (isset($row[$j])){
                                            $sql .= '"'.$row[$j].'"' ;
                                        }
                                        else{
                                            $sql.= '""';
                                        }
                                        if ($j < ($numFields-1)){
                                            $sql .= ',';
                                        }
                                    }
                                    $sql.= ");\n";
                                }
                            }
                            $sql.="\n\n\n";
                        }else{
                            $error=1;
                        }
                    }
                }
                if($error==1){
                    $error = true;
                }else{
                    chmod($dir, 0777);
                    $sql.='SET FOREIGN_KEY_CHECKS=1;';
                    $sql.="\n";
                    $sql.='DELETE FROM bitacora WHERE fecha > "'.$fechaA.'";';
                    $handle=fopen($dir.$DataBASE,'w+');
                    if(fwrite($handle, $sql)){
                        fclose($handle);
                        
                    }else{
                        $error = true;
                    }
                }
            }else{
                $error = true;
            }
            mysqli_free_result($result);
            if (!$error) {
                return 0;
            }
            else{
                $_SESSION["mensaje"] = "Ocurrio un error inesperado al crear la copia de seguridad";
                    $_SESSION["tipo_mensaje"] = "error";
            }

        }

        public function restaurar()
        {
            $sql=$_POST['sql'];
            echo "hola".$sql;
            $restore = $this->restore(_DB_HOST_, _DB_USER_, _DB_PASSWORD_,_DB_WEB_, $sql);
            
        }

        public function restore($server, $username, $password, $dbname, $location){
            //connection
            $conn = new mysqli($server, $username, $password, $dbname); 
        
            //variable use to store queries from our sql file
            $sql = '';
            
            //get our sql file
            $lines = file($location);
        
            //return message
            $output = array('error'=>false);
            
            //loop each line of our sql file
            foreach ($lines as $line){
        
                //skip comments
                if(substr($line, 0, 2) == '--' || $line == ''){
                    continue;
                }
        
                //add each line to our query
                $sql .= $line;
        
                //check if its the end of the line due to semicolon
                if (substr(trim($line), -1, 1) == ';'){
                    //perform our query
                    $query = $conn->query($sql);
                    if(!$query){
                        $_SESSION["mensaje"] = "Ocurrio un error inesperado al restaurar la Base de Datos";
                        $_SESSION["tipo_mensaje"] = "error";
                    }
                    else{
                        $_SESSION["mensaje"] = "¡Base de Datos restaurada con éxito!";
                        $_SESSION["tipo_mensaje"] = "success";
                    }
        
                    //reset our query variable
                    $sql = '';
                    
                }
            }
        
            return 0;
        }
        }



         

	 
?>