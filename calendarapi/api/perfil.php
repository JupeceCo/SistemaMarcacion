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

    require_once '../dao/perfilDAO.php';
    $perfilDAO = new perfilDAO();

    $tipoproceso = $data['proceso'];
    $param1 = $data['p1']; //filtro de busqueda
    $param2 = $data['p2']; //id 
    $param3 = $data['p3']; //descripcion
    $param4 = $data['p4']; //estado
    $param5 = $data['p5'];
    $param6 = $data['p6'];
    $param7 = $data['p7'];

    // 1 = proceso de ListaTurnos
    // 2 = proceso de ListaHoraIngreso
    // 3 = proceso de ListaServicios
    // 4 = proceso de listaProgramadosDiaServicio
    // 5 = proceso de listaProgramadosDia
    // 6 = proceso de listaProgramadosServicio
    // 7 = proceso de listaProgramado
    // 8 = proceso de listaProgramadoHoras
    // administrador
    // 9 = proceso de listaProgramadosGlobal


    switch ($tipoproceso) {
        case 1:
            $respuestaregisto = $perfilDAO->obtenerPerfil();
            $response['success'] = true;
            $response['mensaje'] = 'Consulta Exitosa';
            $response['dataResult'] = $respuestaregisto;
            break;
        case 2:
            $respuestaregisto = $perfilDAO->obtenerPerfilId($param1);
            $response['success'] = true;
            $response['mensaje'] = 'Consulta Exitosa';
            $response['dataResult'] = $respuestaregisto;
            break;
        case 3:
            if($param1 !== ""){
                $ingresado = $perfilDAO->validarRegistradoAnterior("idusuario", $param1);
                $respuestaregisto = $perfilDAO->registrarPerfil($param1, $ingresado[0]["dni"], $param3, $param4,$param5,$param6,$param7);
                $response['success'] = true;
                $response['codigo'] =  $respuestaregisto[0]['codigo'];
                $response['mensaje'] = $respuestaregisto[0]['mensaje'];
            } else {
                $ingresado = $perfilDAO->validarRegistradoAnterior("dni", $param2);
                if(empty($ingresado)){
                    $respuestaregisto = $perfilDAO->registrarPerfil($param1, $param2, $param3, $param4,$param5,$param6,$param7);
                    $response['success'] = true;
                    $response['codigo'] =  $respuestaregisto[0]['codigo'];
                    $response['mensaje'] = $respuestaregisto[0]['mensaje'];
                } else {
                    $response['mensaje'] = "El DNI ya fue registrado y pertenece al usuario " . $ingresado[0]["nombreusuario"];
                }
            }
            break;
    }
}


echo json_encode($response);
