document.addEventListener("DOMContentLoaded", function () {
    const botonesAgregar = document.querySelectorAll(".btnAgregarEjercicio");

    botonesAgregar.forEach(boton => {
        boton.addEventListener("click", function () {
            const contenedorDia = this.closest(".dia");
            const contenedorSemana = this.closest(".semana");

            const dia = contenedorDia.dataset.dia;
            const semana = contenedorSemana.dataset.semana;

            // Guardar en los inputs ocultos
            document.getElementById("semanaSeleccionada").value = semana;
            document.getElementById("diaSeleccionado").value = dia;

            // Mostrar el formulario lateral
            document.getElementById("formularioLateral").style.display = "block";
        });
    });


    const formCrearEjercicio = document.getElementById("crearEjercicio");
    const seccionCrearEjercicio = document.getElementById("seccionCrearEjercicio");
    const selectEjercicio = document.getElementById("exerciseSelect");

    const btnCrearEjercicio = document.getElementById("btnCrearEjercicio");

    //funcion para mostrar el formulario de creacion de ejercicio
    btnCrearEjercicio.addEventListener("click", function () {
        seccionCrearEjercicio.style.display = "block";
    });

    //ocultar
    formCrearEjercicio.addEventListener("submit", function (event) {
        event.preventDefault();
        const formData = new FormData(formCrearEjercicio);

        fetch("../../Controlador/Entrenador/agregarEjercicio.php", {
            method: "POST",
            body: formData
        })
            .then(response => response.json())
            .then(data => {
                const nuevoNombre = formData.get("nomEjercicio");
                const nuevaOpcion = document.createElement("option");
                nuevaOpcion.value = nuevoNombre;
                nuevaOpcion.text = nuevoNombre;
                selectEjercicio.appendChild(nuevaOpcion);

                seccionCrearEjercicio.style.display = "none";
                formCrearEjercicio.reset();
                alert("✅ Ejercicio guardado exitosamente");
            })
            .catch(error => {
                console.error("Error al guardar el ejercicio:", error);
            });
    });

    //funcion select activa el formulario series
    const seccionSeries = document.getElementById('seccionSeries');

    selectEjercicio.addEventListener('change', () => {
        if (selectEjercicio.value !== "") {
            seccionSeries.style.display = 'block';
            seccionCrearEjercicio.style.display = "none";
        } else {
            seccionSeries.style.display = 'none';
        }
    });

    //funcion para agregar series
    document.getElementById("btnAgregarSerie").addEventListener("click", function () {
        agregarNuevaSerie();
    });

    function agregarNuevaSerie(peso = '', repeticiones = '') {
        const container = document.getElementById("seriesContainer");
        const numeroSerie = container.children.length + 1;

        const serie = document.createElement("div");
        serie.classList.add("mb-3", "serie-item", "border", "p-2", "rounded", "position-relative");

        serie.innerHTML = `
            <h6>Serie ${numeroSerie}</h6>
            <div class="mb-2">
                <label>Peso (kg):</label>
                <input type="number" name="peso[]" class="form-control" value="${peso}" required>
            </div>
            <div class="mb-2">
                <label>Repeticiones:</label>
                <input type="number" name="repeticiones[]" class="form-control" value="${repeticiones}" required>
            </div>
            <div class="text-end">
                <button class="btn btn-outline-danger btn-sm btnEliminarSerie"><i class="bi bi-trash-fill"></i></button>
                <button class="btn btn-outline-secondary btn-sm btnDuplicarSerie"><i class="bi bi-files"></i></button>
            </div>
        `;

        // Añadir eventos a los botones dentro de esta serie
        serie.querySelector(".btnEliminarSerie").addEventListener("click", () => {
            serie.remove();
            actualizarTitulosSeries();
        });

        serie.querySelector(".btnDuplicarSerie").addEventListener("click", () => {
            const pesoVal = serie.querySelector('input[name="peso[]"]').value;
            const repVal = serie.querySelector('input[name="repeticiones[]"]').value;
            agregarNuevaSerie(pesoVal, repVal);
        });

        container.appendChild(serie);
        actualizarTitulosSeries();
    }

    function actualizarTitulosSeries() {
        const series = document.querySelectorAll("#seriesContainer .serie-item h6");
        series.forEach((h6, index) => {
            h6.textContent = `Serie ${index + 1}`;
        });
    }

    document.getElementById("btnGenerarRutina").addEventListener("click", function () {
        const semanas = parseInt(document.getElementById("numSemanas").value);
        const dias = parseInt(document.getElementById("numDias").value);
        const ejercicios = parseInt(document.getElementById("numEjercicios").value);
    
        const contenedor = document.getElementById("rutinaGenerada");
        contenedor.innerHTML = "";
        contenedor.style.display = "block";
    
        for (let s = 1; s <= semanas; s++) {
            const semanaDiv = document.createElement("div");
            semanaDiv.classList.add("semana", "border", "p-3", "mb-4", "row");
            semanaDiv.innerHTML = `<h4 class="text-center">Semana ${s}</h4>`;
    
            for (let d = 1; d <= dias; d++) {
                const diaDiv = document.createElement("div");
                diaDiv.classList.add("dia", "p-2", "mb-2", "col-sm-3", "mx-auto");
                diaDiv.innerHTML = `<h5 class="text-center">Día ${d}</h5>`;
    
                for (let e = 1; e <= ejercicios; e++) {
                    const ejercicioDiv = document.createElement("div");
                    ejercicioDiv.classList.add("ejercicio", "mb-2");
                    ejercicioDiv.innerHTML = `
                        <label>Ejercicio ${e}:</label>
                        <select class="form-select mb-2">
                            <option value="">Seleccionar ejercicio</option>
                            <!-- Aquí puedes insertar dinámicamente tus ejercicios desde PHP -->
                        </select>
                    `;
                    diaDiv.appendChild(ejercicioDiv);
                }
    
                semanaDiv.appendChild(diaDiv);
            }
    
            contenedor.appendChild(semanaDiv);
        }
    
        document.getElementById("configuracionInicial").style.display = "none";
    });
});