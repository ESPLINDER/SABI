document.addEventListener('DOMContentLoaded', () => {
    // ir a las rutinas guardadas
    const goEdit = document.querySelectorAll(".editar"); // Botón ir a editar
    goEdit.forEach(button => {
        button.addEventListener("click", function () {
            window.location.href = 'EditarRutina.html';
        });
    });

    // ir a crear rutina
    const goCreate = document.querySelectorAll(".nueva"); // Botón ir a editar
    goCreate.forEach(button => {
        button.addEventListener("click", function () {
            window.location.href = '../Entrenador/CreacionRutina.php';
        });
    });

    // asignar a nicolas
    const goclientes = document.querySelectorAll(".asignarNicolas"); // Botón ir a editar
    goclientes.forEach(button => {
        button.addEventListener("click", function () {
            window.location.href = '../Entrenador/clientes.php';
        });
    });

    // alerta rutina asignada
    const modalEl = document.getElementById("diagnostico");
    let modalElement = bootstrap.Modal.getInstance(modalEl);
    modalElement = new bootstrap.Modal(modalEl);
    const modalcli = document.getElementById("clientes");
    let modalClientes = bootstrap.Modal.getInstance(modalcli);
    modalClientes = new bootstrap.Modal(modalcli);
    
    const asignarModal = document.querySelectorAll(".asignarModal"); // Botón asignar a cliente
    const asignada = document.querySelector("#asignada"); // alerta
    asignarModal.forEach(button => {
        button.addEventListener("click", function () {
            asignada.classList.remove("d-none"); // Muestra la alerta
            // Redirigir después de un tiempo
            setTimeout(() => {
                asignada.classList.add("d-none");
                modalElement.hide(); // Cerrar el modal
                setTimeout(() => {
                    window.location.href = 'rutinasGuardadas.php';
                }, 500); // Espera 2 segundos antes de esconder
            }, 2000); // Espera 2 segundos antes de esconder
        });
    });
});