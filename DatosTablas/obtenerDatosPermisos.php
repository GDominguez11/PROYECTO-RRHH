<?php
require_once("./config/conexion.php");

class obtenerDatosPermisos extends ConexionBD{

    public function datosPermisos(){
        $sql=ConexionBD::getConexion()->prepare("SELECT r.rol, m.modulo,p.tipo_modulo, p.permiso_insercion, p.permiso_actualizacion,
        p.permiso_eliminacion, p.permiso_consulta,p.id_rol,p.id_modulo FROM permisos p
        inner join roles r on r.id_rol=p.id_rol
        inner join modulos m on m.id_modulo=p.id_modulo");
        $sql->execute();
        return $sql;
    }


    //funcion para obtener los permisos que tiene el rol del usuario conectado al sistema
    //para acceder a partes del sistema, crear, modificar o eliminar informacion
    public function datosPermisosID($id_rol,$id_mod){
        $sql=ConexionBD::getConexion()->prepare("SELECT * FROM permisos where id_rol=? and id_modulo=?");
        $sql->bindParam(1,$id_rol);
        $sql->bindParam(2,$id_mod);
        $sql->execute();
        return $sql;
    }
    
}