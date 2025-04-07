<?php
// Incluir la conexión a la base de datos
include '/Applications/XAMPP/xamppfiles/htdocs/GAES-5/PaginaWeb/Controlador/conexion.php';

// Verificar si $_SERVER['REQUEST_METHOD'] está definido y si la solicitud es POST
if (isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'POST') {
    // Obtener los datos del formulario
    $fkIdEjercicio = isset($_POST['fkIdEjercicio']) ? intval($_POST['fkIdEjercicio']) : null;
    $fkIdRutina = isset($_POST['fkIdRutina']) ? intval($_POST['fkIdRutina']) : null;
    $dia = isset($_POST['dia']) ? intval($_POST['dia']) : null;
    $semana = isset($_POST['semana']) ? intval($_POST['semana']) : null;
    $peso = isset($_POST['peso']) ? floatval($_POST['peso']) : null;
    $repeticiones = isset($_POST['repeticiones']) ? intval($_POST['repeticiones']) : null;
    $series = isset($_POST['series']) ? intval($_POST['series']) : null;
    $descanso = isset($_POST['descanso']) ? intval($_POST['descanso']) : null;

    // Validar que todos los campos requeridos estén presentes
    if ($fkIdEjercicio && $fkIdRutina && $dia && $semana && $peso && $repeticiones && $series && $descanso) {
        // Preparar la consulta SQL para insertar los datos
        $sql = "INSERT INTO ejercicios_realizados (fkIdEjercicio, fkIdRutina, dia, semana, peso, repeticiones, series, descanso)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        // Preparar la declaración
        $stmt = $conn->prepare($sql);

        // Verificar si la declaración fue preparada correctamente
        if ($stmt) {
            // Vincular los parámetros
            $stmt->bind_param("iiiiiiii", $fkIdEjercicio, $fkIdRutina, $dia, $semana, $peso, $repeticiones, $series, $descanso);

            // Ejecutar la declaración
            if ($stmt->execute()) {
                // Redirigir de vuelta al index con un mensaje de éxito
                header("Location: /Applications/XAMPP/xamppfiles/htdocs/GAES-5/PaginaWeb/Vista/Rutina.php?success=1");
                exit();
            } else {
                // Mostrar error en caso de fallo al ejecutar la consulta
                echo "Error al guardar los datos: " . $stmt->error;
            }

            // Cerrar la declaración
            $stmt->close();
        } else {
            // Mostrar error en caso de fallo al preparar la consulta
            echo "Error al preparar la consulta: " . $conn->error;
        }
    } else {
        // Mostrar mensaje de error si faltan datos
        echo "Faltan datos requeridos para guardar el ejercicio.";
    }

    // Cerrar la conexión
    $conn->close();
} else {
    // Mostrar mensaje si se accede al archivo sin enviar datos
    echo "Acceso no permitido.";
}
?>
