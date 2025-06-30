<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%String contextPath = request.getContextPath();%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SABI Entrenadores</title>
        <link rel="stylesheet" type="text/css" href="<%= contextPath%>/estilos/indexEntre.css">
        <style>
            .pattern-bg {
                background-image: url('../recursos/fondoSabiNuevo.png');
            }
        </style>
    </head>
    <body class="pattern-bg">
        <!-- Header -->
        <%@ include file="/plantillas/dashEntrenador.jsp" %>





        <!-- Main Content -->
        <main class="main-content">
            <div class="dashboard-container">
                <!-- Welcome Section -->
                <section class="welcome-section">
                    <h1>Bienvenido, Juan Pérez</h1>
                    <p>Aquí tienes un resumen de tu actividad como entrenador en SABI</p>
                </section>


                <!-- Stats Grid -->
                <section class="stats-grid">
                    <div class="stat-card">
                        <div class="stat-icon">👥</div>
                        <div class="stat-content">
                            <h3>28</h3>
                            <p>Clientes Activos</p>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon">💪</div>
                        <div class="stat-content">
                            <h3>45</h3>
                            <p>Rutinas Creadas</p>
                        </div>
                    </div>

                    <div class="stat-card">
                        <div class="stat-icon">⭐</div>
                        <div class="stat-content">
                            <h3>4.8</h3>
                            <p>Calificación</p>
                        </div>
                    </div>
                </section>


                <!-- Content Grid -->
                <section class="content-grid">
                    <!-- Recent Clients -->
                    <div class="content-card">
                        <div class="card-header">
                            <h2>Clientes Recientes</h2>
                            <a href="#" class="view-all">Ver todos</a>
                        </div>
                        <div class="client-list">
                            <div class="client-item">
                                <div class="client-avatar">MG</div>
                                <div class="client-info">
                                    <h4>María González</h4>
                                    <p>Última sesión: Hoy</p>
                                </div>
                                <div class="client-status active">Activo</div>
                            </div>
                            <div class="client-item">
                                <div class="client-avatar">CR</div>
                                <div class="client-info">
                                    <h4>Carlos Rodríguez</h4>
                                    <p>Última sesión: Ayer</p>
                                </div>
                                <div class="client-status active">Activo</div>
                            </div>
                            <div class="client-item">
                                <div class="client-avatar">LM</div>
                                <div class="client-info">
                                    <h4>Laura Martínez</h4>
                                    <p>Última sesión: 2 días</p>
                                </div>
                                <div class="client-status inactive">Inactivo</div>
                            </div>
                            <div class="client-item">
                                <div class="client-avatar">AP</div>
                                <div class="client-info">
                                    <h4>Ana Pérez</h4>
                                    <p>Última sesión: Hoy</p>
                                </div>
                                <div class="client-status active">Activo</div>
                            </div>
                        </div>
                    </div>


                    <!-- Popular Routines -->
                    <div class="content-card">
                        <div class="card-header">
                            <h2>Rutinas Más Populares</h2>
                            <a href="#" class="view-all">Ver todas</a>
                        </div>
                        <div class="routine-list">
                            <div class="routine-item">
                                <div class="routine-info">
                                    <h4>Fuerza Funcional</h4>
                                    <p>15 usuarios activos</p>
                                </div>
                                <div class="routine-stats">
                                    <span class="usage-count">85%</span>
                                </div>
                            </div>
                            <div class="routine-item">
                                <div class="routine-info">
                                    <h4>Cardio Intensivo</h4>
                                    <p>12 usuarios activos</p>
                                </div>
                                <div class="routine-stats">
                                    <span class="usage-count">72%</span>
                                </div>
                            </div>
                            <div class="routine-item">
                                <div class="routine-info">
                                    <h4>Flexibilidad y Movilidad</h4>
                                    <p>8 usuarios activos</p>
                                </div>
                                <div class="routine-stats">
                                    <span class="usage-count">58%</span>
                                </div>
                            </div>
                            <div class="routine-item">
                                <div class="routine-info">
                                    <h4>Principiantes</h4>
                                    <p>6 usuarios activos</p>
                                </div>
                                <div class="routine-stats">
                                    <span class="usage-count">45%</span>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- Quick Actions -->
                    <div class="content-card">
                        <div class="card-header">
                            <h2>Acciones Rápidas</h2>
                        </div>
                        <div class="quick-actions">
                            <button class="action-btn primary">
                                <span class="btn-icon">➕</span>
                                Crear Nueva Rutina
                            </button>
                            <button class="action-btn secondary">
                                <span class="btn-icon">👤</span>
                                Añadir Cliente
                            </button>
                            <button class="action-btn secondary">
                                <span class="btn-icon">📊</span>
                                Ver Reportes
                            </button>
                            <button class="action-btn secondary">
                                <span class="btn-icon">💬</span>
                                Mensajes
                            </button>
                        </div>
                    </div>


                    <!-- Recent Activity -->
                    <div class="content-card">
                        <div class="card-header">
                            <h2>Actividad Reciente</h2>
                        </div>
                        <div class="activity-list">
                            <div class="activity-item">
                                <div class="activity-icon">✅</div>
                                <div class="activity-content">
                                    <p><strong>María González</strong> completó la rutina "Fuerza Funcional"</p>
                                    <span class="activity-time">Hace 2 horas</span>
                                </div>
                            </div>
                            <div class="activity-item">
                                <div class="activity-icon">🆕</div>
                                <div class="activity-content">
                                    <p>Nueva rutina <strong>"HIIT Avanzado"</strong> creada</p>
                                    <span class="activity-time">Hace 4 horas</span>
                                </div>
                            </div>
                            <div class="activity-item">
                                <div class="activity-icon">👤</div>
                                <div class="activity-content">
                                    <p><strong>Carlos Rodríguez</strong> se unió como nuevo cliente</p>
                                    <span class="activity-time">Ayer</span>
                                </div>
                            </div>
                            <div class="activity-item">
                                <div class="activity-icon">⭐</div>
                                <div class="activity-content">
                                    <p><strong>Ana Pérez</strong> te calificó con 5 estrellas</p>
                                    <span class="activity-time">Hace 2 días</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </main>


        <!-- Footer -->
        <footer class="main-footer">
            <div class="footer-content">
                <div class="footer-section">
                    <h4>Políticas de privacidad</h4>
                    <ul>
                        <li><a href="#">Política de datos</a></li>
                        <li><a href="#">Aviso de privacidad</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h4>Términos de servicio</h4>
                    <ul>
                        <li><a href="#">Términos y condiciones</a></li>
                        <li><a href="#">Reglas de uso</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h4>Información de contacto</h4>
                    <ul>
                        <li>1234567484</li>
                        <li>2534647484</li>
                        <li>SABI@gmail.com</li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2024 SABI. Todos los derechos reservados.</p>
                <div class="social-icons">
                    <a href="#">📧</a>
                    <a href="#">📱</a>
                    <a href="#">🐦</a>
                </div>
            </div>
        </footer>


        <script>
            // Simple navigation handling
            document.querySelectorAll('.nav-link').forEach(link => {
                link.addEventListener('click', function (e) {
                    e.preventDefault();

                    // Remove active class from all items
                    document.querySelectorAll('.nav-item').forEach(item => {
                        item.classList.remove('active');
                    });

                    // Add active class to clicked item
                    this.parentElement.classList.add('active');
                });
            });


            // Logout functionality
            document.querySelector('.logout-btn').addEventListener('click', function () {
                if (confirm('¿Estás seguro de que quieres cerrar sesión?')) {
                    // Redirect to login page
                    window.location.href = 'index.jsp';
                }
            });
        </script>
    </body>
</html>
