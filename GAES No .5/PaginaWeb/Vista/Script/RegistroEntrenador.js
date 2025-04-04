document.addEventListener('DOMContentLoaded', () => {
    // SUBIR certificado
    document.getElementById('certificado').addEventListener('change', function (event) {
        const videoFile = event.target.files[0]; // Obtener el archivo subido
        const subir = document.getElementById('subir'); // icono subir
        const subido = document.getElementById('subido'); // Sección del botón de carga

        if (videoFile) {
            subir.classList.add("d-none");
            subido.classList.remove("d-none");
        }
    });
});