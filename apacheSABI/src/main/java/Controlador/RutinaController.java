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
                case "tabla":
                    this.tablaRutina(request, response);
                    break;
            }
        }
        processRequest(request, response);
    }

    protected void tablaRutina(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String numSemanas = request.getParameter("numSemanas"); //el request solo sirve con Strings
            String numDias = request.getParameter("numDias");
            String numEjercicios = request.getParameter("numEjercicios");

            //le damos los valores del formulario al objeto usu
            rutina.setIdRutina(Integer.parseInt(idRutina));
            rutina.setSemRutina(semRutina);
            rutina.setDescRutina(descRutina);
            rutina.setCreaRutina(LocalDateTime.MIN);
            rutina.setAutRutina(autRutina);
            rutina.setAutorCliente(autorCliente);

            usu_dao.Agregar(usu);
            request.getRequestDispatcher("UsuarioController?menu=Usuarios&accion=Listar").forward(request, response);
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
