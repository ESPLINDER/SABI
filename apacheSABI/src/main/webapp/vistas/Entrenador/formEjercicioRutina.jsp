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
        <div class="col-md-8">
            <form id="formEjercicioRutina" action="<%= contextPath%>/Ejercicio_RutinaController">
                <input type="hidden" name="accion" value="Create">
                <%
                    int semana = 0;
                    int dia = 0;
                    int ordenEjercicio = 0;
                    String NumSemanas = request.getParameter("numSemanas");
                    String NumDias = request.getParameter("numDias");
                    String NumEjercicios = request.getParameter("numEjercicios");
                    String Tabla = request.getParameter("numEjercicios");
                    List<Modelo.Ejercicio> lista_ejercicios = (List<Modelo.Ejercicio>) request.getAttribute("lista_ejercicios");
                    if (NumSemanas != null && NumDias != null && NumEjercicios != null && Tabla != null) {
                        semana = Integer.parseInt(NumSemanas);
                        dia = Integer.parseInt(NumDias);
                        ordenEjercicio = Integer.parseInt(NumEjercicios);
                    } else {
                        request.getRequestDispatcher("vistas/Entrenador/formRutina.jsp").forward(request, response);
                    }

                %>
                <input type="hidden" name="accion" id="accion" value="TraerEjercicio">
                <input type="hidden" name="semana" id="semana" value="<%=semana%>">
                <input type="hidden" name="dia" id="dia" value="<%=dia%>">
                <input type="hidden" name="ordenEjercicio" value="<%=ordenEjercicio%>">
                <div class="form-group">
                    <label for="ejercicio">Ejercicio</label>
                    <select name="fkIdEjercicio" class="form-control" id="ejercicio" onchange="TraerEjercicio()" required>
                        <option value="">Elije un ejercicio</option>
                        <%for (Modelo.Ejercicio ejer : lista_ejercicios) {%>
                        <option value="<%= ejer.getIdEjercicio()%>"><%=ejer.getNomEjercicio()%></option>
                        <%}%>
                    </select>
                </div>
                <div class="form-group">
                    <label for="Series">Series</label>
                    <input name="series" type="number" class="form-control" id="Series" max="100">
                </div>
                <div class="form-group">
                    <label for="Intensidad">Intensidad</label>
                    <select name="intensidad" class="form-control" id="Intensidad" required>
                        <option value="">Elije la intensidad para realizar esta serie</option>
                        <option value="Baja">Baja</option>
                        <option value="Media">Media</option>
                        <option value="Moderada">Moderada</option>
                        <option value="Alta">Alta</option>
                        <option value="Extrema">Extrema</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="Repeticiones">Repeticiones</label>
                    <input name="repeticiones" type="text" class="form-control" id="Repeticiones" value="" required>
                </div>
                <div class="form-group">
                    <label for="Peso">Peso</label>
                    <input name="peso" type="text" class="form-control" id="Peso" value="" required>
                </div>
                <div class="form-group">
                    <label for="Descanso">Tiempo de descanso en segundos</label>
                    <input name="descanso" type="number" class="form-control" id="Descanso" value="" placeholder="60" required>seg
                </div>
                <%Ejercicio ejercicio = (Ejercicio) request.getAttribute("lista_ejercicios");
                if (ejercicio != null) {%>
                    <div>
                        <iframe width="560" height="315"
                                src="<%= ejercicio.getUrlVideo()%>"
                                title="YouTube video player"
                                frameborder="0"
                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                allowfullscreen>
                        </iframe>
                    </div>
                <%}%>
            </form>
        </div>
        <script>
            function TraerEjercicio() {
            var ejercicio = document.getElementById("ejercicio").value;
                    window.location.href = "<%= contextPath%>/Ejercicio_RutinaCotroller?accion=TraerEjercicio&semana=<%=semana%>&dia=<%=dia%>&ordenEjercicio=<%=ordenEjercicio%>&idEjercicio=" + var ;
        </script>
    </body>
</html>
