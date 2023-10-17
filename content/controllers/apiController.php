<?php
namespace content\controllers;
use content\models\inventarioModel;
use content\models\categoriasModel;
use content\models\balanceModel;
use PDO;


class apiController {

    public function Inventario() {
        $model = new inventarioModel; 
        header("Access-Control-Allow-Origin: *");
        header("Access-Control-Allow-Methods: GET, POST");
        header("Access-Control-Allow-Headers: Content-Type");

        $opcion = $_GET['opcion'];

        $respuesta = $model->listar($opcion,1);

        if ($respuesta) {

            $res = $respuesta;
            
        } else {
            // Invalid credentials
            $res = [
                'success' => false,
                'message' => 'Invalid username or password',
            ];
        }
        // Send the response as JSON
        header('Content-Type: application/json');
        echo json_encode($res);
    }

    public function Categorias() {
        $model = new categoriasModel; 
        header("Access-Control-Allow-Origin: *");
        header("Access-Control-Allow-Methods: GET, POST");
        header("Access-Control-Allow-Headers: Content-Type");

        $respuesta = $model->listar(1);

        if ($respuesta) {

            $res = $respuesta;
            
        } else {
            // Invalid credentials
            $res = [
                'success' => false,
                'message' => 'Invalid username or password',
            ];
        }
        // Send the response as JSON
        header('Content-Type: application/json');
        echo json_encode($res);
    }

    public function BalanceIngresos() {
        $model = new balanceModel; 
        header("Access-Control-Allow-Origin: *");
        header("Access-Control-Allow-Methods: GET, POST");
        header("Access-Control-Allow-Headers: Content-Type");

        $respuesta = $model->listar("d",1);

        if ($respuesta) {

            $res = $respuesta;
            
        } else {
            // Invalid credentials
            $res = "";
        }
        // Send the response as JSON
        header('Content-Type: application/json');
        echo json_encode($res);
    }
    
    public function BalanceEgresos() {
        $model = new balanceModel; 
        header("Access-Control-Allow-Origin: *");
        header("Access-Control-Allow-Methods: GET, POST");
        header("Access-Control-Allow-Headers: Content-Type");

        $respuesta = $model->listarEgresos("d",1);

        if ($respuesta) {

            $res = $respuesta;
            
        } else {
            // Invalid credentials
            $res = "";
        }
        // Send the response as JSON
        header('Content-Type: application/json');
        echo json_encode($res);
    }
    
    public function ventas() {
        $model = new balanceModel; 
        header("Access-Control-Allow-Origin: *");
        header("Access-Control-Allow-Methods: GET, POST");
        header("Access-Control-Allow-Headers: Content-Type");
        $respuesta = $model->Totales("d",1);
       if ($respuesta["total"] == NULL) {
            $respuesta["total"] = "0";
        }
        $respuesta2 = $model->Totales("d",0);
        if ($respuesta2["total"] == NULL) {
            $respuesta2["total"] = "0";
        }
        if ($respuesta) {

            $res [] =[
                "ventas" => $respuesta["total"],
                "gastos" => $respuesta2["total"]
            ];
            
        } else {
            // Invalid credentials
            $res = "";
        }
        // Send the response as JSON
        header('Content-Type: application/json');
        echo json_encode($res);
    }

}


