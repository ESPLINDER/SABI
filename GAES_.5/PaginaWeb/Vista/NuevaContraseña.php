<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Establecer Nueva Contraseña</title>
   
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <style>
        body {
            background-color: #E2E2B6; 
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .form-container {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
        }
        .btn-custom {
            background-color: black;
            color: azure;
            font-size: 18px;
            font-weight: bold;
            padding: 10px 20px;
            border: none;
            border-radius: 12px;
            position: relative;
            overflow: hidden;
            transition: color 0.3s ease;
            z-index: 1;
        }
        .btn-custom:hover {
            color: black;
        }
        .btn-custom::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, #021526, #03346E, #6EACDA, #E2E2B6, #E2E2B6, #6EACDA, #03346E, #021526, #03346E, #6EACDA, #E2E2B6);
            background-size: 400%;
            z-index: -1;
            transition: opacity 0.3s ease;
            opacity: 0;
            border-radius: 12px;
            animation: glowing 50s linear infinite;
        }
        .btn-custom:hover::before {
            opacity: 1;
        }
        @keyframes glowing {
            0% { background-position: 0 0; }
            50% { background-position: 200% 0; }
            100% { background-position: 0 0; }
        }
        
    </style>
</head>
<body>
    <div class="form-container">
        <h2 class="text-center">Establecer nueva contraseña</h2>
        <form action="InicioSesion.html" method="get">
            <div class="mb-3">
                <label for="newPassword" class="form-label">Nueva Contraseña</label>
                <input type="password" class="form-control" id="newPassword" placeholder="Nueva Contraseña" required>
            </div>
            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Confirmar Contraseña</label>
                <input type="password" class="form-control" id="confirmPassword" placeholder="Confirmar Contraseña" required>
            </div>
            <button type="submit" class="btn btn-custom w-100 mb-3">Establecer Contraseña</button>
        </form>
    </div>

    
    <script src="bootstrap/js/bootstrap.bundle.min.js"></script>
    <script>
        document.getElementById('fitnessForm').addEventListener('submit', function(event) {
     event.preventDefault(); 
     Swal.fire({
         icon: 'success',
         title: '¡Información guardada!',
         text: 'Tu contraseña se actualizado correctamente',
         confirmButtonText: 'Aceptar',
         confirmButtonColor: '#021526'
     }).then(() => {
        
         this.submit();
     });
 });
     </script>
</body>
</html>