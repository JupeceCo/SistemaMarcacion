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
 
        $idplaza = $data['id'];
        $tipoplaza = $data['tp'];
        $apellidopaterno = $data['ap'];
        $apellidomaterno = $data['am'];
        $primernombre = $data['p1'];
        $segundonombre = $data['p2'];
        $nombrecompleto = $apellidopaterno." ".$apellidomaterno." ".$primernombre." ".$segundonombre;
        $tipodocumento = $data['td'];
        $nrodocumento = $data['nd'];
        $fechanacimiento = $data['nf'];
        $idsexo = $data['sex'];
        $idestadocivil = $data['ec'];
        $direccion = $data['dd'];
        $ruc = $data['ur'];

        $response['success'] = false;
        $response['mensaje'] = 'Error en el json';

        $respuestaregisto = $personalDAO->registrarPersonal($idplaza,$tipoplaza, $apellidopaterno, $apellidomaterno, $primernombre, $segundonombre, $nombrecompleto, $tipodocumento, $nrodocumento, $fechanacimiento, $idsexo, $idestadocivil, $direccion, $ruc);
    
            if ($respuestaregisto != 0 ) {               
                $response['success'] = true;
                $response['codigo'] =  $respuestaregisto[0]['codigo'];
                $response['mensaje'] = $respuestaregisto[0]['mensaje'];
            } else {
                $response['mensaje'] = 'Error en el json';
            }
    
    }
    



echo json_encode($response);
