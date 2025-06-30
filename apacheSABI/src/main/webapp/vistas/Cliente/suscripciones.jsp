<% String contextPath = request.getContextPath(); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Modelo.Suscripcion" %>
<%@ page import="Modelo.Usuario" %>
<%
    List<Suscripcion> listSuscripciones = (List<Suscripcion>) request.getAttribute("listSuscripciones");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Suscripciones</title>
        <link rel="stylesheet" href="<%= contextPath%>/estilos/indexCliente.css">
        <link rel="stylesheet" href="<%= contextPath%>/estilos/barranavegacion.css">
    </head>
    <body>
        <%@ include file="/plantillas/barraNavegacionCliente.jsp" %>
            
        <div class="contenido-entrenadores">
            
            <%
                if (listSuscripciones != null && !listSuscripciones.isEmpty()) {
                    for (Suscripcion suscripcion : listSuscripciones) {
            %>
            <div class="contenido-entrenador">
                <h1>Suscripcion con tu entrenador <%= suscripcion.getEntrenador().getNomUsuario() %> <%= suscripcion.getEntrenador().getApeUsuario() %></h1>
                <h2>Valor de la suscripcion</h2>
                <p><%= suscripcion.getValorSuscripcion()%></p>
                <h2>Esta es tu fecha de inicio de la suscripcion</h2>
                <p><%= suscripcion.getInicioSuscripcion()%></p>
                <h2>Esta es tu fecha de finalizacion de la suscripcion</h2>
                <p><%= suscripcion.getFinSuscripcion()%></p>
                <p>Recuerda renovar tu suscripcion una vez termianda para continuar con tu entrenador.</p>
                <a class="boton-accion" href="#">Pagar Suscripcion</a>
            </div>
            <%
                }
            } else {
            %>
            <div class="contenido-entrenador">
                <h1>¡Oh no!</h1>
                <p>el id del cliente es <%= cliente.getIdUsuario() %></p>
                <p>Aun no tienes ninguna Suscripcion</p>
                <p>Puedes ir a solicitar un entrenador para tener una suscripcion</p>
                <a href="<%= request.getContextPath()%>/EntrenadorController">Ver Entrenadores</a>
            </div>
            <%
                }
            %>
        </div>
    </body>
</html>
