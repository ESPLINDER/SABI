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
        <div class="col-md-8 mx-auto mt-5">
            <h1>Estructura el ejercicio</h1>
            <form id="formEjercicioRutina" action="<%= contextPath%>/Ejercicio_RutinaController">
                <input type="hidden" name="accion" value="Create">
                <%
                    int semana = 0, dia = 0, ordenEjercicio = 0; //, numSemanas = 0, numDias = 0, numEjercicios = 0;
                    List<Modelo.Ejercicio> lista_ejercicios = (List<Modelo.Ejercicio>) request.getAttribute("lista_ejercicios");
                    if (lista_ejercicios == null){
                        System.out.println("primero debe hacer la tabla");
                        request.getRequestDispatcher("/vistas/Entrenador/formRutina.jsp").forward(request, response);
                    }
                    Ejercicio ejercicio = (Ejercicio) request.getAttribute("ejercicio");
                %>
                <div class="form-group">
                    <label for="ejercicio">Ejercicio</label>
                    <select name="fkIdEjercicio" class="form-control" id="ejercicio" onchange="TraerEjercicio()">
                        <%String selectValue = (ejercicio != null) ? ejercicio.getNomEjercicio() : "Selecciona un ejercicio";%>
                        <option value=""><%=selectValue%></option>
                        <%for (Modelo.Ejercicio ejer : lista_ejercicios) {%>
                        <option value="<%= ejer.getIdEjercicio()%>"><%=ejer.getNomEjercicio()%></option>
                        <%}%>
                    </select>
                </div>
                
                    <%if (ejercicio != null) {
                    System.out.println("este es el ejercicio que se encontro: "+ejercicio.toString());%>
                <div class="form-group">
                    <label for="Series">Series</label>
                    <input name="series" type="number" class="form-control" id="Series" max="100">
                </div>
                <% String Series = (String) request.getParameter("series");
                    if(Series != null) {
                        int series = Integer.parseInt(Series);
                        for (int i = 1; i <= series; i++) {%>
                            <div>
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
                                <input name="repeticiones" type="number" class="form-control" id="Repeticiones" value="" required>
                            </div>
                            <div class="form-group">
                                <label for="Peso">Peso</label>
                                <input name="peso" type="number" class="form-control" id="Peso" value="" required>
                            </div>
                            <div class="form-group">
                                <label for="Descanso">Tiempo de descanso en segundos</label>
                                <input name="descanso" type="number" class="form-control" id="Descanso" value="" placeholder="60" required>seg
                            </div>
                        <%}
                    }%>
                
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
                <div class="card-title mb-0 text-center">
                    <button type="button" class="btn btn-primary me-2 mt-2">
                        Guardar ejercicio
                    </button>
                </div>
                <%}%>
            </form>
        </div>
        <script>
            function TraerEjercicio() {
                console.log("se ejecuta la funcion");
                var ejercicio = document.getElementById("ejercicio").value;
                window.location.href = "<%= contextPath%>/EjercicioController?accion=TraerEjercicio&idEjercicio=" + ejercicio;
            }
        </script>
    </body>
</html>
