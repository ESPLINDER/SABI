<%@page import="Modelo.Ejercicio_Rutina"%>
<%@page import="Modelo.Ejercicio"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String contextPath = request.getContextPath();%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formula tu ejercicio</title>
    </head>
    <body>
        <%@ include file="/plantillas/barraNavegacionCliente.jsp" %>

        <div class="col-md-8 mx-auto mt-5">
            <h1>Estructura el ejercicio</h1>
            <form id="formEjercicioRutina" action="Ejercicio_RutinaController">
                <input type="hidden" name="accion" value="Update">
                <%                    Ejercicio_Rutina eje_rut_edicion = (Ejercicio_Rutina) session.getAttribute("eje_rut_edicion");
                    Ejercicio ejercicio = (Ejercicio) request.getAttribute("ejercicio");
                    String selectValue = "Selecciona un ejercicio";
                    int selectValueId = 1;
                    System.out.println("select valor " + selectValue);
                    System.out.println("select valor id: " + selectValueId);
                    String valueSerie = "";
                    String intensidadValue = "baja";
                    String repeticionesValue = "";
                    String pesoValue = "";
                    String descansoValue = "";

                    if (ejercicio != null) {
                        selectValue = ejercicio.getNomEjercicio();
                        selectValueId = ejercicio.getIdEjercicio();
                    } else if (eje_rut_edicion != null) {
                        selectValue = eje_rut_edicion.getNomEjercicio();
                        selectValueId = eje_rut_edicion.getFkIdEjercicio();

                        valueSerie = "value=" + "'" + eje_rut_edicion.getSerie() + "'";
                        intensidadValue = eje_rut_edicion.getIntensidad();
                        repeticionesValue = "value=" + "'" + eje_rut_edicion.getRepeticiones() + "'";
                        pesoValue = "value=" + "'" + eje_rut_edicion.getPeso() + "'";
                        descansoValue = "value=" + "'" + eje_rut_edicion.getDescanso() + "'";
                    }
                    List<Modelo.Ejercicio> lista_ejercicios = (List<Modelo.Ejercicio>) request.getAttribute("lista_ejercicios");
                    if (lista_ejercicios == null) {
                        System.out.println("primero debe hacer la tabla");
                        request.getRequestDispatcher("/vistas/Entrenador/formRutina.jsp").forward(request, response);
                    }
                %>
                <div class="form-group">
                    <label for="ejercicio">Ejercicio</label>
                    <select name="fkIdEjercicio" class="form-control" id="ejercicio" onchange="TraerEjercicio()">
                        <option value="<%=selectValueId%>"><%=selectValue%></option>
                        <%for (Modelo.Ejercicio ejer : lista_ejercicios) {%>
                        <option value="<%= ejer.getIdEjercicio()%>"><%=ejer.getNomEjercicio()%></option>
                        <%}%>
                    </select>
                </div>

                <%if (ejercicio != null || eje_rut_edicion != null) {%>
                <div class="form-group">
                    <label for="Series">Series</label>
                    <input name="series" <%=valueSerie%> type="number" class="form-control" id="Series" max="50">
                </div>
                <div>
                    <div class="form-group">
                        <label for="Intensidad">Intensidad</label>
                        <select name="intensidad" class="form-control" id="Intensidad" required>
                            <option value="<%=intensidadValue%>"><%=intensidadValue%></option>
                            <option value="baja">Baja</option>
                            <option value="intermedia">Intermedia</option>
                            <option value="alta">Alta</option>
                            <option value="maxima">Extrema</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="Repeticiones">Repeticiones</label>
                        <input name="repeticiones" <%=repeticionesValue%> type="number" class="form-control" id="Repeticiones" required min="1">
                    </div>
                    <div class="form-group">
                        <label for="Peso">Peso (kg) / Tiempo (segundos)</label>
                        <input name="peso" <%=pesoValue%> type="number" class="form-control" id="Peso" required min="0">
                    </div>
                    <div class="form-group">
                        <label for="Descanso">Tiempo de descanso en segundos</label>
                        <input name="descanso" <%=descansoValue%> type="number" class="form-control" id="Descanso" placeholder="Ej: 60" required min="0">
                    </div>
                </div>
                <div>
                    <iframe width="560" height="315" 
                            src="<%= ejercicio.getUrlVideo()%>"
                            title="YouTube video player" 
                            frameborder="0" 
                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                            referrerpolicy="strict-origin-when-cross-origin" 
                            allowfullscreen>
                    </iframe>
                </div>
                <div class="mt-3">
                    <h6>Descripcion</h6>
                    <p><%=ejercicio.getDescEjercicio()%></p>
                </div>
                <div class="mt-3">
                    <h6>Tipo de ejercicio</h6>
                    <p><%=ejercicio.getTipEjercicio()%></p>
                </div>
                <div class="card-title mb-0 text-center">
                    <button type="submit" class="btn btn-success me-2 mt-2">
                        Guardar ejercicio
                    </button>
                </div>
                <%}%>
            </form>
        </div>
        <script>
            function TraerEjercicio() {
                console.log("Ejecutando TraerEjercicio()");

                // 1. Obtener el valor seleccionado del ejercicio
                var ejercicioId = document.getElementById("ejercicio").value;

                // 2. Obtener todos los parámetros actuales de la URL
                var params = new URLSearchParams(window.location.search);

                // 3. Agregar o actualizar el parámetro fkIdEjercicio
                params.set("idEjercicio", ejercicioId);
                params.set("accion", "TraerEjercicio");

                // 4. Redirigir al controlador con los parámetros
                window.location.href = "<%= contextPath%>/EjercicioController?" + params.toString();
            }
        </script>
    </body>
</html>
