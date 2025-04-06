<?php
if (!empty($_POST["AgregarSerie"])) {
    if (!empty($_POST["Peso"]) and !empty($_POST["Repeticiones"])) {
        $Peso=$_POST["Peso"];
        $Repeticiones=$_POST["Repeticiones"];

        $sql=$conexion->query(" INSERT INTO ejercicio_rutina values (1, 2, 1, $Repeticiones, 1, 1, 1, 30, 'alta')");
    } else {
        echo "Alguno de los campos esta vacio";
    }
}
?>