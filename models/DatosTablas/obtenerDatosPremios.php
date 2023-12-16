<?php
require_once("./config/conexion.php");

class obtenerDatosPremios extends ConexionBD{

    public function datosPremios(){
        $this->getConexion();
        $sql="SELECT p.id_premio, p.id_sorteo, p.id_empresa,s.nombre_sorteo, p.nombre_premio, p.cantidad_disponible,
        p.foto_premio,e.nombre_empresa from premios p
        inner join sorteos s on s.id_sorteo=p.id_sorteo
        inner join empresas e on e.id_empresa=p.id_empresa";
        $resultado=$this->conexion->query($sql) or die ($sql);
        return $resultado;
    }


    public function premiosGanados(){
        $sql=ConexionBD::getConexion()->prepare("SELECT ps.id_premio_sorteo, ps.id_premio, p.nombre_premio, ps.id_usuario,pr.nombres,
        pr.apellidos, ps.estado, ps.fecha_asignacion from premios_sorteo ps
        inner join usuarios u on u.id_usuario=ps.id_usuario
        inner join personas pr on pr.id_persona=u.id_persona
        inner join premios p on p.id_premio=ps.id_premio
        order by ps.id_premio_sorteo desc");
        $sql->execute();
        return $sql;
    }


    public function premiosGanadosPorUsuario($id){
        $sql=ConexionBD::getConexion()->prepare("SELECT ps.id_premio, ps.id_sorteo, s.nombre_sorteo, p.nombre_premio,
        p.foto_premio, ps.estado, ps.fecha_asignacion from premios_sorteo ps
        inner join sorteos s on s.id_sorteo=ps.id_sorteo
        inner join premios p on p.id_premio=ps.id_premio
        where ps.id_usuario=? and ps.estado=1
        order by ps.fecha_asignacion desc");
        $sql->bindParam(1,$id);
        $sql->execute();
        return $sql;
    }

    
    public function contarPremiosGanadosPorUsuario($id){
        $sql=ConexionBD::getConexion()->prepare("SELECT count(*) as contar_premios from premios_sorteo 
        where id_usuario=?");
        $sql->bindParam(1,$id);
        $sql->execute();
        return $sql;
    }
    
}