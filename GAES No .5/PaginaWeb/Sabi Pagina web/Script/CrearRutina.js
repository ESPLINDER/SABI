document.addEventListener('DOMContentLoaded', () => {
    const weekFields = document.getElementById('weekFields');
    const addWeekButton = document.getElementById('addWeek'); // Botón para agregar semanas
    let weekCount = 1;

    // Agregar una nueva semana con un día inicial
    addWeekButton.addEventListener('click', () => {
        weekCount++;
        if (weekCount > 11) { // Máximo 10 semanas
            alert('No puedes agregar más de 10 semanas.');
            return;
        }
        const guide = document.getElementById('guide'); // seccion de la guia inicial
        guide.style.display = 'none'; // esconder la guia
        const saveRutina = document.getElementById('saveRutina'); // boton guardar
        saveRutina.style.display = ''; // mostrar boton

        const newWeek = document.createElement('div');
        newWeek.className = 'week-group mt-2 semana';
        newWeek.innerHTML = `
            <h2>SEMANA ${weekCount - 1}</h2>
            <div id="dayFields-week-${weekCount}" class="row">
                <!-- Día inicial -->
                ${createDayFieldWithModal(1, weekCount)}
            </div>
            <button type="button" class="btn btn-primary mt-2 add-day" data-week="${weekCount}">+ Agregar Día</button>
        `;

        // Agregar la nueva semana antes del botón "Agregar Semana"
        weekFields.insertBefore(newWeek, addWeekButton);
    });

    // Delegación para agregar días dentro de una semana específica
    weekFields.addEventListener('click', (event) => {
        if (event.target && event.target.classList.contains('add-day')) {
            const weekId = event.target.dataset.week;
            const dayFields = document.getElementById(`dayFields-week-${weekId}`);
            const currentDayCount = dayFields.getElementsByClassName('day-group').length;

            if (currentDayCount >= 7) {
                alert('Una semana no puede tener más de 7 días.');
                return;
            }

            // Agregar un nuevo día
            dayFields.insertAdjacentHTML('beforeend', createDayFieldWithModal(currentDayCount + 1, weekId));
        }
    });

    // Botón para agregar ejercicios adicionales en un día
    weekFields.addEventListener("click", (event) => {
        if (event.target && event.target.classList.contains("add-exercise")) {
            const dayGroup = event.target.closest(".day-group");

            // Contenedor de ejercicios
            let exerciseContainer = dayGroup.querySelector(".exercise-container");
            if (!exerciseContainer) {
                exerciseContainer = document.createElement("div");
                exerciseContainer.className = "exercise-container mt-2";
                dayGroup.insertBefore(exerciseContainer, event.target); // Agregar antes del botón
            }

            // Crear un nuevo ejercicio
            const newExercise = document.createElement("div");
            newExercise.className = "exercise-item mb-2";
            newExercise.innerHTML = `
                <select class="form-select" data-bs-toggle="modal" data-bs-target="#myModal">
                    <option value="">Selecciona un ejercicio</option>
                </select>
            `;

            // Insertar el nuevo ejercicio
            exerciseContainer.appendChild(newExercise);
        }
    });


    function createDayFieldWithModal(dayNumber, weekNumber) {
        return `
        <div class="mx-auto mb-3 day-group col-sm-6 col-md-4 col-lg-3 col-xl-2">
            <label for="day-${weekNumber}-${dayNumber}" class="form-label">Día ${dayNumber}</label>
            <!-- Select que abre el modal -->
            <select name="Ejercicio" id="modal-${weekNumber}-${dayNumber}" class="col-sm-12 form-select" data-bs-toggle="modal" data-bs-target="#myModal">
                <option value="">Selecciona un ejercicio</option>
            </select>
            <button type="button" class="btn btn-sm btn-secondary add-exercise mt-2">+ Agregar Ejercicio</button>
        </div>`;
    }




    // Escuchar cambios en el campo select
    const exerciseDetails = document.getElementById('exerciseSelect');
    exerciseDetails.addEventListener('change', function () {
        const selectedValue = this.value; // Obtener el valor seleccionado
        const exerciseDetails = document.getElementById('exerciseDetails'); // Contenedor a mostrar
        const borderDetails = document.getElementById('borderDetails'); // Contenedor a mostrar

        // Mostrar el contenido solo si se selecciona un ejercicio válido
        if (selectedValue && selectedValue !== 'Descanso') {
            exerciseDetails.style.display = ''; // Mostrar contenido
            borderDetails.style.display = ''; // Mostrar contenido
        } else {
            exerciseDetails.style.display = 'none'; // Ocultar contenido
            borderDetails.style.display = 'none'; // Ocultar contenido
        }
    });

    // Añadir series
    document.getElementById('addSerie').addEventListener('click', function () {
        const seriesForm = document.getElementById('seriesForm'); // Contenedor del formulario
        const seriesCount = seriesForm.querySelectorAll('.serie-item').length + 1; // Contar cuántas series hay actualmente

        // Crear un nuevo contenedor para la serie
        const newSerie = document.createElement('div');
        newSerie.className = 'serie-item mt-3 row'; // Agregar clase para estilos
        newSerie.innerHTML = `
          <label for="serie-${seriesCount}" class="form-label">Serie ${seriesCount}</label>
          <div class="col-md-7">
            <label for="Peso-${seriesCount}">Peso *</label>
            <div class="input-group">
              <input type="number" id="Peso-${seriesCount}" class="form-control" placeholder="Ejemplo: 10" required min="1">
              <span class="input-group-text">Kg</span>
            </div>
          </div>
          <div class="col-md-5">
            <label for="Repeticiones-${seriesCount}">Repeticiones *</label>
            <input type="number" id="Repeticiones-${seriesCount}" class="form-control" placeholder="Ejemplo: 10" required min="1">
          </div>
        `;

        // Agregar la nueva serie al formulario
        seriesForm.insertBefore(newSerie, this); // Insertar antes del botón "Agregar serie"
    });

    // SUBIR VIDEOS
    document.getElementById('upload-video').addEventListener('change', function (event) {
        const videoFile = event.target.files[0]; // Obtener el archivo subido
        const videoElement = document.getElementById('uploaded-video'); // Elemento de video
        const videoContainer = document.getElementById('uploaded-video-container'); // Contenedor del video
        const uploadSection = document.getElementById('upload-section'); // Sección del botón de carga
        const defaultVideoContainer = document.getElementById('default-video-container'); // Contenedor del video inicial

        if (videoFile) {
            const videoURL = URL.createObjectURL(videoFile); // Crear una URL para el archivo subido
            videoElement.src = videoURL; // Establecer la URL como fuente del video
            videoElement.style.display = 'block'; // Hacer visible el video
            videoContainer.style.display = 'block'; // Mostrar el contenedor del video subido
            uploadSection.style.display = 'none'; // Ocultar el botón de subir archivo
            defaultVideoContainer.style.display = 'none'; // Ocultar el video por defecto
        }
    });

    // Guardar modal
    weekFields.addEventListener('click', (event) => {
        const exerciseSelectModal = document.getElementById("exerciseSelect"); // Select dentro del modal
        const selectOutside = event.target; // Select fuera del modal
        const saveButton = document.querySelector("#saveModal"); // Botón Guardar Cambios en el modal

        // Evento para guardar el cambio en modal
        saveButton.addEventListener("click", function () {
            const saveRutina = document.getElementById('saveRutina'); // boton guardar rutina
            saveRutina.style.display = ''; // mostrar boton guardar rutina

            const selectedExercise = exerciseSelectModal.value; // Obtener valor del select en el modal
            selectOutside.innerHTML = `<option value="${selectedExercise}">${selectedExercise}</option>`; // Actualizar el select fuera del modal
            const modalElement = bootstrap.Modal.getInstance(document.getElementById("myModal"));
            const exerciseSaved = document.querySelector("#exerciseSaved"); // notificacion de guardado
            const formulario = document.querySelector("#seriesForm"); // formulario de ejercicio
            const repeticionInput = document.querySelector("#Repeticiones"); //input repeticiones
            const pesoInput = document.querySelector("#Peso"); //input peso

            formulario.addEventListener("submit", function (event) {
                event.preventDefault(); // evita recargar la pagina
                const repeticiones = repeticionInput.value;
                const peso = pesoInput.value;
                if (!repeticiones || repeticiones <= 0 || !peso || peso <= 0) { } else {
                    exerciseSaved.classList.remove("d-none"); // Muestra la alerta
                    // Redirigir después de un tiempo
                    setTimeout(() => {
                        exerciseSaved.classList.add("d-none");
                        modalElement.hide(); // Cerrar el modal
                    }, 1500); // Espera 1.5 segundos antes de esconder
                }
            });
        });
    });

    // Mostrar campo describir
    const nombrar = document.querySelector("#nombrar"); // seccion nombrar rutina
    const describir = document.querySelector("#describir"); // seccion nombrar rutina
    nombrar.addEventListener("change", function () {
        describir.style.display = ''; // mostrar select
    });

    // Mostrar campo dificultad
    const difficulty = document.querySelector("#difficulty"); // seccion select
    describir.addEventListener("change", function () {
        difficulty.style.display = ''; // mostrar select
    });

    // habilitar guardado
    difficulty.addEventListener("change", function () {
        saveAll.disabled = !saveAll.disabled; // habilitar
    });

    // Evento para guardar todal la rutina
    const saveAll = document.querySelector("#saveAll"); // Botón Guardar rutina
    const routineSaved = document.querySelector("#routineSaved");
    saveAll.addEventListener("click", function () {
        routineSaved.classList.remove("d-none"); // Muestra la alerta
        // Redirigir después de un tiempo
        setTimeout(() => {
            window.location.href = 'rutinasGuardadas.html';
        }, 1500); // Espera 1.5 segundos antes de redirigir
    });

    // ir a las rutinas guardadas
    const goRoutineSaved = document.querySelector("#goRoutineSaved"); // Botón ir a rutinas guardadas
    goRoutineSaved.addEventListener("click", function () {
        window.location.href = 'rutinasGuardadas.html';
    });
});