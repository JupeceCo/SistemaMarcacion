<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Max-Age: 1000");
header("Access-Control-Allow-Headers: X-Requested-With, Content-Type, Origin, Cache-Control, Pragma, Authorization, Accept, Accept-Encoding");
header("Access-Control-Allow-Methods: PUT, POST, GET, OPTIONS, DELETE");
header("Content-Type: application/json; charset=utf-8");

require_once '../dao/fotoDAO.php';
$fotoDAO = new FotoDAO();

$Fotos = $fotoDAO->obtenerFotos();
$rsFotos = [];

sleep(3);

foreach ($Fotos as $fot) {
    $rsFotos[] = [
        '_id' => $fot['id_foto'],
        'fecha' => utf8_encode($fot['fecha']),
        'nombre' => utf8_encode($fot['nombre']),
        'usuario' => utf8_encode($fot['usuario']),
        'imagen' => utf8_encode($fot['imagen'])
    ];
}

echo json_encode($rsFotos);