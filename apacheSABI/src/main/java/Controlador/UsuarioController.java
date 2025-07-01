package Controlador;

import Modelo.Usuario;
import Modelo.UsuarioDao;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author William
 */

@WebServlet(name = "UsuarioController", urlPatterns = {"/UsuarioController"})
public class UsuarioController extends HttpServlet {
    private final UsuarioDao usuarioDao = new UsuarioDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Usuario> listaEntrenadores = usuarioDao.listarEntrenadores();

        request.setAttribute("entrenadores", listaEntrenadores);
        request.getRequestDispatcher("vistas/Cliente/entrenadores.jsp").forward(request, response);
        System.out.println("El servlt esta funcionando");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener parámetros del formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String tipoDocumento = request.getParameter("tipoDocumento");
        String numeroDocumento = request.getParameter("numeroDocumento");
        String ciudad = request.getParameter("ciudad");
        String rol = request.getParameter("rol");

        // Validaciones básicas
        String errorMessage = validateInputs(nombre, apellido, email, password, numeroDocumento, ciudad, rol);
        if (errorMessage != null) {
            request.setAttribute("error", errorMessage);
            request.getRequestDispatcher("registro.jsp").forward(request, response);
            return; // Detener la ejecución si hay un error
        }

        // Crear una nueva instancia de Usuario
        Usuario nuevoUsuario = new Usuario();
        nuevoUsuario.setNomUsuario(nombre.trim());
        nuevoUsuario.setApeUsuario(apellido.trim());
        nuevoUsuario.setEmaUsuario(email.trim());
        nuevoUsuario.setPassUsuario(password); // Sin hash por ahora
        nuevoUsuario.setTipDocumento(tipoDocumento);
        nuevoUsuario.setNumDocumento(Integer.parseInt(numeroDocumento.trim()));
        nuevoUsuario.setCiudadUsuario(ciudad);
        nuevoUsuario.setRolUsuario(rol != null ? rol : "cliente"); 
        nuevoUsuario.setEspecialidad(""); 
        nuevoUsuario.setXpAños(0.0f); 
        nuevoUsuario.setBiografia("");
        nuevoUsuario.setPromCalificacion(0);
        nuevoUsuario.setEstadoUsuario("activo");
        try {
            // Intentar crear el usuario en la base de datos
            if (usuarioDao.Agregar(nuevoUsuario) > 0) {
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("error", "Error al registrar el usuario. Inténtalo de nuevo.");
                request.getRequestDispatcher("registro.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // Método para validar los inputs
    private String validateInputs(String nombre, String apellido, String email, String password, String numeroDocumento, String ciudad, String rol) {
        if (nombre == null || nombre.trim().isEmpty()) {
            return "El nombre es obligatorio.";
        }
        if (apellido == null || apellido.trim().isEmpty()) {
            return "El apellido es obligatorio.";
        }
        if (email == null || email.trim().isEmpty()) {
            return "El correo electrónico es obligatorio.";
        }
        if (password == null || password.length() < 8) {
            return "La contraseña debe tener al menos 8 caracteres.";
        }
        if (numeroDocumento == null || numeroDocumento.trim().isEmpty()) {
            return "El número de documento es obligatorio.";
        }
        if (!numeroDocumento.matches("\\d+")) {
            return "El número de documento debe contener solo números.";
        }
        if (ciudad == null || ciudad.trim().isEmpty()) {
            return "La ciudad es obligatoria.";
        }
        if (rol == null || rol.trim().isEmpty()) {
            return "El rol es obligatorio.";
        }
        return null; // Sin errores
    }
}