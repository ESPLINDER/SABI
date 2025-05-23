document.addEventListener("DOMContentLoaded", function () {
  // Todo el código va aquí dentro

  const clientes = [
    { nombre: "CRISTIAN DUVAN VASQUEZ MOYANO", id: "1030690985" },
    { nombre: "CRISTIAN CAMILO GIL GONZALEZ", id: "1000469592" },
    { nombre: "CRISTIAN ROA CONSTRUCCIONES SAS", id: "901651152" },
    { nombre: "Cristobal Gil Buitrago Gil", id: "74356721" },
    { nombre: "CRISTOBAL QUINTERO GIRALDO", id: "19409107" },
    { nombre: "VICARIA EPISCOPAL TERRITORIAL DE CRISTO SACERDOTES", id: "800200820" },
    { nombre: "CRISTIAN IBAÑEZ PERALTA", id: "1015409548" }
  ];

  const input = document.getElementById("cliente");
  const resultado = document.getElementById("resultado");

  input.addEventListener("input", () => {
    const valor = input.value.toLowerCase();
    resultado.innerHTML = "";

    if (valor.trim() === "") {
      resultado.style.display = "none";
      return;
    }

    const filtrados = clientes.filter(c => c.nombre.toLowerCase().includes(valor));

    filtrados.forEach(c => {
      const div = document.createElement("div");
      div.textContent = `${c.nombre} (${c.id})`;
      div.onclick = () => {
        input.value = c.nombre;
        resultado.style.display = "none";
      };
      resultado.appendChild(div);
    });

    const crearNuevo = document.createElement("div");
    crearNuevo.id = "crear-nuevo";
    crearNuevo.textContent = "+ Crear nuevo";
    crearNuevo.onclick = () => {
      alert("Abrir formulario de creación de cliente");
      resultado.style.display = "none";
    };
    resultado.appendChild(crearNuevo);

    resultado.style.display = "block";
  });

  document.addEventListener("click", (e) => {
    if (!resultado.contains(e.target) && e.target !== input) {
      resultado.style.display = "none";
    }
  });
});