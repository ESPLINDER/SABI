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
        fetch("../../Controlador/Entrenador/obtenerEjercicios.php") // asegúrate que la ruta sea correcta
            .then(response => response.json())
            .then(ejerciciosBD => {
                console.log("Ejercicios recibidos:", ejerciciosBD);
                const semanas = parseInt(document.getElementById("numSemanas").value);
                const dias = parseInt(document.getElementById("numDias").value);
                const ejercicios = parseInt(document.getElementById("numEjercicios").value);

                const contenedor = document.getElementById("rutinaGenerada");
                contenedor.innerHTML = "";
                contenedor.style.display = "block";
                document.getElementById("infoRutina").style.display = "block";
                document.getElementById("guide").style.display = "none";

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
                            ejercicioDiv.classList.add("ejercicio", "mb-2", "d-flex", "align-items-center", "gap-2");

                            // Label
                            const label = document.createElement("label");
                            label.textContent = ``;
                            label.classList.add("me-2", "mb-0");

                            // Select
                            const select = document.createElement("select");
                            select.classList.add("form-select", "mb-2", "flex-grow-1");
                            select.innerHTML = `<option value="">Seleccionar ejercicio</option>`;
                            ejerciciosBD.forEach(ej => {
                                select.innerHTML += `<option value="${ej.idEjercicio}">${ej.nomEjercicio}</option>`;
                            });

                            // Botón eliminar
                            const btnEliminar = document.createElement("button");
                            btnEliminar.classList.add("btn", "btn-danger", "btn-sm");
                            btnEliminar.innerHTML = "🗑️";
                            btnEliminar.title = "Eliminar este ejercicio";
                            btnEliminar.addEventListener("click", () => {
                                ejercicioDiv.remove();
                            });

                            // Armar el div de ejercicio
                            ejercicioDiv.appendChild(label);
                            ejercicioDiv.appendChild(select);
                            ejercicioDiv.appendChild(btnEliminar);

                            // Insertar en el día
                            diaDiv.appendChild(ejercicioDiv);
                        }

                        semanaDiv.appendChild(diaDiv);
                    }

                    contenedor.appendChild(semanaDiv);
                }

                document.getElementById("configuracionInicial").style.display = "none";
            })
            .catch(error => {
                console.error("Error al cargar ejercicios:", error);
                alert("No se pudieron cargar los ejercicios.");
            });

        document.getElementById("btnGuardarRutina").addEventListener("click", () => {
            const nombre = document.getElementById("nombreRutina").value;
            const descripcion = document.getElementById("descRutina").value;
            const intensidad = document.getElementById("intensidad").value;

            const semanas = document.querySelectorAll(".semana");
            let datos = [];

            semanas.forEach((semanaDiv, i) => {
                const dias = semanaDiv.querySelectorAll(".dia");
                dias.forEach((diaDiv, j) => {
                    const ejercicios = diaDiv.querySelectorAll("select");
                    ejercicios.forEach(select => {
                        const idEjercicio = select.value;
                        if (idEjercicio) {
                            datos.push({
                                semana: i + 1,
                                dia: j + 1,
                                idEjercicio
                            });
                        }
                    });
                });
            });

            const rutina = {
                nombre,
                descripcion,
                intensidad,
                datos
            };

            if (typeof rutinaEnEdicion !== "undefined" && rutinaEnEdicion !== null) {
                rutina.idRutina = rutinaEnEdicion;
            }

            fetch("/SABI/GAES_5/PaginaWeb/Controlador/Entrenador/guardarRutina.php", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(rutina)
            })
                .then(res => res.json())
                .then(response => {
                    console.log("RESPUESTA GUARDAR:", response); // 👈 esto
                    if (response.success) {
                        // Guardar la rutina en localStorage
                        const rutinaGuardada = {
                            nombre,
                            descripcion,
                            intensidad,
                            semanas: Math.max(...datos.map(d => d.semana)),
                            fecha: response.fecha,
                            id: response.idRutina
                        };
                
                        localStorage.setItem("ultimaRutina", JSON.stringify(rutinaGuardada));
                
                        // Redirigir a página de rutinas
                        window.location.href = "/SABI/GAES_5/PaginaWeb/Vista/Entrenador/rutinasGuardadas.php";
                    } else {
                        alert("Error al guardar rutina: " + response.error);
                    }
                })
        });
    });
});


