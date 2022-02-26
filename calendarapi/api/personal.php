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

        require_once '../dao/personalDAO.php';
        $personalDAO = new personalDAO();

        $tipoproceso = $data['proceso'];
        $param1 = $data['p1'];
        $param2 = $data['p2'];
        $param3 = $data['p3'];
        $param4 = $data['p4'];
        $param5 = $data['p5'];
        //INSERT INTO `p_personal`(`idpersona`, `idplaza`, `tipoplaza`, `apellidopaterno`, `apellidomaterno`, `primernombre`, `segundonombre`, `nombrecompleto`, `tipodocumento`, `nrodocumento`, `fechanacimiento`, `idsexo`, `idestadocivil`, `direccion`, `ruc`, `idpuestotrabajo`, `fechaingreso`, `estado`, `idarea`) VALUES (2,31231,32,"Torres","Costa","Manuel","José","Torres Costa Manuel José",1,"das15","1999-08-01 00:00:00",1,1,"direccion","ruc",1,"2000-08-01 00:00:00",1,1)
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
                $respuestaregisto = $personalDAO->obtenerPersonal();
                $response['success'] = true;
                $response['mensaje'] = 'Consulta Exitosa';
                $response['dataResult'] = $respuestaregisto;    
                break;
            case 2:
                $respuestaregisto = $personalDAO->obtenerPersonalId($param1);
                $response['success'] = true;
                $response['mensaje'] = 'Consulta Exitosa';
                $response['dataResult'] = $respuestaregisto;   
                break;

            // case 3:
            //     $respuestaregisto = $personalDAO->obtenerPersonal2($param1);
            //     $response['success'] = true;
            //     $response['mensaje'] = 'Consulta Exitosa';
            //     $response['dataResult'] = $respuestaregisto;   
            //     break;
                
        }
    }

    echo json_encode($response);

