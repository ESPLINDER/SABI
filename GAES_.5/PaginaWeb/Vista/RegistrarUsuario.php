<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>

    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <style>
        body {
            background-image: url('Media/fondoSabi.png');
            background-size: 100% auto;
            background-repeat: repeat-y;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .logo {
            margin-left: 10px; 
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
        .navbar-brand:hover, .navbar-brand:focus, .navbar-brand:active {
            color: #6EACDA; 
            text-decoration: none; 
        }
        .form-container {
            width: 100%;
            max-width: 400px;
            padding: 40px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-control,
        .form-select {
            display: block;
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        input[type="number"]::-webkit-inner-spin-button,
        input[type="number"]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
           
        }

        .form-control:focus,
        .form-select:focus {
            border-color: #80bdff;
            outline: 0;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }

        .form-control.valid {
            background-color: #d4edda;
            border-color: #63ff63;
        }

        .form-control.invalid {
            background-color: #f8d7da;
            border-color: red;
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
</head>

<body>
<nav class="navbar navbar-custom">
        <div class="container-fluid d-flex flex-column align-items-center">
            <div class="d-flex align-items-center w-100 justify-content-between row">
                <div class="col-md-2"><img src="Logo/sabi.enc" alt="Logo" width="60" height="60" class="logo"></div>
                <div class="col-md-8 text-center"><a class="navbar-brand" href="#">SABI</a></div>
                <div class="col-lg-2 text-center"></div>
            </div>
        </div>
    </nav>
    <div class="form-container my-4 mx-auto">
        <h2 class="text-center">Regístrate</h2>
        <form action="codigoVerificacion.html" method="get">
            <div class="mb-3">
                <label for="nombre" class="form-label">Nombre</label>
                <input type="text" class="form-control" id="nombre" placeholder="Nombre" required>
            </div>
            <div class="mb-3">
                <label for="apellido" class="form-label">Apellido</label>
                <input type="text" class="form-control" id="apellido" placeholder="Apellido" required>
            </div>
            <div class="mb-3">
                <label for="tipoDocumento" class="form-label">Tipo de Documento</label>
                <select class="form-select" id="tipoDocumento" aria-label="Seleccionar tipo de documento" required>
                    <option value="TI">TI</option>
                    <option value="CC">CC</option>
                    <option value="CE">CE</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="fechaNacimiento" class="form-label">Fecha de nacimiento</label>
                <input type="date" class="form-control" id="fechaNacimiento" name="age" placeholder="1924 >= 2012"
                    min="1924-01-01" max="2012-12-31" required>
            </div>
            <div class="mb-3">
                <label for="idDocumento" class="form-label">Número de Documento</label>
                <input type="number" class="form-control" id="idDocumento" placeholder="example: 12345678" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Correo</label>
                <input type="email" class="form-control" id="email" placeholder="Correo" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Contraseña</label>
                <input type="password" class="form-control" id="password" placeholder="Contraseña" required>
            </div>
            <button type="submit" class="btn btn-custom w-100 mb-3">Enviar</button>
        </form>
        <p class="text-center mt-3">¿Ya tienes cuenta?</p>
        <div class="text-center"><a href="InicioSesion.php" class="link-button">Iniciar Sesión</a></div>
    </div>
    <script>
        const fechaNacimientoInput = document.getElementById('fechaNacimiento');
        fechaNacimientoInput.addEventListener('input', () => {
            if (fechaNacimientoInput.validity.valid) {
                fechaNacimientoInput.classList.add('valid');
                fechaNacimientoInput.classList.remove('invalid');
            } else {
                fechaNacimientoInput.classList.add('invalid');
                fechaNacimientoInput.classList.remove('valid');
            }
        });
    </script>
    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>

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
</body>

</html>