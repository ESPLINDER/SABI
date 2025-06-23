<?php
session_start();
include('conexion.php');

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = $_POST['email'];
    $password = $_POST['password'];

    $sqlUsuario = "SELECT * FROM usuario WHERE emaUsuario = '$email' AND pasUsuario = '$password'";
    $resultadoUsuario = mysqli_query($conexion, $sqlUsuario);

    if ($usuario = mysqli_fetch_assoc($resultadoUsuario)) {
        $idUsuario = $usuario['idUsuario'];

        $sqlEntrenador = "SELECT * FROM entrenador WHERE fkIdUsuario = '$idUsuario'";
        $resultadoEntrenador = mysqli_query($conexion, $sqlEntrenador);

        if ($entrenador = mysqli_fetch_assoc($resultadoEntrenador)) {
            $_SESSION['tipo'] = 'entrenador';
            $_SESSION['nombre'] = $entrenador['nomEntrenador'];
            $_SESSION['idUsuario'] = $entrenador['fkIdUsuario'];

            header("Location: ../vista/Entrenador/PaginaPrincipalEntrenador.php");
            exit();
        }

        $sqlCliente = "SELECT * FROM cliente WHERE fkIdUsuario = '$idUsuario'";
        $resultadoCliente = mysqli_query($conexion, $sqlCliente);

        if ($cliente = mysqli_fetch_assoc($resultadoCliente)) {
            $_SESSION['tipo'] = 'cliente';
            $_SESSION['nombre'] = $cliente['nomCliente'];
            $_SESSION['idUsuario'] = $cliente['fkIdUsuario'];

            header("Location: ../vista/Cliente/Pagina Principal.php");
            exit();
        }

        echo "No tienes asignado un rol válido.";
    } else {
        echo "Correo o contraseña incorrectos.";
    }
}
?>
