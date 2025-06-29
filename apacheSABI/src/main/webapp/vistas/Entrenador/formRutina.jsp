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
        <%Maximos max = (Maximos) session.getAttribute("max");
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
            <form action="<%= contextPath%>/RutinaController?accion=Create">
                <button class="mb-5 btn btn-success mx-auto" type="submit">Guardar Rutina</button>
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
                                        <%List<Modelo.Ejercicio_Rutina> ejercicios = (List<Modelo.Ejercicio_Rutina>) session.getAttribute("ejerciciosRutina");
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
                                            <%
                                                        break; // ya encontramos el ejercicio, salimos del for
                                                    }
                                                }
                                            }

                                            if (!encontrado) {
                                            %>
                                                <td class="td-vacio"></td> <!-- Aquí generas la celda vacía -->
                                            <%
                                            }
                                    }%>
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