<?php
include("../conexion.php");


$sql = "SELECT idEjercicio, nomEjercicio FROM ejercicio ORDER BY nomEjercicio ASC";
$result = $conexion->query($sql);

$ejercicios = [];

while ($row = $result->fetch_assoc()) {
    $ejercicios[] = $row;
}

header('Content-Type: application/json');
echo json_encode($ejercicios);
?>