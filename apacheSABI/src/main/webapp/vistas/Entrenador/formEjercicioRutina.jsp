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
                <div class="form-group">
                    <label for="ejercicio">Ejercicio</label>
                    <select name="fkIdEjercicio" class="form-control" id="ejercicio" required>
                        <option value="">Elije un ejercicio</option>
                        <option value=""></option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="Series">Series</label>
                    <input name="series" type="number" class="form-control" id="Series" max="100">
                </div>
                <div class="form-group">
                    <label for="nomUsuario">Nombre</label>
                    <input name="nomUsuario" type="text" class="form-control" id="nomUsuario" value="<%=nomValue%>" required>
                </div>
                <div class="form-group">
                    <label for="apeUsuario">Apellido</label>
                    <input name="apeUsuario" type="text" class="form-control" id="apeUsuario" value="<%=apeValue%>" required>
                </div>
                <div class="form-group">
                    <label for="emaUsuario">Correo Electrónico</label>
                    <input name="emaUsuario" type="email" class="form-control" id="emaUsuario" value="<%=emaValue%>" required>
                </div>
                <div class="form-group">
                    <label for="passUsuario">Contraseña</label>
                    <input name="passUsuario" type="text" class="form-control" id="passUsuario" value="<%=passValue%>" required>
                </div>
            </form>
        </div>
    </body>
</html>
