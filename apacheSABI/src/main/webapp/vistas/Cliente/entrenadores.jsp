<% String contextPath = request.getContextPath(); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Modelo.Usuario" %>
<%
    List<Usuario> entrenadores = (List<Usuario>) request.getAttribute("entrenadores");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina de entrenadores</title>
        <link rel="stylesheet" href="<%= contextPath%>/estilos/indexCliente.css">
        <link rel="stylesheet" href="<%= contextPath%>/estilos/barranavegacion.css">
    </head>
    <body>
        <%@ include file="/plantillas/barraNavegacionCliente.jsp" %>

        <div class="contenido-entrenadores">
            <%
                if (entrenadores != null && !entrenadores.isEmpty()) {
                    for (Usuario entrenador : entrenadores) {
            %>
            <div class="contenido-entrenador">
                <h1><%= entrenador.getNomUsuario() + " " + entrenador.getApeUsuario()%></h1>
                <img src="<%= request.getContextPath()%>/recursos/fotoPerfil.png" alt="">
                <p><%= entrenador.getEspecialidad()%></p>
                <p><%= entrenador.getBiografia()%></p>
                <a class="boton-accion" href="<%= request.getContextPath() %>/SuscripcionController?menu=Suscripciones&accion=Agregar&idCliente=<%= cliente.getIdUsuario() %>&idEntrenador=<%= entrenador.getIdUsuario() %>">
                    Solicitar Entrenador
                </a>
            </div>
            <%
                }
            } else {
            %>
            <div class="contenido-entrenador">
                <h1>¡Oh no!</h1>
                <p>Por el momento no hay entrenadores disponibles.</p>
                <a href="rutinas.jsp">Haz tu propia rutina</a>
            </div>
            <%
                }
            %>
        </div>
        
        <%@ include file="/plantillas/footer.jsp" %>
        
    </body>
</html>
