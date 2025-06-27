<% String contextPath = request.getContextPath(); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina de entrenadores</title>
        <link rel="stylesheet" href="<%= contextPath %>/estilos/indexCliente.css">
        <link rel="stylesheet" href="<%= contextPath %>/estilos/barranavegacion.css">
    </head>
    <body>
        <%@ include file="/plantillas/barraNavegacion.jsp" %>
        
        <div class="contenido">
            <%--<% if (!hayEntrenadores) { %>--%>
            <h1>Juan Felipe Melano</h1>
            <p>Esta es la descripcion del entrenador</p>
            <p>Soy entrenador fitness con 5 años de experencia en la salud y el bienestar
            del cuerpo.
            Solicitame ahora y te dare una rutina acorde a tu diagnostico</p>
            <form action="EntrenadorController" method="get">
                <button class="boton-solicitar" type="submit">Solicitar Entrenador</button>
            </form>
            <%--<% } else { %>
            <h1>!Oh no¡</h1>
            <p>Por el momento no hay entrenadores.</p>
            <a href="rutinas.jsp">haz tu propia rutina</a>
            <% }%>--%>
        </div>
    </body>
</html>
