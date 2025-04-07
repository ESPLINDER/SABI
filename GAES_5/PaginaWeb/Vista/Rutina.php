<?php
include '../Controlador/conexion.php'; // Asegúrate de que la ruta a tu archivo de conexión sea correcta

// Verificar si se ha enviado un parámetro de éxito
$successMessage = '';
if (isset($_GET['success']) && $_GET['success'] == 1) {
    $successMessage = 'Rutina guardada exitosamente.';
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tu rutina</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="Stiles/Rutina.css">
</head>
<body class="cuerpo">
    <nav class="navbar navbar-custom">
        <div class="container-fluid d-flex flex-column align-items-center">
            <div class="d-flex align-items-center w-100 justify-content-between row">
                <div class="col-md-2"><img src="Media/Logo.enc" alt="Logo" width="60" height="60" class="logo"></div>
                <div class="col-md-8 text-center"><a class="navbar-brand" href="#">SABI</a></div>
                <div class="col-lg-2 text-center">
                    <a href="PerfilUsuario.html" class="text-light text-decoration-none">Camila</a>
                    <button class="openbtn" onclick="openNav()">☰</button>
                    <div id="mySidebar" class="sidebar">
                        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                        <a href="Pagina principal.html">Inicio</a>
                        <a href="Nosotros.html">Sobre nosotros</a>
                        <a href="Servicios y contactos.html">Servicios y Contactos</a>
                        <a href="Error404.html">Blog</a>
                        <a href="Paginas principal AIS.html">Cerrar sesión</a>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <div class="menu">
        <a href="Rutina.html">Entrenamiento</a>
        <a href="EscogerEntrenador.html">Entrenador</a>
        <a href="Nosotros.html">Nosotros</a>
    </div>

    <header class="row align-items-center mt-2">
        <div class="col-md-2"></div>
        <div class="encabezado col-md-8 my-auto">
            <h1 class="text-center">Aumento de masa muscular</h1>
        </div>
        <div class="col-md-2 mx-auto my-1"></div>
    </header>

    <div class="col-md-10 mx-auto mt-5 text-center">
        <?php if ($successMessage): ?>
            <div class="alert alert-success" role="alert">
                <?php echo $successMessage; ?>
            </div>
        <?php endif; ?>
        
        <form id="routineForm" method="POST" action="procesar_ejercicio.php">
            <div id="dayFields" class="row mt-2 semana" style="display: none;">
                <h2 class="col-md-12">SEMANA 1</h2>
                <div class="mx-auto mb-3 day-group col-sm-6 col-md-4 col-lg-3 col-xl-2">
                    <label for="day-1" class="form-label">Dia 1</label>
                    <select name="Ejercicio" id="modal" class="col-sm-12 form-select" data-bs-toggle="modal" data-bs-target="#myModal"></select>
                </div>
            </div>
            <button type="button" id="addDay" class="btn btn-primary mt-3" style="display: none;">+ Agregar Día</button>
            <div id="weekFields">
                <div class="week-group mt-2 semana">
                    <h2>SEMANA 1</h2>
                    <div id="dayFields-week-2" class="row">
                        <div class="mx-auto mb-3 day-group col-sm-6 col-md-4 col-lg-3 col-xl-2">
                            <label for="day-2-1" class="form-label">Día 1</label>
                            <select name="Ejercicio" id="modal-2-1" class="col-sm-12 form-select" data-bs-toggle="modal" data-bs-target="#myModal">
                                <option class="historial" value="">Press De Banca</option>
                            </select>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button type="button" id="loadHistorial" class="boton-historial mt-2 btn btn-custom w-20 mb-3">Cargar historial</button>
           <!-- Modal ejercicio -->
        </form>
    </div>
    <div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="myModalLabel" data-bs-backdrop="static" aria-hidden="true">
        <div class="modal-dialog modal-fullscreen-custom modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="myModalLabel">A realizar:</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                </div>
                <div class="modal-body row">
                    <div class="mb-2 mx-auto">
                        <div class="col-md-5 mx-auto text-center">
                            <h5>Ejercicio:</h5>
                            Press de banca 
                        </div>
                    </div>
                    <div id="borderDetails" class="col-md-12 mb-3 mt-2" style="border-top: 2px solid rgb(3, 52, 110);"></div>
                    <div class="row" id="exerciseDetails">
                        <div class="col-md-4">
                            <img src="Media/press-de-banca-en-maquina-smith.png" alt="Imagen guia" class="img-fluid">
                        </div>
                        <div class="col-md-4">
                            <form id="seriesForm" class="row" method="POST" enctype="multipart/form-data">
                                <input type="hidden" name="fkIdEjercicio" value="1">
                                <input type="hidden" name="fkIdRutina" value="1">
                                <input type="hidden" name="dia" value="1">
                                <input type="hidden" name="semana" value="1">
                                <div class="mb-3">
                                    <label for="peso" class="form-label">Peso Levantado (Kg)</label>
                                    <input type="number" id="peso" name="peso" class="form-control" placeholder="Ejemplo: 50" required min="1">
                                </div>
                                <div class="mb-3">
                                    <label for="repeticiones" class="form-label">Repeticiones</label>
                                    <input type="number" id="repeticiones" name="repeticiones" class="form-control" placeholder="Ejemplo: 12" required min="1">
                                </div>
                                <div class="mb-3">
                                    <label for="series" class="form-label">Series Realizadas</label>
                                    <input type="number" id="series" name="series" class="form-control" placeholder="Ejemplo: 4" required min="1">
                                </div>
                                <div class="mb-3">
                                    <label for="descanso" class="form-label">Descanso entre Series (segundos)</label>
                                    <input type="number" id="descanso" name="descanso" class="form-control" placeholder="Ejemplo: 0" required min="1">
                                </div>
                            </form>
                            </div>
                        <div class="col-md-4 my-auto">
                            <h4>Video tutorial</h4>
                            <!-- Reemplazo por el iframe del nuevo video de YouTube -->
                            <iframe width="100%" height="315" src="https://www.youtube.com/embed/jlFl7WJ1TzI" 
                                title="Video tutorial" frameborder="0" 
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
                                allowfullscreen>
                            </iframe>
                        </div>
                    </div>
                </div>
                <div class="modal-footer text-center">
                <!-- Contenedor para centrar los botones -->
                <div class="w-100">
                 <button type="submit" form="seriesForm" class="btn btn-primary mx-2" name="btnguardar" value="GUARDADO">Enviar Ejercicio</button>
                   <button type="button" class="btn btn-warning mx-2" data-bs-dismiss="modal">Editar Ejercicio</button>
                </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.getElementById('submitForm').addEventListener('click', function() {
            // Obtener el formulario
            var form = document.getElementById('seriesForm');
            var formData = new FormData(form);

            document.addEventListener('DOMContentLoaded', () => {
             const boton = document.getElementById('miBoton'); // Cambia "miBoton" por el ID real del botón
            if (boton) {
             boton.addEventListener('click', () => {
            console.log('Botón clickeado');
              });
            } else {
          console.error('El elemento con id "miBoton" no existe.');
          }
});

            // Enviar los datos usando Fetch API
            fetch('procesar_ejercicio.php', {
                method: 'POST',
                body: formData
            })
            .then(response => response.text())
            .then(data => {
                // Mostrar el mensaje de éxito
                document.querySelector('.alert').innerHTML = "Rutina guardada exitosamente.";
                document.querySelector('.alert').style.display = "block";
                // Cerrar el modal
                var modal = bootstrap.Modal.getInstance(document.getElementById('myModal'));
                modal.hide();
            })
            .catch(error => {
                console.error('Error:', error);
            });
        });
    </script>

    <!-- Modal historial -->
    <div class="modal fade" id="myModalH" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-fullscreen-custom modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="myModalLabel">Historial</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                </div>
                <div class="modal-body row">
                    <div class="mb-2 mx-auto">
                        <div class="col-md-5 mx-auto text-center">
                            <h5>Ejercicio:</h5>
                            Press de banca
                        </div>
                    </div>
                    <div id="borderDetails" class="col-md-12 mb-3 mt-2" style="border-top: 2px solid rgb(3, 52, 110);"></div>
                    <div class="row" id="exerciseDetails">
                        <div class="col-md-4">
                            <img src="Media/press-de-banca-en-maquina-smith.png" alt="Imagen guia" class="img-fluid">
                        </div>
                        <div class="col-md-4 row">
                            <div class="serie-item row">
                                <div class="mt-auto">Serie 1</div>
                                <div class="col-md-7">
                                    <label for="Peso">Peso: 10 Kg *</label>
                                    <div class="box">10 Kg</div>
                                </div>
                                <div class="col-md-5">
                                    <label for="Repeticiones">Repeticiones: 12 *</label>
                                    <div class="box">12</div>
                                </div>
                            </div>
                            <div class="serie-item mt-3 row">
                                <div class="mt-auto">Serie 2</div>
                                <div class="col-md-7">
                                    <label for="Peso-2">Peso: 10 Kg *</label>
                                    <div class="box">9 Kg</div>
                                </div>
                                <div class="col-md-5">
                                    <label for="Repeticiones-2">Repeticiones: 12 *</label>
                                    <div class="box">12</div>
                                </div>
                            </div>
                            <div class="serie-item mt-3 row">
                                <div class="mt-auto">Serie 3</div>
                                <div class="col-md-7">
                                    <label for="Peso-3">Peso *</label>
                                    <div class="box">9 Kg</div>
                                </div>
                                <div class="col-md-5">
                                    <label for="Repeticiones-3">Repeticiones: 12 *</label>
                                    <div class="box">11</div>
                                </div>
                            </div>
                            <div class="serie-item mt-3 row">
                                <div class="mt-auto">Serie 4</div>
                                <div class="col-md-7">
                                    <label for="Peso-4">Peso: 10 Kg *</label>
                                    <div class="box">9 Kg</div>
                                </div>
                                <div class="col-md-5">
                                    <label for="Repeticiones-4">Repeticiones: 12 *</label>
                                    <div class="box">10</div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 my-auto">
                            <h4>Tu video:</h4>
                            <div class="video-responsive">
                                <video controls="">
                                    <source src="Media/press-de-banca-en-maquina-smith.mp4" type="video/mp4">
                                    Tu navegador no soporta la reproducción de video.
                                </video>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>

    <footer>
        <div class="container">
            <div class="row text-center text-md start">
                <div class="col-md-4">
                    <h5>Políticas de privacidad</h5>
                    <ul class="list-unstyled">
                        <li><a href="#">Política de datos</a></li>
                        <li><a href="#">Aviso de privacidad</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h5>Términos de servicio</h5>
                    <ul class="list-unstyled">
                        <li><a href="#">Términos y condiciones</a></li>
                        <li><a href="#">Reglas de uso</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h5>Información de contacto</h5>
                    <ul class="list-unstyled">
                        <li>1534053454</li>
                        <li>2534647864</li>
                        <li>SABI@gmail.com</li>
                    </ul>
                </div>
            </div>
            <div class="text-center mt-3">
                <p>&copy; 2024 SABI. Todos los derechos reservados.</p>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="Script/Rutina.js"></script>
    <script>
        function openNav() {
            document.getElementById("mySidebar").style.width = "250px";
        }
        function closeNav() {
            document.getElementById("mySidebar").style.width = "0";
        }
    </script>
</body>
</html>
