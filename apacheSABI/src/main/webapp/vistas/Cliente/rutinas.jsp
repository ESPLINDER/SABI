<% String contextPath = request.getContextPath(); %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rutinas</title>
        <link rel="stylesheet" href="<%= contextPath %>/estilos/estiloRutina.css">
        <link rel="stylesheet" href="<%= contextPath %>/estilos/barranavegacion.css">
    </head>

    <body>
        <%@ include file="/plantillas/barraNavegacion.jsp" %>
        
        <div class="rutinas">
            <div class="semana">
                <h2>Semana 1</h2>
                <div class="dia">
                    <h3>Lunes</h3>
                    <p>Ejercicio de fuerza: 3 series de 10 repeticiones</p>
                </div>
                <div class="dia">
                    <h3>Martes</h3>
                    <p>Ejercicio de cardio: 30 minutos de trote</p>
                </div>
                <div class="dia">
                    <h3>Miércoles</h3>
                    <p>Ejercicio de flexibilidad: 20 minutos de estiramientos</p>
                </div>
                <div class="dia">
                    <h3>Jueves</h3>
                    <p>Ejercicio de fuerza: 3 series de 12 repeticiones</p>
                </div>
                <div class="dia">
                    <h3>Viernes</h3>
                    <p>Ejercicio de cardio: 30 minutos de bicicleta</p>
                </div>
                <div class="dia">
                    <h3>Sábado</h3>
                    <p>Descanso o actividad ligera</p>
                </div>
                <div class="dia">
                    <h3>Domingo</h3>
                    <p>Ejercicio de flexibilidad: 20 minutos de yoga</p>
                </div>
            </div>
            <div class="semana">
                <h2>Semana 2</h2>
                <div class="dia">
                    <h3>Lunes</h3>
                    <p>Ejercicio de fuerza: 3 series de 10 repeticiones</p>
                </div>
                <div class="dia">
                    <h3>Martes</h3>
                    <p>Ejercicio de cardio: 30 minutos de trote</p>
                </div>
                <div class="dia">
                    <h3>Miércoles</h3>
                    <p>Ejercicio de flexibilidad: 20 minutos de estiramientos</p>
                </div>
                <div class="dia">
                    <h3>Jueves</h3>
                    <p>Ejercicio de fuerza: 3 series de 12 repeticiones</p>
                </div>
                <div class="dia">
                    <h3>Viernes</h3>
                    <p>Ejercicio de cardio: 30 minutos de bicicleta</p>
                </div>
                <div class="dia">
                    <h3>Sábado</h3>
                    <p>Descanso o actividad ligera</p>
                </div>
                <div class="dia">
                    <h3>Domingo</h3>
                    <p>Ejercicio de flexibilidad: 20 minutos de yoga</p>
                </div>
            </div>
            <div class="semana">
                <h2>Semana 3</h2>
                <div class="dia">
                    <h3>Lunes</h3>
                    <p>Ejercicio de fuerza: 3 series de 10 repeticiones</p>
                </div>
                <div class="dia">
                    <h3>Martes</h3>
                    <p>Ejercicio de cardio: 30 minutos de trote</p>
                </div>
                <div class="dia">
                    <h3>Miércoles</h3>
                    <p>Ejercicio de flexibilidad: 20 minutos de estiramientos</p>
                </div>
                <div class="dia">
                    <h3>Jueves</h3>
                    <p>Ejercicio de fuerza: 3 series de 12 repeticiones</p>
                </div>
                <div class="dia">
                    <h3>Viernes</h3>
                    <p>Ejercicio de cardio: 30 minutos de bicicleta</p>
                </div>
                <div class="dia">
                    <h3>Sábado</h3>
                    <p>Descanso o actividad ligera</p>
                </div>
                <div class="dia">
                    <h3>Domingo</h3>
                    <p>Ejercicio de flexibilidad: 20 minutos de yoga</p>
                </div>
            </div>
        </div>

        <div id="modal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h3>Resgistra tu progreso del Ejercicio</h3>
                <p id="modal-detalle"></p>

                <form id="registro-form">
                    <label for="series">Series realizadas:</label>
                    <input type="number" id="series" name="series" min="0" required>

                    <label for="tiempo">Tiempo (minutos):</label>
                    <input type="number" id="tiempo" name="tiempo" min="0" required>

                    <button type="submit">Guardar</button>
                </form>

                <div id="mensaje-confirmacion" style="display: none; margin-top: 10px; color: green;">
                    ¡Registro guardado!
                </div>
            </div>
        </div>

        <script>
            // Obtener elementos del modal
            const modal = document.getElementById('modal');
            const modalDetalle = document.getElementById('modal-detalle');
            const closeBtn = document.querySelector('.close');

            // Escuchar clic en cada div .dia
            document.querySelectorAll('.dia').forEach(dia => {
                dia.addEventListener('click', () => {
                    const detalle = dia.querySelector('p').textContent;

                    modalDetalle.textContent = detalle;

                    modal.style.display = 'block';
                });
            });

            // Cerrar modal al hacer clic en la X
            closeBtn.addEventListener('click', () => {
                modal.style.display = 'none';
            });

            // Cerrar modal al hacer clic fuera del contenido
            window.addEventListener('click', (e) => {
                if (e.target === modal) {
                    modal.style.display = 'none';
                }
            });

            const form = document.getElementById('registro-form');
            const mensaje = document.getElementById('mensaje-confirmacion');

            form.addEventListener('submit', (e) => {
                e.preventDefault(); // Evita que recargue la página

                const series = document.getElementById('series').value;
                const tiempo = document.getElementById('tiempo').value;

                // Aquí podrías enviar estos datos a un servidor o guardarlos localmente
                console.log(`Series: ${series}, Tiempo: ${tiempo}`);

                mensaje.style.display = 'block'; // Muestra mensaje de confirmación

                // Ocultar el modal después de unos segundos
                setTimeout(() => {
                    mensaje.style.display = 'none';
                    modal.style.display = 'none';
                }, 1500);
            });
        </script>

    </body>

    </html>