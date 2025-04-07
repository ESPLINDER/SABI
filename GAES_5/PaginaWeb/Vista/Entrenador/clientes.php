<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clientes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="../Stiles/clientes.css">
</head>

<body class="cuerpo">
    <!-- Menú -->
    <nav class="navbar navbar-custom">
        <div class="container-fluid d-flex flex-column align-items-center">
            <div class="d-flex align-items-center w-100 justify-content-between row">
                <div class="col-md-2"><img src="Media/Logo.enc" alt="Logo" width="60" height="60" class="logo"></div>
                <div class="col-md-8 text-center"><a class="navbar-brand " href="#">
                        <h1>SABI</h1>
                    </a></div>
                <div class="col-lg-2 text-center">Adriana | Entrenador</div>
            </div>
        </div>
    </nav>


    <!-- Dashboard -->
    <div class="menu">
        <a href="rutinasGuardadas.html">Mis Rutinas</a>
        <a href="clientes.html">Clientes</a>
        <a href="NosotrosEntrenador.html">Nosotros</a>
    </div>

    <header class="mt-3">
        <h1 class="encabezado text-center col-md-2 mx-auto">Tus clientes</h1>
    </header>

    <!-- Contenido -->
    <div class="row col-md-8 mx-auto mt-1">
        <!-- Cliente 1-->
        <div class="cliente mt-4 row">
            <div class="col-md-2 d-flex">
                <img src="Media/fotoPerfilNull.png" alt="Foto de perfil" class="my-auto mx-auto img-fluid">
            </div>
            <div class="col-md-7 row align-items-center">
                <div class="col-md-6"><button disabled class="datos">Nombre: Nicolas Alejandro Cifuentes</button></div>
                <div class="col-md-6"><button disabled class="datos">Edad: 24 Años</button></div>
                <div class="col-md-6"><button disabled class="datos">Genero: Masculino</button></div>
                <div class="col-md-6"><button disabled class="datos">Objetivo: Perdida de peso</button></div>
            </div>
            <div class="col-md-3 d-flex">
                <div class="my-auto mx-auto row">
                    <button class="diagnostico1 diagnostico" data-bs-toggle="modal" data-bs-target="#diagnostico">Consultar diagnostico</button>
                    <button class="asignar1 asignar" href='../Entrenador/rutinasGuardadas.php' disabled>Asignar rutina</button>
                </div>
            </div>
        </div>

        <!-- Cliente 2-->
        <div class="cliente mt-4 row">
            <div class="col-md-2 d-flex">
                <img src="Media/fotoPerfilNull.png" alt="Foto de perfil" class="my-auto mx-auto img-fluid">
            </div>
            <div class="col-md-7 row align-items-center">
                <div class="col-md-6"><button disabled class="datos">Nombre: William Humberto Espinel Corredor</button>
                </div>
                <div class="col-md-6"><button disabled class="datos">Edad: 21 Años</button></div>
                <div class="col-md-6"><button disabled class="datos">Genero: Masculino</button></div>
                <div class="col-md-6"><button disabled class="datos">Objetivo: Aumento de masa muscular</button></div>
            </div>
            <div class="col-md-3 d-flex">
                <div class="my-auto mx-auto row">
                    <button class="diagnostico2 diagnostico" data-bs-toggle="modal" data-bs-target="#diagnostico">Consultar diagnostico</button>
                    <!-- Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace -->
                    <button class="asignar2 asignar" disabled>Asignar rutina</button>
                </div>
            </div>
        </div>

        <!-- Cliente 3-->
        <div class="cliente mt-4 row">
            <div class="col-md-2 d-flex">
                <img src="Media/fotoPerfilNull.png" alt="Foto de perfil" class="my-auto mx-auto img-fluid">
            </div>
            <div class="col-md-7 row align-items-center">
                <div class="col-md-6"><button disabled class="datos">Nombre: Andres Felipe Mena</button></div>
                <div class="col-md-6"><button disabled class="datos">Edad: 30 Años</button></div>
                <div class="col-md-6"><button disabled class="datos">Genero: Masculino</button></div>
                <div class="col-md-6"><button disabled class="datos">Objetivo: Resistencia</button></div>
            </div>
            <div class="col-md-3 d-flex">
                <div class="my-auto mx-auto row">
                    <button class="diagnostico3 diagnostico" data-bs-toggle="modal" data-bs-target="#diagnostico">Consultar diagnostico</button>
                    <!-- Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace -->
                    <button class="asignar3 asignar" disabled>Asignar rutina</button>
                </div>
            </div>
        </div>

        <!-- Cliente 4-->
        <div class="cliente mt-4 row">
            <div class="col-md-2 d-flex">
                <img src="Media/fotoPerfilNull.png" alt="Foto de perfil" class="my-auto mx-auto img-fluid">
            </div>
            <div class="col-md-7 row align-items-center">
                <div class="col-md-6"><button disabled class="datos">Nombre: Santiago David Castro</button></div>
                <div class="col-md-6"><button disabled class="datos">Edad: 28 Años</button></div>
                <div class="col-md-6"><button disabled class="datos">Genero: Masculino</button></div>
                <div class="col-md-6"><button disabled class="datos">Objetivo: Perdida de peso</button></div>
            </div>
            <div class="col-md-3 d-flex">
                <div class="my-auto mx-auto row">
                    <button class="diagnosticoOk" data-bs-toggle="modal" data-bs-target="#diagnostico">Consultar diagnostico</button>
                    <!-- Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace Agregar enlace -->
                    <button class="progreso diagnostico">Consultar progreso</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal diagnostico -->
    <div class="modal fade" id="diagnostico" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="myModalLabel">Diagnostico</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                </div>
                <div class="modal-body row">
                    <div class="mb-3">
                        <label for="objetivoPrincipal" class="form-label">Objetivo principal: </label>
                        <input type="text" id="objetivoPrincipal" class="form-control" value="Ganancia muscular">
                    </div>
        
                    <div class="mb-3">
                        <label for="nivelActividad" class="form-label">Nivel de actividad Fisica: </label>
                        <input type="text" id="nivelActividad" class="form-control" value="Sedentario">
                    </div>
                    <div class="mb-3">
                        <label for="frecuenciaEjercicio" class="form-label">Frecuencia de dias que entrena:</label>
                        <input type="text" id="frecuenciaEjercicio" class="form-control" value="1">
                    </div>
        
                    <div class="mb-3">
                        <label for="preferenciaLugar" class="form-label">Sitio para entrenar:</label>
                        <input type="text" id="preferenciaLugar" class="form-control" value="Gimnasio">
                    </div>
                    <div class="mb-3">
                        <label for="tipoEjercicio" class="form-label">Tipo de ejercicios preferidos:</label>
                        <input type="text" id="tipoEjercicio" class="form-control" value="Fuerza">
                    </div>
        
                    <div class="mb-3">
                        <label for="lesiones" class="form-label">Lesiones:</label>
                        <input type="text" id="lesiones" class="form-control" value="Ninguna">
                    </div>
                    <div class="mb-3">
                        <label for="ejerciciosEvitar" class="form-label">¿Hay algún ejercicio que debas evitar?</label>
                        <input type="text" id="tipoEjercicio" class="form-control" value="Ninguno">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Dias en los que puede entrenar:</label>
                        <input type="text" id="tipoEjercicio" class="form-control" value="Lunes, Miercoles, Jueves, Viernes, Sabado">
                    </div>
        
                   
                    <div class="mb-3">
                        <label for="horas" class="form-label">¿Cuántas horas al día dedicarás?</label>
                        <input type="text" id="tipoEjercicio" class="form-control" value="2 Horas">
                    </div>
        
              
                    <div class="mb-3">
                        <label for="parteDelDia" class="form-label">Jornada para entrenar: </label>
                        <input type="text" id="tipoEjercicio" class="form-control" value="Noche">
                            <option value="" selected disabled>Selecciona una opción</option>
                    </div>
                    <div class="mb-3">
                        <label for="edad" class="form-label">Edad</label>
                        <input type="text" id="edadPesoAltura" class="form-control" value="24">
                    </div>
                    <div class ="mb-3">
                        <label for ="Peso" class="form-label">Peso:</label>
                        <input type="text" id="tipoEjercicio" class="form-control" value="66 Kg">
                    </div>
        
                    <div class="mb-3">
                        <label for="nivelExperiencia" class="form-label">Nivel de actividad Física</label>
                        <input type="text" id="tipoEjercicio" class="form-control" value="Principiante">
                    </div>
        
                    <div class="mb-3">
                        <label for="horasSueno" class="form-label">Horas de sueño:</label>
                        <input type="text" id="tipoEjercicio" class="form-control" value="Entre 5 y 6 horas">
                    </div>
        
                    <div class="mb-3">
                        <label for="nivelEstres" class="form-label">Nivel de estres:</label>
                        <input type="text" id="tipoEjercicio" class="form-control" value="Medio">
                    </div>
        
                    <div class="mb-3">
                        <label for="preferenciasDieteticas" class="form-label">Restriccion alimentaria</label>
                        <input type="text" id="preferenciasDieteticas" class="form-control" value="Ninguna">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="close btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <button class="asignar">Asignar rutina</button>
                </div>
            </div>
        </div>
        <div id="routineSaved" class="alert alert-success d-none rounded text-center align-items-center" role="alert">
            <div class=>Rutina guardada exitosamente</div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../Script/clientes.js"></script>
</body>

</html>