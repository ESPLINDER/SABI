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
            background-image: url('Media/fondoSabi.png');
            background-size: 100% auto;
            background-repeat: repeat-y;
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
            text-align: start;
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
            <div class="d-flex w-100 justify-content-between row">
                <div class="col-md-2"><img src="media/logoNuevo.png" alt="Logo" width="60" height="60" class="logo"></div>
                <div class="col-md-4"><a class="navbar-brand" href="Index.php">SABI</a></div>
                <div class="col-lg-2 text-center">
                    <a href="InicioSesion.php" class="text-light text-decoration-none">Iniciar sesion</a>
                    <button class="openbtn" onclick="openNav()">☰</button>

                    <div id="mySidebar" class="sidebar">
                        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                        <a href="Paginas principal AIS.html">Inicio</a>
                        <a href="NosotrosAIS.php">Sobre nosotros</a>
                        <a href="Servicios y contactos AIS.php">Servicios y Contactos</a>
                        <a href="Error404AIS.php">Blog</a>
                        <a href="InicioSesion.php">Iniciar sesion</a>
                    </div>

                </div>
            </div>
        </div>
    </nav>

    <div class="menu">
        <a href="InicioSesion.php">Entrenamiento</a>
        <a href="InicioSesion.php">Entrenadores</a>
        <a href="NosotrosAIS.php">Nosotros</a>
    </div>

    <div class="container">
        <div class="content-container">
            <div class="row">
                <div class="col-md-6">
                    <video controls>
                        <source src="Videos/¡Bienvenidos a SABI!.mp4" type="video/mp4">
                    </video>
                </div>
                <div class="col-md-6 text-content">
                    <h1><strong>Te damos la bienvenida</strong></h1>
                    <p>En SABI, nuestra misión es ayudarte a alcanzar un estilo de vida saludable y activo a través de programas de entrenamiento gratuitos</p>
                </div>
            </div>
        </div>

       
        <div class="content-container">
            <div class="row">
                <div class="col-md-6 order-md-2">
                    <video controls>
                        <source src="Videos/¡Descubre los Entrenamientos de SABI!.mp4" type="video/mp4">
                    </video>
                </div>
                <div class="col-md-6 text-content order-md-1">
                    <h2><strong>¡Descubre los Entrenamientos de SABI!</strong></h2>
                    <ul>
                        <li>Entrenamientos de SABI</li>
                        <li>En SABI ofrecemos diversas formas de mejorar tu bienestar físico:</li>
                        <ul>
                            <li>Rutinas Personalizadas: Entrenadores que crean programas específicos para tus necesidades y objetivos.</li>
                            <li>Rutinas Preestablecidas: Explora y sigue nuestras rutinas de ejercicio diseñadas por expertos.</li>
                            <li>Crea tus Propias Rutinas: Utiliza nuestras herramientas para diseñar y personalizar tus propios entrenamientos.</li>
                            <li>Con SABI, optimizamos la creación y gestión de programas de entrenamiento para brindarte la mejor experiencia, todo en un solo lugar.</li>
                        </ul>
                    </ul>
                    
                </div>
            </div>
        </div>


        <div class="content-container">
            <div class="row">
                <div class="col-md-6">
                    <video controls>
                        <source src="Videos/Testimonios de Éxito con SABI.mp4" type="video/mp4">
                    </video>
                </div>
                <div class="col-md-6 text-content">
                    <h3><strong>Transformaciones con SABI</strong></h3>
                    <p>Nuestros usuarios han experimentado cambios increíbles en sus vidas gracias a nuestros programas de entrenamiento personalizados. 
                    Desde mejoras en su bienestar físico hasta alcanzar sus objetivos de fitness, aquí tienes algunos testimonios de quienes ya han transformado sus vidas con SABI:</p>
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
                <div>
                    <a href="#" class="text-light mx-2"><i class="bi bi-instagram"></i></a>
                    <a href="#" class="text-light mx-2"><i class="bi bi-facebook"></i></a>
                    <a href="#" class="text-light mx-2"><i class="bi bi-youtube"></i></a>
                    <a href="#" class="text-light mx-2"><i class="bi bi-twitter"></i></a>
                </div>
            </div>
        </div>
    </div>

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
