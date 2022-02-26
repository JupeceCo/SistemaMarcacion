<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Max-Age: 1000");
header("Access-Control-Allow-Headers: X-Requested-With, Content-Type, Origin, Cache-Control, Pragma, Authorization, Accept, Accept-Encoding");
header("Access-Control-Allow-Methods: PUT, POST, GET, OPTIONS, DELETE");
header("Content-Type: application/json; charset=utf-8");
$data = json_decode(file_get_contents('php://input'), true);

$response = [];
$response['success'] = false;
$response['mensaje'] = 'Parámetros inválidos';


  if (is_array($data)) {
        require_once '../dao/personalDAO.php';
        $personalDAO = new personalDAO();
 
        $puestotrabajo = $data['puestotrabajo'];

        $response['success'] = false;
        $response['mensaje'] = 'Error en el json';

        $respuestaregisto = $personalDAO->obtenerpt($puestotrabajo);
        $response['success'] = true;
        $response['mensaje'] = 'Consulta Exitosa';
        $response['dataResult'] = $respuestaregisto;   
    
    }
    
echo json_encode($response);
