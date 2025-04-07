<?php
session_start();

if ($_SESSION['tipo'] != 'entrenador') {
    header("Location: ../accesoDenegado.php");
    exit();
}
$nombreEntrenador = $_SESSION['nombre'];
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

    <header class="row align-items-center mt-2">
        <div class="col-md-2"></div>
        <div class="encabezado col-md-8 my-auto">
            <h1 class="text-center">Crea tu rutina</h1>
        </div>
        <div class="col-md-1 mx-auto my-1">
            <button id="goRoutineSaved" type="button" class="btn btn-outline-primary">Rutinas guardadas</button>
        </div>
    </header>

    <!-- Contenido -->
    <div class="container text-center mt-3 semana" id="guide" style="display: block;">
        <p>Crea una rutina personalizada o selecciona una de tus rutinas guardadas previamente. <br>Inicia agregando una
            semana.</p>
    </div>

    <div class="row mt-4">
        <div class="col-sm-2 ps-4">
            <h5>Ejercicios disponibles</h5>
            <input type="text" class="form-control mb-2" id="filtroEjercicios" placeholder="Buscar...">
            <div id="listaEjercicios" class="list-group" style="max-height: 400px; overflow-y: auto;"></div>
        </div>
        <div id="configuracionInicial" class="col-sm-3 ms-5 px-5 pt-2" style="border-radius: 20px; background-color:rgb(243, 241, 241);">
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

        <div id="rutinaGenerada" class="col-sm-8" style="display: block;"></div>

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
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../../Vista/Script/Entrenador/CreacionRutina.js"></script>
</body>

</html>