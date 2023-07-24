-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-07-2023 a las 21:16:47
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_rrhh`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restablece_clave_email`
--

CREATE TABLE `restablece_clave_email` (
  `id_restablecer` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `codigo` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `restablece_clave_email`
--

INSERT INTO `restablece_clave_email` (`id_restablecer`, `email`, `codigo`, `fecha`) VALUES
(1, 'tankianrichann@gmail.com', 4567, '2023-07-24 18:56:28'),
(2, 'tankianrichann@gmail.com', 2518, '2023-07-24 19:04:13'),
(3, 'tankianrichann@gmail.com', 1607, '2023-07-24 19:05:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `usuario` varchar(50) NOT NULL,
  `estado` enum('Activo','Inactivo','Bloqueado','Eliminado') NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  `fecha_ultima_conexion` datetime DEFAULT NULL,
  `correo_electronico` varchar(50) NOT NULL,
  `creado_por` varchar(30) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `modificado_por` varchar(30) DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_persona`, `usuario`, `estado`, `contrasena`, `fecha_ultima_conexion`, `correo_electronico`, `creado_por`, `fecha_creacion`, `modificado_por`, `fecha_modificacion`) VALUES
(1, 1, 'prueba', 'Activo', '$2y$12$996vQ8DmONpCbf2Sx1.B4ORCm/zF38i0OBdb4r5p4JjH5TYncq.F.', NULL, 'tankianrichann@gmail.com', 'prueba', '2023-05-29 16:03:30', 'prueba', '2023-02-12 11:51:47');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `restablece_clave_email`
--
ALTER TABLE `restablece_clave_email`
  ADD PRIMARY KEY (`id_restablecer`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `restablece_clave_email`
--
ALTER TABLE `restablece_clave_email`
  MODIFY `id_restablecer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
