document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("registroUsuario").addEventListener("submit", function () {
        
        const email = document.getElementById("email").value;
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (!emailRegex.test(email)) {
            alert("Correo no Valido");
            return;
        }
    });

    const fechaNacimientoInput = document.getElementById('fechaNacimiento');
    fechaNacimientoInput.addEventListener('input', () => {
        if (fechaNacimientoInput.validity.valid) {
            fechaNacimientoInput.classList.add('valid');
            fechaNacimientoInput.classList.remove('invalid');
        } else {
            fechaNacimientoInput.classList.add('invalid');
            fechaNacimientoInput.classList.remove('valid');
        }
    });

    function validarPassword() {
        const pass = document.getElementById("password").value;
        const confirmar = document.getElementById("confPassword").value;
        const mensaje = document.getElementById("mensaje");

        if (pass.length < 8) {
            mensaje.textContent = "La contraseña debe tener al menos 8 caracteres.";
            return false;
        }
        if (pass !== confirmar) {
            mensaje.textContent = "Las contraseñas no coinciden.";
            return false;
        }
        mensaje.textContent = "";
        return true;
    }
}); 