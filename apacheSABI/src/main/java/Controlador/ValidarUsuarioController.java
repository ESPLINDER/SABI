package Controlador;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.logging.Level;
import java.util.logging.Logger;
import Modelo.Usuario;
import Modelo.UsuarioDao;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/ValidarUsuarioController")
public class ValidarUsuarioController extends HttpServlet {

    UsuarioDao u_dao = new UsuarioDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");
        if (accion == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        if (accion.equalsIgnoreCase("Ingresar")) {
            String user = request.getParameter("emaUsuario");
            String pass = request.getParameter("passUsuario");

            Usuario usu = null;
            try {
                usu = u_dao.ValidarUsuario(user, pass);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ValidarUsuarioController.class.getName()).log(Level.SEVERE, null, ex);
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error de validación");
                return;
            }

            if (usu != null && usu.getEmaUsuario() != null && usu.getPassUsuario() != null) {
                HttpSession session = request.getSession();

                // ✅ Aquí está la clave: guardar como 'cliente' y 'usuarioId'
                session.setAttribute("cliente", usu);
                session.setAttribute("usuarioId", usu.getIdUsuario());

                if ("entrenador".equalsIgnoreCase(usu.getRolUsuario())) {
                    response.sendRedirect(request.getContextPath() + "/vistas/Entrenador/index.jsp");
                } else {
                    // ✅ Redirige a ClienteController, NO directo al JSP
                    response.sendRedirect(request.getContextPath() + "/ClienteController");
                }
            } else {
                request.setAttribute("error", "Usuario o contraseña incorrectos");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}
