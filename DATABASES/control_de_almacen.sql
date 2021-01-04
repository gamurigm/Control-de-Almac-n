-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2021 at 03:35 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `control_de_almacen`
--

-- --------------------------------------------------------

--
-- Table structure for table `almacen`
--

CREATE TABLE `almacen` (
  `Id` int(11) NOT NULL,
  `Fecha_ingreso` datetime DEFAULT NULL,
  `Fecha_egreso` datetime DEFAULT NULL,
  `Cantidad` int(255) DEFAULT NULL,
  `Id_producto` int(11) NOT NULL,
  `Id_factura` int(11) NOT NULL,
  `Id_usuario` int(11) NOT NULL,
  `Costo` double DEFAULT NULL,
  `Pvp` double DEFAULT NULL,
  `Total_costo` double DEFAULT NULL,
  `Total_pvp` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `almacen_productos`
--

CREATE TABLE `almacen_productos` (
  `Id_almacen` int(11) NOT NULL,
  `Id_producto` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `Id` int(11) UNSIGNED NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Marca` varchar(30) NOT NULL,
  `Modelo` varchar(30) NOT NULL,
  `SKU` bigint(100) NOT NULL,
  `Descripción` text NOT NULL,
  `Id_Usuario` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`Id`, `Nombre`, `Marca`, `Modelo`, `SKU`, `Descripción`, `Id_Usuario`) VALUES
(1, 'ghjkH', 'ghjk', '4ghj', 3456, 'vbhjmklkjhgfghjkl', 0),
(2, 'vbnm', 'ghjkl', 'ghjkl', 34568, 'fghjkl', 0),
(3, 'tyu8i96t5', '456yh', 'fghj', 0, 'hjkl', 0),
(4, 'tyu8i96t5', '456yh', 'fghj', 0, 'hjkl', 0);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) UNSIGNED NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Apellido` varchar(30) NOT NULL,
  `CI` varchar(10) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Teléfono` varchar(10) NOT NULL,
  `Profesión` varchar(30) NOT NULL,
  `Contraseña` varchar(30) NOT NULL,
  `Usuario` varchar(30) NOT NULL,
  `Departamento` varchar(20) DEFAULT NULL,
  `Cargo` varchar(20) DEFAULT NULL,
  `Institución` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `Nombre`, `Apellido`, `CI`, `Email`, `Teléfono`, `Profesión`, `Contraseña`, `Usuario`, `Departamento`, `Cargo`, `Institución`) VALUES
(1, 'gaby', 'larrea', '123141', 'adsada', '1231', 'abogada', 'c57c121592a60f4689a1fc37ea31de', 'gabt', 'asdhkj', 'asdkh', 'udla'),
(2, 'hashdh', 'haksjdh', '123', 'adsakhdjk', '14324', 'dasjhd', '1c9a9de83b32966aa1fc276a26ab36', 'akdsh', 'daksjhd', 'asjdh', 'utpl'),
(3, 'ertgyh', 'ertyu', 'erty', 'rtyhu', 'rtyu', 'rty', '329b03ed80e7be5d47f4db28a06588', 'rtyu', 'rtyu', 'rtyui', 'rtyuio'),
(4, 'hjsjhs', '4568', 'jhfhj', '4567', '456yu', 'fhgfh', 'b2dec7ee96f5b477a5b434d2957882', 'hgfh', 'ghfhgf', 'ghfhgf', 'gfh');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios_productos`
--

CREATE TABLE `usuarios_productos` (
  `Id_usuario` int(10) UNSIGNED NOT NULL,
  `Id_producto` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `id_producto` (`Id_producto`),
  ADD KEY `id_factura` (`Id_factura`),
  ADD KEY `id_usuario` (`Id_usuario`);

--
-- Indexes for table `almacen_productos`
--
ALTER TABLE `almacen_productos`
  ADD PRIMARY KEY (`Id_almacen`),
  ADD KEY `foranea` (`Id_producto`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `id_usuario` (`Id_Usuario`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `CI` (`CI`),
  ADD UNIQUE KEY `email` (`Email`);

--
-- Indexes for table `usuarios_productos`
--
ALTER TABLE `usuarios_productos`
  ADD PRIMARY KEY (`Id_usuario`),
  ADD KEY `foranea` (`Id_producto`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `almacen`
--
ALTER TABLE `almacen`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `almacen_productos`
--
ALTER TABLE `almacen_productos`
  MODIFY `Id_almacen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `usuarios_productos`
--
ALTER TABLE `usuarios_productos`
  MODIFY `Id_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `almacen_productos`
--
ALTER TABLE `almacen_productos`
  ADD CONSTRAINT `almacen_productos_ibfk_1` FOREIGN KEY (`Id_almacen`) REFERENCES `almacen` (`Id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `almacen_productos_ibfk_2` FOREIGN KEY (`Id_producto`) REFERENCES `productos` (`Id`) ON UPDATE CASCADE;

--
-- Constraints for table `usuarios_productos`
--
ALTER TABLE `usuarios_productos`
  ADD CONSTRAINT `usuarios_productos_ibfk_2` FOREIGN KEY (`Id_producto`) REFERENCES `productos` (`Id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_productos_ibfk_3` FOREIGN KEY (`Id_usuario`) REFERENCES `usuarios` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
