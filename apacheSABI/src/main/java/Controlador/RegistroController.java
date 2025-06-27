package Controlador;

import Modelo.Usuario;
import Modelo.UsuarioDao;

import Modelo.Rutina;
import Modelo.RutinaDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet("/registro")
public class RegistroController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String tipoDocumento = request.getParameter("tipoDocumento");
        String numeroDocumento = request.getParameter("numeroDocumento");
        String ciudad = request.getParameter("ciudad");
        String rol = request.getParameter("rol");

        String errorMessage = null;

        // Validaciones básicas
        if (nombre == null || nombre.trim().isEmpty() ||
            apellido == null || apellido.trim().isEmpty() ||
            email == null || email.trim().isEmpty() ||
            password == null || password.isEmpty() ||
            numeroDocumento == null || numeroDocumento.trim().isEmpty()) {
            errorMessage = "Todos los campos obligatorios deben ser completados";
        } else if (!password.equals(confirmPassword)) {
            errorMessage = "Las contraseñas no coinciden";
        } else if (password.length() < 8) {
            errorMessage = "La contraseña debe tener al menos 8 caracteres";
        } else {
            UsuarioDao usuarioDao = new UsuarioDao();

            // Verificar duplicados
            if (usuarioDao.existeEmail(email.trim())) {
                errorMessage = "El correo electrónico ya está registrado";
            } else if (usuarioDao.existeDocumento(Integer.parseInt(numeroDocumento.trim()))) {
                errorMessage = "El número de documento ya está registrado";
            } else {
                // Crear nuevo usuario
                Usuario nuevoUsuario = new Usuario();
                nuevoUsuario.setnomUsuario(nombre.trim());
                nuevoUsuario.setapeUsuario(apellido.trim());
                nuevoUsuario.setEmaUsuario(email.trim());
                nuevoUsuario.setPassUsuario(password);
                nuevoUsuario.setTipDocumento(tipoDocumento);
                nuevoUsuario.setNumDocumento(Integer.parseInt(numeroDocumento.trim()));
                nuevoUsuario.setCiudadUsuario(ciudad);
                nuevoUsuario.setRolUsuario(rol != null ? rol : "cliente");
                nuevoUsuario.setEspecialidad("");
                nuevoUsuario.setXpAños(0.0f);
                nuevoUsuario.setBiografia("");
                nuevoUsuario.setPromCalificacion(0);
                nuevoUsuario.setEstadoUsuario("activo");

                // Agregar usuario a la base de datos
                int resultado = usuarioDao.Agregar(nuevoUsuario);

                if (resultado > 0) {
                // Redirigir según el rol
                if ("entrenador".equals(rol)) {
                response.sendRedirect(request.getContextPath() + "/vistas/Entrenador/index.jsp");
                } else {
                 response.sendRedirect(request.getContextPath() + "/vistas/Cliente/cliente.jsp");
                }
                } else {
                errorMessage = "Error al registrar el usuario. Por favor, inténtalo de nuevo.";
                 System.err.println("Error al registrar el usuario: " + nuevoUsuario); // Para depuración
               }
            }
        }

        // Si hay un error, volver a mostrar el formulario con el mensaje de error
        request.setAttribute("error", errorMessage);
        request.getRequestDispatcher("/registro.jsp").forward(request, response);
    }
}
