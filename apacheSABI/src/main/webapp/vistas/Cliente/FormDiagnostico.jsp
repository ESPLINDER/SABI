<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%
    String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Diagnóstico Físico - SABI</title>
   <link rel="stylesheet" type="text/css" href="<%= contextPath %>/estilos/diagnosticoCliente.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="form-container">
            <div class="form-header">
                <div class="logo-section">
                    <div class="logo">
                        <div class="logo-icon">🐾</div>
                        <span class="logo-text">SABI</span>
                    </div>
                </div>
                <h1>Diagnóstico Físico</h1>
                <p class="subtitle">Completa tu evaluación física inicial</p>
            </div>

            <form action="procesarDiagnostico" method="post" class="diagnostic-form">
                <!-- Información Personal -->
                <div class="form-section">
                    <h2 class="section-title">Información Personal</h2>
                    <div class="form-group-row">
                        <div class="form-group">
                            <label for="genero">Género *</label>
                            <select id="genero" name="genero" required>
                                <option value="">Selecciona tu género</option>
                                <option value="masculino">Masculino</option>
                                <option value="femenino">Femenino</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="edad">Edad *</label>
                            <input type="number" id="edad" name="edad" min="12" max="100" required>
                        </div>
                    </div>
                </div>

                <!-- Medidas Corporales -->
                <div class="form-section">
                    <h2 class="section-title">Medidas Corporales</h2>
                    <div class="form-group-row">
                        <div class="form-group">
                            <label for="estatura">Estatura (cm) *</label>
                            <input type="number" id="estatura" name="estatura" step="0.1" min="100" max="250" 
                                   placeholder="Ej: 175.5" required>
                        </div>
                        <div class="form-group">
                            <label for="peso">Peso (kg) *</label>
                            <input type="number" id="peso" name="peso" step="0.1" min="30" max="300" 
                                   placeholder="Ej: 70.5" required>
                        </div>
                    </div>
                    
                    <div class="form-group-row">
                        <div class="form-group">
                            <label for="medidaBrazo">Medida Brazo (cm)</label>
                            <input type="number" id="medidaBrazo" name="medidaBrazo" step="0.1" min="15" max="60">
                        </div>
                        <div class="form-group">
                            <label for="medidaCintura">Medida Cintura (cm)</label>
                            <input type="number" id="medidaCintura" name="medidaCintura" step="0.1" min="50" max="150">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="medidaPierna">Medida Pierna (cm)</label>
                        <input type="number" id="medidaPierna" name="medidaPierna" step="0.1" min="30" max="80">
                    </div>
                    
                    <!-- Campo calculado automáticamente -->
                    <div class="form-group">
                        <label for="imcCliente">IMC (calculado automáticamente)</label>
                        <input type="number" id="imcCliente" name="imcCliente" step="0.01" readonly>
                    </div>
                </div>

                <!-- Información Médica -->
                <div class="form-section">
                    <h2 class="section-title">Información Médica</h2>
                    <div class="form-group-row">
                        <div class="form-group">
                            <label for="condicionMedica">Condición Médica</label>
                            <input type="text" id="condicionMedica" name="condicionMedica" maxlength="30" 
                                   placeholder="Diabetes, hipertensión, etc.">
                        </div>
                        <div class="form-group">
                            <label for="medicamentos">Medicamentos</label>
                            <input type="text" id="medicamentos" name="medicamentos" maxlength="30" 
                                   placeholder="Medicamentos actuales">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="frecCardiaca">Frecuencia Cardíaca (bpm)</label>
                        <input type="text" id="frecCardiaca" name="frecCardiaca" maxlength="10" 
                               placeholder="Ej: 70-80 bpm">
                    </div>
                </div>

                <!-- Hidratación -->
                <div class="form-section">
                    <h2 class="section-title">Hidratación</h2>
                    <div class="form-group-row">
                        <div class="form-group">
                            <label for="nivelHidratacion">Nivel de Hidratación</label>
                            <select id="nivelHidratacion" name="nivelHidratacion">
                                <option value="">Selecciona nivel</option>
                                <option value="bajo">Bajo (menos de 1L/día)</option>
                                <option value="normal">Normal (1-2L/día)</option>
                                <option value="alto">Alto (más de 2L/día)</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="tipoHidratacion">Tipo de Hidratación</label>
                            <input type="text" id="tipoHidratacion" name="tipoHidratacion" maxlength="100" 
                                   placeholder="Agua, bebidas deportivas, etc.">
                        </div>
                    </div>
                </div>

                <!-- Actividad Física y Objetivos -->
                <div class="form-section">
                    <h2 class="section-title">Actividad Física y Objetivos</h2>
                    <div class="form-group">
                        <label for="nivelActividadFisica">Nivel de Actividad Física *</label>
                        <select id="nivelActividadFisica" name="nivelActividadFisica" required>
                            <option value="">Selecciona tu nivel</option>
                            <option value="sedentario">Sedentario (poco o nada de ejercicio)</option>
                            <option value="ligeramente activo">Ligeramente Activo (ejercicio ligero 1-3 días/semana)</option>
                            <option value="moderadamente activo">Moderadamente Activo (ejercicio moderado 3-5 días/semana)</option>
                            <option value="muy activo">Muy Activo (ejercicio intenso 6-7 días/semana)</option>
                            <option value="extremadamente activo">Extremadamente Activo (ejercicio muy intenso, trabajo físico)</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                        <label for="objetivo">Objetivo Principal *</label>
                        <input type="text" id="objetivo" name="objetivo" maxlength="30" required
                               placeholder="Ej: Perder peso, ganar músculo, tonificar">
                    </div>
                    
                    <div class="form-group">
                        <label for="suplementos">Suplementos</label>
                        <input type="text" id="suplementos" name="suplementos" maxlength="100" 
                               placeholder="Proteína, creatina, vitaminas, etc.">
                    </div>
                </div>

                <!-- Programación de Seguimiento -->
                <div class="form-section">
                    <h2 class="section-title">Seguimiento</h2>
                    <div class="form-group-row">
                        <div class="form-group">
                            <label for="frecuenciaDiagnostico">Frecuencia de Seguimiento (días) *</label>
                            <select id="frecuenciaDiagnostico" name="frecuenciaDiagnostico" required>
                                <option value="">Selecciona frecuencia</option>
                                <option value="7">Cada semana</option>
                                <option value="14">Cada 2 semanas</option>
                                <option value="21">Cada 3 semanas</option>
                                <option value="30">Cada mes</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="fechaDiagnostico">Fecha del Diagnóstico</label>
                            <input type="date" id="fechaDiagnostico" name="fechaDiagnostico" 
                                   value="<%= LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")) %>" readonly>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="proxDiagnostico">Próximo Diagnóstico</label>
                        <input type="date" id="proxDiagnostico" name="proxDiagnostico" readonly>
                    </div>
                </div>

                <!-- Campos ocultos -->
                <input type="hidden" name="fkIdCliente" value="${sessionScope.usuarioId}">
                <input type="hidden" name="fkIdRutina" id="fkIdRutina">

                <!-- Botones -->
                <div class="form-actions">
                    <button type="button" class="btn-secondary" onclick="history.back()">
                        Cancelar
                    </button>
                    <button type="submit" class="btn-primary">
                        Guardar Diagnóstico
                    </button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Calcular IMC automáticamente
        function calcularIMC() {
            const peso = parseFloat(document.getElementById('peso').value);
            const estatura = parseFloat(document.getElementById('estatura').value) / 100; // convertir cm a metros
            
            if (peso && estatura) {
                const imc = (peso / (estatura * estatura)).toFixed(2);
                document.getElementById('imcCliente').value = imc;
            }
        }

        // Calcular próximo diagnóstico
        function calcularProximoDiagnostico() {
            const frecuencia = parseInt(document.getElementById('frecuenciaDiagnostico').value);
            const fechaActual = new Date();
            
            if (frecuencia) {
                const proximaFecha = new Date(fechaActual);
                proximaFecha.setDate(proximaFecha.getDate() + frecuencia);
                
                const proximaFechaStr = proximaFecha.toISOString().split('T')[0];
                document.getElementById('proxDiagnostico').value = proximaFechaStr;
            }
        }

        // Event listeners
        document.getElementById('peso').addEventListener('input', calcularIMC);
        document.getElementById('estatura').addEventListener('input', calcularIMC);
        document.getElementById('frecuenciaDiagnostico').addEventListener('change', calcularProximoDiagnostico);

        // Validación del formulario
        document.querySelector('.diagnostic-form').addEventListener('submit', function(e) {
            const requiredFields = this.querySelectorAll('[required]');
            let isValid = true;
            
            requiredFields.forEach(field => {
                if (!field.value.trim()) {
                    field.classList.add('error');
                    isValid = false;
                } else {
                    field.classList.remove('error');
                }
            });
            
            if (!isValid) {
                e.preventDefault();
                alert('Por favor, completa todos los campos obligatorios.');
            }
        });
    </script>
</body>
</html>