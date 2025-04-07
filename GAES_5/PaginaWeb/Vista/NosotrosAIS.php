<?php
if (isset($_SESSION['idUsuario'])) {
    session_unset();
    session_destroy();
    header("Location: inicioSesion.php?logout=true");
    exit();
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NosotrosAIS</title>
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
        .text-content {
            text-align: center;
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
        .btn-custom {
            background-color: black;
            color: azure;
            font-size: 24px;
            font-weight: bold;
            padding: 16px 32px;
            border: none;
            border-radius: 12px;
            position: relative;
            overflow: hidden;
            transition: color 0.3s ease;
            z-index: 1;
        }
        .btn-custom:hover {
            color: black;
        }
        .btn-custom::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, #021526, #03346E, #6EACDA, #ffffff, #ffffff, #6EACDA, #03346E, #021526, #03346E, #6EACDA, #ffffff);
            background-size: 400%;
            z-index: -1;
            transition: opacity 0.3s ease;
            opacity: 0;
            border-radius: 12px;
            animation: glowing 50s linear infinite;
        }
        .btn-custom:hover::before {
            opacity: 1;
        }
        @keyframes glowing {
            0% { background-position: 0 0; }
            50% { background-position: 200% 0; }
            100% { background-position: 0 0; }
        }
        .content-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding-top: 50px;
            text-align: center;
        }
        .extra-space {
            margin-bottom: 50px; /* Ajusta este valor según tus necesidades */
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
                    <a href="InicioSesion.html" class="text-light text-decoration-none">Iniciar Sesion</a>
                    <button class="openbtn" onclick="openNav()">☰</button>
                    <div id="mySidebar" class="sidebar">
                        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                        <a href="Paginas principal AIS.html">Inicio</a>
                        <a href="NosotrosAIS.html">Sobre nosotros</a>
                        <a href="Servicios y contactos AIS.html">Servicios y Contactos</a>
                        <a href="Error404AIS.html">Blog</a>
                        <a href="InicioSesion.html">Iniciar Sesion</a>
                    </div>
            </div>
        </div>
    </nav>

    

    <div class="menu">
        <a href="InicioSesion.html">Entrenamiento</a>
        <a href="InicioSesion.html">Entrenadores</a>
        <a href="NosotrosAIS.html">Nosotros</a>
    </div>

    <div class="container mt-5 pt-4 extra-space">
        <div class="content-container">
            <div class="row">
                <div class="col-12">
                    <h2 class="text-center" style="font-family: 'Bonello-Regular', sans-serif; color: #021526;">Nosotros</h2>
                    <p class="text-content" style="color: #021526; font-size: 1.1rem;">
                        En <strong>SABI</strong>, partimos de un problema común: muchas personas que buscan mejorar su estado físico enfrentan dificultades para organizar sus entrenamientos, darles seguimiento y recibir apoyo personalizado. Esto puede llevar a la desmotivación, falta de progreso, y en muchos casos, al abandono de sus objetivos.
                    </p>
                    <p class="text-content" style="color: #021526; font-size: 1.1rem;">
                        Nuestra solución es SABI, un sistema diseñado específicamente para simplificar y optimizar la experiencia de entrenamiento físico. Con SABI, los usuarios tienen acceso a una plataforma intuitiva que les permite gestionar sus rutinas, registrar avances y trabajar en colaboración con entrenadores para alcanzar metas claras y realistas.
                    </p>
                    <p class="text-content" style="color: #021526; font-size: 1.1rem;">
                        Nuestra misión es transformar la manera en que las personas entrenan, eliminando barreras organizativas y tecnológicas, y ofreciendo herramientas prácticas que impulsen el compromiso y los resultados. SABI no solo es una solución, sino un aliado en el camino hacia una vida más saludable y activa.
                    </p>
                    <div class="text-center mt-4">
                        <a class="btn btn-custom w-30 mb-3" href="Error404AIS.html">¿Quieres saber más? ¡Únete a nuestro blog!</a>
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