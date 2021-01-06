-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2021 at 11:09 PM
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
  `Fecha_ingreso` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Fecha_egreso` datetime DEFAULT NULL,
  `Cantidad` int(255) DEFAULT NULL,
  `Id_producto` int(11) UNSIGNED NOT NULL,
  `Id_factura` int(11) UNSIGNED NOT NULL,
  `Id_usuario` int(11) UNSIGNED NOT NULL,
  `Costo` text DEFAULT NULL,
  `Pvp` text DEFAULT NULL,
  `Total_costo` text DEFAULT NULL,
  `Total_pvp` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `almacen`
--

INSERT INTO `almacen` (`Id`, `Fecha_ingreso`, `Fecha_egreso`, `Cantidad`, `Id_producto`, `Id_factura`, `Id_usuario`, `Costo`, `Pvp`, `Total_costo`, `Total_pvp`) VALUES
(1, '2021-01-05 23:03:06', NULL, 23, 1, 1, 1, '45', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `factura`
--

CREATE TABLE `factura` (
  `Id` int(11) UNSIGNED NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Id_usuario` int(11) UNSIGNED NOT NULL,
  `Id_producto` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `factura`
--

INSERT INTO `factura` (`Id`, `Fecha`, `Id_usuario`, `Id_producto`) VALUES
(1, '2021-01-05 23:01:42', 1, 1);

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
(1, 'gel', 'hkjh', 'hkjh', 1212121212, 'jkhkjhql', 1);

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
(1, 'eter', 'etr', 'etretretr', 'etretre', 'tretretr', 'etretret', 'e2fd96472cca0ffe0e63de1b3f9ba6', 'tretretre', 'rtetrert', 'rtertetre', 'eretreret'),
(2, 'gabi', 'jlkj', 'lkj', 'lk', 'jl', 'kj', '48e2e79fec9bc01d9a00e0a8fa68b2', 'l', 'kjl', 'kj', 'lkj');

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
-- Indexes for table `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_usuario` (`Id_usuario`),
  ADD KEY `Id_producto` (`Id_producto`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `almacen`
--
ALTER TABLE `almacen`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `Id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `almacen`
--
ALTER TABLE `almacen`
  ADD CONSTRAINT `almacen_factura` FOREIGN KEY (`Id_factura`) REFERENCES `factura` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `almacen_producto` FOREIGN KEY (`Id_producto`) REFERENCES `productos` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `almacen_usuario` FOREIGN KEY (`Id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_producto` FOREIGN KEY (`Id_producto`) REFERENCES `productos` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `factura_usuario` FOREIGN KEY (`Id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `producto_usuario` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
