<!DOCTYPE html>
<html lang="en">

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
                <div class="col-md-8 text-center"><a class="navbar-brand " href="#">SABI</a></div>
                <div class="col-lg-2 text-center">Camila</div>
            </div>
        </div>
    </nav>

    <div class="menu">
        <a href="rutinasGuardadas.html" >Mis Rutinas</a>
        <a href="clientes.html">Clientes</a>
        <a href="NosotrosEntrenador.html">Nosotros</a>
    </div>

    <header class="row align-items-center mt-2">
        <div class="col-md-2"></div>
        <div class="encabezado col-md-8 my-auto">
            <h1 class="text-center">Aumento de masa muscular</h1>
        </div>
        <div class="col-md-2 mx-auto my-1"></div>
    </header>

    <!-- Historial -->
    <div id="historial" class="col-md-11 mx-auto mt-5 text-center">
        <div class="week-group mt-2 sHistorial">
            <h2>SEMANA 1</h2>
            <div id="dayFields-week-2" class="row">
                <div class="mx-auto mb-3 day-group col-sm-6 col-md-4 col-lg-3 col-xl-2">
                    <label for="day-2-1" class="form-label">Día 1</label>
                    <!-- ejercicio que abre el modal -->
                    <button id="modal" class="historial col-sm-12 bg-primary" data-bs-toggle="modal" data-bs-target="#myModalVideo">Press de banca</button>
                    <button id="modal" class="historial col-sm-12 bg-primary" data-bs-toggle="modal" data-bs-target="#myModalVideo">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                </div>

                <div class="mx-auto mb-3 day-group col-sm-6 col-md-4 col-lg-3 col-xl-2">
                    <label for="day-2-2" class="form-label">Día 2</label>
                    <!-- Select que abre el modal -->
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Press de banca</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                </div>
                <div class="mx-auto mb-3 day-group col-sm-6 col-md-4 col-lg-3 col-xl-2">
                    <label for="day-2-3" class="form-label">Día 3</label>
                    <!-- Select que abre el modal -->
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Press de banca</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                </div>
                <div class="mx-auto mb-3 day-group col-sm-6 col-md-4 col-lg-3 col-xl-2">
                    <label for="day-2-4" class="form-label">Día 4</label>
                    <!-- Select que abre el modal -->
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Press de banca</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                </div>
                <div class="mx-auto mb-3 day-group col-sm-6 col-md-4 col-lg-3 col-xl-2">
                    <label for="day-2-5" class="form-label">Día 5</label>
                    <!-- Select que abre el modal -->
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Press de banca</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                </div>
                <div class="mx-auto mb-3 day-group col-sm-6 col-md-4 col-lg-3 col-xl-2">
                    <label for="day-2-6" class="form-label">Día 6</label>
                    <!-- Select que abre el modal -->
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Press de banca</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                </div>
            </div>
        </div>
        <div class="week-group mt-2 sHistorial">
            <h2>SEMANA 2</h2>
            <div id="dayFields-week-2" class="row">
                <div class="mx-auto mb-3 day-group col-sm-6 col-md-4 col-lg-3 col-xl-2">
                    <label for="day-2-1" class="form-label">Día 1</label>
                    <!-- ejercicio que abre el modal -->
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Press de banca</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                </div>

                <div class="mx-auto mb-3 day-group col-sm-6 col-md-4 col-lg-3 col-xl-2">
                    <label for="day-2-2" class="form-label">Día 2</label>
                    <!-- Select que abre el modal -->
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Press de banca</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                </div>
                <div class="mx-auto mb-3 day-group col-sm-6 col-md-4 col-lg-3 col-xl-2">
                    <label for="day-2-3" class="form-label">Día 3</label>
                    <!-- Select que abre el modal -->
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Press de banca</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                </div>
                <div class="mx-auto mb-3 day-group col-sm-6 col-md-4 col-lg-3 col-xl-2">
                    <label for="day-2-4" class="form-label">Día 4</label>
                    <!-- Select que abre el modal -->
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Press de banca</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                </div>
                <div class="mx-auto mb-3 day-group col-sm-6 col-md-4 col-lg-3 col-xl-2">
                    <label for="day-2-5" class="form-label">Día 5</label>
                    <!-- Select que abre el modal -->
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Press de banca</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                </div>
                <div class="mx-auto mb-3 day-group col-sm-6 col-md-4 col-lg-3 col-xl-2">
                    <label for="day-2-6" class="form-label">Día 6</label>
                    <!-- Select que abre el modal -->
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Press de banca</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                </div>
            </div>
        </div>
        <div class="week-group mt-2 sHistorial">
            <h2>SEMANA 3</h2>
            <div id="dayFields-week-2" class="row">
                <div class="mx-auto mb-3 day-group col-sm-6 col-md-4 col-lg-3 col-xl-2">
                    <label for="day-2-1" class="form-label">Día 1</label>
                    <!-- ejercicio que abre el modal -->
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Press de banca</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                </div>

                <div class="mx-auto mb-3 day-group col-sm-6 col-md-4 col-lg-3 col-xl-2">
                    <label for="day-2-2" class="form-label">Día 2</label>
                    <!-- Select que abre el modal -->
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Press de banca</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                </div>
                <div class="mx-auto mb-3 day-group col-sm-6 col-md-4 col-lg-3 col-xl-2">
                    <label for="day-2-3" class="form-label">Día 3</label>
                    <!-- Select que abre el modal -->
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Press de banca</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                </div>
                <div class="mx-auto mb-3 day-group col-sm-6 col-md-4 col-lg-3 col-xl-2">
                    <label for="day-2-4" class="form-label">Día 4</label>
                    <!-- Select que abre el modal -->
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Press de banca</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                </div>
                <div class="mx-auto mb-3 day-group col-sm-6 col-md-4 col-lg-3 col-xl-2">
                    <label for="day-2-5" class="form-label">Día 5</label>
                    <!-- Select que abre el modal -->
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Press de banca</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                    <button id="modal" class="historial col-sm-12" data-bs-toggle="modal" data-bs-target="#myModalH">Ejercicio pasado</button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Modal historial -->
    <div class="modal fade" id="myModalH" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog sinVideo modal-dialog-centered modal-dialog-scrollable">
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
                    <div id="borderDetails" class="col-md-12 mb-3 mt-2" style="border-top: 2px solid rgb(3, 52, 110);">
                    </div>
                    <div class="row" id="exerciseDetails"> <!-- Instrucciones del ejercicio -->
                        <div class="col-md-6">
                            <img src="Media/press-de-banca-en-maquina-smith.png" alt="Imagen guia" class="img-fluid"></div>
                        <div class="col-md-6 row">
                                <!-- Serie inicial -->
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
                    </div>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>

    <!-- Modal historial con VIDEO -->
    <div class="modal fade" id="myModalVideo" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
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
                    <div id="borderDetails" class="col-md-12 mb-3 mt-2" style="border-top: 2px solid rgb(3, 52, 110);">
                    </div>
                    <div class="row" id="exerciseDetails"> <!-- Instrucciones del ejercicio -->
                        <div class="col-md-4">
                            <img src="Media/press-de-banca-en-maquina-smith.png" alt="Imagen guia" class="img-fluid"></div>
                        <div class="col-md-4 row">
                                <!-- Serie inicial -->
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
                            <h4>Video de tu cliente:</h4>
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



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="Script/Rutina.js"></script>
</body>

</html>