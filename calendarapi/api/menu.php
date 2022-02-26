<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Max-Age: 1000");
header("Access-Control-Allow-Headers: X-Requested-With, Content-Type, Origin, Cache-Control, Pragma, Authorization, Accept, Accept-Encoding");
header("Access-Control-Allow-Methods: PUT, POST, GET, OPTIONS, DELETE");
header("Content-Type: application/json; charset=utf-8");
//header($_SERVER['SERVER_PROTOCOL'] . ' 500 Internal Server Error', true, 500);

$data = json_decode(file_get_contents('php://input'), true);

$response = [];
$response['success'] = false;
$response['mensaje'] = 'Parámetros inválidos';

if (is_array($data)) {

    require_once '../dao/horarioDAO.php';
    $HorarioDAO = new HorarioDAO();

    $idusuario = $data['idtransaccion'];
    $idmenu = $data['dcode'];  

    $respuestaregisto = $HorarioDAO->Menu($idusuario,$idmenu);
    $response['success'] = true;
    $response['mensaje'] = 'Consulta Exitosa';
    $response['dataResult'] = $respuestaregisto;
}

echo json_encode($response);
