<?php
//llamado al controlador de login
require_once 'controladores/loginControlador.php';
$usuario = new loginUsuarios(); //se crea nueva instancia de usuario

//valdacion para ver si se recibieron datos de ingreso
if (isset($_POST['acceder'])) {
    $userEnviado=filter_var($_POST['text'], FILTER_SANITIZE_STRING);
    $claveEnviada=filter_var($_POST['clave'], FILTER_SANITIZE_STRING);
    $datos = array(
        'usuario'=> $userEnviado,
        'password'=> $claveEnviada,
    );
    $respuesta = $usuario->accesoSistema($datos); //se envian los datos a la funcion accesoUsuario de Logincontrolador
}
?>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión | Sistema X</title>
    <link rel="stylesheet" href="../vistas/css/Login.css">
</head>
<body>
    <div class="box">
        <form action="" method="POST">
            <h2>Login</h2>
            <div class="inputBox">
                 <input type="text" name="text" required>
                 <span>Usuario</span>
                 <i></i>
            </div>
            <div class="inputBox">
                <input type="clave" name="clave" required>
                <span>Clave</span>
                <i></i>
           </div>
           <a href="<?php echo SERVERURL?>recuperacion-contrasena/" id="olvido-contrasena">¿Olvidaste tu contraseña?</a>
           <input type="submit" name="acceder" placeholder="Ingresar">
        </form>
    </div>
