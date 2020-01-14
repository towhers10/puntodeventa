-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-08-2019 a las 02:15:07
-- Versión del servidor: 10.3.15-MariaDB
-- Versión de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ferreteriainventario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(200) NOT NULL,
  `Telefono` int(11) NOT NULL,
  `RFC` varchar(100) NOT NULL,
  `Correo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_producto`
--

CREATE TABLE `compra_producto` (
  `idCompra` int(11) NOT NULL,
  `Codigo` varchar(50) NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Precio_Unitario` decimal(10,2) NOT NULL,
  `Fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL,
  `CantidadTotal` decimal(10,2) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Fecha` date NOT NULL,
  `formaDePago` varchar(30) NOT NULL,
  `idVenta` int(11) NOT NULL,
  `numero_Articulos` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `RFC` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL,
  `Codigo` varchar(50) NOT NULL,
  `CodigoTP` varchar(30) NOT NULL,
  `Nombre` varchar(200) NOT NULL,
  `idTipoProducto` int(11) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `pUnitario` decimal(10,2) NOT NULL,
  `pTotal` decimal(10,2) NOT NULL,
  `Fabricante` varchar(100) NOT NULL,
  `enStock` int(11) NOT NULL,
  `idProveedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `Codigo`, `CodigoTP`, `Nombre`, `idTipoProducto`, `Descripcion`, `pUnitario`, `pTotal`, `Fabricante`, `enStock`, `idProveedor`) VALUES
(44, '0001', '01', 'Martillo de 14 kg', 1, 'Martillo de 14 kg', '13.50', '90.00', 'TRUPER', 20, 1),
(45, '0002', '02', 'Pinzas', 1, 'Pinzas grandes', '13.99', '80.00', 'PRETUL', 90, 1),
(46, '0003', '03', 'Clavo', 1, 'Clavo para concreto de 1/2 pulgada', '0.30', '30.00', 'TRUPER', 30, 1),
(47, '0004', '0004', 'Aceite', 1, 'Aceite para carros', '12.00', '56.00', 'Truper', 15, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Direccion` varchar(300) NOT NULL,
  `Telefono` int(11) NOT NULL,
  `RFC` varchar(200) NOT NULL,
  `nombre_empresa` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`idProveedor`, `Nombre`, `Direccion`, `Telefono`, `RFC`, `nombre_empresa`) VALUES
(1, 'German', 'Calle 2', 8293828, 'turieoeqeqe', 'TRUPER'),
(2, 'Raul', 'Lomas Verdes', 939393, '424KKRO40', 'PRETUL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoproducto`
--

CREATE TABLE `tipoproducto` (
  `idTipo` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoproducto`
--

INSERT INTO `tipoproducto` (`idTipo`, `Nombre`) VALUES
(1, 'Ferreteria'),
(2, 'Limpieza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

CREATE TABLE `vendedor` (
  `idVendedor` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `vendedor`
--

INSERT INTO `vendedor` (`idVendedor`, `Nombre`, `Password`, `Username`) VALUES
(1, 'Consuelo', 'consuelo02', 'consuelo02'),
(2, 'Gerardo', 'gera05', 'gera05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventatotal`
--

CREATE TABLE `ventatotal` (
  `idVenta` int(11) NOT NULL,
  `Factura` varchar(30) NOT NULL,
  `PagoRecibido` decimal(10,2) NOT NULL,
  `Fecha` date NOT NULL,
  `idVendedor` int(11) NOT NULL,
  `numero_articulos` int(11) NOT NULL,
  `total_venta` decimal(10,2) NOT NULL,
  `hora_compra` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ventatotal`
--

INSERT INTO `ventatotal` (`idVenta`, `Factura`, `PagoRecibido`, `Fecha`, `idVendedor`, `numero_articulos`, `total_venta`, `hora_compra`) VALUES
(47, 'SIN FACTURA', '100.00', '2019-08-04', 1, 3, '27.79', '18:57:14'),
(48, 'SIN FACTURA', '20.00', '2019-08-04', 1, 2, '13.80', '18:59:24'),
(49, 'FACTURA', '100.00', '2019-08-06', 1, 2, '27.49', '16:37:23'),
(50, 'FACTURA', '100.00', '2019-08-06', 1, 2, '27.49', '16:58:32'),
(51, 'FACTURA', '100.00', '2019-08-06', 1, 2, '27.49', '17:04:45'),
(52, 'FACTURA', '100.00', '2019-08-06', 1, 2, '27.49', '17:08:04'),
(53, 'FACTURA', '100.00', '2019-08-06', 1, 1, '13.50', '18:11:32'),
(54, 'FACTURA', '100.00', '2019-08-06', 1, 1, '13.50', '18:52:12'),
(55, 'FACTURA', '100.00', '2019-08-06', 1, 2, '27.49', '18:53:04'),
(56, 'FACTURA', '200.00', '2019-08-06', 1, 3, '27.79', '18:54:47'),
(57, 'FACTURA', '100.00', '2019-08-06', 1, 3, '27.79', '18:58:58'),
(58, 'FACTURA', '100.00', '2019-08-06', 1, 3, '27.79', '19:00:35'),
(59, 'FACTURA', '100.00', '2019-08-06', 1, 3, '27.79', '19:02:07'),
(60, 'FACTURA', '100.00', '2019-08-06', 1, 4, '41.29', '19:05:06'),
(61, 'FACTURA', '100.00', '2019-08-06', 1, 3, '27.79', '19:10:33'),
(62, 'FACTURA', '100.00', '2019-08-06', 1, 7, '28.99', '19:12:11'),
(63, 'FACTURA', '100.00', '2019-08-06', 1, 4, '54.00', '19:13:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_articulo`
--

CREATE TABLE `venta_articulo` (
  `idVentaPorArticulo` int(11) NOT NULL,
  `idVenta` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `PrecioArticulo` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `venta_articulo`
--

INSERT INTO `venta_articulo` (`idVentaPorArticulo`, `idVenta`, `idProducto`, `Cantidad`, `PrecioArticulo`) VALUES
(6, 47, 44, 1, '13.50'),
(7, 47, 45, 1, '13.99'),
(8, 47, 46, 1, '0.30'),
(9, 48, 44, 1, '13.50'),
(10, 48, 46, 1, '0.30'),
(11, 49, 44, 1, '13.50'),
(12, 49, 45, 1, '13.99'),
(13, 50, 44, 1, '13.50'),
(14, 50, 45, 1, '13.99'),
(15, 51, 44, 1, '13.50'),
(16, 51, 45, 1, '13.99'),
(17, 52, 44, 1, '13.50'),
(18, 52, 45, 1, '13.99'),
(19, 53, 44, 1, '13.50'),
(20, 54, 44, 1, '13.50'),
(21, 55, 44, 1, '13.50'),
(22, 55, 45, 1, '13.99'),
(23, 56, 44, 1, '13.50'),
(24, 56, 46, 1, '0.30'),
(25, 56, 45, 1, '13.99'),
(26, 57, 44, 1, '13.50'),
(27, 57, 45, 1, '13.99'),
(28, 57, 46, 1, '0.30'),
(29, 58, 44, 1, '13.50'),
(30, 58, 45, 1, '13.99'),
(31, 58, 46, 1, '0.30'),
(32, 59, 44, 1, '13.50'),
(33, 59, 46, 1, '0.30'),
(34, 59, 45, 1, '13.99'),
(35, 60, 44, 2, '13.50'),
(36, 60, 45, 1, '13.99'),
(37, 60, 46, 1, '0.30'),
(38, 61, 44, 1, '13.50'),
(39, 61, 45, 1, '13.99'),
(40, 61, 46, 1, '0.30'),
(41, 62, 44, 1, '13.50'),
(42, 62, 45, 1, '13.99'),
(43, 62, 46, 5, '0.30'),
(44, 63, 44, 1, '13.50'),
(45, 63, 44, 1, '13.50'),
(46, 63, 44, 1, '13.50'),
(47, 63, 44, 1, '13.50');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `compra_producto`
--
ALTER TABLE `compra_producto`
  ADD PRIMARY KEY (`idCompra`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idVenta` (`idVenta`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idTipoProducto` (`idTipoProducto`),
  ADD KEY `producto_ibfk_2` (`idProveedor`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `tipoproducto`
--
ALTER TABLE `tipoproducto`
  ADD PRIMARY KEY (`idTipo`);

--
-- Indices de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD PRIMARY KEY (`idVendedor`);

--
-- Indices de la tabla `ventatotal`
--
ALTER TABLE `ventatotal`
  ADD PRIMARY KEY (`idVenta`),
  ADD KEY `idVendedor` (`idVendedor`);

--
-- Indices de la tabla `venta_articulo`
--
ALTER TABLE `venta_articulo`
  ADD PRIMARY KEY (`idVentaPorArticulo`),
  ADD KEY `idProducto` (`idProducto`),
  ADD KEY `idVenta` (`idVenta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compra_producto`
--
ALTER TABLE `compra_producto`
  MODIFY `idCompra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipoproducto`
--
ALTER TABLE `tipoproducto`
  MODIFY `idTipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `vendedor`
--
ALTER TABLE `vendedor`
  MODIFY `idVendedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ventatotal`
--
ALTER TABLE `ventatotal`
  MODIFY `idVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `venta_articulo`
--
ALTER TABLE `venta_articulo`
  MODIFY `idVentaPorArticulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`idVenta`) REFERENCES `ventatotal` (`idVenta`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idTipoProducto`) REFERENCES `tipoproducto` (`idTipo`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventatotal`
--
ALTER TABLE `ventatotal`
  ADD CONSTRAINT `ventatotal_ibfk_1` FOREIGN KEY (`idVendedor`) REFERENCES `vendedor` (`idVendedor`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `venta_articulo`
--
ALTER TABLE `venta_articulo`
  ADD CONSTRAINT `venta_articulo_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `venta_articulo_ibfk_2` FOREIGN KEY (`idVenta`) REFERENCES `ventatotal` (`idVenta`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
