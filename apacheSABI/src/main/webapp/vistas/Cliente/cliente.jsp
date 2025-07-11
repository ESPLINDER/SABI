<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="Modelo.Usuario" %>
<%@ page import="Modelo.Diagnostico" %>

<%
    String contextPath = request.getContextPath();
    Diagnostico diagnostico = (Diagnostico) request.getAttribute("diagnostico");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pagina principal del cliente</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link rel="stylesheet" href="<%= contextPath %>/estilos/indexCliente.css">
    </head>
    <body>
        <%@ include file="/plantillas/barraNavegacionCliente.jsp" %>

    <div class="contenido">
        <h1>¡Hola <%= cliente.getNomUsuario() %> <%= cliente.getApeUsuario() %>!</h1>

        <% if (diagnostico == null) { %>
            <p>Aún no tienes un diagnóstico inicial.</p>
            <p>¿Te gustaría realizarlo ahora para que puedas diseñar tu rutina personalizada?</p>
            <a class="boton-accion" href="<%= contextPath %>/DiagnosticoController?action=mostrarFormulario">Realizar Diagnóstico</a>
        <% } else { %>
            <p>Fecha de Diagnóstico: <%= diagnostico.getFechaDiagnostico() %></p>
            <p>Próximo Diagnóstico: <%= diagnostico.getProxDiagnostico() %></p>
            <p>Peso: <%= diagnostico.getPeso() %> kg</p>
            <p>Nivel de Actividad Física: <%= diagnostico.getNivelActividadFisica() %></p>
            <p>Nivel de Hidratación: <%= diagnostico.getNivelHidratacion() %></p>
            <a class="boton-accion" href="<%= contextPath %>/DiagnosticoController?action=editarDiagnostico&idDiagnostico=<%= diagnostico.getIdDiagnostico() %>">Actualizar Diagnóstico</a>
        <% } %>
    </div>
        <%@ include file="/plantillas/footer.jsp" %>
</body>
</html>
