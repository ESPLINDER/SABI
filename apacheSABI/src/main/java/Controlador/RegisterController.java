package Controlador;

import Modelo.Usuario;
import jakarta.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {

    // Simulación de un servicio de usuario
    private static List<Usuario> usuarios = new ArrayList<>();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("register".equals(action)) {
            // Lógica para manejar el registro
            String tipUsuario = request.getParameter("tipUsuario");
            String emaUsuario = request.getParameter("emaUsuario");
            LocalDate nacUsuario = LocalDate.parse(request.getParameter("nacUsuario"));
            int edadUsuario = Integer.parseInt(request.getParameter("edadUsuario"));
            String pasUsuario = request.getParameter("pasUsuario"); // Asegúrate de hashear la contraseña
            String genUsuario = request.getParameter("genUsuario");
            String tipDocumento = request.getParameter("tipDocumento");
            String docUsuario = request.getParameter("docUsuario");
            String ciuUsuario = request.getParameter("ciuUsuario");
            String domicilio = request.getParameter("domicilio");

            // Validación básica
            if (emaUsuario == null || emaUsuario.isEmpty() || !emaUsuario.contains("@")) {
                request.setAttribute("error", "Correo electrónico inválido.");
                request.getRequestDispatcher("registro.jsp").forward(request, response);
                return;
            }

            // Verificar si el correo ya está registrado
            for (Usuario usuario : usuarios) {
                if (usuario.getEmaUsuario().equals(emaUsuario)) {
                    request.setAttribute("error", "El correo ya está registrado.");
                    request.getRequestDispatcher("registro.jsp").forward(request, response);
                    return;
                }
            }

            // Crear un nuevo usuario
            Usuario nuevoUsuario = new Usuario(0, tipUsuario, emaUsuario, nacUsuario, edadUsuario, pasUsuario, genUsuario, tipDocumento, docUsuario, ciuUsuario, domicilio);
            usuarios.add(nuevoUsuario); // Simulación de guardado en base de datos

            response.sendRedirect("login.jsp"); // Redirigir a login después del registro
        } else if ("login".equals(action)) {
            // Lógica para manejar el login
            String emaUsuario = request.getParameter("emaUsuario");
            String pasUsuario = request.getParameter("pasUsuario");

            // Verificación de credenciales
            for (Usuario usuario : usuarios) {
                if (usuario.getEmaUsuario().equals(emaUsuario) && usuario.getPasUsuario().equals(pasUsuario)) {
                    // Credenciales válidas
                    response.sendRedirect("index.jsp"); // Redirigir a la página principal después del login
                    return;
                }
            }

            // Si las credenciales son incorrectas
            request.setAttribute("error", "Correo o contraseña incorrectos.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}




