<?php
ob_start();
?>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<link rel="icon" type="image/x-icon" href="../vistas/assets/img/logo.ico" />
	<?php include "./vistas/inc/archivos_css.php"; ?>
</head>
<body>
	<?php
		$peticionAjax=false;
		require_once "./controladores/vistasControlador.php";
		$IV = new vistasControlador();

		$vistas=$IV->obtener_vistas_controlador();

		if($vistas=="login" || $vistas=="404"){
			require_once "./vistas/contenidos/".$vistas.".php";

		}else{
			$pagina=explode("/", $_GET['views']);
			require_once './controladores/loginControlador.php';
			$lc= new loginUsuarios();
			
			/* if(!isset($_SESSION['usuario_login']) || !isset($_SESSION['token_login']) || !isset($_SESSION['id_login'])
			|| !isset($_SESSION['estado']) || !isset($_SESSION['rol']) || !isset($_SESSION['id_rol'])){
				echo $lc->forzarCierreSesionControlador();
				exit;
			} */
	?>
	<!-- Main container -->
	<main class="full-box main-container">
		<!-- Nav lateral -->
		</section>
	</main>
	<?php
	include  $vistas;
		}
		include "./vistas/inc/Script.php";
	?>
</body>
</html>