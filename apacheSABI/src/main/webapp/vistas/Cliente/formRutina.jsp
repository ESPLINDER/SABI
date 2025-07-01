<%@page import="Modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Maximos"%>
<%@page import="Modelo.Ejercicio_Rutina"%>
<% String contextPath = request.getContextPath();%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT"
              crossorigin="anonymous">
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
        <title>Crea tu rutina</title>
        <link rel="stylesheet" href="<%= contextPath%>/estilos/formRutina.css">
    </head>

    <body>

        <%@ include file="/plantillas/barraNavegacionCliente.jsp" %>

        <%Maximos max = (Maximos) session.getAttribute("max");
            List<Modelo.Ejercicio_Rutina> ejercicios = (List<Modelo.Ejercicio_Rutina>) session.getAttribute("ejerciciosRutina");
            if (max == null) {%>
        <div class="col-md-5 m-auto">
            <h1>Estructura tu rutina</h1>
            <form id="estructuraRutina" method="GET" action="<%= contextPath%>/Ejercicio_RutinaController">
                <input type="hidden" name="accion" value="Create">
                <div class="form-group">
                    <label for="numSemanas">Cuantas semanas deseas en tu rutina?</label>
                    <input name="numSemanas" type="number" class="form-control" id="numSemanas" required>
                </div>
                <div class="form-group">
                    <label for="numDias">Cuantos dias quieres por semana?
                        (Posteriormente podras borrar los dias o ejercicios sobrantes)</label>
                    <input name="numDias" type="number" class="form-control" id="numDias" required>
                </div>
                <div class="form-group">
                    <label for="numEjercicios">Cuantos ejercicios quieres en cada dia?</label>
                    <input name="numEjercicios" type="number" class="form-control" id="numEjercicios" required>
                </div>

                <div class="card-title mb-0 text-center">
                    <button type="submit" class="btn btn-primary me-2 mt-2">
                        Generar tabla
                    </button>
                </div>
            </form>
        </div>
        <%} else {%>
        <div id="contenedorTabla" class="col-md-8 mx-auto text-center">
            <h1 class="mb-4 mt-5">Crea tu rutina</h1>
            <% if(session.getAttribute("alMenosUno")){%>
            <button class="mb-5 btn btn-success mx-auto" type="button" data-bs-toggle="modal" data-bs-target="#guardarRutina">Guardar Rutina</button>
            <%}%>
            <%for (int i = 1; i <= max.getSemanas(); i++) {%>
            <div class="semana text-center mb-5">
                <h2 class="mb-3">Semana <%=i%></h2>
                <table class="table table-md table-bordered">
                    <thead>
                        <tr>
                            <%for (int j = 1; j <= max.getDias(); j++) {%>
                            <th class="mx-2">Dia <%=j%></th>
                                <%}%>
                        </tr>
                    </thead>
                    <tbody>
                        <%for (int k = 1; k <= max.getEjercicios(); k++) {%>
                        <tr>
                            <%for (int j = 1; j <= max.getDias(); j++) {%>
                            <%
                                boolean encontrado = false;

                                if (ejercicios != null) {
                                    for (Modelo.Ejercicio_Rutina ejer : ejercicios) {
                                        if (ejer.getSemana() == i && ejer.getDia() == j && ejer.getOrdenEjercicio() == k) {
                                            encontrado = true;
                            %>
                            <td class="celda position-relative p-0">
                                <div style="display: flex; justify-content: space-between; align-items: center; width: 100%; padding: 8px 12px;">
                                    <a class="editar" href="<%= contextPath%>/EjercicioController?accion=TraerEjercicio&semana=<%=i%>&dia=<%=j%>&ordenEjercicio=<%=k%>&fkIdEjercicio=<%=ejer.getFkIdEjercicio()%>" 
                                       style="flex-grow: 1; text-decoration: none; color: <%=ejer.getEstilo()%>;">
                                        <%=ejer.getNomEjercicio()%>
                                    </a>
                                    <a class="eliminar" href="<%= contextPath%>/Ejercicio_RutinaController?accion=Delete&semana=<%=i%>&dia=<%=j%>&ordenEjercicio=<%=k%>&fkIdEjercicio=<%=ejer.getFkIdEjercicio()%>">
                                        <i class="bi bi-trash3-fill"></i>
                                    </a>
                                </div>
                            </td>
                            <%break; // ya encontramos el ejercicio, salimos del for
                                        }
                                    }
                                }
                                if (!encontrado) {%>
                            <td class="td-vacio"></td> <!-- Aquí generas la celda vacía -->
                            <%}
                                }%>
                        </tr>
                        <%}%>    
                    </tbody>
                </table>
            </div>
            <%}%>
            <!-- Modal -->
            <div class="modal fade" id="guardarRutina" aria-labelledby="titulos" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">

                        <div class="modal-header">
                            <h5 class="modal-title" id="titulos">Guarda los datos de tu rutina</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Cerrar"></button>
                        </div>

                        <div class="modal-body">
                            <form id="edicionUsuario" action="<%=contextPath%>/RutinaController">
                                <input type="hidden" name="semanasRutina" value="<%=max.getSemanas()%>">
                                <div class="form-group">
                                    <label for="NomRutina">Asignale un nombre a tu rutina</label>
                                    <input name="nomRutina" type="text" class="form-control" id="NomRutina" required>
                                </div>
                                <div class="form-group">
                                    <label for="DescRutina">Describe esta rutina</label>
                                    <input name="descRutina" type="text" class="form-control" id="DescRutina" required>
                                </div>
                                <div class="form-group">
                                    <label for="nomUsuario">Que nivel de dificultad es tu rutina?</label>
                                    <select name="nivelRutina" class="form-control" id="rolUsuario" required>
                                        <option value=""></option>
                                        <option value="basico">Basica</option>
                                        <option value="intermedio">Intermedia</option>
                                        <option value="avanzado">Avanzada</option>
                                    </select>
                                </div>
                            </form>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                            <button type="submit" name="accion" value="Create" class="btn btn-success" form="edicionUsuario">Guardar Rutina</button>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <%}%>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>