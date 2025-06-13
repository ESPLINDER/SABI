package Controlador;

import Modelo.UsuarioDao;
import Modelo.Usuario;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author William
 */

@WebServlet("/ValidarUsuario")
public class ValidarUsuario extends HttpServlet {
    
    UsuarioDao u_dao = new UsuarioDao();
    Usuario usu = new Usuario();
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ValidarUsuario</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ValidarUsuario at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String accion = request.getParameter("accion"); //name del boton ingresar/registrar
        if (accion.equalsIgnoreCase("Ingresar")){
            
            //al hacer click en el boton con value ingresar
            String user = request.getParameter("emaUsuario"); //name del formulario campo usuario
            String pass = request.getParameter("passUsuario"); // campo contrasena
            try {
                usu = u_dao.Validar(user, pass);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ValidarUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (usu.getEmaUsuario() != null || usu.getPassUsuario() != null) {
                request.getRequestDispatcher("IndexAdmin.jsp").forward(request, response);
                request.setAttribute("usuario", usu); //vamos a la pagina donde se autentica el usuario
                if (usu.getRolUsuario().equals("Administrador")) {
                    System.out.println("ESTOS SON LOS DATOS"+usu.getEmaUsuario()+usu.getPassUsuario()+usu.getRolUsuario()); 
                    RequestDispatcher dispatcher = request.getRequestDispatcher("IndexAdmin.jsp");
                    //request.getRequestDispatcher("IndexAdmin.jsp").forward(request, response);
                } else {
                    System.out.println("es empleado");
                    request.getRequestDispatcher("IndexEmpleado.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("fail", "Datos no existen en BD");
                request.getRequestDispatcher("login.jsp");
            }
        } else {
            request.setAttribute("fail", "Ingrese Usuario y Contraseña");
            request.getRequestDispatcher("../../index.jsp");
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
