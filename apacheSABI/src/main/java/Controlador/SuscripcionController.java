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
import jakarta.servlet.annotation.WebServlet;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Rojas
 */
@WebServlet("/SuscripcionController")
public class SuscripcionController extends HttpServlet {

    private SuscripcionDao suscripcionDao = new SuscripcionDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");

        System.out.println("llega al metodo");
        if (menu.equals("Suscripciones")) {
            System.out.println("ejucuta el if");
            switch (accion) {
                case "listar":
                    Usuario cliente = (Usuario) request.getSession().getAttribute("logger");
                    int idCliente = cliente.getIdUsuario();

                    List<Suscripcion> listaSuscripciones = suscripcionDao.listarSuscripcionesCliente(idCliente);
                    request.setAttribute("listSuscripciones", listaSuscripciones);
                    request.getRequestDispatcher("vistas/Cliente/suscripciones.jsp").forward(request, response);
                    break;
                case "Agregar": {
                    try {
                        this.crearSuscripcion(request, response);
                    } catch (ClassNotFoundException e) {
                        e.printStackTrace();
                        response.sendRedirect("vistas/Cliente/cliente.jsp");
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
    }

    protected void crearSuscripcion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException {

        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        int idEntrenador = Integer.parseInt(request.getParameter("idEntrenador"));

        SuscripcionDao dao = new SuscripcionDao();
        boolean creada = dao.crearSuscripcionPorDefecto(idCliente, idEntrenador);

        if (creada) {
            request.getRequestDispatcher("vistas/Cliente/cliente.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("vistas/Cliente/cliente.jsp").forward(request, response);
        }
    }

    protected void actualizarSuscripcion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    protected void desactivarSuscripcion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
