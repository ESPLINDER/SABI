<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, Modelo.Usuario" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Usuarios</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
        <link rel="Stylesheet" href="Estilos/contenido.css">
        <link rel="stylesheet" href="Estilos/navbarEstilo.css">
    </head>
    <body>
        <%--Aqui Insertamos el dasboard--%>
        <%@ include file="../plantillas/DashAdminController.jsp" %>
        
        <%--Aqui empieza el contenido--%>
        <div class="contenido">
            <h1>Lista de Usuarios</h1>
            <button class="boton-agregar"><a class="nav-link active" href="vistas/formAgregarUsuario.jsp">Agregar</a></button>
            <div class="tabla">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Email</th>
                            <th>Opciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<Modelo.Usuario> lista_usu = (List<Modelo.Usuario>) request.getAttribute("lista_usu");
                            if (lista_usu != null && !lista_usu.isEmpty()) {
                                for (Modelo.Usuario u : lista_usu) {
                        %>
                        <tr>
                            <td><%= u.getIdUsuario()%></td>
                            <td><%= u.getNomUsuario()%></td>
                            <td><%= u.getApeUsuario()%></td>
                            <td><%= u.getEmaUsuario()%></td>
                            <td><button class="boton boton-editar">Editar</button><button class="boton boton-eliminar">Eliminar</button></td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="2">No hay usuarios registrados</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
