<?php
    header("Access-Control-Allow-Origin: *");
    header("Access-Control-Allow-Credentials: true");
    header("Access-Control-Max-Age: 1000");
    header("Access-Control-Allow-Headers: X-Requested-With, Content-Type, Origin, Cache-Control, Pragma, Authorization, Accept, Accept-Encoding");
    header("Access-Control-Allow-Methods: PUT, POST, GET, OPTIONS, DELETE");
    header("Content-Type: application/json; charset=utf-8");
    // header('Access-Control-Allow-Origin: *');
    //header('Access-Control-Allow-Origin', 'http://localhost/calendar/');
    //aquí agregamos solo los metodos que necesitemos
    // header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE');
    //include_once '../util/funciones.php';
    //Leer los datos recibidos del JS
    $data = json_decode(file_get_contents('php://input'), true);
    $response = [];
    $response['success'] = false;
    $response['mensaje'] = 'Parámetros inválidos';
    //$response['ubicac'] = gethostname();

    if (is_array($data)) {
        require_once '../dao/seguridaDAO.php';
        $seguridaDAO = new seguridaDAO();
        //$response['ip'] = $seguridaDAO->get_client_ip();
        //Devuelve un string con el nombre de host en caso de éxito, false en caso contrario.
        //$response['ubicac'] = gethostname();
        $email = $data['email'];
        $password = $data['password'];
        $Usuario = $seguridaDAO->buscarUsuarioPorEmail($email);
        if ($Usuario) {
            if ($Usuario[0]['clave'] === $password) {
                //$tokenSesion = generateRandomString(40);
                //$seguridaDAO->registrarSESSION($Usuario[0]['idusuario'], $response['ip'], $response['ubicac']);
                $response['success'] = true;
                $response['idtransaccion'] = $Usuario[0]['idusuario'];
                $response['nombres'] = $Usuario[0]['nombreusuario'];
                $response['avatar'] =  $Usuario[0]['avatar'];
                $response['profile'] =  $Usuario[0]['idperfil'];
                //$response['tokenSesion'] = $tokenSesion;
                $response['mensaje'] = 'Bienvenid@ de nuevo.';
            } else {
                $response['mensaje'] = 'La contraseña ingresada no es correcta.';
            }
        } else {
            $response['mensaje'] = 'El DNI ingresado no se encuentra registrado o la cuenta ha sido deshabilitada.';
        }
    }
    echo json_encode($response);