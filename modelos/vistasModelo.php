<?php
	
	class vistasModelo{

		/*--------- Modelo obtener vistas ---------*/
		protected static function obtener_vistas_modelo($vistas){

			$listaBlanca=["home"];
			$listaLogin=["login"];
			if(in_array($vistas, $listaBlanca)){
				if(is_file("./vistas/contenidos/".$vistas.".php")){
					$contenido="./vistas/contenidos/".$vistas.".php";
				}else{
					$contenido="404";
				}
			}elseif(in_array($vistas, $listaLogin)){
				$contenido=$vistas;
			}else{
				$contenido="404";				
			}

			return $contenido;
		}
	}