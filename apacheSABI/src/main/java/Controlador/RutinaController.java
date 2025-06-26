package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author William
 */
@WebServlet("/RutinaController")
public class RutinaController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");

        if (menu.equals("Administrador")) {
            request.getRequestDispatcher("/vistas/admin/IndexAdmin.jsp");

        }
        if (menu.equals("Usuarios")) {
            switch (accion) {
                case "Read":
                    break;
                case "Agregar":
                    this.AgregarUsuario(request, response);
                    break;
                case "Editar":
                    this.EditarUsuario(request, response);
                    break;
                case "Actualizar":
                    this.ActualizarUsuario(request, response);
                    break;
                case "Eliminar":
                    this.EliminarUsuario(request, response);
                    break;
            }
        }
        processRequest(request, response);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RutinaController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RutinaController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
