<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Modelo.Usuario" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Error 500 - Error Interno</title>
    <style>
        body {
            background-color: #fbe9e7;
            font-family: Arial, sans-serif;
            text-align: center;
            padding-top: 100px;
            color: #d32f2f;
        }

        h1 {
            font-size: 60px;
        }

        p {
            font-size: 20px;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            background-color: #d32f2f;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
        }

        a:hover {
            background-color: #b71c1c;
        }
    </style>
</head>
<body>
    <h1>500</h1>
    <p>¡Oops! Algo salió mal en el servidor.</p>

    <%
        Usuario user = (Usuario) session.getAttribute("logger");
        String carpeta;
        if (user != null) {
            if ("entrenador".equalsIgnoreCase(user.getRolUsuario())) {
                carpeta = "Entrenador/index.jsp";
            } else {
                carpeta = "Cliente/cliente.jsp";
            }
        } else {
            // Si no hay usuario logueado, manda a home general o login
            carpeta = "index.jsp";
        }
        String contextPath = request.getContextPath();
    %>

    <a href="<%= contextPath %>/vistas/<%= carpeta %>">Volver al inicio</a>
</body>
</html>
