package Controlador;

import Modelo.Diagnostico;
import Modelo.DiagnosticoDao;
import Modelo.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/ClienteController")
public class ClienteController extends HttpServlet {

    private DiagnosticoDao diagnosticoDao;

    public void init() {
        diagnosticoDao = new DiagnosticoDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Usuario cliente = (Usuario) session.getAttribute("cliente");

        if (cliente == null) {
            // Si no hay sesión, redirige a login (opcional)
            response.sendRedirect("login.jsp");
            return;
        }

        Diagnostico diagnostico = diagnosticoDao.obtenerUltimoDiagnosticoCliente(cliente.getIdUsuario());
        diagnosticoDao.cerrarConexion();

        request.setAttribute("diagnostico", diagnostico);

        request.getRequestDispatcher("cliente.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
