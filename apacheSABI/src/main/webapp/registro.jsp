<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>SABI - Registro</title>
   <link rel="stylesheet" href="META-INF/estilos/registro.css">
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
       </div>
   </div>


   <!-- Modal de Confirmación -->
   <div class="modal-overlay" id="confirmModal">
       <div class="modal-content success-modal">
           <h2 class="modal-title">✅ ¡Registro Exitoso!</h2>
           <p class="modal-subtitle">Tu cuenta ha sido creada correctamente.</p>
           <div class="loading-spinner" id="loadingSpinner">
               <div class="spinner"></div>
               <p>Redirigiendo...</p>
           </div>
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
               <form class="register-form" id="registerForm">
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
                               <option value="bolivar">Bolívar</option>
                               <option value="boyaca">Boyacá</option>
                               <option value="caldas">Caldas</option>
                               <option value="caqueta">Caquetá</option>
                               <option value="casanare">Casanare</option>
                               <option value="cauca">Cauca</option>
                               <option value="cesar">Cesar</option>
                               <option value="choco">Chocó</option>
                               <option value="cordoba">Córdoba</option>
                               <option value="cundinamarca">Cundinamarca</option>
                               <option value="huila">Huila</option>
                               <option value="la-guajira">La Guajira</option>
                               <option value="magdalena">Magdalena</option>
                               <option value="meta">Meta</option>
                               <option value="nariño">Nariño</option>
                               <option value="norte-santander">Norte de Santander</option>
                               <option value="putumayo">Putumayo</option>
                               <option value="quindio">Quindío</option>
                               <option value="risaralda">Risaralda</option>
                               <option value="san-andres">San Andrés y Providencia</option>
                               <option value="santander">Santander</option>
                               <option value="sucre">Sucre</option>
                               <option value="tolima">Tolima</option>
                               <option value="valle">Valle del Cauca</option>
                               <option value="arauca">Arauca</option>
                               <option value="vichada">Vichada</option>
                               <option value="guainia">Guainía</option>
                               <option value="guaviare">Guaviare</option>
                               <option value="vaupes">Vaupés</option>
                               <option value="amazonas">Amazonas</option>
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
                       <a href="#" class="login-link">Iniciar sesión</a>
                   </div>
               </form>
           </div>
           <div class="logo-section">
               <div class="logo">
                   <div class="logo-img" style="width: 120px; height: 120px; background: linear-gradient(135deg, #667eea, #764ba2); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-size: 3rem; font-weight: bold; margin: 0 auto 1rem;">S</div>
                   <h2>SABI</h2>
                   <p>Tu plataforma de entrenamiento</p>
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
   <script>
       // Datos de ciudades por departamento
       const ciudadesPorDepartamento = {
           antioquia: [
               { value: 'medellin', text: 'Medellín' },
               { value: 'bello', text: 'Bello' },
               { value: 'itagui', text: 'Itagüí' },
               { value: 'envigado', text: 'Envigado' },
               { value: 'apartado', text: 'Apartadó' },
               { value: 'turbo', text: 'Turbo' },
               { value: 'rionegro', text: 'Rionegro' },
               { value: 'sabaneta', text: 'Sabaneta' }
           ],
           atlantico: [
               { value: 'barranquilla', text: 'Barranquilla' },
               { value: 'soledad', text: 'Soledad' },
               { value: 'malambo', text: 'Malambo' },
               { value: 'sabanalarga', text: 'Sabanalarga' },
               { value: 'puerto-colombia', text: 'Puerto Colombia' }
           ],
           bogota: [
               { value: 'bogota', text: 'Bogotá' }
           ],
           bolivar: [
               { value: 'cartagena', text: 'Cartagena' },
               { value: 'magangue', text: 'Magangué' },
               { value: 'turbaco', text: 'Turbaco' },
               { value: 'el-carmen', text: 'El Carmen de Bolívar' }
           ],
           boyaca: [
               { value: 'tunja', text: 'Tunja' },
               { value: 'duitama', text: 'Duitama' },
               { value: 'sogamoso', text: 'Sogamoso' },
               { value: 'chiquinquira', text: 'Chiquinquirá' }
           ],
           caldas: [
               { value: 'manizales', text: 'Manizales' },
               { value: 'la-dorada', text: 'La Dorada' },
               { value: 'chinchina', text: 'Chinchiná' },
               { value: 'villamaria', text: 'Villamaría' }
           ],
           caqueta: [
               { value: 'florencia', text: 'Florencia' },
               { value: 'san-vicente', text: 'San Vicente del Caguán' }
           ],
           casanare: [
               { value: 'yopal', text: 'Yopal' },
               { value: 'aguazul', text: 'Aguazul' },
               { value: 'villanueva', text: 'Villanueva' }
           ],
           cauca: [
               { value: 'popayan', text: 'Popayán' },
               { value: 'santander-quilichao', text: 'Santander de Quilichao' }
           ],
           cesar: [
               { value: 'valledupar', text: 'Valledupar' },
               { value: 'aguachica', text: 'Aguachica' },
               { value: 'codazzi', text: 'Codazzi' }
           ],
           choco: [
               { value: 'quibdo', text: 'Quibdó' },
               { value: 'istmina', text: 'Istmina' }
           ],
           cordoba: [
               { value: 'monteria', text: 'Montería' },
               { value: 'lorica', text: 'Lorica' },
               { value: 'cerete', text: 'Cereté' },
               { value: 'sahagun', text: 'Sahagún' }
           ],
           cundinamarca: [
               { value: 'soacha', text: 'Soacha' },
               { value: 'girardot', text: 'Girardot' },
               { value: 'zipaquira', text: 'Zipaquirá' },
               { value: 'facatativa', text: 'Facatativá' },
               { value: 'chía', text: 'Chía' },
               { value: 'madrid', text: 'Madrid' },
               { value: 'funza', text: 'Funza' },
               { value: 'cajica', text: 'Cajicá' }
           ],
           huila: [
               { value: 'neiva', text: 'Neiva' },
               { value: 'pitalito', text: 'Pitalito' },
               { value: 'garzon', text: 'Garzón' },
               { value: 'la-plata', text: 'La Plata' }
           ],
           'la-guajira': [
               { value: 'riohacha', text: 'Riohacha' },
               { value: 'maicao', text: 'Maicao' }
           ],
           magdalena: [
               { value: 'santa-marta', text: 'Santa Marta' },
               { value: 'cienaga', text: 'Ciénaga' },
               { value: 'fundacion', text: 'Fundación' }
           ],
           meta: [
               { value: 'villavicencio', text: 'Villavicencio' },
               { value: 'acacias', text: 'Acacías' },
               { value: 'granada', text: 'Granada' }
           ],
           nariño: [
               { value: 'pasto', text: 'Pasto' },
               { value: 'tumaco', text: 'Tumaco' },
               { value: 'ipiales', text: 'Ipiales' }
           ],
           'norte-santander': [
               { value: 'cucuta', text: 'Cúcuta' },
               { value: 'ocaña', text: 'Ocaña' },
               { value: 'pamplona', text: 'Pamplona' },
               { value: 'villa-del-rosario', text: 'Villa del Rosario' }
           ],
           putumayo: [
               { value: 'mocoa', text: 'Mocoa' },
               { value: 'puerto-asis', text: 'Puerto Asís' }
           ],
           quindio: [
               { value: 'armenia', text: 'Armenia' },
               { value: 'calarca', text: 'Calarcá' },
               { value: 'la-tebaida', text: 'La Tebaida' },
               { value: 'montenegro', text: 'Montenegro' }
           ],
           risaralda: [
               { value: 'pereira', text: 'Pereira' },
               { value: 'dosquebradas', text: 'Dosquebradas' },
               { value: 'santa-rosa', text: 'Santa Rosa de Cabal' }
           ],
           'san-andres': [
               { value: 'san-andres', text: 'San Andrés' },
               { value: 'providencia', text: 'Providencia' }
           ],
           santander: [
               { value: 'bucaramanga', text: 'Bucaramanga' },
               { value: 'floridablanca', text: 'Floridablanca' },
               { value: 'giron', text: 'Girón' },
               { value: 'piedecuesta', text: 'Piedecuesta' },
               { value: 'barrancabermeja', text: 'Barrancabermeja' },
               { value: 'san-gil', text: 'San Gil' }
           ],
           sucre: [
               { value: 'sincelejo', text: 'Sincelejo' },
               { value: 'corozal', text: 'Corozal' }
           ],
           tolima: [
               { value: 'ibague', text: 'Ibagué' },
               { value: 'espinal', text: 'Espinal' },
               { value: 'melgar', text: 'Melgar' },
               { value: 'honda', text: 'Honda' }
           ],
           valle: [
               { value: 'cali', text: 'Cali' },
               { value: 'palmira', text: 'Palmira' },
               { value: 'buenaventura', text: 'Buenaventura' },
               { value: 'tulua', text: 'Tuluá' },
               { value: 'cartago', text: 'Cartago' },
               { value: 'buga', text: 'Buga' },
               { value: 'jamundi', text: 'Jamundí' }
           ],
           arauca: [
               { value: 'arauca', text: 'Arauca' }
           ],
           vichada: [
               { value: 'puerto-carreño', text: 'Puerto Carreño' }
           ],
           guainia: [
               { value: 'puerto-inirida', text: 'Puerto Inírida' }
           ],
           guaviare: [
               { value: 'san-jose', text: 'San José del Guaviare' }
           ],
           vaupes: [
               { value: 'mitu', text: 'Mitú' }
           ],
           amazonas: [
               { value: 'leticia', text: 'Leticia' }
           ]
       };


       function updateCiudades() {
           const departamentoSelect = document.getElementById('departamento');
           const ciudadSelect = document.getElementById('ciudad');
           const departamentoValue = departamentoSelect.value;


           // Limpiar opciones actuales
           ciudadSelect.innerHTML = '';


           if (departamentoValue === '') {
               // Si no hay departamento seleccionado, deshabilitar ciudades
               ciudadSelect.disabled = true;
               ciudadSelect.innerHTML = '<option value="">Primero selecciona un departamento</option>';
           } else {
               // Habilitar select de ciudades
               ciudadSelect.disabled = false;
              
               // Agregar opción por defecto
               ciudadSelect.innerHTML = '<option value="">Seleccionar ciudad</option>';
              
               // Agregar ciudades del departamento seleccionado
               const ciudades = ciudadesPorDepartamento[departamentoValue] || [];
               ciudades.forEach(ciudad => {
                   const option = document.createElement('option');
                   option.value = ciudad.value;
                   option.textContent = ciudad.text;
                   ciudadSelect.appendChild(option);
               });
           }
       }


       function goBack() {
           window.history.back();
       }


       // Inicializar el estado al cargar la página
       document.addEventListener('DOMContentLoaded', function() {
           updateCiudades();
       });
   </script>
</body>
</html>
