<header class="superior">
    <div class="izquierda">
        <img src="<%= contextPath%>/recursos/logoLargo.png" alt="Logo" class="logo">
    </div>
    <nav>
        <a href="<%= request.getContextPath()%>/vistas/Cliente/cliente.jsp">
            <span>Progreso</span>
        </a>
        <a href="<%= contextPath%>/vistas/Cliente/rutinas.jsp">
            <span>Rutinas</span>
        </a>
        <a href="<%= request.getContextPath()%>/EntrenadorController">
            <span>Entrenadores</span>
        </a>
        <a href="<%= request.getContextPath()%>/SuscripcionController">
            <span>Subcripciones</span>
        </a>
    </nav>
    <div class="derecha">
        <img src="<%= contextPath%>/recursos/cliente.jpg" alt="user" class="user">
        <span>Juan Garzon</span>
    </div>
</header>
