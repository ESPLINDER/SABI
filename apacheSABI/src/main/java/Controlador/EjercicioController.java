package Controlador;

import Modelo.Ejercicio;
import Modelo.EjercicioDao;
import Modelo.Ejercicio_Rutina;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
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
        String IdEjercicio = request.getParameter("idEjercicio");
        String Semana = request.getParameter("semana");
        String Dia = request.getParameter("dia");
        String OrdenEjercicio = request.getParameter("ordenEjercicio");
        Ejercicio_Rutina ubicacionEjercicio = new Ejercicio_Rutina();
        if (Semana != null && Dia != null && OrdenEjercicio != null) {
            int semana = Integer.parseInt(Semana);
            int dia = Integer.parseInt(Dia);
            int ordenEjercicio = Integer.parseInt(OrdenEjercicio);
            
            ubicacionEjercicio.setSemana(semana);
            ubicacionEjercicio.setDia(dia);
            ubicacionEjercicio.setOrdenEjercicio(ordenEjercicio);
        }
        HttpSession session = request.getSession();
        session.setAttribute("ubicacionEjercicio", ubicacionEjercicio);

        List listaEjercicios = ejercicio_dao.listar();
        request.setAttribute("lista_ejercicios", listaEjercicios);

        if (IdEjercicio != null) {
            int idEjercicio = Integer.parseInt(IdEjercicio);
            request.setAttribute("ejercicio", ejercicio_dao.listarId(idEjercicio));
        }
        System.out.println("enviando lista a form ejercicio rutina");
        request.getRequestDispatcher("/vistas/Entrenador/formEjercicioRutina.jsp").forward(request, response);
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
