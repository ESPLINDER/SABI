<?php
session_start();
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <title>Acceso Denegado</title>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8d7da;
            color: #721c24;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            font-family: Arial, sans-serif;
        }

        .denegado-container {
            text-align: center;
            background-color: #fff;
            border: 2px solid #f5c6cb;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .denegado-container h1 {
            font-size: 2.5rem;
            margin-bottom: 20px;
            color: #dc3545;
        }

        .btn-custom {
            margin: 10px;
            padding: 10px 25px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
        }

        .btn-inicio {
            background-color: #007bff;
            color: white;
        }

        .btn-salir {
            background-color: #dc3545;
            color: white;
        }

        .btn-inicio:hover,
        .btn-salir:hover {
            opacity: 0.8;
        }
    </style>
</head>

<body>
    <div class="denegado-container">
        <h1>Acceso Denegado</h1>
        <p>No tienes permiso para acceder a esta página.</p>

        <a href="InicioSesion.php" class="btn btn-custom btn-inicio">Ir al inicio</a>
        <a href="../controlador/logOut.php" class="btn btn-custom btn-salir">Cerrar sesión</a>
    </div>
</body>
</html>