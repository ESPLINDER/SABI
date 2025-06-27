package Controlador;

import Modelo.Ejercicio_Rutina;
import Modelo.Ejercicio_RutinaDao;
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
@WebServlet("/Ejercicio_RutinaController")
public class Ejercicio_RutinaController extends HttpServlet {

    Ejercicio_RutinaDao eje_rut_dao = new Ejercicio_RutinaDao();
    Ejercicio_Rutina eje_rut = new Ejercicio_Rutina();
    int id;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion = request.getParameter("accion");

        switch (accion) {
                case "Create":
                    break;
                case "Read":
                    break;
                case "Update":
                    break;
                case "Delete":
                    break;
                case "estructura":
                    break;
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
            out.println("<title>Servlet Ejercicio_RutinaController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Ejercicio_RutinaController at " + request.getContextPath() + "</h1>");
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
