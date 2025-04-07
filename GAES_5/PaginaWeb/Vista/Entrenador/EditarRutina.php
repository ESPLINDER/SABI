<?php
session_start();
include_once("../../Controlador/Conexion.php");
$idRutina = isset($_GET['id']) ? intval($_GET['id']) : null;

if (!$idRutina) {
  echo "<div class='alert alert-danger'>ID de rutina no proporcionado.</div>";
  exit;
}

// Obtener info de la rutina
$stmt = $conexion->prepare("SELECT * FROM rutina WHERE idRutina = ?");
$stmt->bind_param("i", $idRutina);
$stmt->execute();
$result = $stmt->get_result();
$rutina = $result->fetch_assoc();

// Obtener ejercicios
$ejercicios = [];
$query = "SELECT er.*, e.nomEjercicio FROM ejercicio_rutina er
          JOIN ejercicio e ON er.fkIdEjercicio = e.idEjercicio
          WHERE fkIdRutina = ?
          ORDER BY semana, dia";
$stmt = $conexion->prepare($query);
$stmt->bind_param("i", $idRutina);
$stmt->execute();
$res = $stmt->get_result();
while ($row = $res->fetch_assoc()) {
  $ejercicios[] = $row;
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tu rutina</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
  <link rel="stylesheet" href="../Stiles/CrearRutina.css">
</head>

<body class="cuerpo">
  <nav class="navbar navbar-custom">
    <div class="container-fluid d-flex flex-column align-items-center">
      <div class="d-flex align-items-center w-100 justify-content-between row">
        <div class="col-md-2"><img src="Media/Logo.enc" alt="Logo" width="60" height="60" class="logo"></div>
        <div class="col-md-8 text-center"><a class="navbar-brand " href="#">SABI</a></div>
        <div class="col-lg-2 text-center">William | Entrenador</div>
      </div>
    </div>
  </nav>

  <div class="menu">
    <a href="#">Inicio</a>
    <a href="rutinasGuardadas.html" style="color: #E2E2B6;">Mis Rutinas</a>
    <a href="clientes.html">Clientes</a>
    <a href="#">Nosotros</a>
  </div>

  <div class="container mt-4">
    <h2><?= htmlspecialchars($rutina['descRutina']) ?></h2>
    <p><strong>Semanas:</strong> <?= htmlspecialchars($rutina['semRutina']) ?></p>
  </div>

  <div class="container">
    <?php
    $semanaActual = 0;
    foreach ($ejercicios as $ej) {
      if ($ej['semana'] != $semanaActual) {
        if ($semanaActual > 0) echo "</div>";
        $semanaActual = $ej['semana'];
        echo "<div class='mt-4'><h4>Semana $semanaActual</h4>";
      }
      echo "<div class='card mb-2'>
              <div class='card-body d-flex justify-content-between'>
                  <div>
                      <strong>Día {$ej['dia']}:</strong> {$ej['nomEjercicio']}
                  </div>
                  <button class='btn btn-danger btn-sm eliminar-ejercicio' data-id='{$ej['idEje_Rut']}'>
                      <i class='bi bi-trash'></i> Eliminar
                  </button>
              </div>
            </div>";
    }
    if ($semanaActual > 0) echo "</div>";
    ?>
  </div>

  <script>
    document.addEventListener("DOMContentLoaded", () => {
      document.querySelectorAll(".eliminar-ejercicio").forEach(btn => {
        btn.addEventListener("click", () => {
          const id = btn.dataset.id;
          if (confirm("¿Estás seguro de eliminar este ejercicio de la rutina?")) {
            fetch("../../Controlador/Entrenador/eliminarEjercicioRutina.php", {
                method: "POST",
                headers: {
                  "Content-Type": "application/x-www-form-urlencoded"
                },
                body: "id=" + encodeURIComponent(id)
              })
              .then(res => res.json())
              .then(data => {
                if (data.success) {
                  // Eliminar la fila visualmente
                  btn.closest(".card").remove();
                } else {
                  alert("Error al eliminar: " + data.error);
                }
              });
          }
        });
      });
    });
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="../Script/EditarRutina.js"></script>
</body>

</html>