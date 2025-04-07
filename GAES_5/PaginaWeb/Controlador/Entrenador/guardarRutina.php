<?php
session_start();
include_once(__DIR__ . "/../Conexion.php");

$data = json_decode(file_get_contents("php://input"), true);

$nombre = $data["nombre"];
$descripcion = $data["descripcion"];
$intensidad = $data["intensidad"];
$datos = $data["datos"];
$idEntrenador = $_SESSION["idUsuario"];
$fecha = date("Y-m-d");

// Verificamos si es una edición (viene con idRutina)
$idRutina = isset($data["idRutina"]) ? $data["idRutina"] : null;

if ($idRutina) {
    // EDITAR RUTINA EXISTENTE
    $stmt = $conexion->prepare("UPDATE rutina SET descRutina = ?, creaRutina = ?, semRutina = ?, autRutina = ? WHERE idRutina = ?");
    $numSemanas = 0;
    foreach ($datos as $d) {
        if ($d["semana"] > $numSemanas) $numSemanas = $d["semana"];
    }
    $stmt->bind_param("ssiii", $descripcion, $fecha, $numSemanas, $idEntrenador, $idRutina);

    if ($stmt->execute()) {
        // Eliminar los ejercicios anteriores de esta rutina
        $delete = $conexion->prepare("DELETE FROM ejercicio_rutina WHERE fkIdRutina = ?");
        $delete->bind_param("i", $idRutina);
        $delete->execute();

        // Insertar los nuevos ejercicios
        $insert = $conexion->prepare("INSERT INTO ejercicio_rutina (fkIdEjercicio, fkIdRutina, dia, semana, intensidad) VALUES (?, ?, ?, ?, ?)");
        foreach ($datos as $e) {
            $insert->bind_param("iiiis", $e["idEjercicio"], $idRutina, $e["dia"], $e["semana"], $intensidad);
            $insert->execute();
        }

        echo json_encode([
            "success" => true,
            "idRutina" => $idRutina,
            "nombre" => $nombre,
            "descripcion" => $descripcion,
            "intensidad" => $intensidad,
            "fecha" => $fecha,
            "semanas" => $numSemanas
        ]);
    } else {
        echo json_encode(["success" => false, "error" => $stmt->error]);
    }
} else {
    // NUEVA RUTINA
    $numSemanas = 0;
    foreach ($datos as $d) {
        if ($d["semana"] > $numSemanas) $numSemanas = $d["semana"];
    }

    $stmt = $conexion->prepare("INSERT INTO rutina (semRutina, descRutina, creaRutina, autRutina) VALUES (?, ?, ?, ?)");
    $stmt->bind_param("issi", $numSemanas, $descripcion, $fecha, $idEntrenador);

    if ($stmt->execute()) {
        $nuevoId = $stmt->insert_id;

        $insert = $conexion->prepare("INSERT INTO ejercicio_rutina (fkIdEjercicio, fkIdRutina, dia, semana, intensidad) VALUES (?, ?, ?, ?, ?)");
        foreach ($datos as $e) {
            $insert->bind_param("iiiis", $e["idEjercicio"], $nuevoId, $e["dia"], $e["semana"], $intensidad);
            $insert->execute();
        }

        echo json_encode([
            "success" => true,
            "idRutina" => $nuevoId, // o como se llame tu ID generado
            "nombre" => $nombre,
            "descripcion" => $descripcion,
            "intensidad" => $intensidad,
            "fecha" => $fecha,
            "semanas" => $numSemanas
        ]);
    } else {
        echo json_encode(["success" => false, "error" => $stmt->error]);
    }
}
?>