<?php
require_once("./config/conexion.php");

class obtenerDatosUsuarios extends ConexionBD{

    public function datosEmpleados(){
        $sql=ConexionBD::getConexion()->prepare("SELECT u.id_usuario, u.id_persona, u.id_rol, u.usuario, p.nombres, p.apellidos, u.estado,r.rol, 
        u.correo_electronico,p.dni, p.telefono,p.sexo,p.direccion from usuarios u
        inner join roles r on r.id_rol=u.id_rol
        inner join personas p on p.id_persona=u.id_persona
        where u.id_rol!=3");
        $sql->execute();
        return $sql;
    }

    public function datosParticipantes(){
        $this->getConexion();
        $sql="SELECT u.id_usuario, u.id_persona, u.id_rol, u.usuario, p.nombres, p.apellidos, u.estado,r.rol, 
        u.correo_electronico,p.dni, p.telefono,p.sexo,p.direccion from usuarios u
        inner join roles r on r.id_rol=u.id_rol
        inner join personas p on p.id_persona=u.id_persona
        where u.id_rol=3";
        $resultado=$this->conexion->query($sql) or die ($sql);
        return $resultado;
    }

    public function contarUsuarios(){
        $sql=ConexionBD::getConexion()->prepare("SELECT * from usuarios");
        $sql->execute();
        return $sql;
    }

    public function datosPerfil($id){
        $sql=ConexionBD::getConexion()->prepare("SELECT u.id_usuario, u.id_persona, u.id_rol, u.usuario, p.nombres, p.apellidos, u.estado,r.rol, 
        u.correo_electronico,p.dni, p.telefono,p.sexo,p.direccion from usuarios u
        inner join roles r on r.id_rol=u.id_rol
        inner join personas p on p.id_persona=u.id_persona
        where u.id_usuario=?");
        $sql->bindParam(1,$id);
        $sql->execute();
        return $sql;
    }
    
}