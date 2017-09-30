-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 24-09-2017 a las 21:46:13
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
-- Base de datos: `DML_2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `CLIENTES`
--

CREATE TABLE `CLIENTES` (
  `codigo_cliente` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `domicilio` varchar(20) DEFAULT NULL,
  `provincia` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `CLIENTES`
--

INSERT INTO `CLIENTES` (`codigo_cliente`, `nombre`, `domicilio`, `provincia`) VALUES
(1, 'Jorge', 'Roca 321', 'Jujuy'),
(2, 'Pedro', 'Maipu 321', 'Mendoza'),
(3, 'Mario', 'Pergamino 441', 'Buenos Aires');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ITEM_VENTAS`
--

CREATE TABLE `ITEM_VENTAS` (
  `numero_factura` int(11) NOT NULL,
  `codigo_producto` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ITEM_VENTAS`
--

INSERT INTO `ITEM_VENTAS` (`numero_factura`, `codigo_producto`, `cantidad`, `precio`) VALUES
(1, 2, 100, 400),
(2, 4, 50, 40),
(3, 1, 20, 15),
(4, 5, 30, 35),
(1, 2, 30, 43),
(2, 4, 33, 43),
(3, 1, 20, 15),
(4, 5, 30, 35);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PRODUCTOS`
--

CREATE TABLE `PRODUCTOS` (
  `codigo_producto` int(11) NOT NULL,
  `nombre_producto` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `PRODUCTOS`
--

INSERT INTO `PRODUCTOS` (`codigo_producto`, `nombre_producto`) VALUES
(1, 'Tuerca'),
(2, 'Mecha'),
(3, 'Tarugo'),
(4, 'Clavo'),
(5, 'Arandela'),
(6, 'Bulon');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `VENTAS`
--

CREATE TABLE `VENTAS` (
  `numero_factura` int(11) NOT NULL,
  `codigo_cliente` int(11) NOT NULL,
  `fecha` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `VENTAS`
--

INSERT INTO `VENTAS` (`numero_factura`, `codigo_cliente`, `fecha`) VALUES
(1, 1, '17/01/2017'),
(2, 2, '27/01/2017'),
(3, 2, '17/05/2017'),
(4, 3, '17/01/2017'),
(5, 1, '17/03/2017');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `CLIENTES`
--
ALTER TABLE `CLIENTES`
  ADD PRIMARY KEY (`codigo_cliente`);

--
-- Indices de la tabla `ITEM_VENTAS`
--
ALTER TABLE `ITEM_VENTAS`
  ADD KEY `FK_COD_FAC` (`numero_factura`),
  ADD KEY `FK_CODIGO_PROD` (`codigo_producto`);

--
-- Indices de la tabla `PRODUCTOS`
--
ALTER TABLE `PRODUCTOS`
  ADD PRIMARY KEY (`codigo_producto`);

--
-- Indices de la tabla `VENTAS`
--
ALTER TABLE `VENTAS`
  ADD PRIMARY KEY (`numero_factura`),
  ADD KEY `FK_COD_CLI` (`codigo_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `CLIENTES`
--
ALTER TABLE `CLIENTES`
  MODIFY `codigo_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `PRODUCTOS`
--
ALTER TABLE `PRODUCTOS`
  MODIFY `codigo_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `VENTAS`
--
ALTER TABLE `VENTAS`
  MODIFY `numero_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ITEM_VENTAS`
--
ALTER TABLE `ITEM_VENTAS`
  ADD CONSTRAINT `FK_CODIGO_PROD` FOREIGN KEY (`codigo_producto`) REFERENCES `PRODUCTOS` (`codigo_producto`),
  ADD CONSTRAINT `FK_COD_FAC` FOREIGN KEY (`numero_factura`) REFERENCES `VENTAS` (`numero_factura`);

--
-- Filtros para la tabla `VENTAS`
--
ALTER TABLE `VENTAS`
  ADD CONSTRAINT `FK_COD_CLI` FOREIGN KEY (`codigo_cliente`) REFERENCES `CLIENTES` (`codigo_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
