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
        <title>Suscripciones cliente</title>
        <link rel="stylesheet" href="<%= contextPath%>/estilos/indexCliente.css">
        <link rel="stylesheet" href="<%= contextPath%>/estilos/barranavegacion.css">
    </head>
    <body>
        <%@ include file="/plantillas/barraNavegacionCliente.jsp" %>

        <div class="contenido-suscripciones">

            <%                if (listSuscripciones != null && !listSuscripciones.isEmpty()) {
                    for (Suscripcion suscripcion : listSuscripciones) {
            %>
            <div class="contenido-suscripcion">
                <div class="encabezado-suscripcion">
                    <h1>Suscripcion con tu entrenador <%= suscripcion.getEntrenador().getNomUsuario()%> <%= suscripcion.getEntrenador().getApeUsuario()%></h1>
                </div>                
                <div class="fechas-suscripcion">
                    <div class="fecha">
                        <h2>Fecha de inicio</h2>
                        <p><%= suscripcion.getInicioSuscripcion()%></p>
                    </div>
                    <div class="fecha">
                        <h2>Fecha de finalizacion</h2>
                        <p><%= suscripcion.getFinSuscripcion()%></p>
                    </div>
                </div>
                <div class="datos-suscripcion">
                    <h2>Estado de la Suscripcion</h2>
                    <p class="verde"><%= suscripcion.getEstadoSuscripcion()%></p>
                </div>
                <%
                    if (suscripcion.getEstadoSuscripcion().equals("inactiva")) {
                %>
                <div class="datos-suscripcion">
                    <h2>Valor de la suscripcion</h2>
                    <p>Aun esta por definirse.</p>
                    <br>
                    <p>Cuando tu entrenador defina un precio a tu suscripcion se te habilitara el pago</p>
                    <a class="boton-accion-inactivo" href="">Pagar Suscripcion</a>
                </div>
                <%
                } else if (suscripcion.getEstadoSuscripcion().equals("activa") && suscripcion.getEstadoPagoSuscripcion().equals("inactivo")) {
                %>
                <div class="datos-suscripcion">
                    <h2>Valor de la suscripcion</h2>
                    <p><%= suscripcion.getValorSuscripcion()%></p>
                    <br>
                    <p>Ya se te asigno un precio a tu rutina, ya puedes pagarla.</p>
                    <a class="boton-accion" href="SuscripcionController?menu=Suscripciones&accion=PagarSuscripcion&idSuscripcion=<%= suscripcion.getIdSuscripcion() %>">Pagar Suscripcion</a>

                </div>
                <%
                } else {
                %>
                <div class="datos-suscripcion">
                    <h2>Valor de la suscripcion</h2>
                    <p><%= suscripcion.getValorSuscripcion()%></p>
                    <br>
                    <p>Tu suscripcion se encuentra ACTIVA, recuerda renovarla cuando esta termine.</p>
                </div>                
                <%
                    }
                %>
            </div>
            <%
                }
            } else {
            %>
            <div class="contenido-entrenador">
                <h1>¡Oh no!</h1>
                <p>Aun no tienes ninguna Suscripcion</p>
                <p>Puedes ir a solicitar un entrenador para tener una suscripcion</p>
                <a href="<%= request.getContextPath()%>/EntrenadorController">Ver Entrenadores</a>
            </div>
            <%
                }
            %>
        </div>
        
        <%@ include file="/plantillas/footer.jsp" %>
        
    </body>
</html>
