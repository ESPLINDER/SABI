package Controlador;

import Modelo.EjercicioDao;
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
@WebServlet("/EjercicioController")
public class EjercicioController extends HttpServlet {

    Ejercicio_RutinaDao eje_rut_dao = new Ejercicio_RutinaDao();
    Ejercicio_Rutina eje_rut = new Ejercicio_Rutina();
    EjercicioDao ejercicio_dao = new EjercicioDao();
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
                case "TraerEjercicio":
                    List listaEjercicios = ejercicio_dao.listar();
                    request.setAttribute("lista_ejercicios", listaEjercicios);
                    request.getRequestDispatcher("vistas/Entrenador/formRutina.jsp").forward(request, response);
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
            out.println("<title>Servlet EjercicioController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EjercicioController at " + request.getContextPath() + "</h1>");
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
