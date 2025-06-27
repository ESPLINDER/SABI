<% String contextPath = request.getContextPath(); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina principal del cliente</title>
        <link rel="stylesheet" href="<%= contextPath %>/estilos/indexCliente.css">
        <link rel="stylesheet" href="<%= contextPath %>/estilos/barranavegacion.css">
    </head>
    <body>
        <jsp:include page="/plantillas/barraNavegacion.jsp" />

        <div class="contenido">
            <h1>¡Hola Juan Garzon!</h1>

            <%--<% if (!tieneDiagnostico) { %>--%>
            <p>Aún no tienes un diagnóstico inicial.</p>
            <p>¿Te gustaría realizarlo ahora para que puedas diseñar tu rutina personalizada?</p>
            <form action="DiagnosticoController" method="get">
                <button class="boton-diagnostico" type="submit">Realizar diagnóstico</button>
            </form>
            <%--<% } else { %>
            <p>Ya tienes un diagnóstico registrado.</p>
            <a href="verDiagnostico.jsp">Ver mi diagnóstico</a>
            <% }%>--%>
        </div>
    </body>
</html>
