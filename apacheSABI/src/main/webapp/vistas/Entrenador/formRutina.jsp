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
        <%Maximos max = (Maximos) request.getAttribute("max");
        if (max != null) {%>
        <div id="contenedorTabla" class="col-md-8 mx-auto">
            <h1 class="mb-5">Crea tu rutina</h1>
            <form action="<%= contextPath%>/Ejercicio_RutinaController">
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
                                <%List<Modelo.Ejercicio_Rutina> ejercicios = (List<Modelo.Ejercicio_Rutina>) request.getAttribute("ejercicios");
                                    for (Modelo.Ejercicio_Rutina ejer : ejercicios) {
                                        String ejerValue = (ejer.getNomEjercicio() != null && ejer.getSemana() == i && ejer.getDia() == j)
                                        ? ejer.getNomEjercicio() : "Ejercicio " + k;
                                        if (ejer.getSemana() == i && ejer.getDia() == j && ejer.getOrdenEjercicio() == k) {%>
                                        <td class="td-hover">
                                            <a href="<%= contextPath%>/EjercicioController?accion=TraerEjercicio&semana=<%=i%>&dia=<%=j%>&ordenEjercicio=<%=k%>&numSemanas=<%=max.getSemanas()%>&numDias=<%=max.getDias()%>&numEjercicios=<%=max.getEjercicios()%>">
                                                <%=ejerValue%></a>
                                            <a class="float-end" href=""><i class="bi bi-trash3-fill"></i></a>
                                        </td>
                                        <%}%>
                                    <%}%>
                                <%}%>
                            </tr>
                            <%}%>    
                        </tbody>
                    </table>
                </div>
                <%}%>
            </form>
        </div>
        <%}%>
    </body>
</html>