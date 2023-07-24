<?php
	if (session_status() == PHP_SESSION_NONE) {
		session_start();
	}

    //llamado al controlador de login
    require_once 'controladores/emailControlador.php';
    $enviarCodigo = new Correo(); //se crea nueva instancia de usuario

    //valdacion para ver si se recibieron datos de ingreso
    if (isset($_POST['acceder'])) {
        $codigo =  $_POST['text'];
        $respuesta = $enviarCodigo->verificaCodigoToken($codigo); //se envian los datos a la funcion accesoUsuario de modelo Login
    }
?>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cambio de Contraseña | Sistema X</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" href="../vistas/css/Login.css">
</head>
<body>
    <div class="box-recuperacion">
        <form action="" method="POST">
         <!-- <?php
            if(isset($_SESSION['respuesta'])){
				switch($_SESSION['respuesta']){
					case 'Usuario si existe':
						
                        echo '
						<style>
                            .box-recuperacion{height: 390px;} 
						</style>
						<div div class="alert alert-success text-center style="font-size: 17px;" role="alert">Usuario si existe</div>';
                    break;
                    case 'Usuario no existe':
						echo '
						    <style>
                                .box-recuperacion{height: 390px;} 
							</style>
							<div div class="alert alert-danger text-center style="font-size: 17px;" role="alert">Usuario no existe</div>';
					break;
                    }
                }
            ?>  -->
            <h3>Cambiar Contraseña</h3>
            <div class="inputBox">
                 <input type="password" name="text" required>
                 <span>Ingrese su nueva contraseña</span>
                 <i></i>
            </div>
            <div class="inputBox">
                 <input type="password" name="text" required>
                 <span>Confirme su nueva contraseña</span>
                 <i></i>
            </div>
            <button type="submit" name="acceder">Guardar Cambios</button>
        </form>
    </div>
