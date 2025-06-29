package Controlador;

import Modelo.Suscripcion;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Modelo.SuscripcionDao;
import Modelo.Usuario;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author Rojas
 */
@WebServlet("/SuscripcionController")
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

        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");

        if (menu.equals("suscripciones")) {
            switch (accion) {
                case "listar":
                    Usuario cliente = (Usuario) request.getSession().getAttribute("usuarioActual");
                    int idCliente = cliente.getIdUsuario(); // este será el ID real del cliente logueado

                    List<Suscripcion> listaSuscripciones = suscripcionDao.listarSuscripcionesCliente(idCliente);
                    request.setAttribute("suscripciones", listaSuscripciones);
                    request.getRequestDispatcher("vistas/Cliente/suscripciones.jsp").forward(request, response);
                    break;
                case "crear": {
                    try {
                        this.crearSuscripcion(request, response);
                    } catch (ClassNotFoundException e) {
                        e.printStackTrace();
                        response.sendRedirect("vistas/Cliente/index.jsp");
                        System.out.println("No se pudo Crear la suscripcion");
                    }
                }
                break;

                case "Actualizar":
                    this.actualizarSuscripcion(request, response);
                    break;
                case "Eliminar":
                    this.desactivarSuscripcion(request, response);
                    break;
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void crearSuscripcion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {

        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        int idEntrenador = Integer.parseInt(request.getParameter("idEntrenador"));

        SuscripcionDao dao = new SuscripcionDao();
        boolean creada = dao.crearSuscripcionPorDefecto(idCliente, idEntrenador);

        if (creada) {
            response.sendRedirect("vistas/Cliente/Suscripciones.jsp?msg=creada");
        } else {
            response.sendRedirect("vistas/Cliente/Suscripciones.jsp?msg=error");
        }
    }

    protected void actualizarSuscripcion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void desactivarSuscripcion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
