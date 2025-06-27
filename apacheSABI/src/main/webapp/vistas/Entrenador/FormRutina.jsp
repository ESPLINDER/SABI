<%@page import="java.util.Map"%>
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
        <link rel="stylesheet" href="<%= contextPath%>/estilos/nuevaRutina.css">
    </head>

    <body>
        <div class="col-md-5 m-auto">
            <h1>Estructura tu rutina</h1>
            <form id="estructuraRutina" method="GET" action="<%= contextPath%>/RutinaController">
                <input type="hidden" name="accion" value="Estructurar">
                <div class="form-group">
                    <label for="numSemanas">Cuantas semanas deseas en tu rutina?</label>
                    <input name="numSemanas" type="number" class="form-control" id="numSemanas" required max="12">
                </div>
                <div class="form-group">
                    <label for="numDias">Cuantos dias quieres por semana?
                        (Posteriormente podras borrar los dias o ejercicios sobrantes)</label>
                    <input name="numDias" type="number" class="form-control" id="numDias" required max="7">
                </div>
                <div class="form-group">
                    <label for="numEjercicios">Cuantos ejercicios quieres en cada dia?</label>
                    <input name="numEjercicios" type="number" class="form-control" id="numEjercicios" required max="30">
                </div>

                <div class="card-title mb-0 text-center">
                    <button type="submit" class="btn btn-primary me-2 mt-2">
                        Generar tabla
                    </button>
                </div>
            </form>
        </div>
        <%
            String tabla = "none";
            int numSemanas = 0;
            int numDias = 0;
            int numEjercicios = 0;
            String NumSemanas = request.getParameter("numSemanas");
            String NumDias = request.getParameter("numDias");
            String NumEjercicios = request.getParameter("numEjercicios");
            if (NumSemanas != null && NumDias != null && NumEjercicios != null) {
                numSemanas = Integer.parseInt(NumSemanas);
                numDias = Integer.parseInt(NumDias);
                numEjercicios = Integer.parseInt(NumEjercicios);
                tabla = "block";
            }
        %>

        <div id="contenedorTabla" class="col-md-8 mx-auto" style="display: <%=tabla%>">
            <h1 class="mb-5">Crea tu rutina</h1>
            <form action="<%= contextPath%>/RutinaController">
                <% for (int i = 1; i <= numSemanas; i++) {%>
                <div class="semana text-center mb-5">
                    <h2 class="mb-3">Semana <%=i%></h2>
                    <table class="table table-md table-bordered">
                        <thead>
                            <tr>
                                <%for (int j = 1; j <= numDias; j++) {%>
                                <th class="mx-2">Dia <%=j%></th>
                                    <%}%>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (int k = 1; k <= numEjercicios; k++) {%>
                            <tr>
                                <%for (int j = 1; j <= numDias; j++) {%>
                                <td class="td-hover">
                                    <%Map<Integer, String[][]> ejercicios = (Map<Integer, String[][]>) request.getAttribute("ejercicios");
                                        String ejercicioValue = (ejercicios != null && ejercicios.get(i) != null && ejercicios.get(i)[j][k] != null)
                                                ? ejercicios.get(i)[j][k] : "Ejercicio " + k;%>
                                    <a href=""><%=ejercicioValue%></a>
                                    <a class="float-end" href=""><i class="bi bi-trash3-fill"></i></a>
                                </td>
                                <%}%>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
                <%}%>
                <%
                    /*  Modelo.Ejercicio_Rutina ejercicio_Rutina = (Ejercicio_Rutina) request.getAttribute("ejercicio_Rutina");
                String idEjercicio_Rutina = (usuarioEditar != null) ? String.valueOf(usuarioEditar.getIdUsuario()) : "";
                String fkIdEjercicio = (usuarioEditar != null) ? String.valueOf(usuarioEditar.getNomUsuario()) : "";
                String fkIdRutina = (usuarioEditar != null) ? String.valueOf(usuarioEditar.getApeUsuario()) : "";
                String emaValue = (usuarioEditar != null) ? String.valueOf(usuarioEditar.getEmaUsuario()) : "";
                String passValue = (usuarioEditar != null) ? String.valueOf(usuarioEditar.getPassUsuario()) : "";
                String rolValue = (usuarioEditar != null) ? String.valueOf(usuarioEditar.getRolUsuario()) : "";
                     */%>
            </form>
        </div>
    </body>

</html>