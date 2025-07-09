package Controlador;

import Modelo.Diagnostico;
import Modelo.DiagnosticoDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/DiagnosticoController")
public class DiagnosticoController extends HttpServlet {

    private DiagnosticoDao diagnosticoDao;

    public void init() {
        diagnosticoDao = new DiagnosticoDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "mostrarFormulario":
                mostrarFormulario(request, response);
                break;
            case "editarDiagnostico":
                mostrarFormulario(request, response);
                break;
            default:
                response.sendRedirect("ClienteController");
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "";

        switch (action) {
            case "guardarDiagnostico":
                guardarDiagnostico(request, response);
                break;
            case "actualizarDiagnostico":
                actualizarDiagnostico(request, response);
                break;
            default:
                response.sendRedirect("ClienteController");
                break;
        }
    }

    private void mostrarFormulario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("idDiagnostico");
        if (id != null && !id.isEmpty()) {
            Diagnostico diagnostico = diagnosticoDao.obtenerDiagnosticoPorId(Integer.parseInt(id));
            request.setAttribute("diagnostico", diagnostico);
        }
        request.getRequestDispatcher("formDiagnostico.jsp").forward(request, response);
    }

    private void guardarDiagnostico(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        Diagnostico diagnostico = construirDiagnosticoDesdeRequest(request);
        diagnosticoDao.crearDiagnosticoYRetornarId(diagnostico);
        diagnosticoDao.cerrarConexion();
        response.sendRedirect("ClienteController");
    }

    private void actualizarDiagnostico(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        Diagnostico diagnostico = construirDiagnosticoDesdeRequest(request);
        diagnostico.setIdDiagnostico(Integer.parseInt(request.getParameter("idDiagnostico")));
        diagnosticoDao.actualizarDiagnostico(diagnostico);
        diagnosticoDao.cerrarConexion();
        response.sendRedirect("ClienteController");
    }

    private Diagnostico construirDiagnosticoDesdeRequest(HttpServletRequest request) {
        Diagnostico d = new Diagnostico();
        d.setFkIdCliente(Integer.parseInt(request.getParameter("fkIdCliente")));
        d.setGenero(request.getParameter("genero"));
        d.setEdad(Integer.parseInt(request.getParameter("edad")));
        d.setEstatura(Float.parseFloat(request.getParameter("estatura")));
        d.setPeso(Float.parseFloat(request.getParameter("peso")));
        d.setImcCliente(Float.parseFloat(request.getParameter("imcCliente")));
        d.setFechaDiagnostico(LocalDate.parse(request.getParameter("fechaDiagnostico")));
        d.setFrecuenciaDiagnostico(Integer.parseInt(request.getParameter("frecuenciaDiagnostico")));
        d.setProxDiagnostico(LocalDate.parse(request.getParameter("proxDiagnostico")));
        d.setNivelActividadFisica(request.getParameter("nivelActividadFisica"));
        d.setNivelHidratacion(request.getParameter("nivelHidratacion"));
        return d;
    }
}
