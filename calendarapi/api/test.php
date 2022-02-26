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
    $response['mensaje'] = 'Error en la solicitud';

    if (is_array($data)) {

        require_once '../dao/testDAO.php';
        $testDAO = new TestDAO();

        $table = $data['table'];

        $dat = $testDAO->all($table);
        $response['success'] = true;
        $response['data'] =  $dat;
        $response['mensaje'] = "Solicitud exitosa";

    }
    
    echo json_encode($response);