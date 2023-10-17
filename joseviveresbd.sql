-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-10-2023 a las 01:05:55
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `joseviveresbd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abonos`
--

CREATE TABLE `abonos` (
  `id` int(11) NOT NULL,
  `concepto` varchar(255) DEFAULT NULL,
  `valor` decimal(11,2) NOT NULL,
  `id_metodo_pago` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `abonos`
--

INSERT INTO `abonos` (`id`, `concepto`, `valor`, `id_metodo_pago`, `fecha`) VALUES
(8, 'abono ', 25.00, 1, '2023-03-16'),
(9, 'abono ', 25.00, 1, '2023-03-16'),
(10, 'abono 1', 20.00, 3, '2023-03-16'),
(11, 'abono 2', 3.00, 1, '2023-03-16'),
(12, 'abono 3', 30.00, 1, '2023-03-16'),
(13, 'abono 3', 30.00, 1, '2023-03-16'),
(14, 'abono ', 5.00, 1, '2023-03-16'),
(15, 'abono ', 5.00, 1, '2023-03-16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abono_movimiento`
--

CREATE TABLE `abono_movimiento` (
  `id` int(11) NOT NULL,
  `id_movimiento` int(11) NOT NULL,
  `id_abono` int(11) NOT NULL,
  `monto` decimal(11,2) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `abono_movimiento`
--

INSERT INTO `abono_movimiento` (`id`, `id_movimiento`, `id_abono`, `monto`, `estado`) VALUES
(2, 197, 8, 25.00, 1),
(3, 197, 9, 25.00, 1),
(4, 198, 10, 20.00, 1),
(5, 199, 11, 3.00, 1),
(6, 199, 12, 30.00, 1),
(7, 199, 13, 63.00, 1),
(8, 200, 14, 5.00, 1),
(9, 200, 15, 5.00, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `accion` text NOT NULL,
  `modulo` varchar(100) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `bitacora`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_producto`
--

CREATE TABLE `cat_producto` (
  `id` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `estado` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `cat_producto`
--

INSERT INTO `cat_producto` (`id`, `categoria`, `estado`) VALUES
(32, 'Verduras', '1'),
(33, 'Viveres', '1'),
(34, 'Carnes', '1'),
(40, 'limpieza', '1'),
(41, 'ASEO PERSONAL', '1'),
(42, 'CHARCUTERIA', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `nro_doc` int(11) NOT NULL,
  `tipo_doc` varchar(25) NOT NULL,
  `telefono` varchar(11) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `nro_doc`, `tipo_doc`, `telefono`, `estado`) VALUES
(1, 'daniela antonia', 27629581, 'CI', '04147483641', 1),
(2, 'Arianna Colmenarez', 566488978, 'CI', '04147483642', 1),
(3, 'fernando miranda', 10776355, 'CI', '04265515445', 1),
(4, 'maria jose', 75558994, 'CI', '02456651415', 1),
(5, 'jose manuel', 10226548, 'CI', '56445645655', 1),
(6, 'mauricio gamba', 96180031, 'CI', '02415488755', 1),
(7, 'paola jose', 96180044, 'CI', '04147483647', 1),
(8, 'jose becerra', 27695845, 'CI', '20221664411', 1),
(10, 'paola colmenarez', 27629584, 'CI', '04147483642', 1),
(11, 'arianna paola', 27629586, 'CI', '04147483621', 1),
(14, 'Daniela VELIZ', 96180012, 'CI', '04147483611', 1),
(15, 'paola altagracia', 9618456, 'CI', '04147483456', 1),
(17, 'arianna paola', 27629574, 'CI', '04147483609', 1),
(18, 'jinfer miranda', 96180070, 'CI', '04147483647', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concepto_movimiento`
--

CREATE TABLE `concepto_movimiento` (
  `id` int(11) NOT NULL,
  `categoria` varchar(255) NOT NULL,
  `estado` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `concepto_movimiento`
--

INSERT INTO `concepto_movimiento` (`id`, `categoria`, `estado`) VALUES
(1, 'VENTA', '1'),
(2, 'SERVICIOS PÚBLICOS', '1'),
(3, 'COMPRA DE PRODUCTOS E INSUMOS', '1'),
(4, 'ARRIENDO', '1'),
(5, 'NÓMINA', '1'),
(6, 'GASTOS ADMINISTRATIVOS', '1'),
(7, 'MERCADEO Y PUBLICIDAD', '1'),
(8, 'TRANSPORTES, DOMICILIOS, LOGISTICA', '1'),
(9, 'MANTENIMIENTO Y REPARACIONES', '1'),
(10, 'MUEBLES, EQUIPOS Y MAQUINARÍA', '1'),
(11, 'OTROS', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_movimientos`
--

CREATE TABLE `detalles_movimientos` (
  `id` int(11) NOT NULL,
  `precio` decimal(11,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `estado` varchar(25) NOT NULL,
  `id_movimientos` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `detalles_movimientos`
--

INSERT INTO `detalles_movimientos` (`id`, `precio`, `cantidad`, `estado`, `id_movimientos`, `id_producto`) VALUES
(130, 25.00, 1, '1', 196, 36),
(132, 25.00, 1, '1', 197, 36),
(133, 25.00, 1, '1', 199, 36),
(135, 25.00, 1, '1', 200, 36),
(137, 25.00, 2, '1', 202, 36);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso_detalles`
--

CREATE TABLE `ingreso_detalles` (
  `id` int(11) NOT NULL,
  `precio_venta` float(11,2) NOT NULL,
  `precio_costo` float(11,2) NOT NULL,
  `cantidad` float(11,2) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `id_ingreso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingreso_detalles`
--

INSERT INTO `ingreso_detalles` (`id`, `precio_venta`, `precio_costo`, `cantidad`, `id_producto`, `estado`, `id_ingreso`) VALUES
(17, 25.00, 20.00, 14.00, 36, 2, 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso_productos`
--

CREATE TABLE `ingreso_productos` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `nro_factura` varchar(20) NOT NULL,
  `fecha_factura` date NOT NULL,
  `estado_factura` varchar(25) NOT NULL,
  `total_factura` float(11,2) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `id_metodo_pago` int(11) DEFAULT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingreso_productos`
--

INSERT INTO `ingreso_productos` (`id`, `fecha`, `nro_factura`, `fecha_factura`, `estado_factura`, `total_factura`, `id_proveedor`, `id_metodo_pago`, `estado`) VALUES
(18, '2023-03-16', '00001', '2023-03-16', 'PAGADA', 784.00, 1, 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca_producto`
--

CREATE TABLE `marca_producto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marca_producto`
--

INSERT INTO `marca_producto` (`id`, `nombre`, `estado`) VALUES
(1, 'JUANA', 1),
(6, 'PAN POLAR', 1),
(7, 'MAZEITE', 1),
(8, 'DOÑA EMILIA', 1),
(9, 'YUQUERY', 1),
(10, 'MONTALBAN', 1),
(11, 'MAVESA', 1),
(12, 'ALIVE', 1),
(13, 'MINALBA', 1),
(14, 'EBENECER', 1),
(15, 'VATEL', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `metodo_pago`
--

INSERT INTO `metodo_pago` (`id`, `nombre`) VALUES
(1, 'EFECTIVO'),
(2, 'TARJETA'),
(3, 'TRANSFERENCIA'),
(4, 'DOLARES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `total` decimal(11,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `estado_movimiento` varchar(50) NOT NULL,
  `estado` varchar(25) NOT NULL,
  `id_concepto_movimiento` int(11) NOT NULL,
  `id_metodo_pago` int(11) DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`id`, `nombre`, `total`, `fecha`, `hora`, `estado_movimiento`, `estado`, `id_concepto_movimiento`, `id_metodo_pago`, `id_proveedor`, `id_cliente`, `id_usuario`) VALUES
(195, 'compra de productos', 784.00, '2023-03-16', '13:16:00', 'PAGADA', '1', 3, 4, 1, NULL, 1),
(196, '', 25.00, '2023-03-16', '13:22:00', 'PAGADA', '1', 1, 1, NULL, NULL, 1),
(197, '', 63.00, '2023-03-16', '13:23:00', 'A CREDITO', '0', 1, 1, NULL, 17, 1),
(198, 'compra aceite', 320.00, '2023-03-16', '13:23:00', 'A CREDITO', '1', 3, 2, 1, NULL, 1),
(199, '', 63.00, '2023-03-16', '14:19:00', 'PAGADO', '1', 1, 1, NULL, 2, 1),
(200, '', 25.00, '2023-03-16', '14:27:00', 'A CREDITO', '1', 1, 1, NULL, 2, 1),
(201, '', 38.00, '2023-09-14', '15:16:00', 'PAGADA', '1', 1, 1, NULL, NULL, 3),
(202, '', 50.00, '2023-09-14', '15:17:00', 'PAGADA', '1', 1, 1, NULL, NULL, 3),
(203, 'mesa planchar', 20.00, '2023-10-14', '20:22:00', 'PAGADA', '1', 3, 1, NULL, NULL, 3),
(204, 'mesa planchar', 20.00, '2023-10-14', '20:27:00', 'PAGADA', '1', 4, 2, 1, NULL, 3),
(205, 'mesa planchar', 20.00, '2023-10-14', '20:28:00', 'PAGADA', '1', 4, 2, NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones`
--

CREATE TABLE `notificaciones` (
  `id` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `mensaje` varchar(250) NOT NULL,
  `estado` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `notificaciones`
--

INSERT INTO `notificaciones` (`id`, `titulo`, `mensaje`, `estado`, `created_at`) VALUES
(18, 'daniela tiene una dueda atrasada', 'la deuda es del 2022-10-21 por 9.20 bs', 0, '2022-10-21 19:03:41'),
(19, 'ARIANNA tiene una dueda atrasada', 'la deuda es del 2022-10-01 por 5.00 bs', 0, '2022-10-21 19:03:42'),
(20, 'ARIANNA tiene una dueda atrasada', 'la deuda es del 2022-10-01 por 5.00 bs', 0, '2022-10-21 19:03:42'),
(21, 'ARIANNA tiene una dueda atrasada', 'la deuda es del 2022-10-13 por 5.00 bs', 0, '2022-10-21 19:03:43'),
(22, 'daniela tiene una dueda atrasada', 'la deuda es del 2022-10-21 por 9.20 bs', 0, '2022-10-21 19:03:36'),
(23, ' Tienes una dueda atrasada conARIANNA', 'la deuda es del 2022-10-01 por 5.00 bs', 0, '2022-10-21 19:03:39'),
(24, ' Tienes una dueda atrasada conARIANNA', 'la deuda es del 2022-10-01 por 5.00 bs', 0, '2022-10-21 19:03:40'),
(25, ' Tienes una dueda atrasada conARIANNA', 'la deuda es del 2022-10-13 por 5.00 bs', 0, '2022-10-21 19:03:41'),
(26, ' Tienes una dueda atrasada con ARIANNA', 'la deuda es del 2023-03-16 por 320.00 bs', 1, '2023-03-16 18:45:15'),
(27, 'Arianna Colmenarez tiene una dueda atrasada', 'la deuda es del 2023-03-16 por 25.00 bs', 1, '2023-03-16 18:45:15'),
(28, ' Tienes una dueda atrasada con ARIANNA', 'la deuda es del 2023-03-16 por 320.00 bs', 1, '2023-03-16 18:46:23'),
(29, 'Arianna Colmenarez tiene una dueda atrasada', 'la deuda es del 2023-03-16 por 25.00 bs', 1, '2023-03-16 18:46:23'),
(30, ' Tienes un producto que se esta agotando', 'ACEITE MAZEITEMAZEITE Este producto se esta agotando tienes solo 4.00 en stock', 1, '2023-03-16 18:46:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `estado` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `nombre`, `estado`) VALUES
(1, 'Consultar Ventas', '1'),
(2, 'Modificar Balance', '1'),
(3, 'Crear Ventas', '1'),
(4, 'Anular Ventas', '1'),
(5, 'Consultar Inventario', '1'),
(6, 'Modificar Inventario', ''),
(7, 'Crear Inventario', '1'),
(8, 'Eliminar Inventario', '1'),
(9, 'Consultar Deudas', '1'),
(10, 'Abonar Deudas', '1'),
(12, 'Eliminar Deudas', '1'),
(13, 'Consultar Proveedores', '1'),
(14, 'Modificar Proveedores', '1'),
(15, 'Crear Proveedores', '1'),
(16, 'Eliminar Proveedores', '1'),
(17, 'Consultar Clientes', '1'),
(18, 'Modificar Clientes', '1'),
(19, 'Crear Clientes', '1'),
(20, 'Eliminar Clientes', '1'),
(21, 'Consultar Usuarios', '1'),
(22, 'Modificar Usuarios', '1'),
(23, 'Crear Usuarios', ''),
(24, 'Eliminar Usuarios', '1'),
(25, 'Estadisticas Ventas', '1'),
(26, 'Consultar Reportes Balance', '1'),
(27, 'Consultar Reportes Inventario', '1'),
(28, 'Consultar Reportes Deudas', '1'),
(29, 'Crear Respaldo Base Datos', '1'),
(30, 'Modificar Base Datos', '1'),
(31, 'Consultar Roles', '1'),
(32, 'Modificar Roles', '1'),
(33, 'Crear Roles', '1'),
(34, 'Eliminar Roles', '1'),
(35, 'Crear Permisos', '1'),
(36, 'Consultar Reportes Bitacora', '1'),
(37, 'Consultar Gastos', '1'),
(38, 'Registrar Gastos', '1'),
(39, 'Eliminar Gastos', '1'),
(40, 'Consultar Ingresos', '1'),
(41, 'Crear Ingresos', '1'),
(42, 'Anular Ingresos', '1'),
(43, 'Consultar Productos', '1'),
(44, 'Crear Productos', '1'),
(45, 'Modificar Productos', '1'),
(46, 'Eliminar Productos', '1'),
(47, 'Consultar Categorias', '1'),
(48, 'Modificar Categorias', '1'),
(49, 'Eliminar Categorias', '1'),
(50, 'Crear Categorias', '1'),
(51, 'Consultar Presentaciones', '1'),
(52, 'Modificar Presentaciones', '1'),
(53, 'Crear Presentaciones', '1'),
(54, 'Eliminar Presentaciones', '1'),
(55, 'Consultar Marcas', '1'),
(56, 'Modificar Marcas', '1'),
(57, 'Crear Marcas', '1'),
(58, 'Eliminar Marcas', '1'),
(59, 'Estadisticas Gastos', '1'),
(60, 'Estadisticas Vendidos', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta_de_seguridad`
--

CREATE TABLE `pregunta_de_seguridad` (
  `id_pregunta` int(11) NOT NULL,
  `pregunta` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `pregunta_de_seguridad`
--

INSERT INTO `pregunta_de_seguridad` (`id_pregunta`, `pregunta`) VALUES
(1, '¿Cuál es el nombre de tu primera mascota?'),
(2, '¿Cuál es el nombre de tu abuela materna?'),
(3, '¿En qué ciudad naciste?'),
(4, '¿Cuál es tu canción favorita?'),
(5, '¿Cuál es el nombre de tu libro favorito?'),
(6, '¿Cuál es tu comida favorita?'),
(7, '¿Cuál es el nombre de tu película favorita?'),
(8, '¿Cuál es tu equipo deportivo favorito?'),
(9, '¿Cuál es el apellido de soltera de tu madre?'),
(10, '¿Cuál es el nombre de tu primer amigo de la infancia?'),
(11, '¿En qué ciudad conociste a tu cónyuge o pareja actual?'),
(12, '¿Cuál es tu destino de vacaciones soñado?'),
(13, '¿Cuál es tu número de teléfono de la infancia?');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentacion_producto`
--

CREATE TABLE `presentacion_producto` (
  `id` int(11) NOT NULL,
  `volumen` int(11) NOT NULL,
  `unidad_medida` varchar(20) NOT NULL,
  `unidades` int(11) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `presentacion_producto`
--

INSERT INTO `presentacion_producto` (`id`, `volumen`, `unidad_medida`, `unidades`, `estado`) VALUES
(1, 2, 'KG', 1, 1),
(3, 500, 'ML', 1, 1),
(5, 1, 'UNIDAD', 30, 1),
(6, 250, 'ML', 1, 1),
(9, 100, 'metros', 1, 1),
(10, 1, 'L', 1, 1),
(11, 1, 'L', 12, 1),
(12, 1, 'G', 1, 1),
(13, 20, 'L', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `url_img` varchar(255) DEFAULT NULL,
  `estado` varchar(25) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_marca` int(11) DEFAULT NULL,
  `id_presentacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `url_img`, `estado`, `id_categoria`, `id_marca`, `id_presentacion`) VALUES
(36, 'HARINA PAN', '', 'assets/images/productos/100343473.jpg', '0', 33, 6, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `nro_doc` int(11) NOT NULL,
  `tipo_doc` varchar(25) NOT NULL,
  `contacto` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `nombre`, `nro_doc`, `tipo_doc`, `contacto`, `direccion`, `estado`) VALUES
(1, 'ARIANNA', 27629581, 'CI', '04267346011', '', 1),
(3, 'ANGELs', 27629588, 'CI', '0245211254', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recuperacion`
--

CREATE TABLE `recuperacion` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fechaHora` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `recuperacion`
--

INSERT INTO `recuperacion` (`id`, `id_usuario`, `fechaHora`, `estado`) VALUES
(1, 3, '2023-08-21 16:23:02', 1),
(2, 3, '2023-08-21 17:33:04', 1),
(3, 21, '2023-08-23 09:25:52', 1),
(4, 3, '2023-08-21 17:57:28', 1),
(5, 3, '2023-08-21 17:59:14', 1),
(6, 3, '2023-08-22 08:03:27', 1),
(7, 3, '2023-08-22 08:05:24', 1),
(8, 3, '2023-08-22 08:06:15', 1),
(9, 3, '2023-08-22 08:07:01', 1),
(10, 3, '2023-08-22 08:08:23', 1),
(11, 3, '2023-08-22 08:29:03', 1),
(12, 21, '2023-08-23 09:25:58', 1),
(13, 3, '2023-08-22 10:10:39', 1),
(14, 3, '2023-08-22 10:31:12', 1),
(15, 3, '2023-08-22 10:39:27', 1),
(16, 3, '2023-08-22 11:25:44', 1),
(17, 3, '2023-08-23 08:49:09', 1),
(18, 3, '2023-08-23 10:15:40', 1),
(19, 3, '2023-08-23 11:21:26', 1),
(20, 3, '2023-08-23 11:36:31', 1),
(21, 3, '2023-09-04 08:12:44', 1),
(22, 3, '2023-09-04 08:31:32', 1),
(23, 3, '2023-09-04 08:35:42', 1),
(24, 3, '2023-09-04 09:14:52', 1),
(25, 3, '2023-09-04 09:15:08', 1),
(26, 3, '2023-09-04 09:15:21', 1),
(27, 3, '2023-09-04 09:18:18', 1),
(28, 3, '2023-09-04 09:20:05', 1),
(29, 3, '2023-09-05 08:06:50', 1),
(30, 3, '2023-09-05 08:12:01', 1),
(31, 3, '2023-09-05 08:13:44', 1),
(32, 3, '2023-09-05 08:14:54', 1),
(33, 3, '2023-09-05 08:20:54', 1),
(34, 3, '2023-09-05 08:23:29', 1),
(35, 3, '2023-09-05 08:24:25', 1),
(36, 3, '2023-09-05 08:29:09', 1),
(37, 3, '2023-09-05 08:29:50', 1),
(38, 3, '2023-09-05 08:30:47', 1),
(39, 3, '2023-09-05 08:31:55', 1),
(40, 3, '2023-09-05 08:39:20', 1),
(41, 3, '2023-09-05 08:40:05', 1),
(42, 3, '2023-09-05 08:44:39', 1),
(43, 3, '2023-09-05 08:49:08', 1),
(44, 3, '2023-09-05 08:53:09', 1),
(45, 3, '2023-09-05 08:54:32', 1),
(46, 3, '2023-09-05 09:09:02', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `id_respuesta` int(11) NOT NULL,
  `respuesta` varchar(255) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_pregunta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `respuesta`
--

INSERT INTO `respuesta` (`id_respuesta`, `respuesta`, `id_usuario`, `id_pregunta`) VALUES
(60, 'tobby', 37, 1),
(61, 'barquisimeto', 37, 3),
(62, 'madrid', 37, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `estado` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`, `descripcion`, `estado`) VALUES
(1, 'ENCARGADO', 'Se encarga de manejar el sistema', '1'),
(3, 'superusuario', 'tiene todos los permisos', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_permiso`
--

CREATE TABLE `rol_permiso` (
  `id` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `rol_permiso`
--

INSERT INTO `rol_permiso` (`id`, `id_rol`, `id_permiso`) VALUES
(342, 3, 21),
(343, 3, 22),
(344, 3, 23),
(345, 3, 24),
(346, 3, 5),
(347, 3, 1),
(348, 3, 3),
(349, 3, 4),
(350, 3, 37),
(351, 3, 38),
(352, 3, 39),
(353, 3, 40),
(354, 3, 41),
(355, 3, 42),
(356, 3, 43),
(357, 3, 45),
(358, 3, 44),
(359, 3, 46),
(360, 3, 47),
(361, 3, 48),
(362, 3, 50),
(363, 3, 49),
(364, 3, 51),
(365, 3, 52),
(366, 3, 53),
(367, 3, 54),
(368, 3, 55),
(369, 3, 56),
(370, 3, 57),
(371, 3, 58),
(372, 3, 9),
(373, 3, 10),
(374, 3, 12),
(375, 3, 17),
(376, 3, 18),
(377, 3, 19),
(378, 3, 20),
(379, 3, 13),
(380, 3, 14),
(381, 3, 15),
(382, 3, 16),
(383, 3, 25),
(384, 3, 59),
(385, 3, 60),
(386, 3, 27),
(387, 3, 26),
(388, 3, 28),
(389, 3, 36),
(390, 3, 29),
(391, 3, 30),
(392, 3, 31),
(393, 3, 32),
(394, 3, 33),
(395, 3, 34),
(396, 3, 35),
(400, 1, 5),
(401, 1, 1),
(402, 1, 3),
(403, 1, 4),
(404, 1, 37),
(405, 1, 38),
(406, 1, 39),
(407, 1, 40),
(408, 1, 41),
(409, 1, 42),
(410, 1, 43),
(411, 1, 45),
(412, 1, 44),
(413, 1, 46),
(414, 1, 47),
(415, 1, 48),
(416, 1, 50),
(417, 1, 49),
(418, 1, 51),
(419, 1, 52),
(420, 1, 53),
(421, 1, 54),
(422, 1, 55),
(423, 1, 56),
(424, 1, 57),
(425, 1, 58),
(426, 1, 9),
(427, 1, 10),
(428, 1, 12),
(429, 1, 17),
(430, 1, 18),
(431, 1, 19),
(432, 1, 20),
(433, 1, 13),
(434, 1, 14),
(435, 1, 15),
(436, 1, 16),
(437, 1, 25),
(438, 1, 59),
(439, 1, 60),
(440, 1, 27),
(441, 1, 26),
(442, 1, 28),
(443, 1, 36);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `clave` varchar(250) NOT NULL,
  `estado` varchar(25) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `intentos` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `clave`, `estado`, `id_rol`, `intentos`) VALUES
(1, 'SUPERUSUARIO', 'ezcolmenarjose@gmail.com', '$2y$10$acmq4Z7/iyRbwr4j/ERouO9UdyMNYZxnbowh7msl8ED1CzR7.uVga', '1', 3 , 0),
(3, 'ARIANNA', 'aripaocol@gmail.com', '$2y$10$k6snS9cJyNxTFwz9eRFJEejkaVgnMOYYtgKnkGJAvnEUgVlth4Eva', '1', 3 , 0),
(21, 'PAOLA25', 'ARICOL25@GMAIL.COM', '$2y$10$TTAgPYYbrQ.lTPS85i5H7O5YeX2v2CDYK1WktIYiLwq/J46qHNIdC', '1', 1 , 0),
(22, 'PAOLA02', 'colmenarjose2512@gmail.com', '$2y$10$QHFOc92ns7JqDgtZk3OYTO1/441VHhgtdAIn02b1OLZ0Wx5z5eLlS', '1', 3 , 0),
(37, 'ALEJANDRO', 'ale@gmail.com', '$2y$10$EKHbvsf6Yo.qS.mDDlKQjOZ/zcS5DMhxUsaMuLqFFXZeLTFBGmzUC', '1', 3 , 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `abonos`
--
ALTER TABLE `abonos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_metodo_pago` (`id_metodo_pago`);

--
-- Indices de la tabla `abono_movimiento`
--
ALTER TABLE `abono_movimiento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_movimiento` (`id_movimiento`),
  ADD KEY `id_abono` (`id_abono`);

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `cat_producto`
--
ALTER TABLE `cat_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `concepto_movimiento`
--
ALTER TABLE `concepto_movimiento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalles_movimientos`
--
ALTER TABLE `detalles_movimientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_movimientos` (`id_movimientos`) USING BTREE;

--
-- Indices de la tabla `ingreso_detalles`
--
ALTER TABLE `ingreso_detalles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_ingreso` (`id_ingreso`);

--
-- Indices de la tabla `ingreso_productos`
--
ALTER TABLE `ingreso_productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_proveedor` (`id_proveedor`),
  ADD KEY `id_metodo_pago` (`id_metodo_pago`);

--
-- Indices de la tabla `marca_producto`
--
ALTER TABLE `marca_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_metodo_pago` (`id_metodo_pago`),
  ADD KEY `id_persona` (`id_proveedor`),
  ADD KEY `id_concepto_movimiento` (`id_concepto_movimiento`) USING BTREE,
  ADD KEY `id_proveedor` (`id_proveedor`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pregunta_de_seguridad`
--
ALTER TABLE `pregunta_de_seguridad`
  ADD PRIMARY KEY (`id_pregunta`);

--
-- Indices de la tabla `presentacion_producto`
--
ALTER TABLE `presentacion_producto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_marca` (`id_marca`),
  ADD KEY `id_presentacion` (`id_presentacion`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `recuperacion`
--
ALTER TABLE `recuperacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD PRIMARY KEY (`id_respuesta`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_pregunta` (`id_pregunta`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rol_permiso`
--
ALTER TABLE `rol_permiso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `id_permiso` (`id_permiso`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `abonos`
--
ALTER TABLE `abonos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `abono_movimiento`
--
ALTER TABLE `abono_movimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=641;

--
-- AUTO_INCREMENT de la tabla `cat_producto`
--
ALTER TABLE `cat_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `concepto_movimiento`
--
ALTER TABLE `concepto_movimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `detalles_movimientos`
--
ALTER TABLE `detalles_movimientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT de la tabla `ingreso_detalles`
--
ALTER TABLE `ingreso_detalles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `ingreso_productos`
--
ALTER TABLE `ingreso_productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `marca_producto`
--
ALTER TABLE `marca_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT de la tabla `notificaciones`
--
ALTER TABLE `notificaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `pregunta_de_seguridad`
--
ALTER TABLE `pregunta_de_seguridad`
  MODIFY `id_pregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `presentacion_producto`
--
ALTER TABLE `presentacion_producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `recuperacion`
--
ALTER TABLE `recuperacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  MODIFY `id_respuesta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `rol_permiso`
--
ALTER TABLE `rol_permiso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=444;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `abonos`
--
ALTER TABLE `abonos`
  ADD CONSTRAINT `abonos_ibfk_2` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `abono_movimiento`
--
ALTER TABLE `abono_movimiento`
  ADD CONSTRAINT `abono_movimiento_ibfk_1` FOREIGN KEY (`id_movimiento`) REFERENCES `movimientos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `abono_movimiento_ibfk_2` FOREIGN KEY (`id_abono`) REFERENCES `abonos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalles_movimientos`
--
ALTER TABLE `detalles_movimientos`
  ADD CONSTRAINT `detalles_movimientos_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalles_movimientos_ibfk_2` FOREIGN KEY (`id_movimientos`) REFERENCES `movimientos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ingreso_detalles`
--
ALTER TABLE `ingreso_detalles`
  ADD CONSTRAINT `ingreso_detalles_ibfk_1` FOREIGN KEY (`id_ingreso`) REFERENCES `ingreso_productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ingreso_detalles_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ingreso_productos`
--
ALTER TABLE `ingreso_productos`
  ADD CONSTRAINT `ingreso_productos_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ingreso_productos_ibfk_2` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`id_concepto_movimiento`) REFERENCES `concepto_movimiento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_ibfk_2` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodo_pago` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_ibfk_3` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_ibfk_4` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientos_ibfk_5` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `cat_producto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`id_presentacion`) REFERENCES `presentacion_producto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_ibfk_3` FOREIGN KEY (`id_marca`) REFERENCES `marca_producto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `recuperacion`
--
ALTER TABLE `recuperacion`
  ADD CONSTRAINT `recuperacion_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD CONSTRAINT `respuesta_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `respuesta_ibfk_2` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta_de_seguridad` (`id_pregunta`);

--
-- Filtros para la tabla `rol_permiso`
--
ALTER TABLE `rol_permiso`
  ADD CONSTRAINT `rol_permiso_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rol_permiso_ibfk_2` FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
