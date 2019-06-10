-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-06-2019 a las 23:43:08
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tpfinal`
--
CREATE DATABASE IF NOT EXISTS `tpfinal` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `tpfinal`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE IF NOT EXISTS `comentarios` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `usuario` bigint(20) UNSIGNED NOT NULL,
  `post` bigint(20) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `comentario` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario` (`usuario`),
  KEY `post` (`post`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

DROP TABLE IF EXISTS `favoritos`;
CREATE TABLE IF NOT EXISTS `favoritos` (
  `usuario` bigint(20) UNSIGNED NOT NULL,
  `post` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`usuario`,`post`),
  KEY `post` (`post`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos`
--

DROP TABLE IF EXISTS `grupos`;
CREATE TABLE IF NOT EXISTS `grupos` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `categoria` bigint(20) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `creador` bigint(20) UNSIGNED NOT NULL,
  `integrantes` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`),
  KEY `categoria` (`categoria`),
  KEY `creador` (`creador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

DROP TABLE IF EXISTS `mensajes`;
CREATE TABLE IF NOT EXISTS `mensajes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `origen` bigint(20) UNSIGNED NOT NULL,
  `destino` bigint(20) UNSIGNED NOT NULL,
  `titulo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `mensaje` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `estado` enum('AM','SO','SD') COLLATE utf8_spanish_ci NOT NULL DEFAULT 'AM',
  PRIMARY KEY (`id`),
  KEY `origen` (`origen`),
  KEY `destino` (`destino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `niveles`
--

DROP TABLE IF EXISTS `niveles`;
CREATE TABLE IF NOT EXISTS `niveles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `limite` int(11) DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

DROP TABLE IF EXISTS `permisos`;
CREATE TABLE IF NOT EXISTS `permisos` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos_asignados`
--

DROP TABLE IF EXISTS `permisos_asignados`;
CREATE TABLE IF NOT EXISTS `permisos_asignados` (
  `nivel` bigint(20) UNSIGNED NOT NULL,
  `permiso` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`nivel`,`permiso`),
  KEY `permiso` (`permiso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `usuario` bigint(20) UNSIGNED NOT NULL,
  `grupo` bigint(20) UNSIGNED DEFAULT NULL,
  `titulo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `categoria` bigint(20) UNSIGNED NOT NULL,
  `post` text COLLATE utf8_spanish_ci NOT NULL,
  `fecha` date NOT NULL,
  `puntos` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `favoritos` int(10) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `titulo` (`titulo`),
  KEY `usuario` (`usuario`),
  KEY `grupo` (`grupo`),
  KEY `categoria` (`categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `grupo` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `grupo` (`grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguidores`
--

DROP TABLE IF EXISTS `seguidores`;
CREATE TABLE IF NOT EXISTS `seguidores` (
  `seguidor` bigint(20) UNSIGNED NOT NULL,
  `seguido` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`seguidor`,`seguido`),
  KEY `seguido` (`seguido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` varchar(63) COLLATE utf8_spanish_ci NOT NULL,
  `apellido` varchar(63) COLLATE utf8_spanish_ci NOT NULL,
  `username` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `facebook` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nivel` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `puntos` bigint(20) UNSIGNED NOT NULL DEFAULT '0',
  `mensajePersonal` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `nivel` (`nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_grupos`
--

DROP TABLE IF EXISTS `usuarios_grupos`;
CREATE TABLE IF NOT EXISTS `usuarios_grupos` (
  `usuario` bigint(20) UNSIGNED NOT NULL,
  `grupo` bigint(20) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `rol` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`usuario`,`grupo`),
  KEY `grupo` (`grupo`),
  KEY `rol` (`rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`post`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`post`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `grupos`
--
ALTER TABLE `grupos`
  ADD CONSTRAINT `grupos_ibfk_1` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `grupos_ibfk_2` FOREIGN KEY (`creador`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`origen`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mensajes_ibfk_2` FOREIGN KEY (`destino`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `permisos_asignados`
--
ALTER TABLE `permisos_asignados`
  ADD CONSTRAINT `permisos_asignados_ibfk_1` FOREIGN KEY (`nivel`) REFERENCES `niveles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permisos_asignados_ibfk_2` FOREIGN KEY (`permiso`) REFERENCES `permisos` (`id`);

--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`grupo`) REFERENCES `grupos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_ibfk_3` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`grupo`) REFERENCES `grupos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `seguidores`
--
ALTER TABLE `seguidores`
  ADD CONSTRAINT `seguidores_ibfk_1` FOREIGN KEY (`seguidor`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `seguidores_ibfk_2` FOREIGN KEY (`seguido`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`nivel`) REFERENCES `niveles` (`id`);

--
-- Filtros para la tabla `usuarios_grupos`
--
ALTER TABLE `usuarios_grupos`
  ADD CONSTRAINT `usuarios_grupos_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_grupos_ibfk_2` FOREIGN KEY (`grupo`) REFERENCES `grupos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_grupos_ibfk_3` FOREIGN KEY (`rol`) REFERENCES `roles` (`id`);


--
-- Metadatos
--
USE `phpmyadmin`;

--
-- Metadatos para la tabla categorias
--
-- Error leyendo datos de la tabla phpmyadmin.pma__column_info: #1100 - Tabla 'pma__column_info' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__table_uiprefs: #1100 - Tabla 'pma__table_uiprefs' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__tracking: #1100 - Tabla 'pma__tracking' no fue trabada con LOCK TABLES

--
-- Metadatos para la tabla comentarios
--
-- Error leyendo datos de la tabla phpmyadmin.pma__column_info: #1100 - Tabla 'pma__column_info' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__table_uiprefs: #1100 - Tabla 'pma__table_uiprefs' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__tracking: #1100 - Tabla 'pma__tracking' no fue trabada con LOCK TABLES

--
-- Metadatos para la tabla favoritos
--
-- Error leyendo datos de la tabla phpmyadmin.pma__column_info: #1100 - Tabla 'pma__column_info' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__table_uiprefs: #1100 - Tabla 'pma__table_uiprefs' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__tracking: #1100 - Tabla 'pma__tracking' no fue trabada con LOCK TABLES

--
-- Metadatos para la tabla grupos
--
-- Error leyendo datos de la tabla phpmyadmin.pma__column_info: #1100 - Tabla 'pma__column_info' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__table_uiprefs: #1100 - Tabla 'pma__table_uiprefs' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__tracking: #1100 - Tabla 'pma__tracking' no fue trabada con LOCK TABLES

--
-- Metadatos para la tabla mensajes
--
-- Error leyendo datos de la tabla phpmyadmin.pma__column_info: #1100 - Tabla 'pma__column_info' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__table_uiprefs: #1100 - Tabla 'pma__table_uiprefs' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__tracking: #1100 - Tabla 'pma__tracking' no fue trabada con LOCK TABLES

--
-- Metadatos para la tabla niveles
--
-- Error leyendo datos de la tabla phpmyadmin.pma__column_info: #1100 - Tabla 'pma__column_info' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__table_uiprefs: #1100 - Tabla 'pma__table_uiprefs' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__tracking: #1100 - Tabla 'pma__tracking' no fue trabada con LOCK TABLES

--
-- Metadatos para la tabla permisos
--
-- Error leyendo datos de la tabla phpmyadmin.pma__column_info: #1100 - Tabla 'pma__column_info' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__table_uiprefs: #1100 - Tabla 'pma__table_uiprefs' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__tracking: #1100 - Tabla 'pma__tracking' no fue trabada con LOCK TABLES

--
-- Metadatos para la tabla permisos_asignados
--
-- Error leyendo datos de la tabla phpmyadmin.pma__column_info: #1100 - Tabla 'pma__column_info' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__table_uiprefs: #1100 - Tabla 'pma__table_uiprefs' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__tracking: #1100 - Tabla 'pma__tracking' no fue trabada con LOCK TABLES

--
-- Metadatos para la tabla posts
--
-- Error leyendo datos de la tabla phpmyadmin.pma__column_info: #1100 - Tabla 'pma__column_info' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__table_uiprefs: #1100 - Tabla 'pma__table_uiprefs' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__tracking: #1100 - Tabla 'pma__tracking' no fue trabada con LOCK TABLES

--
-- Metadatos para la tabla roles
--
-- Error leyendo datos de la tabla phpmyadmin.pma__column_info: #1100 - Tabla 'pma__column_info' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__table_uiprefs: #1100 - Tabla 'pma__table_uiprefs' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__tracking: #1100 - Tabla 'pma__tracking' no fue trabada con LOCK TABLES

--
-- Metadatos para la tabla seguidores
--
-- Error leyendo datos de la tabla phpmyadmin.pma__column_info: #1100 - Tabla 'pma__column_info' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__table_uiprefs: #1100 - Tabla 'pma__table_uiprefs' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__tracking: #1100 - Tabla 'pma__tracking' no fue trabada con LOCK TABLES

--
-- Metadatos para la tabla usuarios
--
-- Error leyendo datos de la tabla phpmyadmin.pma__column_info: #1100 - Tabla 'pma__column_info' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__table_uiprefs: #1100 - Tabla 'pma__table_uiprefs' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__tracking: #1100 - Tabla 'pma__tracking' no fue trabada con LOCK TABLES

--
-- Metadatos para la tabla usuarios_grupos
--
-- Error leyendo datos de la tabla phpmyadmin.pma__column_info: #1100 - Tabla 'pma__column_info' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__table_uiprefs: #1100 - Tabla 'pma__table_uiprefs' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__tracking: #1100 - Tabla 'pma__tracking' no fue trabada con LOCK TABLES

--
-- Metadatos para la base de datos tpfinal
--
-- Error leyendo datos de la tabla phpmyadmin.pma__bookmark: #1100 - Tabla 'pma__bookmark' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__relation: #1100 - Tabla 'pma__relation' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__savedsearches: #1100 - Tabla 'pma__savedsearches' no fue trabada con LOCK TABLES
-- Error leyendo datos de la tabla phpmyadmin.pma__central_columns: #1100 - Tabla 'pma__central_columns' no fue trabada con LOCK TABLES
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
