<%-- 
    Document   : error404
    Created on : 1/07/2025, 7:52:47 a. m.
    Author     : Rojas
--%>

<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error 404 - Página no encontrada</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                background-color: #f2f2f2;
                font-family: Arial, sans-serif;
                text-align: center;
                display: flex;
                flex-direction: column;
                justify-content: center;
                height: 100vh;
            }

            h1 {
                font-size: 8rem;
                margin: 0;
                color: #ff4c4c;
            }

            p {
                font-size: 1.5rem;
                color: #555;
            }

            a {
                display: inline-block;
                margin-top: 20px;
                text-decoration: none;
                padding: 10px 20px;
                background-color: #0064e9;
                color: white;
                border-radius: 5px;
            }

            a:hover {
                background-color: #004bb5;
            }
        </style>
    </head>
    <body>
        <h1>404</h1>
        <p>Lo sentimos, la página que buscas no existe.</p>
        <%Usuario user = (Usuario) session.getAttribute("logger"); 
        String carpeta = (user.getRolUsuario().equals("entrenador")) ? "Entrenador/index.jsp" : "Cliente/cliente.jsp";%>
        
        <a href="${pageContext.request.contextPath}/vistas/<%=carpeta%>">Volver al inicio</a>
    </body>
</html>