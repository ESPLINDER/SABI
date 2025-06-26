<% String contextPath=request.getContextPath(); %>
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
        </head>

        <body>
            <div class="col-md-5 m-auto">
                <h1>Estructura tu rutina</h1>
                <form id="estructuraRutina">
                    <input type="hidden" name="menu" value="Entrenador">
                    <input type="hidden" name="accion" value="Estructura">
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
                        <input name="numDias" type="number" class="form-control" id="numDias" required>
                    </div>

                    <div class="card-title mb-0 text-center">
                        <button type="submit" class="btn btn-primary me-2 mt-2">
                            Generar tabla
                        </button>
                    </div>
                </form>
            </div>
            
            <div id="contenedorTabla" class="col-md-10" style="display: none;">
                <h1>Crea tu rutina</h1>
                <form action="">

                </form>
            </div>
        </body>

        </html>