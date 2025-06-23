<?php
session_start();
include('conexion.php');

function calcularEdad($fechaNacimiento)
{
    $fechaNacimiento = new DateTime($fechaNacimiento);
    $hoy = new DateTime();
    $edad = $hoy->diff($fechaNacimiento);
    return $edad->y;
}

$registroExitoso = false;

if (isset($_POST['registroUsuario'])) {

    $nomUsuario = $_POST['nombre'];
    $apeUsuario = $_POST['apellido'];
    $tipoDocumento = $_POST['tipoDocumento'];
    $fechaNacimiento = $_POST['fechaNacimiento'];
    $edad = calcularEdad($fechaNacimiento);
    $idDocumento = $_POST['idDocumento'];
    $genero = $_POST['genero'];
    $ciudad = $_POST['ciudad'];
    $municipio = $_POST['municipio'];
    $email = $_POST['email'];
    $password = $_POST['password'];

    $insertar = "INSERT INTO usuario(emaUsuario, nacUsuario, edadUsuario,  pasUsuario, genUsuario, tipDocumento, docUsuario, ciuUsuario, municipioUsuario)
            VALUES ('$email','$fechaNacimiento', '$edad', '$password', '$genero', '$tipoDocumento','$idDocumento', '$ciudad', '$municipio')";
    $resultado = mysqli_query($conexion, $insertar);

    $consultar = "SELECT idUsuario FROM usuario WHERE emaUsuario = '$email' AND pasUsuario = '$password'";
    $resultadoCosulta = mysqli_query($conexion, $consultar);
    
    if ($id = mysqli_fetch_assoc($resultadoCosulta)) {
        $_SESSION['idUsuario'] = $id['idUsuario'];
    }

    if ($resultado) {
        $registroExitoso = true;
        $_SESSION['nombre'] = $nomUsuario;
        $_SESSION['apellido'] = $apeUsuario;
        $_SESSION['email'] = $email;
        header("Location: ElecciónUsuario-Entrenador.php");
        exit();
    }
}
?>