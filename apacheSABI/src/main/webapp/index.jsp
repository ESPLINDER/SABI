<% String contextPath = request.getContextPath();%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<!DOCTYPE html>
<html lang="es">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>SABI - Inicio de Sesión</title>
   <link rel="stylesheet" type="text/css" href="estilos/login.css">
</head>
<body>
  
    <%System.out.println("iniciamos sabi");%>
   <!-- Sección de Login -->
   <section class="login-section">
       <div class="login-container">
           <div class="login-card">
               <h1>Inicio de Sesión</h1>
               <div class="divider">
                   <span>O regístrate</span>
               </div>
               <form class="login-form" method="POST" action="ValidarUsuarioController">
                   <div class="form-group">
                       <label>Correo Electrónico</label>
                       <input name="emaUsuario" type="email" placeholder="correo@ejemplo.com">
                   </div>
                   <div class="form-group">
                       <label>Contraseña</label>
                       <input name="passUsuario" type="password" placeholder="Tu contraseña">
                   </div>
                   <button name="accion" value="Ingresar" type="submit" class="login-btn">Iniciar Sesión</button>
                   <a href="registro.jsp" class="register-link">No tienes cuenta Regístrate aquí</a>
               </form>
           </div>
           <div class="logo-section">
               <div class="logo">
                   <img src="recursos/logoF.png" alt="SABI Logo" class="logo-img">
               </div>
           </div>
       </div>
   </section>


   <!-- Sección Principal -->
   <section class="main-section">
       <header class="main-header">
       </header>


       <div class="content-container">
           <div class="welcome-section">
               <h2>QUE ES SABI</h2>
               <p>En SABI, nuestro método de entrenador a la demanda. Un entrenador que evoluciona activamente a través de programas de entrenamiento gratuitos.</p>
           </div>


           <div class="features-grid">
               <div class="feature-card">
                   <h3>¡Descubre los Entrenamientos de SABI!</h3>
                   <ul>
                       <li><strong>Entrenamientos de SABI:</strong></li>
                       <li>En SABI enseñamos diversas formas de mejorar tu bienestar físico.</li>
                       <li><strong>Rutinas Personalizadas:</strong> Nuestros Entrenadores que crean programas específicos para cada usuario basándose en sus necesidades y objetivos.</li>
                       <li><strong>Rutinas Preestablecidas:</strong> Explora y sigue nuestras rutinas de ejercicios diseñadas por expertos.</li>
                       <li><strong>Crea tus Propias Rutinas:</strong> Utiliza nuestras herramientas para diseñar y personalizar tus propios entrenamientos.</li>
                       <li><strong>Con SABI,</strong> optimizamos tu creación y gestión de programas de entrenamientos asegurándonos todo por tu mejor experiencia, todo en un solo lugar.</li>
                   </ul>
               </div>


               <div class="feature-card">
                   <h3>Transformaciones con SABI</h3>
                   <p>Nuestros usuarios han experimentado cambios increíbles en sus vidas gracias a nuestros programas de entrenamiento personalizado. Desde mejoras en su bienestar físico hasta alcanzar sus objetivos de fitness, aquí tienes algunos testimonios de quienes ya han transformado sus vidas con SABI.</p>
                   <p>Con SABI, cada usuario puede encontrar el programa perfecto que se adapte a sus necesidades específicas, ya sea para principiantes o atletas avanzados. Nuestro enfoque personalizado garantiza resultados efectivos y duraderos.</p>
               </div>
           </div>
       </div>
       
       <%@ include file="/plantillas/footer.jsp" %>
       
   </section>
</body>