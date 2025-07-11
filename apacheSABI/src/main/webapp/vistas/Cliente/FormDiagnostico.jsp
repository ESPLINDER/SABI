<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%
    String contextPath = request.getContextPath();
    String accion = request.getParameter("action");
    String idDiagnostico = request.getParameter("idDiagnostico") != null ? request.getParameter("idDiagnostico") : "";
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Diagnóstico Físico - SABI</title>
    <link rel="stylesheet" href="<%= contextPath %>/estilos/diagnosticoCliente.css">
</head>
<body>
    <h1>Diagnóstico Físico</h1>
    <form action="DiagnosticoController?action=<%= (accion != null && accion.equals("editarDiagnostico")) ? "actualizarDiagnostico" : "guardarDiagnostico" %>" method="post">
        
        <label>Género:</label>
        <select name="genero" required>
            <option value="masculino">Masculino</option>
            <option value="femenino">Femenino</option>
        </select><br>

        <label>Edad:</label>
        <input type="number" name="edad" min="12" required><br>

        <label>Peso (kg):</label>
        <input type="number" id="peso" name="peso" step="0.1" required><br>

        <label>Estatura (cm):</label>
        <input type="number" id="estatura" name="estatura" step="0.1" required><br>

        <label>IMC:</label>
        <input type="number" id="imcCliente" name="imcCliente" step="0.01" readonly><br>

        <label>Frecuencia Diagnóstico (días):</label>
        <select id="frecuenciaDiagnostico" name="frecuenciaDiagnostico" required>
            <option value="7">Cada semana</option>
            <option value="14">Cada 2 semanas</option>
            <option value="30">Cada mes</option>
        </select><br>

        <label>Fecha Diagnóstico:</label>
        <input type="date" name="fechaDiagnostico" value="<%= LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")) %>" readonly><br>

        <label>Próximo Diagnóstico:</label>
        <input type="date" id="proxDiagnostico" name="proxDiagnostico" readonly><br>

        <label>Nivel Actividad Física:</label>
        <select name="nivelActividadFisica" required>
            <option value="sedentario">Sedentario</option>
            <option value="activo">Activo</option>
        </select><br>

        <label>Nivel Hidratación:</label>
        <select name="nivelHidratacion" required>
            <option value="bajo">Bajo</option>
            <option value="normal">Normal</option>
            <option value="alto">Alto</option>
        </select><br>

        <!-- Campos ocultos -->
        <input type="hidden" name="fkIdCliente" value="<%= session.getAttribute("usuarioId") %>">
        <input type="hidden" name="idDiagnostico" value="<%= idDiagnostico %>">

        <button type="submit">Guardar</button>
    </form>

    <script>
    const peso = document.getElementById('peso');
    const estatura = document.getElementById('estatura');
    const imcCliente = document.getElementById('imcCliente');
    const freq = document.getElementById('frecuenciaDiagnostico');
    const prox = document.getElementById('proxDiagnostico');

    function calcularIMC() {
        const p = parseFloat(peso.value);
        const e = parseFloat(estatura.value) / 100;
        if (p && e) {
            const imc = (p / (e * e)).toFixed(2);
            imcCliente.value = imc;
        }
    }

    peso.addEventListener('input', calcularIMC);
    estatura.addEventListener('input', calcularIMC);

    freq.addEventListener('change', () => {
        const f = parseInt(freq.value);
        if (f) {
            const hoy = new Date();
            hoy.setDate(hoy.getDate() + f);
            prox.value = hoy.toISOString().split('T')[0];
        }
    });

    window.addEventListener('DOMContentLoaded', () => {
        freq.dispatchEvent(new Event('change'));
    });
</script>
</body>
</html>
