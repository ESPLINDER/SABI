<?php
include("../../Controlador/conexion.php");

$nomEjercicio = $_POST['nomEjercicio'];
$desEjercicio = $_POST['descEjercicio'];
$tipEjercicio = $_POST['tipEjercicio'];
$autEjercicio = 1; // <-- cambia esto si ya tienes una sesión o lo recibes dinámicamente

$sql = "INSERT INTO ejercicio (nomEjercicio, descEjercicio, tipEjercicio)
        VALUES ('$nomEjercicio', '$descEjercicio', '$tipEjercicio')";

if ($conexion->query($sql)) {
    echo json_encode([
        "success" => true,
        "id" => $conexion->insert_id,
        "nombre" => $nomEjercicio
    ]);
} else {
    echo json_encode(["success" => false, "error" => $conexion->error]);
}
?>