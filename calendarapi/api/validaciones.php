<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Max-Age: 1000");
header("Access-Control-Allow-Headers: X-Requested-With, Content-Type, Origin, Cache-Control, Pragma, Authorization, Accept, Accept-Encoding");
header("Access-Control-Allow-Methods: PUT, POST, GET, OPTIONS, DELETE");
header("Content-Type: application/json; charset=utf-8");
include_once '../util/funciones.php';

$data = json_decode(file_get_contents('php://input'), true);

$response = [];
$response['success'] = false;
$response['mensaje'] = 'Parámetros inválidos';

if (is_array($data)) {

    require_once '../dao/validacionesDAO.php';
    $validacionesDAO = new validacionDAO();

    $tipoproceso = $data['proceso'];
    $param1 = $data['p1'];



    switch ($tipoproceso) {
        case 1:
            $respuestaregisto = $validacionesDAO->Asignarestadodeconformidad($param1,1);
            $response['success'] = true;
            $response['mensaje'] = 'Conformidad registrada correctamente';
            $response['dataResult'] = $respuestaregisto;
            break;
        case 2:
            $respuestaregisto = $validacionesDAO->Asignarestadodeconformidad($param1,2);
            $response['success'] = true;
            $response['mensaje'] = 'Inconformidad registrada correctamente';
            $response['dataResult'] = $respuestaregisto;
            break;
        case 3:
            $respuestaregisto = $validacionesDAO->AsignarestadodeconformidadEmpleado($param1,1);
            $response['success'] = true;
            $response['mensaje'] = 'Trabajo terminado registrado correctamente';
            $response['dataResult'] = $respuestaregisto;
            break;
        case 4:
            $respuestaregisto = $validacionesDAO->AsignarestadodeconformidadEmpleado($param1,2);
            $response['success'] = true;
            $response['mensaje'] = 'Trabajo incompleto registrado correctamente';
            $response['dataResult'] = $respuestaregisto;
            break;
        // case 5:
        //     $respuestaregisto = $validacionesDAO->Verificar($param1);
        //     $response['success'] = true;
        //     $response['mensaje'] = 'Trabajo incompleto registrado correctamente';
        //     $response['dataResult'] = $respuestaregisto;
        //     break;
    }
}

echo json_encode($response);
