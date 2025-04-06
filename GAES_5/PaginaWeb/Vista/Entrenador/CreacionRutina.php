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
    <div class="row">
        <div class="col-sm-3" style="display: block;">
            <div class="mb-2 mx-auto">
                <div class="col-md-6 mx-auto row">
                    <h5 class="text-center">Seleccione un Ejercicio</h5>
                    <div class="col-md-9" style="display: block;">
                        <select id="exerciseSelect" name="Ejercicio" class="form-select">
                            <?php
                            include("../../Controlador/conexion.php");
                            $sql = $conexion->query("SELECT * FROM ejercicio order by nomEjercicio ASC");
                            while ($datos = $sql->fetch_object()) { ?>
                                <option value="<?= $datos->nomEjercicio ?>"><?= $datos->nomEjercicio ?></option>
                            <?php }
                            ?>
                        </select>
                    </div>
                    <div class="col-md-3"><button class="btn btn-success">Crear Nuevo</button></div>
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
                                <input type="radio" id="maquina-si" name="tipEjercicio" value="1">
                                <label for="maquina-si">Si</label>
                                <input type="radio" id="maquina-no" name="tipEjercicio" value="0">
                                <label for="maquina-no">No</label>
                            </div>

                            <button type="submit" class="btn btn-success" name="btnAgregarEjercicio" value="ok">Guardar Ejercicio</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-9 mx-auto">
            <form id="rutina" method="post">
                <div id="dayFields" class="row mt-2 semana me-5">
                    <h3 class="col-md-12 text-center">SEMANA 1</h2>
                        <!-- Campo inicial para el primer día -->
                        <div class="mx-auto mb-3 day-group col-sm-6 col-md-4 col-lg-3 col-xl-2 text-center">
                            <table>
                                <thead>
                                    <tr>
                                        <th scope="col">Dia 1</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>ejercicio 1</td>
                                    </tr>
                                    <tr>
                                        <td scope="row">
                                            <a href="" class="btn btn-small btn-primary"><i class="bi bi-plus-square-fill"></i></a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <button type="button" class="btn btn-sm btn-secondary add-exercise mt-2">+ Agregar Ejercicio</button>
                        </div>
                </div>
                <button type="button" id="addDay" class="btn btn-primary mt-3" style="display: none;">+ Agregar Día</button>
                <div id="weekFields">
                    <button type="button" id="addWeek" class="btn btn-primary mt-3">+ Agregar Semana</button>
                    <button type="button" id="saveRutina" class="btn btn-success mt-3" style="display: none;" data-bs-toggle="modal"
                        data-bs-target="#SaveRutina">Guardar</button>
                </div>
            </form>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" data-bs-backdrop="static"
            aria-hidden="true">
            <div class="modal-dialog modal-fullscreen-custom modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="myModalLabel">Personaliza tu ejercicio</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                    </div>
                    <div class="modal-body row">
                        <div class="mb-2 mx-auto">
                            <div class="col-md-6 mx-auto row">
                                <h5 class="text-center">Seleccione un Ejercicio</h5>
                                <div class="col-md-9">
                                    <select id="exerciseSelect" name="Ejercicio" class="form-select">
                                        <?php
                                        include("../../Controlador/conexion.php");
                                        $sql = $conexion->query("SELECT * FROM ejercicio");
                                        while ($datos = $sql->fetch_object()) { ?>
                                            <option value="<?= $datos->nomEjercicio ?>"><?= $datos->nomEjercicio ?></option>
                                        <?php }
                                        ?>
                                    </select>
                                </div>
                                <div class="col-md-3"><button class="btn btn-success">Crear Nuevo</button></div>
                            </div>
                        </div>
                        <div id="borderDetails" class="col-md-12 mb-3 mt-2" style="display: none; border-top: 2px solid #03346E;">
                        </div>
                        <div class="row" id="exerciseDetails" style="display: none;"> <!-- Instrucciones del ejercicio -->
                            <div class="col-md-4"><img src="Media/press-de-banca-en-maquina-smith.png" alt="Imagen guia"
                                    class="img-fluid"></div>
                            <div class="col-md-4">
                                <form id="seriesForm" class="row" method="POST">
                                    <!-- Serie inicial -->
                                    <div class="serie-item row">
                                        <label for="serie-1" class="form-label">Serie 1</label>
                                        <?php
                                        include "../../Controlador/conexion.php";
                                        include "../../Controlador/RegistrarSerie.php";
                                        ?>
                                        <div class="col-md-7">
                                            <label for="Peso">Peso *</label>
                                            <div class="input-group">
                                                <input type="number" name="Peso" id="Peso" class="form-control" placeholder="Ejemplo: 10" required min="1">
                                                <span class="input-group-text">Kg</span>
                                            </div>
                                        </div>
                                        <div class="col-md-5">
                                            <label for="Repeticiones">Repeticiones *</label>
                                            <input type="number" name="Repeticiones" id="Repeticiones" class="form-control" placeholder="Ejemplo: 10" required min="1">
                                        </div>
                                    </div>
                                    <!-- Botón para agregar más series -->
                                    <button type="submit" name="AgregarSerie" id="" class="btn btn-primary mt-3" value="ok">+ Agregar serie</button>
                                </form>
                            </div>
                            <div class="col-md-4 my-auto">
                                <h4>Video tutorial</h4>
                                <div class="video-responsive" id="default-video-container">
                                    <video controls>
                                        <source src="Media/press-de-banca-en-maquina-smith.mp4" type="video/mp4">
                                        Tu navegador no soporta la reproducción de video.
                                    </video>
                                </div>
                                <div class="mt-4" id="upload-section">
                                    <label for="upload-video" class="form-label">Sube un video tutorial personalizado</label>
                                    <input type="file" id="upload-video" class="form-control" accept="video/*">
                                </div>
                                <!-- Contenedor para el video subido -->
                                <div id="uploaded-video-container" class="mt-3" style="display: none;">
                                    <h5>Video tutorial subido:</h5>
                                    <video id="uploaded-video" controls class="w-100">
                                        Tu navegador no soporta la reproducción de video.
                                    </video>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <button type="submit" form="seriesForm" id="saveModal" class="btn btn-primary">Guardar Cambios</button>
                    </div>
                </div>
            </div>
        </div>
        <div id="exerciseSaved" class="alert alert-success d-none rounded text-center align-items-center" role="alert">
            <div class=>Ejercicio guardado exitosamente</div>
        </div>

        <!-- Nombrar rutina -->
        <div class="modal fade" id="SaveRutina" tabindex="-1" aria-labelledby="myModalLabel" data-bs-backdrop="static"
            aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="myModalLabel">Guarda tu rutina</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                    </div>
                    <div class="modal-body row">
                        <form>
                            <div id="nombrar">
                                <label for="nameRoutine">Nombra tu rutina:</label>
                                <input type="text" id="nameRoutine" placeholder="Ej: Aumento de masa muscular" class="form-control">
                            </div>
                            <div style="display: none;" id="describir">
                                <label for="Descripcion" class="mt-2">Describe el objetivo de esta rutina personalizada</label>
                                <textarea name="description" id="description" class="form-control"
                                    placeholder="Rutina diseñada para maximizar el crecimiento muscular en poco tiempo, utilizando ejercicios compuestos y de alta intensidad para trabajar todo el cuerpo en sesiones cortas y efectivas."></textarea>
                            </div>
                            <div style="display: none;" id="difficulty">
                                <label for="nivel">Nivel de dificultad:</label>
                                <select id="nivel" name="nivel" class="form-select">
                                    <option value=""></option>
                                    <option value="Principiante">Principiante</option>
                                    <option value="Intermedio">Intermedio</option>
                                    <option value="Avanzado">Avanzado</option>
                                </select>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <button type="submit" id="saveAll" class="btn btn-primary" disabled>Guardar Rutina</button>
                    </div>
                </div>
            </div>
            <div id="routineSaved" class="alert alert-success d-none rounded text-center align-items-center" role="alert">
                <div class=>Rutina guardada exitosamente</div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../Script/CrearRutina.js"></script>
    <script src="../../Vista/Script/Entrenador/CreacionRutina.js"></script>
</body>

</html>