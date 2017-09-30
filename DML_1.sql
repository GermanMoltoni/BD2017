-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 24-09-2017 a las 17:27:06
-- Versión del servidor: 10.1.24-MariaDB
-- Versión de PHP: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `DML`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PRODUCTOS`
--

CREATE TABLE `PRODUCTOS` (
  `PNRO` int(11) NOT NULL,
  `PNOMBRE` varchar(20) NOT NULL,
  `PRECIO` float NOT NULL,
  `TAMAÑO` varchar(20) DEFAULT NULL,
  `LOCALIDAD` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `PRODUCTOS`
--

INSERT INTO `PRODUCTOS` (`PNRO`, `PNOMBRE`, `PRECIO`, `TAMAÑO`, `LOCALIDAD`) VALUES
(1, 'Talco', 5, 'Chico', 'Capital Federal'),
(2, 'Talco', 7, 'Chico', 'Capital Federal'),
(3, 'Crema', 8, 'Grande', 'Ramos Mejia'),
(4, 'Cepillo', 2, 'Grande', 'Avellaneda'),
(5, 'Esmalte', 1.2, 'Normal', 'Chacarita');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PROVEEDORES`
--

CREATE TABLE `PROVEEDORES` (
  `NUMERO` int(11) NOT NULL,
  `NOMBRE` varchar(20) NOT NULL,
  `DOMICILIO` varchar(20) NOT NULL,
  `LOCALIDAD` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `PROVEEDORES`
--

INSERT INTO `PROVEEDORES` (`NUMERO`, `NOMBRE`, `DOMICILIO`, `LOCALIDAD`) VALUES
(101, 'Gomez', 'Nazca 920', 'Capital Federal'),
(102, 'Perez', 'Argerich 1030', 'Capital Federal'),
(103, 'Vazquez', 'Sarmiento 450', 'Ramos Mejia'),
(104, 'Lopez', 'Av Alsina 720', 'Avellaneda'),
(107, 'Rosales', 'NULL', 'Wilde');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PROV_PROD`
--

CREATE TABLE `PROV_PROD` (
  `NUMERO` int(11) NOT NULL,
  `PNRO` int(11) NOT NULL,
  `CANTIDAD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `PROV_PROD`
--

INSERT INTO `PROV_PROD` (`NUMERO`, `PNRO`, `CANTIDAD`) VALUES
(101, 1, 300),
(101, 2, 200),
(101, 3, 400),
(101, 4, 200),
(101, 5, 100),
(102, 1, 300),
(102, 2, 400),
(103, 2, 200),
(104, 2, 200),
(104, 4, 300);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `PRODUCTOS`
--
ALTER TABLE `PRODUCTOS`
  ADD PRIMARY KEY (`PNRO`);

--
-- Indices de la tabla `PROVEEDORES`
--
ALTER TABLE `PROVEEDORES`
  ADD PRIMARY KEY (`NUMERO`);

--
-- Indices de la tabla `PROV_PROD`
--
ALTER TABLE `PROV_PROD`
  ADD KEY `FK_NUMERO` (`NUMERO`),
  ADD KEY `FK_PNRO` (`PNRO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `PRODUCTOS`
--
ALTER TABLE `PRODUCTOS`
  MODIFY `PNRO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `PROVEEDORES`
--
ALTER TABLE `PROVEEDORES`
  MODIFY `NUMERO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `PROV_PROD`
--
ALTER TABLE `PROV_PROD`
  ADD CONSTRAINT `FK_NUMERO` FOREIGN KEY (`NUMERO`) REFERENCES `PROVEEDORES` (`NUMERO`),
  ADD CONSTRAINT `FK_PNRO` FOREIGN KEY (`PNRO`) REFERENCES `PRODUCTOS` (`PNRO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
