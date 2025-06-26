<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>SABI - Registro</title>
   <link rel="stylesheet" type="text/css" href="estilos/registro.css">
   <script>
       function showRoleModal() {
           document.getElementById('roleModal').classList.add('active'); // Mostrar el modal
       }

       function selectRole(role) {
           if (role === 'entrenador') {
               window.location.href = 'entrenar.jsp'; // Redirigir a la página de entrenar
           } else if (role === 'cliente') {
               window.location.href = 'cliente.jsp'; // Redirigir a la página del cliente
           }
           document.getElementById('roleModal').classList.remove('active'); // Ocultar el modal
       }

       function closeModal() {
           document.getElementById('roleModal').classList.remove('active'); // Función para cerrar el modal
       }

       function updateCiudades() {
           const departamentoSelect = document.getElementById('departamento');
           const ciudadSelect = document.getElementById('ciudad');
           const departamento = departamentoSelect.value;

           // Limpiar las opciones de ciudad
           ciudadSelect.innerHTML = '';

           if (departamento) {
               ciudadSelect.disabled = false;
               const ciudades = {
                   antioquia: ['Medellín', 'Envigado', 'Bello'],
                   atlantico: ['Barranquilla', 'Soledad', 'Malambo'],
                   bogota: ['Bogotá'],
                   // Agrega más departamentos y ciudades según sea necesario
               };

               ciudades[departamento].forEach(ciudad => {
                   const option = document.createElement('option');
                   option.value = ciudad.toLowerCase();
                   option.text = ciudad;
                   ciudadSelect.appendChild(option);
               });
           } else {
               ciudadSelect.disabled = true;
               ciudadSelect.innerHTML = '<option value="">Primero selecciona un departamento</option>';
           }
       }
   </script>
</head>
<body>
   <!-- Modal de Selección de Rol -->
   <div class="modal-overlay" id="roleModal">
       <div class="modal-content">
           <h2 class="modal-title">¡Bienvenido a SABI!</h2>
           <p class="modal-subtitle">¿Qué rol prefieres para tu cuenta?</p>
           <div class="role-buttons">
               <button class="role-btn" onclick="selectRole('cliente')">
                   <span class="role-icon">👤</span>
                   <span>Cliente</span>
               </button>
               <button class="role-btn" onclick="selectRole('entrenador')">
                   <span class="role-icon">💪</span>
                   <span>Entrenador</span>
               </button>
           </div>
           <button onclick="closeModal()">Cerrar</button> <!-- Botón para cerrar el modal -->
       </div>
   </div>

   <!-- Navbar -->
   <nav class="navbar">
       <div class="nav-container">
           <button class="back-btn" onclick="goBack()">
               <svg width="24" height="24" viewBox="0 0 24 24" fill="none">
                   <path d="M19 12H5M12 19l-7-7 7-7" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
               </svg>
           </button>
           <h1 class="brand-title">SABI</h1>
       </div>
   </nav>

   <!-- Sección de Registro -->
   <section class="register-section">
       <div class="register-container">
           <div class="register-card">
               <h2>Bienvenido a SABI<br>Ingresa tus datos</h2>
               <form class="register-form" id="registerForm" onsubmit="showRoleModal(); return false;"> <!-- Mostrar modal en submit -->
                   <div class="form-row">
                       <div class="form-group">
                           <label>Nombre *</label>
                           <input type="text" name="nombre" placeholder="Nombre" required>
                       </div>
                       <div class="form-group">
                           <label>Apellido *</label>
                           <input type="text" name="apellido" placeholder="Apellido" required>
                       </div>
                   </div>

                   <div class="form-row">
                       <div class="form-group">
                           <label>Género *</label>
                           <select name="genero" required>
                               <option value="">Seleccionar género</option>
                               <option value="masculino">Masculino</option>
                               <option value="femenino">Femenino</option>
                               <option value="otro">Otro</option>
                               <option value="no-especificar">Prefiero no especificar</option>
                           </select>
                       </div>
                       <div class="form-group">
                           <label>Fecha de nacimiento *</label>
                           <input type="date" name="fechaNacimiento" required>
                       </div>
                   </div>

                   <div class="form-row">
                       <div class="form-group">
                           <label>Departamento *</label>
                           <select id="departamento" name="departamento" required onchange="updateCiudades()">
                               <option value="">Seleccionar departamento</option>
                               <option value="antioquia">Antioquia</option>
                               <option value="atlantico">Atlántico</option>
                               <option value="bogota">Bogotá D.C.</option>
                               <!-- Agrega más departamentos según sea necesario -->
                           </select>
                       </div>
                       <div class="form-group">
                           <label>Ciudad *</label>
                           <select id="ciudad" name="ciudad" required disabled>
                               <option value="">Primero selecciona un departamento</option>
                           </select>
                       </div>
                   </div>

                   <div class="form-row">
                       <div class="form-group">
                           <label>Tipo de Documento *</label>
                           <select name="tipoDocumento" required>
                               <option value="">Seleccionar tipo</option>
                               <option value="cc">Cédula de Ciudadanía</option>
                               <option value="ti">Tarjeta de Identidad</option>
                               <option value="ce">Cédula de Extranjería</option>
                               <option value="pasaporte">Pasaporte</option>
                           </select>
                       </div>
                       <div class="form-group">
                           <label>Número de Documento *</label>
                           <input type="text" name="numeroDocumento" placeholder="123456789" required>
                       </div>
                   </div>

                   <div class="form-group full-width">
                       <label>Correo electrónico *</label>
                       <input type="email" name="email" placeholder="correo@ejemplo.com" required>
                   </div>

                   <div class="form-row">
                       <div class="form-group">
                           <label>Contraseña *</label>
                           <input type="password" name="password" placeholder="Contraseña" required minlength="8">
                       </div>
                       <div class="form-group">
                           <label>Confirmar Contraseña *</label>
                           <input type="password" name="confirmPassword" placeholder="Confirmar contraseña" required minlength="8">
                       </div>
                   </div>

                   <div class="form-group">
                       <small class="password-hint">Mínimo 8 caracteres</small>
                   </div>

                   <button type="submit" class="register-btn">
                       <span class="btn-text">Registrarse</span>
                       <span class="btn-loading" style="display: none;">
                           <div class="btn-spinner"></div>
                           Procesando...
                       </span>
                   </button>
                  
                   <div class="login-link-container">
                       <span>¿Ya tienes cuenta? </span>
                       <a href="index.jsp" class="login-link">Iniciar sesión</a>
                   </div>
               </form>
           </div>
           <div class="logo-section">
               <div class="logo">
                   <img src="recursos/logoF.png" alt="SABI Logo" class="logo-img">
               </div>
           </div>
       </div>
   </section>

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
                   <li>1634053454</li>
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
</body>
</html>

