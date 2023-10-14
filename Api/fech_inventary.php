<?php
namespace content\models;
use content\libraries\core\Conexion;
use PDO;
require_once ("../content/models/inventarioModel.php");
require_once ("../content/libraries/core/Conexion.php");

echo"api";
        $model = new inventarioModel; 
        header("Access-Control-Allow-Origin: *");
        header("Access-Control-Allow-Methods: GET, POST");
        header("Access-Control-Allow-Headers: Content-Type");

        $respuesta = $model->listar("");

        if ($respuesta) {
            var_dump($respuesta);

            // Valid credentials
            // $response = [
            //     'success' => true,
            //     'message' => 'Login successful',
            //     'nombre' => $respuesta['nom'],
            //     'res$respuesta_name' => $respuesta['full_name'],
            //       'res$respuesta_email' => $respuesta['res$respuesta_email'],
            //       'res$respuesta_grade' => $respuesta['res$respuesta_grade'],
            //   'res$respuesta_school' => $respuesta['school'],
            //     'id' => $respuesta['id'],
            // ];
        } else {
            // Invalid credentials
            $response = [
                'success' => false,
                'message' => 'Invalid username or password',
            ];
        }
        
        // Send the response as JSON
        header('Content-Type: application/json');
        echo json_encode($respuesta);





