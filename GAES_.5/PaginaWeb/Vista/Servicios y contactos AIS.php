<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página Principal</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <style>
        @font-face {
            font-family: 'Bonello-Regular';
            src: url('Fonts/Bonello-Regular.otf') format('opentype');
        }
        body {
            background-color: #E2E2B6;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .navbar-custom {
            background-color: #021526;
            color: whitesmoke;
        }
        .navbar-brand {
            font-size: 1.8rem;
            font-weight: bold;
            color: #6EACDA;
            font-family: 'Bonello-Regular', sans-serif;
            text-align: center;
            margin: 0 auto;
            text-decoration: none;
        }
        .menu {
            background-color: #6EACDA;
            text-align: center;
            padding: 10px 0;
        }
        .menu a {
            color: #021526;
            font-weight: bold;
            margin: 0 15px;
            text-decoration: none;
        }
        .menu a:hover {
            text-decoration: underline;
        }
        .content-container {
            margin: 20px 0;
        }
        .content-container .row {
            align-items: center;
        }
        .content-container video {
            width: 100%;
            height: auto;
            border-radius: 8px;
        }
        .text-content {
            text-align: justify;
            padding: 20px;
        }
        footer {
            background-color: #021526;
            color: #fff;
            padding: 10px 0;
            margin-top: auto;
        }
        footer a {
            color: #6EACDA;
            text-decoration: none;
        }
        footer a:hover {
            color: #fff;
        }
        .sidebar {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 1;
            top: 0;
            right: 0;
            background-color: #021526;
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 60px;
        }
        .sidebar a {
            padding: 10px 15px;
            text-decoration: none;
            font-size: 25px;
            color: #6EACDA;
            display: block;
            transition: 0.3s;
        }
        .sidebar a:hover {
            color: #fff;
        }
        .sidebar .closebtn {
            position: absolute;
            top: 0;
            right: 25px;
            font-size: 36px;
        }
        .openbtn {
            font-size: 20px;
            cursor: pointer;
            background-color: #021526;
            color: #6EACDA;
            padding: 5px 7.5px;
            border: none;
        }
        .openbtn:hover {
            background-color: #03346E;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-custom">
        <div class="container-fluid d-flex flex-column align-items-center">
            <div class="d-flex align-items-center w-100 justify-content-between row">
                <div class="col-md-2"><img src="Logo/sabi.enc" alt="Logo" width="60" height="60" class="logo"></div>
                <div class="col-md-8 text-center"><a class="navbar-brand" href="#">SABI</a></div>
                <div class="col-lg-2 text-center">
                    <a href="InicioSesion.html" class="text-light text-decoration-none">Inicia sesión</a>
                    <button class="openbtn" onclick="openNav()">☰</button>
                    <div id="mySidebar" class="sidebar">
                        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                        <a href="Paginas principal AIS.html">Inicio</a>
                        <a href="NosotrosAIS.html">Sobre nosotros</a>
                        <a href="Servicios y contactos AIS.html">Servicios y Contactos</a>
                        <a href="Error404AIS.html">Blog</a>
                        <a href="InicioSesion.html">Iniciar sesión</a>
                    </div>
            </div>
        </div>
    </nav>

    

    <div class="menu">
        <a href="InicioSesion.html">Entrenamiento</a>
        <a href="InicioSesion.html">Entrenadores</a>
        <a href="NosotrosAIS.html">Nosotros</a>
    </div>

    <div class="container mt-4">
        <div class="content-container text-center">
            <h2>Servicios</h2>
            <div class="row">
                <div class="col-md-4 mb-3">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Rutinas Personalizadas</h5>
                            <p class="card-text">Entrenadores profesionales crean programas de entrenamiento específicos para tus necesidades y objetivos.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Rutinas Preestablecidas</h5>
                            <p class="card-text">Acceso a una biblioteca de rutinas de ejercicio diseñadas por expertos.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Crear tus Propias Rutinas</h5>
                            <p class="card-text">Herramientas interactivas para diseñar y personalizar tus propios entrenamientos.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Comunidad de Apoyo</h5>
                            <p class="card-text">Foros de discusión, grupos de apoyo y eventos en línea para mantenerte motivado.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Seguimiento Digital</h5>
                            <p class="card-text">Registro digital del progreso y acceso a informes detallados.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="content-container text-center">
            <h2>Contacto</h2>
            <p>Para cualquier consulta, comentario o sugerencia, no dudes en ponerte en contacto con nosotros a través de los siguientes medios:</p>
            <div class="row justify-content-center">
                <div class="col-md-4 mb-3">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Formulario de Contacto</h5>
                            <p  class="card-text">Completa el formulario a continuación para enviarnos tu mensaje.</p>
                            <a id="formulario" href="InicioSesion.html"> Has click aquí</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Correo Electrónico</h5>
                            <p class="card-text">SABI@gmail.com</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Teléfonos de Contacto</h5>
                            <p class="card-text">
                                Teléfono 1: 1534053454<br>
                                Teléfono 2: 2534647864
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Dirección Física</h5>
                            <p class="card-text">Avenida Principal, Edificio SABI, Bogotá, Colombia</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card h-100">
                        <div class="card-body">
                            <h5 class="card-title">Redes Sociales</h5>
                            <p class="card-text">
                                <a href="#" class="text-dark"><i class="bi bi-instagram"></i> Instagram</a><br>
                                <a href="#" class="text-dark"><i class="bi bi-facebook"></i> Facebook</a><br>
                                <a href="#" class="text-dark"><i class="bi bi-youtube"></i> YouTube</a><br>
                                <a href="#" class="text-dark"><i class="bi bi-twitter"></i> Twitter</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer>
        <div class="container">
            <div class="row text-center text-md-start">
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
