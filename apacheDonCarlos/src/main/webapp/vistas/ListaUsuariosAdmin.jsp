<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pagina_Principal</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="Estilos/navbarEstilo.css">
    </head>
    <body>
        <jsp:include page="IndexAdmin.jsp" flush="true">
        <jsp:param name="nombre"value="valor" />
        </jsp:include>
        <div>
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
                <c:forEach var="u" items="${listaUsuarios}">
                    <tr>
                        <td>${u.getIdUsuario()}</td>
                        <td>${u.getNomUsuario()}</td>
                        <td>${u.getApeUsuario()}</td>
                        <td>${u.getEmaUsuario()}</td>
                        <td>Editar - Eliminar</td>
                    </tr>
                </c:forEach> 
            </tbody>
        </div>
    </body>
</html>
