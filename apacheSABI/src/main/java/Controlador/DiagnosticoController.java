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
    private static final long serialVersionUID = 1L;
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
                editarDiagnostico(request, response);
                break;
            case "verDiagnostico":
                verDiagnostico(request, response);
                break;
            default:
                response.sendRedirect("index.jsp");
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
                response.sendRedirect("index.jsp");
                break;
        }
    }

    // 1️⃣ Mostrar formulario (crear o editar)
    private void mostrarFormulario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("idDiagnostico");
        if (id != null && !id.isEmpty()) {
            int idDiagnostico = Integer.parseInt(id);
            Diagnostico diagnostico = diagnosticoDao.obtenerDiagnosticoPorId(idDiagnostico);
            request.setAttribute("diagnostico", diagnostico);
        }
        diagnosticoDao.cerrarConexion();
        request.getRequestDispatcher("formDiagnostico.jsp").forward(request, response);
    }

    // 2️⃣ Guardar nuevo diagnóstico
    private void guardarDiagnostico(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        Diagnostico diagnostico = construirDiagnosticoDesdeRequest(request);
        Integer idGenerado = diagnosticoDao.crearDiagnosticoYRetornarId(diagnostico);
        diagnosticoDao.cerrarConexion();

        if (idGenerado != null) {
            request.getSession().setAttribute("mensajeExito", "Diagnóstico guardado correctamente");
            response.sendRedirect("DiagnosticoController?action=verDiagnostico&idDiagnostico=" + idGenerado);
        } else {
            request.getSession().setAttribute("mensajeError", "Error al guardar diagnóstico");
            response.sendRedirect("DiagnosticoController?action=mostrarFormulario");
        }
    }

    // 3️⃣ Mostrar formulario con datos cargados
    private void editarDiagnostico(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        mostrarFormulario(request, response);
    }

    // 4️⃣ Actualizar diagnóstico
    private void actualizarDiagnostico(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        Diagnostico diagnostico = construirDiagnosticoDesdeRequest(request);
        diagnostico.setIdDiagnostico(Integer.parseInt(request.getParameter("idDiagnostico")));
        boolean exito = diagnosticoDao.actualizarDiagnostico(diagnostico);
        diagnosticoDao.cerrarConexion();

        if (exito) {
            request.getSession().setAttribute("mensajeExito", "Diagnóstico actualizado correctamente");
            response.sendRedirect("DiagnosticoController?action=verDiagnostico&idDiagnostico=" + diagnostico.getIdDiagnostico());
        } else {
            request.getSession().setAttribute("mensajeError", "Error al actualizar diagnóstico");
            response.sendRedirect("DiagnosticoController?action=editarDiagnostico&idDiagnostico=" + diagnostico.getIdDiagnostico());
        }
    }

    // 5️⃣ Ver detalle
    private void verDiagnostico(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("idDiagnostico"));
        Diagnostico diagnostico = diagnosticoDao.obtenerDiagnosticoPorId(id);
        diagnosticoDao.cerrarConexion();
        request.setAttribute("diagnostico", diagnostico);
        request.getRequestDispatcher("verDiagnostico.jsp").forward(request, response);
    }

    // 🧠 Mapear request -> objeto Diagnostico
    private Diagnostico construirDiagnosticoDesdeRequest(HttpServletRequest request) {
        Diagnostico d = new Diagnostico();

        d.setFkIdCliente(Integer.parseInt(request.getParameter("fkIdCliente")));
        String rutina = request.getParameter("fkIdRutina");
        d.setFkIdRutina((rutina != null && !rutina.isEmpty()) ? Integer.parseInt(rutina) : null);

        d.setGenero(request.getParameter("genero"));
        d.setEdad(Integer.parseInt(request.getParameter("edad")));
        d.setEstatura(Float.parseFloat(request.getParameter("estatura")));
        d.setPeso(Float.parseFloat(request.getParameter("peso")));
        d.setImcCliente(Float.parseFloat(request.getParameter("imcCliente")));
        d.setFechaDiagnostico(LocalDate.parse(request.getParameter("fechaDiagnostico")));
        d.setFrecuenciaDiagnostico(Integer.parseInt(request.getParameter("frecuenciaDiagnostico")));
        d.setProxDiagnostico(LocalDate.parse(request.getParameter("proxDiagnostico")));
        d.setObjetivo(request.getParameter("objetivo"));
        d.setMedidaBrazo(Float.parseFloat(request.getParameter("medidaBrazo")));
        d.setMedidaCintura(Float.parseFloat(request.getParameter("medidaCintura")));
        d.setMedidaPierna(Float.parseFloat(request.getParameter("medidaPierna")));
        d.setCondicionMedica(request.getParameter("condicionMedica"));
        d.setMedicamentos(request.getParameter("medicamentos"));
        d.setFrecCardiaca(request.getParameter("frecCardiaca"));
        d.setNivelHidratacion(request.getParameter("nivelHidratacion"));
        d.setTipoHidratacion(request.getParameter("tipoHidratacion"));
        d.setNivelActividadFisica(request.getParameter("nivelActividadFisica"));
        d.setSuplementos(request.getParameter("suplementos"));

        return d;
    }
}
