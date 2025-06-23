<?php
session_start();
if (isset($_SESSION['error'])) {
    echo "<p style='color:red'>" . $_SESSION['error'] . "</p>";
    unset($_SESSION['error']);
    
}
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
    <title>Página de Inicio de Sesión</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <style>
        @font-face {
            font-family: 'Bonello-Regular';
            src: url('Fonts/Bonello-Regular.otf') format('opentype');
        }

        body {
            background-image: url('Media/fondoSabi.png');
            background-size: cover;
            background-position: center;
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

        .navbar-brand:hover,
        .navbar-brand:focus,
        .navbar-brand:active {
            color: #6EACDA;
            text-decoration: none;
        }

        .login-container {
            background-color: #fff;
            border: 5px solid #021526;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 100%;
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
            background: linear-gradient(45deg, #021526, #03346E, #6EACDA, #E2E2B6, #E2E2B6, #6EACDA, #03346E, #021526, #03346E, #6EACDA, #E2E2B6);
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
            0% {
                background-position: 0 0;
            }

            50% {
                background-position: 200% 0;
            }

            100% {
                background-position: 0 0;
            }
        }

        .content-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding-top: 50px;
        }

        .volver-button-container {
            margin-top: 10px;
            text-align: left;
            display: flex;
            justify-content: start;
        }

        .logo {
            margin-left: 10px;
        }

        .text-link {
            display: block;
            text-align: center;
            text-decoration: none;
            color: #000;
            margin-top: 10px;
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

        .footer-column {
            margin-bottom: 20px;
        }
    </style>
    </style>
</head>

<body>
    <nav class="navbar navbar-custom">
        <div class="container-fluid d-flex flex-column align-items-center">
            <div class="d-flex align-items-center w-100 justify-content-between row">
                <div class="col-md-2"><img src="media/logoNuevo.png" alt="Logo" width="60" height="60" class="logo"></div>
                <div class="col-md-8 text-center"><a class="navbar-brand" href="index.php">SABI</a></div>
                <div class="col-lg-2 text-center"></div>
            </div>
        </div>
    </nav>

    <div class="content-container my-4">
        <div class="login-container text-center">
            <h2 class="mb-4">Inicio de sesión</h2>

            <!-- Formulario de inicio de sesion -->
            <form method="POST" id="iniciarSesion" action="../Controlador/inicioSesionControl.php">
                <div class="mb-3 text-start">
                    <label for="email" class="form-label">Correo</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Correo" required>
                </div>
                <div class="mb-4 text-start">
                    <label for="password" class="form-label">Contraseña</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Contraseña" required>
                </div>
                <button type="summit" class="btn btn-custom w-100 mb-3" onclick="handleLogin()">Iniciar sesión</button>
            </form>

            <a href="CorreoRecuperacion.HTML" class="text-decoration">¿Olvidó su contraseña?</a>
            <p class="text-center mt-3">¿No tiene cuenta?</p>
            <a href="RegistrarUsuario.php" class="text-decoration">Regístrese</a>
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
    </footer>


    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
        document.getElementById("loginForm").addEventListener("submit", function(event) {
            event.preventDefault();

            const email = document.getElementById("email").value;
            const password = document.getElementById("password").value;

            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            if (!emailRegex.test(email)) {
                alert("Correo no Valido");
                return;
            }
            if (password.length < 8) {
                alert("La contraseña debe tener al menos 8 caracteres");
                return;
            }
            if (password === 'cliente123') {
                window.location.href = 'cliente/Pagina principal.php'; // Redirige si la contraseña es cliente123

            } else if (password === 'entrenador123') {
                window.location.href = 'entrenador/PaginaPrincipalEntrenador.php'; // Redirige si la contraseña es entrenador123
            } else {
                alert('La Contraseña es incorrecta');
            }
        });
    </script>
</body>

</html>