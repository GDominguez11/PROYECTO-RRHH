-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.34 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para sistema_rrhh
DROP DATABASE IF EXISTS `sistema_rrhh`;
CREATE DATABASE IF NOT EXISTS `sistema_rrhh` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sistema_rrhh`;

-- Volcando estructura para tabla sistema_rrhh.auxiliares
DROP TABLE IF EXISTS `auxiliares`;
CREATE TABLE IF NOT EXISTS `auxiliares` (
  `id_auxiliar` int NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dni` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `lugar_nacimiento` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `grado_academico` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cargo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fuerza` enum('Ejército','Naval','Áerea') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_ingreso_ffaa` datetime DEFAULT NULL,
  `fecha_ingreso_udh` datetime DEFAULT NULL,
  `estado_civil` enum('Soltero','Casado') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `modalidad` enum('Permanente','Por Contrato') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ruta_carpeta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `registro_borrado` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_auxiliar`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sistema_rrhh.auxiliares: ~0 rows (aproximadamente)
DELETE FROM `auxiliares`;

-- Volcando estructura para tabla sistema_rrhh.docentes
DROP TABLE IF EXISTS `docentes`;
CREATE TABLE IF NOT EXISTS `docentes` (
  `id_docente` int NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dni` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `lugar_nacimiento` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `grado_academico` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cuenta_banco` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `rtn` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_ingreso_udh` datetime DEFAULT NULL,
  `estado_civil` enum('Soltero','Casado') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ruta_carpeta` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `registro_borrado` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_docente`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sistema_rrhh.docentes: ~0 rows (aproximadamente)
DELETE FROM `docentes`;

-- Volcando estructura para tabla sistema_rrhh.oficiales
DROP TABLE IF EXISTS `oficiales`;
CREATE TABLE IF NOT EXISTS `oficiales` (
  `id_oficial` int NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `grado` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dni` varchar(15) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `lugar_nacimiento` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `grado_academico` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cargo` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `serie` varchar(16) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fuerza` enum('Ejército','Naval','Áerea') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_ingreso_ffaa` datetime DEFAULT NULL,
  `fecha_ingreso_udh` datetime DEFAULT NULL,
  `estado_civil` enum('Soltero','Casado') COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ruta_carpeta` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `registro_borrado` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_oficial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sistema_rrhh.oficiales: ~0 rows (aproximadamente)
DELETE FROM `oficiales`;

-- Volcando estructura para tabla sistema_rrhh.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `estado` enum('Activo','Inactivo','Bloqueado','Eliminado') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contrasena` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_rol` int DEFAULT NULL,
  `correo_electronico` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creado_por` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `modificado_por` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `registro_borrado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla sistema_rrhh.usuarios: ~1 rows (aproximadamente)
DELETE FROM `usuarios`;
INSERT INTO `usuarios` (`id_usuario`, `usuario`, `estado`, `contrasena`, `id_rol`, `correo_electronico`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`, `registro_borrado`) VALUES
	(1, 'prueba', 'Activo', '$2y$12$JZuF8nYNy9bF3Oo3w1ujROM8i00XmIUBsljz2MAPLkwaWUuWZhc2q', 1, 'prueba@gmail.hn', 'prueba', '2023-05-29 16:03:30', 'prueba', '2023-09-30 16:08:41', 0);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
