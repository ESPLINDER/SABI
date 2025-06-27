package Controlador;

import Modelo.Usuario;
import Modelo.UsuarioDao;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "RegistroController", urlPatterns = {"/registro"})
public class RegistroController extends HttpServlet {
    
    private static final Logger LOGGER = Logger.getLogger(RegistroController.class.getName());
    private UsuarioDao usuarioDao;
    
    @Override
    public void init() throws ServletException {
        super.init();
        usuarioDao = new UsuarioDao();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Mostrar el formulario de registro
        request.getRequestDispatcher("/registro.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Establecer encoding para caracteres especiales
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        try {
            // Obtener y validar datos del formulario
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");
            String tipoDocumento = request.getParameter("tipoDocumento");
            String numeroDocumento = request.getParameter("numeroDocumento");
            String departamento = request.getParameter("departamento");
            String ciudad = request.getParameter("ciudad");
            String rol = request.getParameter("rol");
            String genero = request.getParameter("genero");
            String fechaNacimiento = request.getParameter("fechaNacimiento");
            
            // Validaciones del servidor
            String errorMessage = validarDatos(nombre, apellido, email, password, confirmPassword, 
                                             tipoDocumento, numeroDocumento, departamento, ciudad, rol);
            
            if (errorMessage != null) {
                enviarError(request, response, errorMessage);
                return;
            }
            
            // Verificar duplicados
            if (usuarioDao.existeEmail(email.trim())) {
                enviarError(request, response, "El correo electrónico ya está registrado");
                return;
            }
            
            if (usuarioDao.existeDocumento(Integer.parseInt(numeroDocumento.trim()))) {
                enviarError(request, response, "El número de documento ya está registrado");
                return;
            }
            
            // Crear nuevo usuario
            Usuario nuevoUsuario = crearUsuario(nombre, apellido, email, password, tipoDocumento, 
                                              numeroDocumento, departamento, ciudad, rol, genero, fechaNacimiento);
            
            // Registrar usuario
            int resultado = usuarioDao.Agregar(nuevoUsuario);
            
            if (resultado > 0) {
                // Registro exitoso - crear sesión
                HttpSession session = request.getSession();
                session.setAttribute("usuario", nuevoUsuario);
                session.setAttribute("tipoUsuario", rol);
                
                // Log del registro exitoso
                LOGGER.log(Level.INFO, "Usuario registrado exitosamente: {0} - Rol: {1}", new Object[]{email, rol});
                
                // Redirigir según el rol con DEBUG
                String redirectUrl = determinarRedirect(rol, request.getContextPath());
                response.sendRedirect(redirectUrl);
                
            } else {
                enviarError(request, response, "Error al registrar el usuario. Intente nuevamente.");
            }
            
        } catch (NumberFormatException e) {
            LOGGER.log(Level.WARNING, "Error de formato en número de documento", e);
            enviarError(request, response, "El número de documento debe ser válido");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error inesperado en registro", e);
            enviarError(request, response, "Error del sistema. Por favor, intente más tarde.");
        }
    }
    
    private String validarDatos(String nombre, String apellido, String email, String password, 
                               String confirmPassword, String tipoDocumento, String numeroDocumento,
                               String departamento, String ciudad, String rol) {
        
        // Validar campos obligatorios
        if (esNuloOVacio(nombre) || esNuloOVacio(apellido) || esNuloOVacio(email) || 
            esNuloOVacio(password) || esNuloOVacio(tipoDocumento) || esNuloOVacio(numeroDocumento) ||
            esNuloOVacio(departamento) || esNuloOVacio(ciudad) || esNuloOVacio(rol)) {
            return "Todos los campos obligatorios deben ser completados";
        }
        
        // Validar longitud de campos
        if (nombre.trim().length() > 50 || apellido.trim().length() > 50) {
            return "El nombre y apellido no pueden exceder 50 caracteres";
        }
        
        if (email.trim().length() > 100) {
            return "El correo electrónico no puede exceder 100 caracteres";
        }
        
        // Validar formato de email
        if (!email.matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$")) {
            return "El formato del correo electrónico no es válido";
        }
        
        // Validar contraseña
        if (password.length() < 8) {
            return "La contraseña debe tener al menos 8 caracteres";
        }
        
        if (!password.equals(confirmPassword)) {
            return "Las contraseñas no coinciden";
        }
        
        // Validar número de documento
        if (!numeroDocumento.matches("^\\d+$")) {
            return "El número de documento debe contener solo números";
        }
        
        // Validar rol
        if (!rol.equals("cliente") && !rol.equals("entrenador")) {
            return "El rol seleccionado no es válido";
        }
        
        return null; // No hay errores
    }
    
    private boolean esNuloOVacio(String valor) {
        return valor == null || valor.trim().isEmpty();
    }
    
    private Usuario crearUsuario(String nombre, String apellido, String email, String password,
                                String tipoDocumento, String numeroDocumento, String departamento,
                                String ciudad, String rol, String genero, String fechaNacimiento) {
        
        Usuario usuario = new Usuario();
        usuario.setnomUsuario(nombre.trim());
        usuario.setapeUsuario(apellido.trim());
        usuario.setEmaUsuario(email.trim().toLowerCase());
        usuario.setPassUsuario(password); // En producción, hashear la contraseña
        usuario.setTipDocumento(tipoDocumento);
        usuario.setNumDocumento(Integer.parseInt(numeroDocumento.trim()));
        usuario.setCiudadUsuario(ciudad);
        usuario.setRolUsuario(rol);
        usuario.setEspecialidad(""); // Vacío por defecto
        usuario.setXpAños(0.0f); // 0 por defecto
        usuario.setBiografia(""); // Vacío por defecto
        usuario.setPromCalificacion(0); // 0 por defecto
        usuario.setEstadoUsuario("activo");
        
        // Campos adicionales si los tienes en tu modelo
        // usuario.setGenero(genero);
        // usuario.setFechaNacimiento(fechaNacimiento);
        
        return usuario;
    }
    
    private String determinarRedirect(String rol, String contextPath) {
        String redirectUrl;
        switch (rol) {
            case "entrenador":
                redirectUrl = contextPath + "/vistas/Entrenador/index.jsp";
                break;
            case "cliente":
                redirectUrl = contextPath + "/vistas/Cliente/index.jsp";
                break;
            default:
                redirectUrl = contextPath + "/index.jsp";
        }
        
        // DEBUG: Imprime la URL que se está generando
        System.out.println("=== DEBUG REDIRECT ===");
        System.out.println("Rol: " + rol);
        System.out.println("Context Path: " + contextPath);
        System.out.println("URL Final: " + redirectUrl);
        System.out.println("===================");
        
        return redirectUrl;
    }
    
    private void enviarError(HttpServletRequest request, HttpServletResponse response, String mensaje)
            throws ServletException, IOException {
        request.setAttribute("error", mensaje);
        request.getRequestDispatcher("/registro.jsp").forward(request, response);
    }
    
    @Override
    public String getServletInfo() {
        return "Controlador para el registro de usuarios";
    }
}