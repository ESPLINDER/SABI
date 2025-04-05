document.addEventListener('DOMContentLoaded', () => {
    const redes = document.querySelector("#redes"); // Div que contiene las redes
    const toggleRedes = document.querySelector("#toggle-redes"); // Enlace para mostrar/ocultar
    const up = document.querySelector(".up"); // subir
    const down = document.querySelector(".down"); // bajar

    toggleRedes.addEventListener("click", (event) => {
        event.preventDefault(); // Prevenir el comportamiento predeterminado del enlace
        redes.classList.toggle("d-none"); // Alternar la clase d-none
        up.classList.toggle("d-none"); // Alternar la clase d-none
        down.classList.toggle("d-none"); // Alternar la clase d-none
    });

    // Chat
    const chat = document.querySelector("#chat"); // Todo el chat
    const mostrar = document.querySelector(".mostrar"); // Enlace para mostrar/ocultar

    mostrar.addEventListener("click", (event) => {
        event.preventDefault(); // Prevenir el comportamiento predeterminado del enlace
        chat.classList.toggle("d-none"); // Alternar la clase d-none
    });
    
    const mostrar2 = document.querySelector(".mostrar2"); // Enlace para mostrar/ocultar

    mostrar2.addEventListener("click", (event) => {
        event.preventDefault(); // Prevenir el comportamiento predeterminado del enlace
        chat.classList.toggle("d-none"); // Alternar la clase d-none
    });
});
function openNav() {
    document.getElementById("mySidebar").style.width = "250px";
}
function closeNav() {
    document.getElementById("mySidebar").style.width = "0";
}