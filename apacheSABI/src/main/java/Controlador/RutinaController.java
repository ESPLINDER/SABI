package Controlador;

import Modelo.Rutina;
import Modelo.RutinaDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.List;

/**
 * @author William
 */
@WebServlet("/RutinaController")
public class RutinaController extends HttpServlet {

    RutinaDao rutina_dao = new RutinaDao();
    Rutina rutina = new Rutina();
    Rutina tablaRutina = new Rutina();
    int idRutina;

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
        }
        processRequest(request, response);
    }

    protected void CrearTabla(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String NumSemanas = request.getParameter("numSemanas");
            String NumDias = request.getParameter("numDias");
            String NumEjercicios = request.getParameter("numEjercicios");
            int numSemanas = 0;
            int numDias = 0;
            int numEjercicios = 0;
            if (NumSemanas != null && NumDias != null && NumEjercicios != null) {
                numSemanas = Integer.parseInt(NumSemanas);
                numDias = Integer.parseInt(NumDias);
                numEjercicios = Integer.parseInt(NumEjercicios);
                String tabla = "block";
                request.setAttribute("numSemanas", numSemanas);
                request.setAttribute("numDias", numDias);
                request.setAttribute("numEjercicios", numEjercicios);
                request.getRequestDispatcher("vistas/Entrenador/nuevaRutina.jsp").forward(request, response);
            } else {
                String alerta = "Por favor rellenar todos los campos con numeros enteros";
                request.setAttribute("alerta", alerta);
                request.getRequestDispatcher("vistas/Entrenador/nuevaRutina.jsp").forward(request, response);
            }
        } catch (ServletException | IOException | NumberFormatException e) {
            System.out.println("Error en el registro");
        }
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
