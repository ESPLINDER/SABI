<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cuestionario de Fitness</title>
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <style>
        body {
            background-color: #E2E2B6;
            display: flex;
            justify-content: center;
            align-items:flex-start;
            height: 175vh;
            margin: 10;
        }
        .form-container {
            width: 100%;
            max-width: 500px;
            padding: 10px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .btn-custom {
            background-color: black;
            color: azure;
            font-size: 18px;
            font-weight: bold;
            padding: 10px 20px;
            border: none;
            border-radius: 12px;
            position: relative;
            overflow: hidden;
            transition: color 0.3s ease;
            z-index: 1;
        }
        .btn-custom:hover {
            color: black;
        }
        .btn-custom::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, #021526, #03346E, #6EACDA, #E2E2B6, #E2E2B6, #6EACDA, #03346E, #021526, #03346E, #6EACDA, #E2E2B6);
            background-size: 400%;
            z-index: -1;
            transition: opacity 0.3s ease;
            opacity: 0;
            border-radius: 12px;
            animation: glowing 50s linear infinite;
        }
        .btn-custom:hover::before {
            opacity: 1;
        }
        @keyframes glowing {
            0% { background-position: 0 0; }
            50% { background-position: 200% 0; }
            100% { background-position: 0 0; }
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Cuestionario de Fitness</h2>
        <form id="fitnessForm" action="Pagina principal.html" method="get">
            <div class="mb-3">
                <label for="objetivoPrincipal" class="form-label">¿Cuál es tu principal objetivo?</label>
                <select id="objetivoPrincipal" class="form-select" required>
                    <option value="" disabled selected>Selecciona una opción</option>
                    <option value="perderPeso">Perder peso</option>
                    <option value="ganarMusculo">Ganar músculo</option>
                    <option value="mejorarResistencia">Mejorar la resistencia</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="metasEspecificas" class="form-label">¿Qué metas deseas alcanzar en los próximos meses?</label>
                <select id="metas" class="form-select" required>
                    <option value="Resistencia Fisica">Mejorar mi resistencia fisica</option>
                    <option value="Perder peso">Perder 5 kg de peso</option>
                    <option value="Masamuscular">Incrementar mi masa muscular</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="nivelActividad" class="form-label">¿Cual es su nivel de actividad Fisica?</label>
                <select id="nivelActividad" class="form-select" required>
                    <option value="" disabled selected>Selecciona una opción</option>
                    <option value="sedentario">Sedentario</option>
                    <option value="algoActivo">Algo activo</option>
                    <option value="muyActivo">Muy activo</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="frecuenciaEjercicio" class="form-label">¿Cuántas veces a la semana haces ejercicio?</label>
                <input type="number" id="frecuenciaEjercicio" class="form-control" placeholder="Ejemplo: 3" required min="0">
            </div>

            <div class="mb-3">
                <label for="preferenciaLugar" class="form-label">¿Prefieres entrenar en casa o en el gimnasio?</label>
                <select id="preferenciaLugar" class="form-select" required>
                    <option value="" disabled selected>Selecciona una opción</option>
                    <option value="casa">Casa</option>
                    <option value="gimnasio">Gimnasio</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="tipoEjercicio" class="form-label">¿Qué tipo de ejercicios disfrutas más?</label>
                <select id="tipoEjercicio" class="form-select" required>
                    <option value="" disabled selected>Selecciona una opción</option>
                    <option value="cardio">Cardio</option>
                    <option value="fuerza">Fuerza</option>
                    <option value="yoga">Yoga</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="lesiones" class="form-label">¿Tienes alguna lesión o condición médica que debamos considerar?</label>
                <input type="text" id="lesiones" class="form-control" placeholder="Especifica si tienes alguna lesión">
            </div>
            <div class="mb-3">
                <label for="ejerciciosEvitar" class="form-label">¿Hay algún ejercicio que debas evitar?</label>
                <input type="text" id="ejerciciosEvitar" class="form-control" placeholder="Especifica los ejercicios">
            </div>
            <div class="mb-3">
                <label class="form-label">¿Qué días puedes hacer tus rutinas?</label>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="lunes" name="dias" value="Lunes">
                    <label class="form-check-label" for="lunes">Lunes</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="martes" name="dias" value="Martes">
                    <label class="form-check-label" for="martes">Martes</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="miercoles" name="dias" value="Miércoles">
                    <label class="form-check-label" for="miercoles">Miércoles</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="jueves" name="dias" value="Jueves">
                    <label class="form-check-label" for="jueves">Jueves</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="viernes" name="dias" value="Viernes">
                    <label class="form-check-label" for="viernes">Viernes</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="sabado" name="dias" value="Sábado">
                    <label class="form-check-label" for="sabado">Sábado</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="domingo" name="dias" value="Domingo">
                    <label class="form-check-label" for="domingo">Domingo</label>
                </div>
            </div>

           
            <div class="mb-3">
                <label for="horas" class="form-label">¿Cuántas horas al día dedicarás?</label>
                <select class="form-select" id="horas" name="horas" required>
                    <option value="" selected disabled>Selecciona una opción</option>
                    <option value="1 hora">1 hora</option>
                    <option value="2 horas">2 horas</option>
                    <option value="3 horas">3 horas</option>
                    <option value="4 horas o más">4 horas o más</option>
                </select>
            </div>

      
            <div class="mb-3">
                <label for="parteDelDia" class="form-label">¿En qué parte del día realizarás las rutinas?</label>
                <select class="form-select" id="parteDelDia" name="parteDelDia" required>
                    <option value="" selected disabled>Selecciona una opción</option>
                    <option value="Mañana">Mañana</option>
                    <option value="Tarde">Tarde</option>
                    <option value="Noche">Noche</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="edad" class="form-label">¿Cuál es tu edad?</label>
                <input type="text" id="edadPesoAltura" class="form-control" placeholder="Ejemplo: 25" required>
            </div>
            <div class =""mb-3>
                <label for ="Peso" class="form-label">¿Cual es tu peso actual?</label>
                <select id="pesokg" class="form-select" required>
                    <option value="40-49 kg">40-49 kg</option>
                    <option value="50-59 kg">50-59 kg</option>
                    <option value="60-69 kg">60-69 kg</option>
                    <option value="70-79 kg">70-79 kg</option>
                    <option value="80-89 kg">80-89 kg</option>
                    <option value="90-99 kg">90-99 kg</option>
                    <option value="Más de 100 kg">Más de 100 kg</option>
                    
                </select>
            </div>

            <div class="mb-3">
                <label for="nivelExperiencia" class="form-label">¿Cuál es tu nivel de actividad Física?</label>
                <select id="nivelExperiencia" class="form-select" required>
                    <option value="" disabled selected>Selecciona una opción</option>
                    <option value="principiante">Principiante</option>
                    <option value="intermedio">Intermedio</option>
                    <option value="avanzado">Avanzado</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="horasSueno" class="form-label">¿Cuántas horas duermes normalmente?</label>
                <select id="horasdesueño" class="form-select"required>
                    <option value="Menos de 4 horas">Menos de 4 horas</option>
                    <option value="Entre 4 y 5 horas">Entre 4 y 5 horas</option>
                    <option value="Entre 5 y 6 horas">Entre 5 y 6 horas</option>
                    <option value="Entre 6 y 7 horas">Entre 6 y 7 horas</option>
                    <option value="Entre 7 y 8 horas">Entre 7 y 8 horas</option>
                    <option value="Más de 8 horas">Más de 8 horas</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="nivelEstres" class="form-label">¿Cómo calificarías tu nivel de estrés diario?</label>
                <select id="nivelEstres" class="form-select" required>
                    <option value="" disabled selected>Selecciona una opción</option>
                    <option value="bajo">Bajo</option>
                    <option value="medio">Medio</option>
                    <option value="alto">Alto</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="preferenciasDieteticas" class="form-label">¿Tienes alguna preferencia dietética o restricción alimentaria?</label>
                <input type="text" id="preferenciasDieteticas" class="form-control" placeholder="Especifica tus preferencias o restricciones" required>
            </div>
            <div class="mb-3">
                <label for="motivacion" class="form-label">¿Qué te motiva a seguir un programa de fitness?</label>
                <input type="text" id="motivacion" class="form-control" placeholder="Escribe tu motivación" required>
            </div>
            <div class="mb-3">
                <label for="apoyo" class="form-label">¿Tienes amigos o familiares que te apoyen en tus objetivos?</label>
                <input type="text" id="apoyo" class="form-control" placeholder="Especifica si tienes apoyo" required>
            </div>

            <button type="submit" class="btn btn-custom w-100">Enviar</button>
        </form>
    </div>

    <script src="../bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
       document.getElementById('fitnessForm').addEventListener('submit', function(event) {
    event.preventDefault(); 
    Swal.fire({
        icon: 'success',
        title: '¡Información guardada!',
        text: 'Tu información ha sido registrada exitosamente.',
        confirmButtonText: 'Aceptar',
        confirmButtonColor: '#021526'
    }).then(() => {
        
        this.submit();
    });
});
    </script>
</body>
</html>

