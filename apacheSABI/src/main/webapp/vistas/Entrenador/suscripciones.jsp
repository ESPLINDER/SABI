<% String contextPath = request.getContextPath(); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Modelo.Suscripcion" %>
<%@ page import="Modelo.Usuario" %>
<%
    List<Suscripcion> listSuscripciones = (List<Suscripcion>) request.getAttribute("listSuscripcionesEntrenador");
    Object reporteObj = request.getAttribute("reporte");
    System.out.println("cantida de clientes que llegan" + reporteObj);
    int reporteClientes = 0;

    if (reporteObj != null) {
        reporteClientes = (int) reporteObj;
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Suscripciones Entrenador</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <link rel="stylesheet" href="<%= contextPath %>/estilos/indexCliente.css">
    </head>
    <body>
        <%@ include file="/plantillas/dashEntrenador.jsp" %>

        <div class="contenido-suscripciones">

            <%                if (listSuscripciones != null && !listSuscripciones.isEmpty()) {
                    for (Suscripcion suscripcion : listSuscripciones) {
            %>
            <div class="contenido-suscripcion">
                <div class="encabezado-suscripcion">
                    <i class="bi bi-bookmark-check-fill"></i>
                    <h1>Suscripcion con tu cliente <%= suscripcion.getEntrenador().getNomUsuario()%> <%= suscripcion.getEntrenador().getApeUsuario()%></h1>
                </div>                
                <div class="fechas-suscripcion">
                    <div class="fecha">
                        <h2><i class="bi bi-calendar-check"></i> Fecha de inicio</h2>
                        <p><%= suscripcion.getInicioSuscripcion()%></p>
                    </div>
                    <div class="fecha">
                        <h2><i class="bi bi-calendar-check"></i> Fecha de finalizacion</h2>
                        <p><%= suscripcion.getFinSuscripcion()%></p>
                    </div>
                </div>
                <div class="datos-suscripcion">
                    <h2><i class="bi bi-circle-fill" style="color: #004bb5;"></i> Estado de la Suscripcion</h2>
                    <p class="verde"><%= suscripcion.getEstadoPagoSuscripcion()%></p>
                </div>
                <%
                    if (suscripcion.getEstadoSuscripcion().equals("inactiva")) {
                %>
                <div class="datos-suscripcion">
                    <h2><i class="bi bi-coin"></i> Precio de la suscripcion</h2>
                    <p>Aun no lo has definido.</p>
                    <br>
                    <p>Asignale un precio a la suscripcion y/o edita la fecha de finalizacion</p>
                    <p>y activala para que tu cliente la pueda pagar.</p>
                    <div class="botones">
                        <a class="boton-accion" href="<%= contextPath%>/SuscripcionController?menu=Suscripciones&accion=Editar&idSuscripcion=<%= suscripcion.getIdSuscripcion()%>"><i class="bi bi-pencil-square"></i> Editar Suscripcion</a>
                        <a class="boton-accion-eliminar" 
                           href="#"
                           data-id="<%= suscripcion.getIdSuscripcion()%>">
                            <i class="bi bi-trash-fill"></i> Eliminar
                        </a>
                    </div>
                </div>
                <%
                } else if (suscripcion.getEstadoSuscripcion().equals("activa") && suscripcion.getEstadoPagoSuscripcion().equals("inactivo")) {
                %>
                <div class="datos-suscripcion">
                    <h2><i class="bi bi-coin"></i> Precio de la suscripcion</h2>
                    <p><%= suscripcion.getValorSuscripcion()%></p>
                    <br>
                    <p>La suscripcion ya quedo activa</p>
                    <p>Aun falta que tu cliente la pague para que este Activa</p>
                    <div class="botones">
                        <a class="boton-accion" href="<%= contextPath%>/SuscripcionController?menu=Suscripciones&accion=Editar&idSuscripcion=<%= suscripcion.getIdSuscripcion()%>"><i class="bi bi-pencil-square"></i> Editar Suscripcion</a>
                        <a class="boton-accion-eliminar" 
                           href="#"
                           data-id="<%= suscripcion.getIdSuscripcion()%>">
                            <i class="bi bi-trash-fill"></i> Eliminar
                        </a>
                    </div>
                </div>
                <%
                } else {
                %>
                <div class="datos-suscripcion">
                    <h2><i class="bi bi-coin"></i> Precio de la suscripcion</h2>
                    <p><%= suscripcion.getValorSuscripcion()%></p>
                    <br>
                    <p>La suscripcion se encuentra ACTIVA, el cliente ya realizo el pago.</p>
                    <div class="botones">
                        <a class="boton-accion" href="<%= contextPath%>/SuscripcionController?menu=Suscripciones&accion=Editar&idSuscripcion=<%= suscripcion.getIdSuscripcion()%>"><i class="bi bi-pencil-square"></i> Editar Suscripcion</a>
                        <a class="boton-accion-eliminar" 
                           href="#"
                           data-id="<%= suscripcion.getIdSuscripcion()%>">
                            <i class="bi bi-trash-fill"></i> Eliminar
                        </a>
                    </div>
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
                <p>Cuando un cliente te solicite aqui apareceran su suscripcion.</p>
            </div>
            <%
                }
            %>
        </div>


        <%  Modelo.Suscripcion SuscripcionEditar = (Suscripcion) request.getAttribute("suscripcionEditar");
            String idSuscripcion = (SuscripcionEditar != null) ? String.valueOf(SuscripcionEditar.getIdSuscripcion()) : "";
            String finSuscripcion = (SuscripcionEditar != null && SuscripcionEditar.getFinSuscripcion() != null) ? SuscripcionEditar.getFinSuscripcion().toString() : "";
            String estadoSuscripcion = (SuscripcionEditar != null) ? String.valueOf(SuscripcionEditar.getEstadoSuscripcion()) : "";
            String valorSuscripcion = (SuscripcionEditar != null) ? String.valueOf(SuscripcionEditar.getValorSuscripcion()) : "";
        %>
        <%----- modal ------%>
        <div class="modal fade" id="editarUsuario" aria-labelledby="editarUsuarioLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">

                    <div class="modal-header">
                        <h5 class="modal-title" id="editarSuscripcionLabel">Editar Suscripcion</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                    </div>

                    <div class="modal-body">
                        <form id="edicionSuscripcion" action="SuscripcionController">
                            <input type="hidden" name="menu" value="Suscripciones">
                            <input type="hidden" name="accion" value="Actualizar">
                            <input type="hidden" name="idSuscripcion" value="<%= idSuscripcion%>">
                            <div class="form-group">
                                <label for="finSuscripcion">Fin de suscripcion</label>
                                <input name="finSuscripcion" type="date" class="form-control" value="<%= finSuscripcion%>">
                            </div>
                            <div class="form-group">
                                <label for="estadoSuscripcion">Estado de la Suscripcion</label>
                                <select name="estadoSuscripcion" class="form-control" id="estadoSuscripcion" required>
                                    <option value="<%= estadoSuscripcion%>"><%= estadoSuscripcion%></option>
                                    <option value="activa">activa</option>
                                    <option value="inactiva">inactiva</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="nomUsuario">Precio Suscripcion</label>
                                <input name="valorSuscripcion" type="text" class="form-control" id="valorSuscripcion" value="<%= valorSuscripcion%>" required>
                            </div>                             
                        </form>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-primary" form="edicionSuscripcion">Guardar cambios</button>
                    </div>

                </div>
            </div>
        </div>
        <div class="reporte">
            <h3>Clientes en Bogotá</h3>
            <p><%= reporteClientes%></p>
        </div>


        <%@ include file="/plantillas/footer.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>

        <% if (SuscripcionEditar != null) {
                System.out.println("el objeto no esta vacio");%>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var modalElement = document.getElementById('editarUsuario');
                if (modalElement) {
                    var modal = new bootstrap.Modal(modalElement);
                    modal.show();
                }
            });
        </script>
        <%} else {
            System.out.println("el objeto esta vacio");
        %>  <script></script> <%
            }%>
        <script>
            const contextPath = '<%= request.getContextPath()%>'; // Asegúrate que esto no esté vacío

            document.addEventListener("DOMContentLoaded", function () {
                const botonesEliminar = document.querySelectorAll(".boton-accion-eliminar");

                botonesEliminar.forEach(boton => {
                    boton.addEventListener("click", function (e) {
                        e.preventDefault();

                        const id = this.getAttribute("data-id");
                        console.log("ID de suscripción:", id); // Para depurar
                        console.log("contextPath:", contextPath);

                        if (!id) {
                            console.error("No se encontró ID de la suscripción");
                            return;
                        }

                        const url = `${contextPath}/SuscripcionController?menu=Suscripciones&accion=Eliminar&idSuscripcion=${id}`;
                                        console.log("URL generada:", url);

                                        Swal.fire({
                                            title: '¿Estás seguro?',
                                            text: "Esta acción no se puede deshacer.",
                                            icon: 'warning',
                                            showCancelButton: true,
                                            confirmButtonColor: '#d33',
                                            cancelButtonColor: '#3085d6',
                                            confirmButtonText: 'Sí, eliminar',
                                            cancelButtonText: 'Cancelar'
                                        }).then((result) => {
                                            if (result.isConfirmed) {
                                                window.location.href = url;
                                            }
                                        });
                                    });
                                });
                            });
        </script>



        <% String mensaje = request.getParameter("mensaje"); %>
        <% if ("eliminado".equals(mensaje)) { %>
        <script>
            Swal.fire({
                title: '¡Eliminado!',
                text: 'La suscripción ha sido eliminada correctamente.',
                icon: 'success',
                confirmButtonText: 'Aceptar'
            });
        </script>
        <% }%>

    </body>
</html>
