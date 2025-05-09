<?php
session_start();

if ($_SESSION['tipo'] != 'entrenador') {
    header("Location: ../accesoDenegado.php");
    exit();
}
$idUsuario = $_SESSION['idUsuario'];
$nomUsuario = $_SESSION['nombre'];

if (isset($_GET['id'])) {
    $idRutina = $_GET['id'];
    include_once("../../Controlador/Conexion.php");

    // Obtener info general de la rutina
    $stmtRutina = $conexion->prepare("SELECT * FROM rutina WHERE idRutina = ?");
    $stmtRutina->bind_param("i", $idRutina);
    $stmtRutina->execute();
    $resultadoRutina = $stmtRutina->get_result();
    $rutina = $resultadoRutina->fetch_assoc();

    // Obtener los ejercicios asociados a esa rutina
    $stmtEjercicios = $conexion->prepare("SELECT * FROM ejercicio_rutina WHERE fkIdRutina = ?");
    $stmtEjercicios->bind_param("i", $idRutina);
    $stmtEjercicios->execute();
    $resultadoEjercicios = $stmtEjercicios->get_result();

    $ejerciciosRutina = [];
    while ($row = $resultadoEjercicios->fetch_assoc()) {
        $ejerciciosRutina[] = $row;
    }
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
                <div class="col-md-2"><img src="Media/logoNuevo" alt="Logo" width="60" height="60" class="logo"></div>
                <div class="col-md-8 text-center"><a class="navbar-brand " href="#">SABI</a></div>
                <div class="col-lg-2 text-center"><?php echo $nomUsuario ?> | Entrenador</div>
            </div>
        </div>
    </nav>

    <div class="menu">
        <a href="PaginaPrincipalEntrenador.php">Inicio</a>
        <a href="rutinasGuardadas.php" style="color: #E2E2B6;">Mis Rutinas</a>
        <a href="clientes.php">Clientes</a>
        <a href="#">Nosotros</a>
    </div>

    <header class="row align-items-center mt-2">
        <div class="col-md-2"></div>
        <div class="encabezado col-md-8 my-auto">
            <h1 class="text-center">Crea tu rutina</h1>
        </div>
        <div class="col-md-1 mx-auto my-1">
            <button id="goRoutineSaved" type="button" class="btn btn-outline-primary"><a href="rutinasGuardadas.php">Rutinas guardadas</a></button>
        </div>
    </header>

    <!-- Contenido -->
    <div class="container text-center mt-3 semana" id="guide" style="display: block;">
        <p>Crea una rutina personalizada o selecciona una de tus rutinas guardadas previamente. <br>Inicia agregando una
            semana.</p>
    </div>

    <!--listar-->
    <div id="configuracionInicial" class="col-sm-3 mx-auto px-5 py-2 mt-3" style="border-radius: 20px; background-color:rgb(243, 241, 241);">
        <h4 class="text-center">Configuración de la rutina</h4>
        <div class="mb-2">
            <label for="numSemanas">¿Cuántas semanas quieres que tenga la rutina?</label>
            <input type="number" id="numSemanas" class="form-control" min="1" required value="1">
        </div>
        <div class="mb-2">
            <label for="numDias">¿Cuántos días por semana?</label>
            <input type="number" id="numDias" class="form-control" min="1" max="7" required value="1">
        </div>
        <div class="mb-2">
            <label for="numEjercicios">¿Cuántos ejercicios por día? Los campos de ejercicios que dejes en blanco no se tomaran en cuenta</label>
            <input type="number" id="numEjercicios" class="form-control" min="1" required value="1">
        </div>
        <div class="row mb-2">
            <button class="btn btn-success col-sm-4 mx-auto" id="btnGenerarRutina">Generar Rutina</button>
        </div>
    </div>

    <div id="rutinaGenerada" class="col-sm-8 mx-auto mt-4" style="display: block;"></div>

    <div id="infoRutina" class="col-sm-4 mx-auto p-3 mt-3" style="display: none;">
        <h5 class="text-center">Información de la rutina</h5>
        <div class="mb-2">
            <label for="nombreRutina">Nombre de la rutina</label>
            <input type="text" id="nombreRutina" class="form-control" required>
        </div>
        <div class="mb-2">
            <label for="descRutina">Descripción</label>
            <textarea id="descRutina" class="form-control" rows="2"></textarea>
        </div>
        <div class="mb-2">
            <label for="intensidad">Nivel de dificultad</label>
            <select id="intensidad" class="form-select">
                <option value="principiante">Principiante</option>
                <option value="intermedio">Intermedio</option>
                <option value="avanzado">Avanzado</option>
            </select>
        </div>
        <div class="row">
            <button id="btnGuardarRutina" class="btn btn-success mt-2 mx-auto">Guardar Rutina</button>
        </div>
    </div>

    <div class="row mt-3">
        <div id="formularioLateral" class="col-sm-3" style="display: none;">
            <div class="mb-2 mx-auto col-md-6 row">
                <h5 class="text-center">Seleccione un Ejercicio</h5>
                <div class="col-md-9">
                    <select id="exerciseSelect" name="Ejercicio" class="form-select">
                        <option value=""></option>
                        <?php
                        include("../../Controlador/conexion.php");
                        $sql = $conexion->query("SELECT * FROM ejercicio order by nomEjercicio ASC");
                        while ($datos = $sql->fetch_object()) { ?>
                            <option value="<?= $datos->nomEjercicio ?>"><?= $datos->nomEjercicio ?></option>
                        <?php }
                        ?>
                    </select>
                    <input type="hidden" id="semanaSeleccionada">
                    <input type="hidden" id="diaSeleccionado">
                </div>
                <div class="col-md-3">
                    <button class="btn btn-success" id="btnCrearEjercicio">Crear Nuevo</button>
                </div>
                <!-- Sección para crear un nuevo ejercicio -->
                <div style="display: block;" id="seccionCrearEjercicio">
                    <form id="crearEjercicio">
                        <h3>Crea tu ejercicio</h3>
                        <div class="mb-2">
                            <label for="nombre" class="form-label">Nombre del ejercicio</label>
                            <input type="text" name="nomEjercicio" maxlength="20">
                        </div>
                        <div class="mb-2">
                            <label for="descripcion" class="form-label">Descripcion del ejercicio</label>
                            <input type="text" name="descEjercicio" maxlength="90">
                        </div>
                        <div class="mb-2">
                            <label>¿El ejercicio requiere máquina?</label><br>
                            <input type="radio" id="maquina-si" name="tipEjercicio" value="Requiere maquina">
                            <label for="maquina-si">Si</label>
                            <input type="radio" id="maquina-no" name="tipEjercicio" value="No requiere maquina">
                            <label for="maquina-no">No</label>
                        </div>
                        <div class="mb-2">
                            <label for="urlVideo" class="form-label">Enlace de video</label>
                            <input type="url" name="urlVideo" id="urlVideo" class="form-control">
                        </div>
                        <button type="submit" class="btn btn-success" name="btnAgregarEjercicio" value="ok">Guardar Ejercicio</button>
                    </form>
                </div>


                <!-- Sección de series -->
                <div id="seccionSeries" style="display: none;">
                    <h5>Estructura del ejercicio</h5>
                    <div id="seriesContainer"></div> <!-- Aquí se irán agregando las series -->

                    <button type="button" class="btn btn-sm btn-secondary" id="btnAgregarSerie">Agregar Serie</button>
                    <button type="button" class="btn btn-success" id="btnGuardarEjercicio">Guardar ejercicio</button>
                </div>
            </div>
        </div>

        <div id="exerciseSaved" class="alert alert-success d-none rounded text-center align-items-center" role="alert">
            <div class=>Ejercicio guardado exitosamente</div>
        </div>
    </div>

    <script>
        const rutinaEnEdicion = <?= isset($rutina['idRutina']) ? $rutina['idRutina'] : 'null' ?>;
    </script>
    <script>
        const rutinaEditando = <?= isset($rutina) ? json_encode($rutina) : 'null' ?>;
        const ejerciciosEditando = <?= isset($ejerciciosRutina) ? json_encode($ejerciciosRutina) : '[]' ?>;
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../Script/Entrenador/CreacionRutina.js"></script>
</body>

</html>
<!-- listar 
<div class="col-sm-2 ps-4">
            <h5>Ejercicios disponibles</h5>
            <input type="text" class="form-control mb-2" id="filtroEjercicios" placeholder="Buscar...">
            <div id="listaEjercicios" class="list-group" style="max-height: 400px; overflow-y: auto;"></div>
        </div>-->