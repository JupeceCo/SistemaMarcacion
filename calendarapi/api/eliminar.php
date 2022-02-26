<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Max-Age: 1000");
header("Access-Control-Allow-Headers: X-Requested-With, Content-Type, Origin, Cache-Control, Pragma, Authorization, Accept, Accept-Encoding");
header("Access-Control-Allow-Methods: PUT, POST, GET, OPTIONS, DELETE");
header("Content-Type: application/json; charset=utf-8");
//header($_SERVER['SERVER_PROTOCOL'] . ' 500 Internal Server Error', true, 500);


include_once '../util/funciones.php';

$data = json_decode(file_get_contents('php://input'), true);

$response = [];
$response['success'] = false;
$response['mensaje'] = 'Parámetros inválidos';

if (is_array($data)) {

    require_once '../dao/eliminarDAO.php';
    $eliminarDAO = new eliminarDAO();

    $tipoproceso = $data['proceso'];
    $nro = $data['p1']; //persona programada
    $p2 = $data['p2'];
    $p3 = $data['p3'];
    $p4 = $data['p4'];
    $p5 = $data['p5'];


       switch ($tipoproceso) {
        case 1:
            $respuestaregisto = $eliminarDAO->eliminarActividad($nro);
            $response['success'] = true;
            $response['mensaje'] = "Actividad Eliminada";
            break;
        case 2:
            $respuestaregisto = $eliminarDAO->eliminarProgramacion($nro);
            $response['success'] = true;
            $response['mensaje'] = "Programacion Eliminada";
            break;

    }



}

echo json_encode($response);
