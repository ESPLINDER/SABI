package Controlador;

import Modelo.Suscripcion;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Modelo.SuscripcionDao;
import Modelo.Usuario;
import jakarta.servlet.annotation.WebServlet;
import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author Rojas
 */
@WebServlet("/SuscripcionController")
public class SuscripcionController extends HttpServlet {

    SuscripcionDao suscripcionDao = new SuscripcionDao();
    Suscripcion sus = new Suscripcion();
    int doc;

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
                case "listarEntrenador":
                    Usuario entrenador = (Usuario) request.getSession().getAttribute("logger");
                    int idEntrenador = entrenador.getIdUsuario();

                    List<Suscripcion> listaSuscripcionesEntrenador = suscripcionDao.listarSuscripcionesEntrenador(idEntrenador);
                    request.setAttribute("listSuscripcionesEntrenador", listaSuscripcionesEntrenador);
                    request.getRequestDispatcher("vistas/Entrenador/suscripciones.jsp").forward(request, response);
                    break;
                case "Editar":
                    int idSuscripcionEditar = Integer.parseInt(request.getParameter("idSuscripcion"));
                    Suscripcion suscripcionEditar = suscripcionDao.obtenerPorId(idSuscripcionEditar); // necesitas este método en el DAO

                    Usuario entrenadorSesion = (Usuario) request.getSession().getAttribute("logger");
                    int idEntrenadorEditar = entrenadorSesion.getIdUsuario();

                    List<Suscripcion> suscripcionesEntrenador = suscripcionDao.listarSuscripcionesEntrenador(idEntrenadorEditar);
                    request.setAttribute("listSuscripcionesEntrenador", suscripcionesEntrenador);

                    request.setAttribute("suscripcionEditar", suscripcionEditar); // aquí está el objeto individual

                    request.getRequestDispatcher("SuscripcionController?menu=Suscripciones&accion=listarEntrenador").forward(request, response);
                    break;
                case "Actualizar":
                    this.actualizarSuscripcion(request, response);
                    break;
                case "PagarSuscripcion":
                    int idPagar = Integer.parseInt(request.getParameter("idSuscripcion"));
                    boolean pagoActualizado = suscripcionDao.actualizarEstadoPago(idPagar);

                    if (pagoActualizado) {
                        System.out.println("Pago actualizado correctamente");
                    } else {
                        System.out.println("No se pudo actualizar el estado de pago");
                    }

                    // Luego recarga la lista como normalmente lo haces
                    Usuario entrenadorPago = (Usuario) request.getSession().getAttribute("logger");
                    int idEntrenadorPago = entrenadorPago.getIdUsuario();

                    List<Suscripcion> listaActualizada = suscripcionDao.listarSuscripcionesEntrenador(idEntrenadorPago);
                    request.setAttribute("listSuscripcionesEntrenador", listaActualizada);
                    request.getRequestDispatcher("SuscripcionController?menu=Suscripciones&accion=listar").forward(request, response);
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
        try {
            String idSuscripcion = request.getParameter("idSuscripcion"); //el request solo sirve con Strings
            String finSuscripcion = request.getParameter("finSuscripcion");
            String estadoSuscripcion = request.getParameter("estadoSuscripcion");
            String valorSuscripcion = request.getParameter("valorSuscripcion");

            sus.setIdSuscripcion(Integer.parseInt(idSuscripcion));
            sus.setFinSuscripcion(LocalDate.parse(finSuscripcion));
            sus.setEstadoSuscripcion(estadoSuscripcion);
            sus.setValorSuscripcion(Integer.parseInt(valorSuscripcion));
            suscripcionDao.Actualizar(sus);
            request.getRequestDispatcher("SuscripcionController?menu=Suscripciones&accion=listarEntrenador").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException e) {
            System.out.println("Error al actualizar Suscripcion");
        }
    }

    protected void desactivarSuscripcion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            doc = Integer.parseInt(request.getParameter("idSuscripcion"));
            suscripcionDao.Eliminar(doc);
            request.getRequestDispatcher("SuscripcionController?menu=Suscripciones&accion=listarEntrenador").forward(request, response);
        } catch (ServletException | IOException | NumberFormatException e) {
            System.out.println("Error al eliminar");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
