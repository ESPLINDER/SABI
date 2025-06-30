<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%String contextPath = request.getContextPath();%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tus Rutinas</title>
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
            <div class="col-md-12 row">
                <!-- filtros -->
                <div class="col-md-4 me-auto">
                    fitlros
                </div>
                <div class="col-md-4 ms-auto">
                    <button class="btn btn-success ms-auto">+ Crear nueva rutina</button>
                </div>
            </div>

            <div class="rutinas">
                <div class="rutina mt-4 row">
                    <div class="col-md-3"></div>
                    <div class="col-md-6 d-flex">
                        <div class="my-auto mx-auto">
                            <h3>Aumento de masa muscular</h3>
                        </div>
                    </div>
                    <div class="col-md-3 text-end">
                        Fecha de creacion: 05/11/2024 </br>
                        Puntuacion promedio: 4.5 </br>
                        Dificultad: Principiante </br>
                        Duracion: 4 Semana/s </br>
                        Asignada: 5 Clientes </br>
                    </div>

                    <div class="col-md-7">
                        <div class="content-card">
                            <div class="card-header">
                                <h2>Clientes Recientes</h2>
                                <a href="#" class="view-all">Ver todos</a>
                            </div>
                            <div class="client-list">
                                <div class="client-item">
                                    <div class="client-avatar">MG</div>
                                    <div class="client-info">
                                        <h4>María González</h4>
                                        <p>Última sesión: Hoy</p>
                                    </div>
                                    <div class="client-status active">Activo</div>
                                </div>
                                <div class="client-item">
                                    <div class="client-avatar">CR</div>
                                    <div class="client-info">
                                        <h4>Carlos Rodríguez</h4>
                                        <p>Última sesión: Ayer</p>
                                    </div>
                                    <div class="client-status active">Activo</div>
                                </div>
                                <div class="client-item">
                                    <div class="client-avatar">LM</div>
                                    <div class="client-info">
                                        <h4>Laura Martínez</h4>
                                        <p>Última sesión: 2 días</p>
                                    </div>
                                    <div class="client-status inactive">Inactivo</div>
                                </div>
                                <div class="client-item">
                                    <div class="client-avatar">AP</div>
                                    <div class="client-info">
                                        <h4>Ana Pérez</h4>
                                        <p>Última sesión: Hoy</p>
                                    </div>
                                    <div class="client-status active">Activo</div>
                                </div>
                            </div>
                        </div>
                        En esta rutina encontraras ejercicios básicos para generar resistencia y ganar masa muscular.
                    </div>
                    <div class="col-md-5">
                        <div class="row my-auto mx-auto">
                            <button class="editar">Editar rutina</button>
                        </div>
                        <div class="row my-auto mx-auto">
                            <button class="asignar" data-bs-toggle="modal" data-bs-target="#clientes">Asignar rutina</button>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>