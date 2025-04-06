document.addEventListener("DOMContentLoaded", function () {
    const formCrearEjercicio = document.getElementById("crearEjercicio");
    const seccionCrearEjercicio = document.getElementById("seccionCrearEjercicio");
    const selectEjercicio = document.getElementById("exerciseSelect");

    formCrearEjercicio.addEventListener("submit", function (event) {
        event.preventDefault();
        const formData = new FormData(formCrearEjercicio);

        fetch("agregarEjercicio.php", {
            method: "POST",
            body: formData
        })
        .then(response => response.text())
        .then(data => {
            const nuevoNombre = formData.get("nomEjercicio");
            const nuevaOpcion = document.createElement("option");
            nuevaOpcion.value = nuevoNombre;
            nuevaOpcion.text = nuevoNombre;
            nuevaOpcion.selected = true;
            selectEjercicio.appendChild(nuevaOpcion);

            seccionCrearEjercicio.style.display = "none";
            formCrearEjercicio.reset();
        })
        .catch(error => {
            console.error("Error al guardar el ejercicio:", error);
        });
    });
});