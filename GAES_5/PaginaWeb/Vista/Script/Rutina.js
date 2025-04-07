document.addEventListener('DOMContentLoaded', () => {
    const weekFields = document.getElementById('weekFields');


    // SUBIR VIDEOS
    document.getElementById('upload-video').addEventListener('change', function (event) {
        const videoFile = event.target.files[0]; // Obtener el archivo subido
        const videoElement = document.getElementById('uploaded-video'); // Elemento de video
        const videoContainer = document.getElementById('uploaded-video-container'); // Contenedor del video
        const uploadSection = document.getElementById('upload-section'); // Sección del botón de carga

        if (videoFile) {
            const videoURL = URL.createObjectURL(videoFile); // Crear una URL para el archivo subido
            videoElement.src = videoURL; // Establecer la URL como fuente del video
            videoElement.style.display = 'block'; // Hacer visible el video
            videoContainer.style.display = 'block'; // Mostrar el contenedor del video subido
            uploadSection.style.display = 'none'; // Ocultar el botón de subir archivo
        }
    });

    // Guardar modal
    const saveButton = document.querySelector("#saveModal"); // Botón Guardar Cambios en el modal

    // Evento para guardar el cambio en modal
    saveButton.addEventListener("click", function () {
        console.log(saveButton);
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

    // Mostrar historial
    const loadHistorial = document.querySelector("#loadHistorial"); // Botón cargar historial
    const historial = document.querySelector("#historial"); // Botón cargar historial
    console.log(loadHistorial, "11111111111111111111", historial);

    loadHistorial.addEventListener("click", function () {
        historial.classList.remove("d-none"); // Muestra el historial
    });
});