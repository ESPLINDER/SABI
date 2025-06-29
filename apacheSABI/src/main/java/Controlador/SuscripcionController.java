package Controlador;

import Modelo.Suscripcion;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Modelo.SuscripcionDao;
import java.util.List;

/**
 *
 * @author Rojas
 */
public class SuscripcionController extends HttpServlet {
    private SuscripcionDao suscripcionDao = new SuscripcionDao(); 

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SuscripcionController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SuscripcionController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Suscripcion> listaSuscripciones = suscripcionDao.listarSuscripciones(1);
        request.setAttribute("suscripciones", listaSuscripciones);
        request.getRequestDispatcher("vistas/Cliente/suscripciones.jsp").forward(request, response);
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
