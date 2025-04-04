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
        .main-content {
            background-color: #E2E2B6;
            color: #021526;
            padding: 30px;
            text-align: center;
        }
        .card {
            border: none;
            background-color: #6EACDA;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .card img {
            width: 350px; /* Aumentamos el tamaño de la imagen */
            height: 350px; /* Aseguramos que la imagen sea cuadrada */
            margin: 20px auto 10px;
        }
        .card-body {
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
            border: 2px solid black;
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
            0% { background-position: 0 0; }
            50% { background-position: 200% 0; }
            100% { background-position: 0 0; }
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
                </div>
            </div>
        </div>
        </nav>
   

    <div class="main-content">
        <h1 class="mb-4">¿QUÉ DESEAS HACER?</h1>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="card text-center">
                        <img src="Media/Entrenar.jpg" alt="Usuario" class="card-img-top">
                        <div class="card-body">
                            <h5 class="card-title">Entrenar</h5>
                            <p class="card-text">Selecciona esta opción si deseas seguir un plan de entrenamiento personalizado y mejorar tu forma física.</p>
                            <a href="FormularioDiagnostico.html" class="btn btn-custom w-10 mb-3">Seleccionar</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card text-center">
                        <img src="Media/Entrenador.jpg" alt="Ser Entrenador" class="card-img-top">
                        <div class="card-body">
                            <h5 class="card-title">Ser Entrenador</h5>
                            <p class="card-text">Selecciona esta opción si quieres crear entrenamientos y guiar a otros en su camino hacia el bienestar.</p>
                            <a href="RegistroEntrenador.html" class="btn btn-custom w-10 mb-3">Seleccionar</a>
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
                <div>
                    <a href="#" class="text-light mx-2"><i class="bi bi-instagram"></i></a>
                    <a href="#" class="text-light mx-2"><i class="bi bi-facebook"></i></a>
                    <a href="#" class="text-light mx-2"><i class="bi bi-youtube"></i></a>
                    <a href="#" class="text-light mx-2"><i class="bi bi-twitter"></i></a>
                </div>
            </div>
        </div>
    </footer>
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
