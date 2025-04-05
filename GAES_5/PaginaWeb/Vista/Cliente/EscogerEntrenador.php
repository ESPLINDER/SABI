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
        .trainer-card {
            background-color: #4aaffdd0;
            border: 1px solid #000000;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
        }
        .trainer-card img {
            width: 200px;
            height: 200px;
            object-fit: cover;
            border-radius: 50%;
        }
        .trainer-card h4 {
            margin: 10px 0;
        }
        .star {
            color: gold; /* Cambia las estrellas a color dorado */
            transition: transform 0.3s ease, color 0.3s ease;
            font-size: 1.2rem;
        }
        .star:hover {
            transform: scale(1.2); /* Aumenta el tamaño al pasar el mouse */
            color: orange;
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
        .btn-custom {
            background-color: black;
            color: azure;
            font-size: 18px;
            font-weight: bold;
            padding: 10px 20px;
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
            background: linear-gradient(45deg, #021526, #03346E, #6EACDA, #ffffff, #E2E2B6, #6EACDA, #03346E, #021526, #03346E, #6EACDA, #E2E2B6);
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
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-custom">
        <div class="container-fluid d-flex flex-column align-items-center">
            <div class="d-flex align-items-center w-100 justify-content-between row">
                <div class="col-md-2">
                    <img src="Logo/sabi.enc" alt="Logo" width="60" height="60" class="logo">
                </div>
                <div class="col-md-8 text-center">
                    <a class="navbar-brand" href="#">SABI</a>
                </div>
                <div class="col-lg-2 text-center">
                    <a href="PerfilUsuario.html" class="text-light text-decoration-none">Camila</a>
                    <button class="openbtn" onclick="openNav()">☰</button>
                </div>
            </div>
        </div>
    </nav>

    <!-- Sidebar -->
    <div id="mySidebar" class="sidebar">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <a href="Pagina principal.html">Inicio</a>
        <a href="Nosotros.html">Sobre nosotros</a>
        <a href="Servicios y contactos.html">Servicios y Contactos</a>
        <a href="Error404.html">Blog</a>
        <div class="mt-auto"><a href="Paginas principal AIS.html">Cerrar sesión</a></div>
    </div>

    <!-- Menu -->
    <div class="menu">
        <a href="Rutina.html">Entrenamiento</a>
        <a href="EscogerEntrenador.html">Entrenadores</a>
        <a href="NosotrosAIS.html">Nosotros</a>
    </div>


    <div class="container mt-4">
        <h2 class="text-center">Nuestros mejores entrenadores</h2>
        <div class="content-container">
            <div class="row trainer-card">
                <div class="col-md-2 text-center">
                    <img src="Media/Juan.jpg" alt="Entrenador 1" class="img-fluid">
                </div>
                <div class="col-md-6">
                    <h4>Entrenador Juan Carlos Gómez</h4>
                    <p>Género: Masculino</p>
                    <p>Edad: 35 años</p>
                    <p>Años de experiencia: 10 años</p>
                    <p>Especialidad: Entrenamiento de fuerza y condición física para deportistas.</p>
                    <p>Bio: Juan Carlos es un entrenador certificado con más de 10 años de experiencia en el ámbito del fitness. Ha trabajado con deportistas de alto nivel y ha ayudado a muchos a alcanzar sus objetivos de condición física.</p>
                    <p>
                        <i class="bi bi-star-fill star"></i>
                        <i class="bi bi-star-fill star"></i>
                        <i class="bi bi-star-half star"></i>
                        <i class="bi bi-star star"></i>
                        <i class="bi bi-star star"></i>
                        <span>(2.5/5)</span>
                    </p>
                </div>
                <div class="col-md-4 text-center">
                    <button class="btn btn-custom w-20 mb-3" ><a href="Error505.html">Seleccionar</a></button>
                </div>
            </div>
            
            <div class="row trainer-card">
                <div class="col-md-2 text-center">
                    <img src="Media/Ximena.jpg" alt="Entrenador 1" class="img-fluid">
                </div>
                <div class="col-md-6">
                    <h4>Entrenador Ximena Elisabeth Reyes</h4>
                    <p>Género: Femenimo</p>
                    <p>Edad: 28 años</p>
                    <p>Años de experiencia: 5 años</p>
                    <p>Especialidad: Entrenamiento de cardio y HIIT (Entrenamiento de Intervalos de Alta Intensidad) para la pérdida de peso y la mejora de la condición cardiovascular.</p>
                    <p>Bio: Ximena Elisabeth es una entrenadora certificada con más de 5 años de experiencia en el ámbito del fitness. Ha trabajado con clientes de todas las edades y ha ayudado a muchos a alcanzar sus objetivos de pérdida de peso y mejora de la condición cardiovascular.</p>
                    <p>
                        <i class="bi bi-star-fill star"></i>
                        <i class="bi bi-star-fill star"></i>
                        <i class="bi bi-star-fill star"></i>
                        <i class="bi bi-star star"></i>
                        <i class="bi bi-star star"></i>
                        <span>(3/5)</span>
                    </p>
                </div>
                <div class="col-md-4 text-center">
                    <button class="btn btn-custom w-20 mb-3" ><a href="Error505.html">Seleccionar</a></button>
                </div>
            </div>
            <!-- Repite para los otros entrenadores -->
            <div class="row trainer-card">
                <div class="col-md-2 text-center">
                    <img src="Media/Luis.jpg" alt="Entrenador 1" class="img-fluid">
                </div>
                <div class="col-md-6">
                    <h4>Entrenador Luis Miguel Rodriguez</h4>
                    <p>Género: Masculino</p>
                    <p>Edad: 40 años</p>
                    <p>Años de experiencia: 15 años</p>
                    <p>Especialidad: Entrenamiento de yoga y Pilates para la flexibilidad y el equilibrio.</p>
                    <p>Bio: Luis Miguel es un entrenador certificado con más de 15 años de experiencia en el ámbito del fitness. Ha trabajado con clientes de todas las edades y ha ayudado a muchos a mejorar su flexibilidad y equilibrio.</p>
                    <p>
                        <i class="bi bi-star-fill star"></i>
                        <i class="bi bi-star-fill star"></i>
                        <i class="bi bi-star-fill star"></i>
                        <i class="bi bi-star-half star"></i>
                        <i class="bi bi-star star"></i>
                        <span>(3.5/5)</span>
                    </p>
                </div>
                <div class="col-md-4 text-center">
                    <button class="btn btn-custom w-20 mb-3" ><a href="Error505.html">Seleccionar</a></button>
                </div>
            </div>
            <!-- Repite para los otros entrenadores -->
            <div class="row trainer-card">
                <div class="col-md-2 text-center">
                    <img src="Media/Sofia.jpg" alt="Entrenador 1" class="img-fluid">
                </div>
                <div class="col-md-6">
                    <h4>Entrenador Adriana Sofia Sanchez</h4>
                    <p>Género: Femenino</p>
                    <p>Edad: 32 años</p>
                    <p>Años de experiencia: 8 años</p>
                    <p>Especialidad: Entrenamiento de musculación y tonificación para mujeres.</p>
                    <p>Bio: Adriana Sofía es una entrenadora certificada con más de 8 años de experiencia en el ámbito del fitness. Ha trabajado con mujeres de todas las edades y ha ayudado a muchas a alcanzar sus objetivos de musculación y tonificación.</p>
                    <p>
                        <i class="bi bi-star-fill star"></i>
                        <i class="bi bi-star-fill star"></i>
                        <i class="bi bi-star-fill star"></i>
                        <i class="bi bi-star-fill star"></i>
                        <i class="bi bi-star star"></i>
                        <span>(4/5)</span>
                    </p>
                </div>
                <div class="col-md-4 text-center">
                    <button class="btn btn-custom w-20 mb-3" onclick="seleccionarEntrenador('Adriana Sofia Sanchez')">Seleccionar</button>
                </div>
            </div>
            
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="row text-center text-md-start">
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
                </footer>
            </div>
        </div>
    </footer>

    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    // Función para mostrar alerta con el entrenador seleccionado
    function seleccionarEntrenador(nombreEntrenador) {
        Swal.fire({
            icon: 'success',
            title: '¡Entrenador seleccionado!',
            text: `Has seleccionado a Adriana Sofia Sanchez.`,
            confirmButtonText: 'Aceptar',
            confirmButtonColor: '#021526'
        }).then(() => {
            window.location.href = 'MiEntrenador.html';
            // Aquí puedes agregar lógica adicional, como redireccionar a otra página
        });
    }
</script>

</body>
</html>
