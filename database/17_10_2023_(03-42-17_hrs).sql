SET FOREIGN_KEY_CHECKS=0;
SET @usuario_id=1;

SET CHARACTER SET utf8; 
TRUNCATE TABLE abono_movimiento;
INSERT INTO abono_movimiento VALUES("2","197","8","25.00","1");
INSERT INTO abono_movimiento VALUES("3","197","9","25.00","1");
INSERT INTO abono_movimiento VALUES("4","198","10","20.00","1");
INSERT INTO abono_movimiento VALUES("5","199","11","3.00","1");
INSERT INTO abono_movimiento VALUES("6","199","12","30.00","1");
INSERT INTO abono_movimiento VALUES("7","199","13","63.00","1");
INSERT INTO abono_movimiento VALUES("8","200","14","5.00","1");
INSERT INTO abono_movimiento VALUES("9","200","15","5.00","1");



TRUNCATE TABLE abonos;
INSERT INTO abonos VALUES("8","abono ","25.00","1","2023-03-16");
INSERT INTO abonos VALUES("9","abono ","25.00","1","2023-03-16");
INSERT INTO abonos VALUES("10","abono 1","20.00","3","2023-03-16");
INSERT INTO abonos VALUES("11","abono 2","3.00","1","2023-03-16");
INSERT INTO abonos VALUES("12","abono 3","30.00","1","2023-03-16");
INSERT INTO abonos VALUES("13","abono 3","30.00","1","2023-03-16");
INSERT INTO abonos VALUES("14","abono ","5.00","1","2023-03-16");
INSERT INTO abonos VALUES("15","abono ","5.00","1","2023-03-16");



TRUNCATE TABLE bitacora;
INSERT INTO bitacora VALUES("641","2023-10-16","Se registro un nuevo Usuario joses ","Usuarios","1");
INSERT INTO bitacora VALUES("644","2023-10-17","Se registro un nuevo Usuario prueba ","Usuarios","1");
INSERT INTO bitacora VALUES("645","2023-10-17","Se eliminó un Usuario con el id: 41 ","Usuarios","1");
INSERT INTO bitacora VALUES("646","2023-10-17","Se modificó un Usuario ALEJANDRO ","Usuarios","1");
INSERT INTO bitacora VALUES("647","2023-10-17","Se registro un nuevo Usuario sdgdfdfhd ","Usuarios","1");
INSERT INTO bitacora VALUES("648","2023-10-17","Se registro un nuevo Usuario joseee ","Usuarios","1");
INSERT INTO bitacora VALUES("649","2023-10-17","Se eliminó un Usuario con el id: 43 ","Usuarios","1");
INSERT INTO bitacora VALUES("650","2023-10-17","Se realizo un respaldo de la BASE DE DATOS ","Mantenimiento","1");
INSERT INTO bitacora VALUES("651","2023-10-17","Se realizo un respaldo automatico de la BASE DE DATOS ","Mantenimiento","1");
INSERT INTO bitacora VALUES("652","2023-10-17","Se realizo un respaldo automatico de la BASE DE DATOS ","Mantenimiento","1");
INSERT INTO bitacora VALUES("653","2023-10-17","Se realizo un respaldo automatico de la BASE DE DATOS ","Mantenimiento","1");



TRUNCATE TABLE cat_producto;
INSERT INTO cat_producto VALUES("32","Verduras","1");
INSERT INTO cat_producto VALUES("33","Viveres","1");
INSERT INTO cat_producto VALUES("34","Carnes","1");
INSERT INTO cat_producto VALUES("40","limpieza","1");
INSERT INTO cat_producto VALUES("41","ASEO PERSONAL","1");
INSERT INTO cat_producto VALUES("42","CHARCUTERIA","1");



TRUNCATE TABLE clientes;
INSERT INTO clientes VALUES("1","daniela antonia","27629581","CI","04147483641","1");
INSERT INTO clientes VALUES("2","Arianna Colmenarez","566488978","CI","04147483642","1");
INSERT INTO clientes VALUES("3","fernando miranda","10776355","CI","04265515445","1");
INSERT INTO clientes VALUES("4","maria jose","75558994","CI","02456651415","1");
INSERT INTO clientes VALUES("5","jose manuel","10226548","CI","56445645655","1");
INSERT INTO clientes VALUES("6","mauricio gamba","96180031","CI","02415488755","1");
INSERT INTO clientes VALUES("7","paola jose","96180044","CI","04147483647","1");
INSERT INTO clientes VALUES("8","jose becerra","27695845","CI","20221664411","1");
INSERT INTO clientes VALUES("10","paola colmenarez","27629584","CI","04147483642","1");
INSERT INTO clientes VALUES("11","arianna paola","27629586","CI","04147483621","1");
INSERT INTO clientes VALUES("14","Daniela VELIZ","96180012","CI","04147483611","1");
INSERT INTO clientes VALUES("15","paola altagracia","9618456","CI","04147483456","1");
INSERT INTO clientes VALUES("17","arianna paola","27629574","CI","04147483609","1");
INSERT INTO clientes VALUES("18","jinfer miranda","96180070","CI","04147483647","1");



TRUNCATE TABLE concepto_movimiento;
INSERT INTO concepto_movimiento VALUES("1","VENTA","1");
INSERT INTO concepto_movimiento VALUES("2","SERVICIOS PÚBLICOS","1");
INSERT INTO concepto_movimiento VALUES("3","COMPRA DE PRODUCTOS E INSUMOS","1");
INSERT INTO concepto_movimiento VALUES("4","ARRIENDO","1");
INSERT INTO concepto_movimiento VALUES("5","NÓMINA","1");
INSERT INTO concepto_movimiento VALUES("6","GASTOS ADMINISTRATIVOS","1");
INSERT INTO concepto_movimiento VALUES("7","MERCADEO Y PUBLICIDAD","1");
INSERT INTO concepto_movimiento VALUES("8","TRANSPORTES, DOMICILIOS, LOGISTICA","1");
INSERT INTO concepto_movimiento VALUES("9","MANTENIMIENTO Y REPARACIONES","1");
INSERT INTO concepto_movimiento VALUES("10","MUEBLES, EQUIPOS Y MAQUINARÍA","1");
INSERT INTO concepto_movimiento VALUES("11","OTROS","1");



TRUNCATE TABLE detalles_movimientos;
INSERT INTO detalles_movimientos VALUES("130","25.00","1","1","196","36");
INSERT INTO detalles_movimientos VALUES("132","25.00","1","1","197","36");
INSERT INTO detalles_movimientos VALUES("133","25.00","1","1","199","36");
INSERT INTO detalles_movimientos VALUES("135","25.00","1","1","200","36");
INSERT INTO detalles_movimientos VALUES("137","25.00","2","1","202","36");



TRUNCATE TABLE ingreso_detalles;
INSERT INTO ingreso_detalles VALUES("17","25.00","20.00","14.00","36","2","18");



TRUNCATE TABLE ingreso_productos;
INSERT INTO ingreso_productos VALUES("18","2023-03-16","00001","2023-03-16","PAGADA","784.00","1","4","1");



TRUNCATE TABLE marca_producto;
INSERT INTO marca_producto VALUES("1","JUANA","1");
INSERT INTO marca_producto VALUES("6","PAN POLAR","1");
INSERT INTO marca_producto VALUES("7","MAZEITE","1");
INSERT INTO marca_producto VALUES("8","DOÑA EMILIA","1");
INSERT INTO marca_producto VALUES("9","YUQUERY","1");
INSERT INTO marca_producto VALUES("10","MONTALBAN","1");
INSERT INTO marca_producto VALUES("11","MAVESA","1");
INSERT INTO marca_producto VALUES("12","ALIVE","1");
INSERT INTO marca_producto VALUES("13","MINALBA","1");
INSERT INTO marca_producto VALUES("14","EBENECER","1");
INSERT INTO marca_producto VALUES("15","VATEL","1");



TRUNCATE TABLE metodo_pago;
INSERT INTO metodo_pago VALUES("1","EFECTIVO");
INSERT INTO metodo_pago VALUES("2","TARJETA");
INSERT INTO metodo_pago VALUES("3","TRANSFERENCIA");
INSERT INTO metodo_pago VALUES("4","DOLARES");



TRUNCATE TABLE movimientos;
INSERT INTO movimientos VALUES("195","compra de productos","784.00","2023-03-16","13:16:00","PAGADA","1","3","4","1","","1");
INSERT INTO movimientos VALUES("196","","25.00","2023-03-16","13:22:00","PAGADA","1","1","1","","","1");
INSERT INTO movimientos VALUES("197","","63.00","2023-03-16","13:23:00","A CREDITO","0","1","1","","17","1");
INSERT INTO movimientos VALUES("198","compra aceite","320.00","2023-03-16","13:23:00","A CREDITO","1","3","2","1","","1");
INSERT INTO movimientos VALUES("199","","63.00","2023-03-16","14:19:00","PAGADO","1","1","1","","2","1");
INSERT INTO movimientos VALUES("200","","25.00","2023-03-16","14:27:00","A CREDITO","1","1","1","","2","1");
INSERT INTO movimientos VALUES("201","","38.00","2023-09-14","15:16:00","PAGADA","1","1","1","","","3");
INSERT INTO movimientos VALUES("202","","50.00","2023-09-14","15:17:00","PAGADA","1","1","1","","","3");
INSERT INTO movimientos VALUES("203","mesa planchar","20.00","2023-10-14","20:22:00","PAGADA","1","3","1","","","3");
INSERT INTO movimientos VALUES("204","mesa planchar","20.00","2023-10-14","20:27:00","PAGADA","1","4","2","1","","3");
INSERT INTO movimientos VALUES("205","mesa planchar","20.00","2023-10-14","20:28:00","PAGADA","1","4","2","","","3");



TRUNCATE TABLE notificaciones;
INSERT INTO notificaciones VALUES("18","daniela tiene una dueda atrasada","la deuda es del 2022-10-21 por 9.20 bs","0","2022-10-21 15:03:41");
INSERT INTO notificaciones VALUES("19","ARIANNA tiene una dueda atrasada","la deuda es del 2022-10-01 por 5.00 bs","0","2022-10-21 15:03:42");
INSERT INTO notificaciones VALUES("20","ARIANNA tiene una dueda atrasada","la deuda es del 2022-10-01 por 5.00 bs","0","2022-10-21 15:03:42");
INSERT INTO notificaciones VALUES("21","ARIANNA tiene una dueda atrasada","la deuda es del 2022-10-13 por 5.00 bs","0","2022-10-21 15:03:43");
INSERT INTO notificaciones VALUES("22","daniela tiene una dueda atrasada","la deuda es del 2022-10-21 por 9.20 bs","0","2022-10-21 15:03:36");
INSERT INTO notificaciones VALUES("23"," Tienes una dueda atrasada conARIANNA","la deuda es del 2022-10-01 por 5.00 bs","0","2022-10-21 15:03:39");
INSERT INTO notificaciones VALUES("24"," Tienes una dueda atrasada conARIANNA","la deuda es del 2022-10-01 por 5.00 bs","0","2022-10-21 15:03:40");
INSERT INTO notificaciones VALUES("25"," Tienes una dueda atrasada conARIANNA","la deuda es del 2022-10-13 por 5.00 bs","0","2022-10-21 15:03:41");
INSERT INTO notificaciones VALUES("26"," Tienes una dueda atrasada con ARIANNA","la deuda es del 2023-03-16 por 320.00 bs","1","2023-03-16 14:45:15");
INSERT INTO notificaciones VALUES("27","Arianna Colmenarez tiene una dueda atrasada","la deuda es del 2023-03-16 por 25.00 bs","1","2023-03-16 14:45:15");
INSERT INTO notificaciones VALUES("28"," Tienes una dueda atrasada con ARIANNA","la deuda es del 2023-03-16 por 320.00 bs","1","2023-03-16 14:46:23");
INSERT INTO notificaciones VALUES("29","Arianna Colmenarez tiene una dueda atrasada","la deuda es del 2023-03-16 por 25.00 bs","1","2023-03-16 14:46:23");
INSERT INTO notificaciones VALUES("30"," Tienes un producto que se esta agotando","ACEITE MAZEITEMAZEITE Este producto se esta agotando tienes solo 4.00 en stock","1","2023-03-16 14:46:23");



TRUNCATE TABLE permisos;
INSERT INTO permisos VALUES("1","Consultar Ventas","1");
INSERT INTO permisos VALUES("2","Modificar Balance","1");
INSERT INTO permisos VALUES("3","Crear Ventas","1");
INSERT INTO permisos VALUES("4","Anular Ventas","1");
INSERT INTO permisos VALUES("5","Consultar Inventario","1");
INSERT INTO permisos VALUES("6","Modificar Inventario","");
INSERT INTO permisos VALUES("7","Crear Inventario","1");
INSERT INTO permisos VALUES("8","Eliminar Inventario","1");
INSERT INTO permisos VALUES("9","Consultar Deudas","1");
INSERT INTO permisos VALUES("10","Abonar Deudas","1");
INSERT INTO permisos VALUES("12","Eliminar Deudas","1");
INSERT INTO permisos VALUES("13","Consultar Proveedores","1");
INSERT INTO permisos VALUES("14","Modificar Proveedores","1");
INSERT INTO permisos VALUES("15","Crear Proveedores","1");
INSERT INTO permisos VALUES("16","Eliminar Proveedores","1");
INSERT INTO permisos VALUES("17","Consultar Clientes","1");
INSERT INTO permisos VALUES("18","Modificar Clientes","1");
INSERT INTO permisos VALUES("19","Crear Clientes","1");
INSERT INTO permisos VALUES("20","Eliminar Clientes","1");
INSERT INTO permisos VALUES("21","Consultar Usuarios","1");
INSERT INTO permisos VALUES("22","Modificar Usuarios","1");
INSERT INTO permisos VALUES("23","Crear Usuarios","");
INSERT INTO permisos VALUES("24","Eliminar Usuarios","1");
INSERT INTO permisos VALUES("25","Estadisticas Ventas","1");
INSERT INTO permisos VALUES("26","Consultar Reportes Balance","1");
INSERT INTO permisos VALUES("27","Consultar Reportes Inventario","1");
INSERT INTO permisos VALUES("28","Consultar Reportes Deudas","1");
INSERT INTO permisos VALUES("29","Crear Respaldo Base Datos","1");
INSERT INTO permisos VALUES("30","Modificar Base Datos","1");
INSERT INTO permisos VALUES("31","Consultar Roles","1");
INSERT INTO permisos VALUES("32","Modificar Roles","1");
INSERT INTO permisos VALUES("33","Crear Roles","1");
INSERT INTO permisos VALUES("34","Eliminar Roles","1");
INSERT INTO permisos VALUES("35","Crear Permisos","1");
INSERT INTO permisos VALUES("36","Consultar Reportes Bitacora","1");
INSERT INTO permisos VALUES("37","Consultar Gastos","1");
INSERT INTO permisos VALUES("38","Registrar Gastos","1");
INSERT INTO permisos VALUES("39","Eliminar Gastos","1");
INSERT INTO permisos VALUES("40","Consultar Ingresos","1");
INSERT INTO permisos VALUES("41","Crear Ingresos","1");
INSERT INTO permisos VALUES("42","Anular Ingresos","1");
INSERT INTO permisos VALUES("43","Consultar Productos","1");
INSERT INTO permisos VALUES("44","Crear Productos","1");
INSERT INTO permisos VALUES("45","Modificar Productos","1");
INSERT INTO permisos VALUES("46","Eliminar Productos","1");
INSERT INTO permisos VALUES("47","Consultar Categorias","1");
INSERT INTO permisos VALUES("48","Modificar Categorias","1");
INSERT INTO permisos VALUES("49","Eliminar Categorias","1");
INSERT INTO permisos VALUES("50","Crear Categorias","1");
INSERT INTO permisos VALUES("51","Consultar Presentaciones","1");
INSERT INTO permisos VALUES("52","Modificar Presentaciones","1");
INSERT INTO permisos VALUES("53","Crear Presentaciones","1");
INSERT INTO permisos VALUES("54","Eliminar Presentaciones","1");
INSERT INTO permisos VALUES("55","Consultar Marcas","1");
INSERT INTO permisos VALUES("56","Modificar Marcas","1");
INSERT INTO permisos VALUES("57","Crear Marcas","1");
INSERT INTO permisos VALUES("58","Eliminar Marcas","1");
INSERT INTO permisos VALUES("59","Estadisticas Gastos","1");
INSERT INTO permisos VALUES("60","Estadisticas Vendidos","1");



TRUNCATE TABLE pregunta_de_seguridad;
INSERT INTO pregunta_de_seguridad VALUES("1","¿Cuál es el nombre de tu primera mascota?");
INSERT INTO pregunta_de_seguridad VALUES("2","¿Cuál es el nombre de tu abuela materna?");
INSERT INTO pregunta_de_seguridad VALUES("3","¿En qué ciudad naciste?");
INSERT INTO pregunta_de_seguridad VALUES("4","¿Cuál es tu canción favorita?");
INSERT INTO pregunta_de_seguridad VALUES("5","¿Cuál es el nombre de tu libro favorito?");
INSERT INTO pregunta_de_seguridad VALUES("6","¿Cuál es tu comida favorita?");
INSERT INTO pregunta_de_seguridad VALUES("7","¿Cuál es el nombre de tu película favorita?");
INSERT INTO pregunta_de_seguridad VALUES("8","¿Cuál es tu equipo deportivo favorito?");
INSERT INTO pregunta_de_seguridad VALUES("9","¿Cuál es el apellido de soltera de tu madre?");
INSERT INTO pregunta_de_seguridad VALUES("10","¿Cuál es el nombre de tu primer amigo de la infancia?");
INSERT INTO pregunta_de_seguridad VALUES("11","¿En qué ciudad conociste a tu cónyuge o pareja actual?");
INSERT INTO pregunta_de_seguridad VALUES("12","¿Cuál es tu destino de vacaciones soñado?");
INSERT INTO pregunta_de_seguridad VALUES("13","¿Cuál es tu número de teléfono de la infancia?");



TRUNCATE TABLE presentacion_producto;
INSERT INTO presentacion_producto VALUES("1","2","KG","1","1");
INSERT INTO presentacion_producto VALUES("3","500","ML","1","1");
INSERT INTO presentacion_producto VALUES("5","1","UNIDAD","30","1");
INSERT INTO presentacion_producto VALUES("6","250","ML","1","1");
INSERT INTO presentacion_producto VALUES("9","100","metros","1","1");
INSERT INTO presentacion_producto VALUES("10","1","L","1","1");
INSERT INTO presentacion_producto VALUES("11","1","L","12","1");
INSERT INTO presentacion_producto VALUES("12","1","G","1","1");
INSERT INTO presentacion_producto VALUES("13","20","L","1","1");



TRUNCATE TABLE productos;
INSERT INTO productos VALUES("36","HARINA PAN","","assets/images/productos/100343473.jpg","0","33","6","1");



TRUNCATE TABLE proveedores;
INSERT INTO proveedores VALUES("1","ARIANNA","27629581","CI","04267346011","","1");
INSERT INTO proveedores VALUES("3","ANGELs","27629588","CI","0245211254","","1");



TRUNCATE TABLE recuperacion;
INSERT INTO recuperacion VALUES("1","3","2023-08-21 16:23:02","1");
INSERT INTO recuperacion VALUES("2","3","2023-08-21 17:33:04","1");
INSERT INTO recuperacion VALUES("3","21","2023-08-23 09:25:52","1");
INSERT INTO recuperacion VALUES("4","3","2023-08-21 17:57:28","1");
INSERT INTO recuperacion VALUES("5","3","2023-08-21 17:59:14","1");
INSERT INTO recuperacion VALUES("6","3","2023-08-22 08:03:27","1");
INSERT INTO recuperacion VALUES("7","3","2023-08-22 08:05:24","1");
INSERT INTO recuperacion VALUES("8","3","2023-08-22 08:06:15","1");
INSERT INTO recuperacion VALUES("9","3","2023-08-22 08:07:01","1");
INSERT INTO recuperacion VALUES("10","3","2023-08-22 08:08:23","1");
INSERT INTO recuperacion VALUES("11","3","2023-08-22 08:29:03","1");
INSERT INTO recuperacion VALUES("12","21","2023-08-23 09:25:58","1");
INSERT INTO recuperacion VALUES("13","3","2023-08-22 10:10:39","1");
INSERT INTO recuperacion VALUES("14","3","2023-08-22 10:31:12","1");
INSERT INTO recuperacion VALUES("15","3","2023-08-22 10:39:27","1");
INSERT INTO recuperacion VALUES("16","3","2023-08-22 11:25:44","1");
INSERT INTO recuperacion VALUES("17","3","2023-08-23 08:49:09","1");
INSERT INTO recuperacion VALUES("18","3","2023-08-23 10:15:40","1");
INSERT INTO recuperacion VALUES("19","3","2023-08-23 11:21:26","1");
INSERT INTO recuperacion VALUES("20","3","2023-08-23 11:36:31","1");
INSERT INTO recuperacion VALUES("21","3","2023-09-04 08:12:44","1");
INSERT INTO recuperacion VALUES("22","3","2023-09-04 08:31:32","1");
INSERT INTO recuperacion VALUES("23","3","2023-09-04 08:35:42","1");
INSERT INTO recuperacion VALUES("24","3","2023-09-04 09:14:52","1");
INSERT INTO recuperacion VALUES("25","3","2023-09-04 09:15:08","1");
INSERT INTO recuperacion VALUES("26","3","2023-09-04 09:15:21","1");
INSERT INTO recuperacion VALUES("27","3","2023-09-04 09:18:18","1");
INSERT INTO recuperacion VALUES("28","3","2023-09-04 09:20:05","1");
INSERT INTO recuperacion VALUES("29","3","2023-09-05 08:06:50","1");
INSERT INTO recuperacion VALUES("30","3","2023-09-05 08:12:01","1");
INSERT INTO recuperacion VALUES("31","3","2023-09-05 08:13:44","1");
INSERT INTO recuperacion VALUES("32","3","2023-09-05 08:14:54","1");
INSERT INTO recuperacion VALUES("33","3","2023-09-05 08:20:54","1");
INSERT INTO recuperacion VALUES("34","3","2023-09-05 08:23:29","1");
INSERT INTO recuperacion VALUES("35","3","2023-09-05 08:24:25","1");
INSERT INTO recuperacion VALUES("36","3","2023-09-05 08:29:09","1");
INSERT INTO recuperacion VALUES("37","3","2023-09-05 08:29:50","1");
INSERT INTO recuperacion VALUES("38","3","2023-09-05 08:30:47","1");
INSERT INTO recuperacion VALUES("39","3","2023-09-05 08:31:55","1");
INSERT INTO recuperacion VALUES("40","3","2023-09-05 08:39:20","1");
INSERT INTO recuperacion VALUES("41","3","2023-09-05 08:40:05","1");
INSERT INTO recuperacion VALUES("42","3","2023-09-05 08:44:39","1");
INSERT INTO recuperacion VALUES("43","3","2023-09-05 08:49:08","1");
INSERT INTO recuperacion VALUES("44","3","2023-09-05 08:53:09","1");
INSERT INTO recuperacion VALUES("45","3","2023-09-05 08:54:32","1");
INSERT INTO recuperacion VALUES("46","3","2023-09-05 09:09:02","1");



TRUNCATE TABLE respuesta;
INSERT INTO respuesta VALUES("63","tobby","40","1");
INSERT INTO respuesta VALUES("64","barquisimeto","40","3");
INSERT INTO respuesta VALUES("65","madrid","40","12");



TRUNCATE TABLE rol;
INSERT INTO rol VALUES("1","ENCARGADO","Se encarga de manejar el sistema","1");
INSERT INTO rol VALUES("3","superusuario","tiene todos los permisos","1");



TRUNCATE TABLE rol_permiso;
INSERT INTO rol_permiso VALUES("342","3","21");
INSERT INTO rol_permiso VALUES("343","3","22");
INSERT INTO rol_permiso VALUES("344","3","23");
INSERT INTO rol_permiso VALUES("345","3","24");
INSERT INTO rol_permiso VALUES("346","3","5");
INSERT INTO rol_permiso VALUES("347","3","1");
INSERT INTO rol_permiso VALUES("348","3","3");
INSERT INTO rol_permiso VALUES("349","3","4");
INSERT INTO rol_permiso VALUES("350","3","37");
INSERT INTO rol_permiso VALUES("351","3","38");
INSERT INTO rol_permiso VALUES("352","3","39");
INSERT INTO rol_permiso VALUES("353","3","40");
INSERT INTO rol_permiso VALUES("354","3","41");
INSERT INTO rol_permiso VALUES("355","3","42");
INSERT INTO rol_permiso VALUES("356","3","43");
INSERT INTO rol_permiso VALUES("357","3","45");
INSERT INTO rol_permiso VALUES("358","3","44");
INSERT INTO rol_permiso VALUES("359","3","46");
INSERT INTO rol_permiso VALUES("360","3","47");
INSERT INTO rol_permiso VALUES("361","3","48");
INSERT INTO rol_permiso VALUES("362","3","50");
INSERT INTO rol_permiso VALUES("363","3","49");
INSERT INTO rol_permiso VALUES("364","3","51");
INSERT INTO rol_permiso VALUES("365","3","52");
INSERT INTO rol_permiso VALUES("366","3","53");
INSERT INTO rol_permiso VALUES("367","3","54");
INSERT INTO rol_permiso VALUES("368","3","55");
INSERT INTO rol_permiso VALUES("369","3","56");
INSERT INTO rol_permiso VALUES("370","3","57");
INSERT INTO rol_permiso VALUES("371","3","58");
INSERT INTO rol_permiso VALUES("372","3","9");
INSERT INTO rol_permiso VALUES("373","3","10");
INSERT INTO rol_permiso VALUES("374","3","12");
INSERT INTO rol_permiso VALUES("375","3","17");
INSERT INTO rol_permiso VALUES("376","3","18");
INSERT INTO rol_permiso VALUES("377","3","19");
INSERT INTO rol_permiso VALUES("378","3","20");
INSERT INTO rol_permiso VALUES("379","3","13");
INSERT INTO rol_permiso VALUES("380","3","14");
INSERT INTO rol_permiso VALUES("381","3","15");
INSERT INTO rol_permiso VALUES("382","3","16");
INSERT INTO rol_permiso VALUES("383","3","25");
INSERT INTO rol_permiso VALUES("384","3","59");
INSERT INTO rol_permiso VALUES("385","3","60");
INSERT INTO rol_permiso VALUES("386","3","27");
INSERT INTO rol_permiso VALUES("387","3","26");
INSERT INTO rol_permiso VALUES("388","3","28");
INSERT INTO rol_permiso VALUES("389","3","36");
INSERT INTO rol_permiso VALUES("390","3","29");
INSERT INTO rol_permiso VALUES("391","3","30");
INSERT INTO rol_permiso VALUES("392","3","31");
INSERT INTO rol_permiso VALUES("393","3","32");
INSERT INTO rol_permiso VALUES("394","3","33");
INSERT INTO rol_permiso VALUES("395","3","34");
INSERT INTO rol_permiso VALUES("396","3","35");
INSERT INTO rol_permiso VALUES("400","1","5");
INSERT INTO rol_permiso VALUES("401","1","1");
INSERT INTO rol_permiso VALUES("402","1","3");
INSERT INTO rol_permiso VALUES("403","1","4");
INSERT INTO rol_permiso VALUES("404","1","37");
INSERT INTO rol_permiso VALUES("405","1","38");
INSERT INTO rol_permiso VALUES("406","1","39");
INSERT INTO rol_permiso VALUES("407","1","40");
INSERT INTO rol_permiso VALUES("408","1","41");
INSERT INTO rol_permiso VALUES("409","1","42");
INSERT INTO rol_permiso VALUES("410","1","43");
INSERT INTO rol_permiso VALUES("411","1","45");
INSERT INTO rol_permiso VALUES("412","1","44");
INSERT INTO rol_permiso VALUES("413","1","46");
INSERT INTO rol_permiso VALUES("414","1","47");
INSERT INTO rol_permiso VALUES("415","1","48");
INSERT INTO rol_permiso VALUES("416","1","50");
INSERT INTO rol_permiso VALUES("417","1","49");
INSERT INTO rol_permiso VALUES("418","1","51");
INSERT INTO rol_permiso VALUES("419","1","52");
INSERT INTO rol_permiso VALUES("420","1","53");
INSERT INTO rol_permiso VALUES("421","1","54");
INSERT INTO rol_permiso VALUES("422","1","55");
INSERT INTO rol_permiso VALUES("423","1","56");
INSERT INTO rol_permiso VALUES("424","1","57");
INSERT INTO rol_permiso VALUES("425","1","58");
INSERT INTO rol_permiso VALUES("426","1","9");
INSERT INTO rol_permiso VALUES("427","1","10");
INSERT INTO rol_permiso VALUES("428","1","12");
INSERT INTO rol_permiso VALUES("429","1","17");
INSERT INTO rol_permiso VALUES("430","1","18");
INSERT INTO rol_permiso VALUES("431","1","19");
INSERT INTO rol_permiso VALUES("432","1","20");
INSERT INTO rol_permiso VALUES("433","1","13");
INSERT INTO rol_permiso VALUES("434","1","14");
INSERT INTO rol_permiso VALUES("435","1","15");
INSERT INTO rol_permiso VALUES("436","1","16");
INSERT INTO rol_permiso VALUES("437","1","25");
INSERT INTO rol_permiso VALUES("438","1","59");
INSERT INTO rol_permiso VALUES("439","1","60");
INSERT INTO rol_permiso VALUES("440","1","27");
INSERT INTO rol_permiso VALUES("441","1","26");
INSERT INTO rol_permiso VALUES("442","1","28");
INSERT INTO rol_permiso VALUES("443","1","36");



TRUNCATE TABLE usuarios;
INSERT INTO usuarios VALUES("1","SUPERUSUARIO","ezcolmenarjose@gmail.com","$2y$10$acmq4Z7/iyRbwr4j/ERouO9UdyMNYZxnbowh7msl8ED1CzR7.uVga","1","3","0");
INSERT INTO usuarios VALUES("3","ARIANNA","aripaocol@gmail.com","$2y$10$k6snS9cJyNxTFwz9eRFJEejkaVgnMOYYtgKnkGJAvnEUgVlth4Eva","1","3","0");
INSERT INTO usuarios VALUES("21","PAOLA25","ARICOL25@GMAIL.COM","$2y$10$TTAgPYYbrQ.lTPS85i5H7O5YeX2v2CDYK1WktIYiLwq/J46qHNIdC","1","1","0");
INSERT INTO usuarios VALUES("22","PAOLA02","colmenarjose2512@gmail.com","$2y$10$QHFOc92ns7JqDgtZk3OYTO1/441VHhgtdAIn02b1OLZ0Wx5z5eLlS","1","3","0");
INSERT INTO usuarios VALUES("40","ALEJANDRO","hola@gmail.com","$2y$10$7kxTqeZhiwaiIrlkevHpQOxGNcvJ2X5QzFdez0FImCU6i.Shh9qfS","1","3","0");
INSERT INTO usuarios VALUES("43","JOSEE","josee@gmail.com","$2y$10$LfgS7lGHp66PLn1QIpD1S.WXuwLjHnhg/z01wlPeiZo9iK/iMoToG","0","1","0");



SET FOREIGN_KEY_CHECKS=1;
DELETE FROM bitacora WHERE fecha > "2023-10-16 21:42:17";