<?php
    include('conexion.php');

    if(isset($_GET['registroUsuario'])){
        if(strlen($_GET['nombre']) >= 1 &&
        strlen($_GET['apellido']) >= 1 &&
        strlen($_GET['tipoDocumneto']) >= 1 &&
        strlen($_GET['fechaNacimiento']) >= 1 &&
        strlen($_GET['idDocumento']) >= 1 &&
        strlen($_GET['email']) >= 1 &&
        strlen($_GET['password']) >= 1){
            $nombre = $_GET['nombre'];
            $apellido = $_GET['apellido'];
            $tipoDocumneto = $_GET['tipoDocumneto'];
            $fechaNacimiento = $_GET['fechaNacimiento'];
            $idDocumento = $_GET['idDocumento'];
            $email = $_GET['email'];
            $password = $_GET['password'];

            $Insertar = "INSERT INTO `usuario`(`emaUsuario`, `nacUsuario`, `pasUsuario`, `tipDocumento`, `docUsuario`)
            VALUES ('$email','$fechaNacimiento','$password','$tipoDocumneto','$idDocumento')";
            
            $resultado = mysqli_query($conexion,$registrar);
        }
    }
?>