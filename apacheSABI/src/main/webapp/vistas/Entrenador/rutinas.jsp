<%@page import="Modelo.Rutina"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%String contextPath = request.getContextPath();%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tus Rutinas</title>
        <link rel="stylesheet" type="text/css" href="<%= contextPath%>/estilos/rutinas.css">
        <link rel="stylesheet" type="text/css" href="<%= contextPath%>/estilos/indexEntre.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT"
              crossorigin="anonymous">
        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
        <style>
            .pattern-bg {
                background-image: url('../recursos/fondoSabiNuevo.png');
            }
        </style>
    </head>

    <body class="pattern-bg">
        <!-- Header -->
        <%@ include file="/plantillas/dashEntrenador.jsp" %>
        <div class="col-md-3 mx-auto text-center"> 
            <h1>Tus rutinas</h1>
        </div>

        <div class="col-md-8 mx-auto row">
            <div class="col-md-12 align-items-center text-center row">
                <!-- filtros -->
                <div class="col-md-4 me-auto">
                    <div class="content-card p-2 row">
                        <form action="<%= contextPath%>/RutinaController">
                            <input type="hidden" name="accion" value="Read">
                            <div class="col-md-12">
                                <label for="tipoFiltro">Buscar por:</label>
                                <select name="tipoFiltro" id="tipoFiltro" class="form-select">
                                    <option value=""></option>
                                    <option value="nomRutina">Nombre</option>
                                    <option value="semanasRutina">Cantidad de semanas</option>
                                    <option value="descRutina">Descripcion</option>
                                    <option value="nivelRutina">Nivel</option>
                                </select>
                            </div>
                            <div class="col-md-12 mt-1">
                                <div class="input-group">
                                    <input type="text" name="filtro" id="filtro" class="form-control" placeholder="Buscar">
                                    <button class="buscar input-group-text" type="submit">
                                        <i class="bi bi-search"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-4 ms-auto">
                    <button class="nueva btn">
                        <a href="<%= contextPath%>/vistas/Entrenador/formRutina">+ Crear nueva rutina</a>
                    </button>
                </div>
            </div>


            <% List<Modelo.Rutina> listaRutinas = (List<Modelo.Rutina>) request.getAttribute("listaRutinas");
                String alerta = (String) request.getAttribute("alerta");
                if (alerta == null || alerta.equals("")) {
                    System.out.println(alerta);
                    if (listaRutinas != null && !listaRutinas.isEmpty()) {
                        for (Modelo.Rutina rutina : listaRutinas) {%>
            <div class="rutinas">
                <div class="rutina mt-4 row">
                    <div class="col-md-3"></div>
                    <div class="col-md-6 d-flex">
                        <div class="my-auto mx-auto">
                            <h3><%=rutina.getNomRutina()%></h3>
                        </div>
                    </div>
                    <div class="col-md-3 text-end">
                        Fecha de creacion: <%=rutina.getCreacionRutina()%> </br>
                        Nivel de dificultad: <%=rutina.getNivelRutina()%> </br>
                        Duracion: <%=rutina.getSemanasRutina()%> Semana/s </br>
                        Asignada: <%=rutina.getTotalClientes()%> Clientes </br>
                    </div>

                    <div class="col-md-7">
                        <div class="content-card p-3">
                            <div class="card-header text-center">
                                <h2>Descripcion</h2>
                            </div>
                            <div class="client-list">
                                <%=rutina.getDescRutina()%> 
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="row my-auto mx-auto pt-4">
                            <button class="editar btn col-md-4 mx-auto">Editar rutina</button>
                        </div>
                        <div class="row my-auto mx-auto pt-1">
                            <button class="asignar btn btn-success col-md-4 mx-auto" data-bs-toggle="modal" data-bs-target="#clientes">Asignar rutina</button>
                        </div>

                    </div>
                </div>
            </div>
            <%}
            } else {%>
            <div><h1>Primero crea una rutina</h1></div>
            <%}
            } else {%>
            <div class="contenedor-alerta">
                <div class="tarjeta-alerta">
                    <%= alerta%>
                </div>
            </div>
            <%}%>
        </div>
    </body>
</html>