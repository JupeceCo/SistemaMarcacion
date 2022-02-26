<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Max-Age: 1000");
header("Access-Control-Allow-Headers: X-Requested-With, Content-Type, Origin, Cache-Control, Pragma, Authorization, Accept, Accept-Encoding");
header("Access-Control-Allow-Methods: PUT, POST, GET, OPTIONS, DELETE");
header("Content-Type: application/json; charset=utf-8");

require_once '../dao/noticiaDAO.php';
$noticiaDAO = new NoticiaDAO();

$Noticias = $noticiaDAO->obtenerNoticias();
$rsNoticias = [];

sleep(3);

foreach ($Noticias as $not) {
    $rsNoticias[] = [
        'id_noticia' => $not['id_noticia'],
        'titulo' => utf8_encode($not['titulo']),
        'imagen' => utf8_encode($not['imagen'])
    ];
}

echo json_encode($rsNoticias);