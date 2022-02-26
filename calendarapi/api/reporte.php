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

    require_once '../dao/reporteDAO.php';
    $reporteDAO = new reporteDAO();

    $tipoproceso = $data['proceso'];

    $param1 = $data['p1'];
    $param2 = $data['p2'];
    $param3 = $data['p3'];
    $param4 = $data['p4'];
    $param5 = $data['p5'];

    switch ($tipoproceso) {
        case 1:
            $respuestaregisto = $reporteDAO->obtenerReporte();
            $response['success'] = true;
            $response['mensaje'] = 'Consulta Exitosa';
            $response['dataResult'] = $respuestaregisto;
            break;
        case 2:
            $respuestaregisto = $reporteDAO->consultaReporte($param1, $param2, $param3,$param5);
            $response['success'] = true;
            $response['mensaje'] = 'Consulta Exitosa';
            $response['dataResult'] = $respuestaregisto;
            break;
        case 3:
            $respuestaregisto = $reporteDAO->obtenerReporteActividad();
            $response['success'] = true;
            $response['mensaje'] = 'Consulta Exitosa';
            $response['dataResult'] = $respuestaregisto;
            break;
        case 4:
            $respuestaregisto = $reporteDAO->consultaReporteActividad($param1, $param2, $param3, $param4,$param5);
            $response['success'] = true;
            $response['mensaje'] = 'Consulta Exitosa';
            $response['dataResult'] = $respuestaregisto;
            break;
        case 5: 
            $planillas = $reporteDAO->listarPlanillas();
            $personal = $reporteDAO->listarPersonal();
            $programaciones = $reporteDAO->listarProgramaciones();
            $actividades = $reporteDAO->listarActividades();
            $departamento = $reporteDAO->listarDepartamentos();
            $servicio = $reporteDAO->listarServicios();
            $area = $reporteDAO->listarAreas();
            $grupo = $reporteDAO->listarGrupos();
            $puesto = $reporteDAO->listarPuestos();
            $usuario = $reporteDAO->listarUsuarios();
            $response['success'] = true;
            $response['mensaje'] = 'Consulta Exitosa';
            //Current retorna el primer puntero del array
            $response['planillas'] = current($planillas);
            $response['personal'] = current($personal);
            $response['programaciones'] = current($programaciones);
            $response['actividades'] = current($actividades);
            $response['departamento'] = current($departamento);
            $response['servicio'] = current($servicio);
            $response['area'] = current($area);
            $response['grupo'] = current($grupo);
            $response['puesto'] = current($puesto);
            $response['usuario'] = current($usuario);
            break;
        case 6: 
            $respuestaregistro = $reporteDAO->consultaReporteActividadAll($param1, $param5);
            $response['success'] = true;
            $response['mensaje'] = 'Consulta Exitosa';
            $response['registros'] = $respuestaregistro;
            break;
    }
}

echo json_encode($response);
