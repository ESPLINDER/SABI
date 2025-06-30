<% String contextPath = request.getContextPath();%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="Modelo.Usuario" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina principal del cliente</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <link rel="stylesheet" href="<%= contextPath%>/estilos/indexCliente.css">
        <link rel="stylesheet" href="<%= contextPath%>/estilos/barranavegacion.css">
    </head>
    <body>
        <%@ include file="/plantillas/barraNavegacionCliente.jsp" %>

        <div class="contenido">
            <h1>¡Hola <%= cliente.getNomUsuario() %> <%= cliente.getApeUsuario() %>!</h1>
            <p>Aún no tienes un diagnóstico inicial.</p>
            <p>¿Te gustaría realizarlo ahora para que puedas diseñar tu rutina personalizada?</p>
            <a class="boton-accion" href="DiagnosticoController">Realizar Diagnostico</a>
        </div>

        <div class="contenido-estadisticas">
            <div class="encabezado">
                <h1>Estas son tus estadísticas</h1>
            </div>
            <div class="grupo-estadisticas">
                <div class="estadistica">
                    <h2><i class="fa-solid fa-weight-scale"></i> Peso</h2>
                    <h3>83 kg</h3>
                </div>
                <div class="estadistica">
                    <h2><i class="bi bi-person-walking"></i> Niveles de actividad física</h2>
                    <h3>Sedentario</h3>
                </div>
                <div class="estadistica">
                    <h2><i class="bi bi-moisture"></i> Nivel de Hidratación</h2>
                    <h3>Menos de un litro</h3>
                </div>
                <div class="estadistica">
                    <h2><i class="bi bi-x-octagon"></i> Aqui Estadistica</h2>
                    <h3>descripcion</h3>
                </div>
                <div class="estadistica">
                    <h2><i class="bi bi-x-octagon"></i> Aqui Estadistica</h2>
                    <h3>descripcion</h3>
                </div>
            </div>
            <div>
                <a class="boton-diagnostico" href="DiagnosticoController">Actualizar Estadísticas</a>
            </div>
        </div>
    </body>
</html>