<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error 404 - Página no encontrada</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <style>
        body {
            background-color: #E2E2B6; 
            color: black; 
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .container {
            text-align: center;
        }
        .error-title {
            font-size: 10rem;
            font-weight: bold;
            color: #E2E2B6; 
            animation: bounce 2s infinite, colorChange 5s infinite alternate;
        }
        .error-message {
            font-size: 2rem;
            margin-bottom: 30px;
        }
        .error-illustration img {
            width: 300px; 
            height: auto;
            margin-bottom: 20px;
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
            text-decoration: none; 
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
        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-30px);
            }
            60% {
                transform: translateY(-15px);
            }
        }
        @keyframes colorChange {
            0% { color: #142552; }
            25% { color: #133E87}
            50% {color:  #608BC1}
            75% {color: #87b8e2}
            100% { color: #ffffffee; }
        }
    </style>
</head>
<body>
    
    <div class="container">
        <div class="error-illustration">
            <img src="Gifs/error 404 2.gif" alt="GIF de error 404 GYM"> 
        </div>
        <div class="error-title">404</div>
        <div class="error-message">Página no encontrada</div>
        <p>Ups, parece que te has perdido en tu rutina. No te preocupes, vuelve a la página principal para seguir entrenando.</p>
        <a href="Paginas principal AIS.html" class="btn btn-custom w-50 mb-3">Regresar a la página principal</a>
    </div>
    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
