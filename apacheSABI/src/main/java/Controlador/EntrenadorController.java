package Controlador;

import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import Modelo.UsuarioDao;

/**
 *
 * @author Rojas
 */
public class EntrenadorController extends HttpServlet {
    private final UsuarioDao usuarioDao = new UsuarioDao();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EntrenadorController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EntrenadorController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Usuario> listaEntrenadores = usuarioDao.listarEntrenadores();

        request.setAttribute("entrenadores", listaEntrenadores);
        request.getRequestDispatcher("vistas/Cliente/entrenadores.jsp").forward(request, response);
        System.out.println("El servlet esta funcionando");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
