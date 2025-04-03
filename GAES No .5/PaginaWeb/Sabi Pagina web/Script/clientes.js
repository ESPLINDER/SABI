document.addEventListener('DOMContentLoaded', () => {
    // ir a las rutinas guardadas
    const goasignar = document.querySelectorAll(".asignar"); // Botón ir a editar
    goasignar.forEach(button => {
        button.addEventListener("click", function () {
            window.location.href = 'rutinasGuardadas.html';
        });
    });

    // activar asignar
    const diagnostico1 = document.querySelector(".diagnostico1"); // Botón diagnostico
    const asignar1 = document.querySelector(".asignar1"); // Botón asignar
    diagnostico1.addEventListener("click", function () {
        asignar1.disabled = !asignar1.disabled; // habilitar
    });
    const diagnostico2 = document.querySelector(".diagnostico2"); // Botón diagnostico
    const asignar2 = document.querySelector(".asignar2"); // Botón asignar
    diagnostico2.addEventListener("click", function () {
        asignar2.disabled = !asignar2.disabled; // habilitar
    });
    const diagnostico3 = document.querySelector(".diagnostico3"); // Botón diagnostico
    const asignar3 = document.querySelector(".asignar3"); // Botón asignar
    diagnostico3.addEventListener("click", function () {
        asignar3.disabled = !asignar3.disabled; // habilitar
    });

    // ver progreso
    const progreso = document.querySelector(".progreso"); // Botón asignar
    progreso.addEventListener("click", function () {
        window.location.href = 'progreso.html';
    });
});