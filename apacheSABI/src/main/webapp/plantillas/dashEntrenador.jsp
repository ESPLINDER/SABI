<%
    Modelo.Usuario entrenador = (Modelo.Usuario) session.getAttribute("logger");
%>
<link rel="stylesheet" href="<%= contextPath%>/estilos/barranavegacion.css">
<header class="superior">
    <div class="izquierda">
        <img src="<%= contextPath%>/recursos/logoLargo.png" alt="Logo" class="logo">
    </div>
    <nav>
        <a href="<%= request.getContextPath()%>/vistas/Entrenador/index.jsp">
            <span>Inicio</span>
        </a>
        <a href="<%= contextPath%>/RutinaController?accion=Read">
            <span>Rutinas</span>
        </a>
        <a href="<%= request.getContextPath()%>/SuscripcionController?menu=Suscripciones&accion=listarEntrenador">
            <span>Suscripciones</span>
        </a>
    </nav>
    <div class="derecha">
        <a href="<%= request.getContextPath()%>/CerrarSesion">
            <span>Cerrar Sesion</span>
        </a>
        <img src="<%= contextPath%>/recursos/entrenador.jpg" alt="user" class="user">
        <span><%= entrenador.getNomUsuario() %> <%= entrenador.getApeUsuario() %> | <%= entrenador.getRolUsuario() %></span>
    </div>
</header>