<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pagina_Principal</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="Estilos/navbarEstilo.css">
    </head>
    <body>
        <header>
            <div class="left">
                <div class="brand">
                    <i class="bi bi-shop logo"></i>
                    <span class="name">El vecino Amigo</span>
                </div>
            </div>
            <div class="right">
                <a href="IndexAdmin.jsp">
                    <i class="bi bi-arrow-left"></i>
                    <span class="names">Administrador</span>
                </a>
                <a href="IndexEmpleado.jsp">
                    <i class="bi bi-arrow-left"></i>
                    <span class="names">Empleado</span>
                </a>
            </div>
            <div class="right">
                <a href="login.jsp">
                    <i class="bi bi-arrow-right"></i>
                    <span class="names">Iniciar Sesion</span>
                </a>
                <img src="recursos/user.png" alt="usuario" class="user">
            </div>
        </header>
        <script src="../Scripts/slideBar.js"></script>
    </body>
</html>