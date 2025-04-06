<?php
include("../../Controlador/conexion.php");

$nomEjercicio = $_POST['nomEjercicio'];
$descEjercicio = $_POST['descEjercicio'];
$tipEjercicio = $_POST['tipEjercicio'];
$urlVideo = isset($_POST['urlVideo']) && $_POST['urlVideo'] !== '' ? $_POST['urlVideo'] : NULL;
$autEjercicio = 1; // <-- cambia esto si ya tienes una sesión o lo recibes dinámicamente

$sql = "INSERT INTO ejercicio (nomEjercicio, descEjercicio, tipEjercicio, autEjercicio, urlVideo)
        VALUES ('$nomEjercicio', '$descEjercicio', '$tipEjercicio', '$autEjercicio', '$urlVideo')";

if ($conexion->query($sql)) {
    echo json_encode([
        "success" => true,
        "id" => $conexion->insert_id,
        "nombre" => $nomEjercicio
    ]);
} else {
    echo json_encode(["success" => false, "error" => $conexion->error]);
}
