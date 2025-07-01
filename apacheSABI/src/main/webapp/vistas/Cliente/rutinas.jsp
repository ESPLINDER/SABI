<% String contextPath = request.getContextPath(); %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="Modelo.Usuario" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rutinas</title>
        <link rel="stylesheet" href="<%= contextPath %>/estilos/indexCliente.css">
        <link rel="stylesheet" href="<%= contextPath %>/estilos/barranavegacion.css">
    </head>

    <body>
        <%@ include file="/plantillas/barraNavegacionCliente.jsp" %>
        
        <div class="contenido">
            <h1>¿No te gustan estas rutinas?</h1>
            <p>Aqui podras crear tu propia rutina personalizada.</p>
            <p>tambien podras crear ejercicios para agregar a tu rutina, elegir la cantidad de semanas y mucho más.</p>
            <a class="boton-accion" href="RutinaController">Crear Mi rutina</a>
        </div>
        
        <%@ include file="/plantillas/footer.jsp" %>
        
    </body>

    </html>