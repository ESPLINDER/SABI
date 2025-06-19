<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pagina_Principal</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="Estilos/navbarEstilo.css">
        <link rel="Stylesheet" href="Estilos/contenido.css">
    </head>
    <body>
        <header>
            <div class="left">
                <div class="brand">
                    <i class="bi bi-shop logo"></i>
                    <span class="name">El Vecino Amigo</span>
                </div>
            </div>
            <div class="right">
                <a href="index.jsp">
                    <i class="bi bi-arrow-return-left"></i>
                    <span class="names">Regresar</span>
                </a>
                <a href="#">
                    <i class="bi bi-plus"></i>
                    <span class="names">Cliente</span>
                </a>
                <a href="#">
                    <i class="bi bi-plus"></i>
                    <span class="names">Credito</span>
                </a>
                <div class="right">
                    <a href="#" class="d-flex align-items-center">
                        <i class="bi bi-people"></i>
                        <span class="names">Clientes</span>
                    </a>
                </div>
                <img src="recursos/admin.jpg" alt="usuario" class="user">
                <span class="names">Administrador</span>
            </div>
        </header>
        <div class="sidebar">
            <ul>
                <li>
                    <a href="#">
                        <i class="bi bi-cash-stack"></i>
                        <span class="names">Pagos</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="bi bi-coin"></i>
                        <span class="names">Creditos</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class="bi bi-basket"></i>
                        <span class="names">Productos</span>
                    </a>
                </li>
                <li>
                <body>
                    <a href="#">
                        <i class="bi bi-people"></i>
                        <span class="names">clientes</span>
                    </a>
                    </li>
                <li>
                    <a href="#">
                        <i class="bi bi-exclamation-circle"></i>
                        <span class="names">reportes</span>
                    </a>
                </li>
            </ul>
        </div>

        <%--Aqui empieza el contenido--%>
        <div class="contenido">
            <<h1>Lista de Usuarios</h1>
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
                <c:forEach var="u" items="${lista_usu}">
                    <tr>
                        <td>${u.getIdUsuario()}</td>
                        <td>${u.getNomUsuario()}</td>
                        <td>${u.getApeUsuario()}</td>
                        <td>${u.getEmaUsuario()}</td>
                        <td>Editar - Eliminar</td>
                    </tr>
                </c:forEach> 
                </tbody>
            </table>
            </div>
        </div>
    </body>
</html>
