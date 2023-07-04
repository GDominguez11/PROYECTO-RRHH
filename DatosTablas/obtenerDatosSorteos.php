<?php
require_once("./config/conexion.php");

class obtenerDatosSorteos extends ConexionBD{

    public function datosSorteos(){
        $sql=ConexionBD::getConexion()->prepare("SELECT id_sorteo, nombre_sorteo, estado_sorteo from sorteos");
        $sql->execute();
        return $sql;
    }

    
    public function boletosVendidos(){
        $sql=ConexionBD::getConexion()->prepare("SELECT b.id_boleto, b.id_usuario, b.id_sorteo, p.nombres, p.apellidos, p.dni, 
        s.nombre_sorteo, b.numero_boleto,b.fecha_compra, u.id_persona from boletos b
        inner join usuarios u on u.id_usuario=b.id_usuario
        inner join sorteos s on s.id_sorteo=b.id_sorteo
        inner join personas p on p.id_persona=u.id_persona
        order by b.numero_boleto desc");
        $sql->execute();
        return $sql;
    }


    public function boletosCompradosPorUsuario($id){
        $sql=ConexionBD::getConexion()->prepare("SELECT b.id_boleto, b.id_sorteo, s.nombre_sorteo, b.numero_boleto,b.fecha_compra from boletos b
        inner join usuarios u on u.id_usuario=b.id_usuario
        inner join sorteos s on s.id_sorteo=b.id_sorteo
        where b.id_usuario=?   
        order by b.numero_boleto desc");
        $sql->bindParam(1,$id);
        $sql->execute();
        return $sql;
    }

    
    public function contarBoletosCompradosPorUsuario($id){
        $sql=ConexionBD::getConexion()->prepare("SELECT count(*) as contar_boletos from boletos 
        where id_usuario=?");
        $sql->bindParam(1,$id);
        $sql->execute();
        return $sql;
    }
    
}