<?php
require_once("./config/conexion.php");

class obtenerDatosTablas extends ConexionBD{

    public function datosTablas($tabla){
        $sql=ConexionBD::getConexion()->prepare("SELECT * FROM $tabla");
        $sql->execute();
        return $sql;
    }


    public function contarRegistros($tabla){
        $sql=ConexionBD::getConexion()->prepare("SELECT count(*) as contar_registros FROM $tabla");
        $sql->execute();
        return $sql;
    }

    
    public function datosBitacora(){
        $sql=ConexionBD::getConexion()->prepare("SELECT b.id_modulo, b.fecha, b.id_usuario, b.accion,
         b.descripcion, m.modulo, u.usuario FROM bitacora b
        inner join modulos m on m.id_modulo=b.id_modulo
        inner join usuarios u on u.id_usuario=b.id_usuario
        order by fecha desc");
        $sql->execute();
        return $sql;
    }
    
}