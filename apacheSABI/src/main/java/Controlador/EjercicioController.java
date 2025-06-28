package Controlador;

import Modelo.Ejercicio;
import Modelo.EjercicioDao;
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
    
    Ejercicio ejercicio = new Ejercicio();
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
                this.EnviarEjercicios(request, response);
                break;
        }
        processRequest(request, response);
    }
    
    protected void EnviarEjercicios(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String semana = request.getParameter("semana");
        String dia = request.getParameter("dia");
        String ordenEjercicio = request.getParameter("ordenEjercicio");
        String IdEjercicio = request.getParameter("idEjercicio");
        List listaEjercicios = ejercicio_dao.listar();
        request.setAttribute("lista_ejercicios", listaEjercicios);
        request.setAttribute("semana", semana);
        request.setAttribute("dia", dia);
        request.setAttribute("ordenEjercicio", ordenEjercicio);
        if (IdEjercicio != null) {
            int idEjercicio = Integer.parseInt(IdEjercicio);
            request.setAttribute("ejercicio", ejercicio_dao.listarId(id));
        }
        request.getRequestDispatcher("vistas/Entrenador/formEjercicioRutina.jsp").forward(request, response);
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
