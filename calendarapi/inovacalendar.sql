-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-02-2022 a las 21:57:25
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.1.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inova_calendar`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_spRegistrarActividades` (IN `_idactividades` INT, IN `_idservicio` INT, IN `_descripcion` VARCHAR(200), IN `_estado` INT)  BEGIN

declare _fecharegistro datetime;
  declare _codrespuesta int default 0;
  declare _registros int;
  declare _detalle varchar(100);

  set _fecharegistro = (select now());
  set _registros = (select count(*) from p_actividades where idactividades=_idactividades);
  if _registros >0 then

  UPDATE p_actividades set
  idservicio=_idservicio,
  descripcion=_descripcion ,
  estado=_estado

  WHERE idactividades =_idactividades;
  SET _codrespuesta =1;
  set _detalle ='Se Actualizo los datos Correctamente';
  select _codrespuesta as codigo,_detalle as mensaje;

  else
  INSERT INTO p_actividades (idservicio,descripcion, estado)
  VALUES(

  _idservicio,
  _descripcion ,
  _estado);

  SET _codrespuesta =1;
  set _detalle ='Se Registro los datos Correctamente';
  select _codrespuesta as codigo,_detalle as mensaje;

  end if;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_spRegistrarArea` (IN `_idarea` INT, IN `_idservicio` INT, IN `_descripcion` VARCHAR(200), IN `_estado` INT)  BEGIN

  declare _fecharegistro datetime;
  declare _codrespuesta int default 0;
  declare _registros int;
  declare _detalle varchar(100);

  set _fecharegistro = (select now());
  set _registros = (select count(*) from p_area where idarea=_idarea);
  if _registros >0 then

  UPDATE p_area set
  idservicio=_idservicio,
  descripcion=_descripcion ,
  estado=_estado

  WHERE idarea =_idarea;
  SET _codrespuesta =1;
  set _detalle ='Se Actualizo los datos Correctamente';
  select _codrespuesta as codigo,_detalle as mensaje;

  else
  INSERT INTO p_area (idservicio,descripcion, estado, clase)
  VALUES(

  _idservicio,
  _descripcion ,
  _estado, "color-1");

  SET _codrespuesta =1;
  set _detalle ='Se Registro los datos Correctamente';
  select _codrespuesta as codigo,_detalle as mensaje;

  end if;


END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_spRegistrarDepartamento` (`_idundorganizacional` INT, `_descripcion` VARCHAR(200), `_tipo` INT, `_estado` INT)  BEGIN

  declare _fecharegistro datetime;
  declare _codrespuesta int default 0;
  declare _registros int;
  declare _detalle varchar(100);

  set _fecharegistro = (select now());
  set _registros = (select count(*) from p_unidadorganizacional where idundorganizacional=_idundorganizacional);
  if _registros >0 then

  UPDATE p_unidadorganizacional set

  descripcion=_descripcion ,
  tipo=_tipo,
  estado=_estado

  WHERE idundorganizacional =_idundorganizacional;
  SET _codrespuesta =1;
  set _detalle ='Se Actualizo los datos Correctamente';
  select _codrespuesta as codigo,_detalle as mensaje;

  else
  INSERT INTO p_unidadorganizacional (descripcion,tipo, estado)
  VALUES(
  _descripcion ,
  _tipo,
  _estado);

  SET _codrespuesta =1;
  set _detalle ='Se Registro los datos Correctamente';
  select _codrespuesta as codigo,_detalle as mensaje;

  end if;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_spRegistrarGrupoRiesgo` (`_idgruporiesgo` INT, `_descripcion` VARCHAR(200), `_estado` INT)  BEGIN

  declare _fecharegistro datetime;
  declare _codrespuesta int default 0;
  declare _registros int;
  declare _detalle varchar(100);

  set _fecharegistro = (select now());
  set _registros = (select count(*) from p_gruporiesgo where idgruporiesgo=_idgruporiesgo);
  if _registros >0 then

  UPDATE p_gruporiesgo set

  descripcion=_descripcion ,
  estado=_estado

  WHERE idgruporiesgo =_idgruporiesgo;
  SET _codrespuesta =1;
  set _detalle ='Se Actualizo los datos Correctamente';
  select _codrespuesta as codigo,_detalle as mensaje;

  else
  INSERT INTO p_gruporiesgo (descripcion, estado)
  VALUES(

  _descripcion ,
  _estado);

  SET _codrespuesta =1;
  set _detalle ='Se Registro los datos Correctamente';
  select _codrespuesta as codigo,_detalle as mensaje;

  end if;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_spRegistrarPerfil` (IN `_idusuario` INT, IN `_dni` VARCHAR(200), IN `_clave` VARCHAR(200), IN `_nombreusuario` VARCHAR(200), IN `_idestado` INT, IN `_idperfil` INT, IN `_avatar` VARCHAR(200))  BEGIN

  declare _fecharegistro datetime;
  declare _codrespuesta int default 0;
  declare _registros int;
  declare _detalle varchar(100);

  set _fecharegistro = (select now());
  set _registros = (select count(*) from p_usuario where idusuario=_idusuario);
  if _registros >0 then

  UPDATE p_usuario set
  dni=_dni,
  clave=_clave ,
  nombreusuario=_nombreusuario ,
  idestado=_idestado ,
  idperfil=_idperfil,
  avatar=_avatar

  WHERE idusuario =_idusuario;
  SET _codrespuesta =1;
  set _detalle ='Se Actualizo los datos Correctamente';
  select _codrespuesta as codigo,_detalle as mensaje;

  else
  INSERT INTO p_usuario (dni,clave,nombreusuario,idestado,idperfil,avatar)
  VALUES(

  _dni,
  _clave ,
  _nombreusuario,
  _idestado,
  _idperfil,
  _avatar);

  SET _codrespuesta =1;
  set _detalle ='Se Registro los datos Correctamente';
  select _codrespuesta as codigo,_detalle as mensaje;

  end if;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_spRegistrarPersonal` (`_idplaza` INT, `_tipoplaza` INT, `_apellidopaterno` VARCHAR(200), `_apellidomaterno` VARCHAR(200), `_primernombre` VARCHAR(200), `_segundonombre` VARCHAR(200), `_nombrecompleto` VARCHAR(500), `_tipodocumento` INT, `_nrodocumento` VARCHAR(12), `_fechanacimiento` DATETIME, `_idsexo` INT, `_idestadocivil` INT, `_direccion` VARCHAR(100), `_ruc` VARCHAR(11))  BEGIN

  declare _fecharegistro datetime;
  declare _codrespuesta int default 0;
  declare _registros int;
  declare _detalle varchar(100);

  set _fecharegistro = (select now());
  set _registros = (select count(*) from p_personal where idplaza=_idplaza);
  if _registros >0 then

  UPDATE p_personal set
  idplaza =_idplaza,
  apellidopaterno=_apellidopaterno ,
  apellidomaterno=_apellidomaterno ,
  primernombre  = _primernombre ,
  segundonombre = _segundonombre ,
  nombrecompleto =_nombrecompleto ,
  tipodocumento =_tipodocumento ,
  nrodocumento =_nrodocumento ,
  fechanacimiento = _fechanacimiento ,
  idsexo =_idsexo ,
  idestadocivil = _idestadocivil ,
  direccion =_direccion ,
  ruc =_ruc

  WHERE idplaza =_idplaza;
  SET _codrespuesta =1;
  set _detalle ='Se Actualizo los datos Correctamente';
  select _codrespuesta as codigo,_detalle as mensaje;

  else
  INSERT INTO p_personal (idplaza,tipoplaza, apellidopaterno, apellidomaterno, primernombre, segundonombre, nombrecompleto, tipodocumento, nrodocumento, fechanacimiento, idsexo, idestadocivil, direccion, ruc )
  VALUES(_idplaza ,
  _tipoplaza ,
  _apellidopaterno ,
  _apellidomaterno ,
  _primernombre ,
  _segundonombre ,
  _nombrecompleto ,
  _tipodocumento ,
  _nrodocumento ,
  _fechanacimiento ,
  _idsexo ,
  _idestadocivil ,
  _direccion ,
  _ruc);

  SET _codrespuesta =1;
  set _detalle ='Se Registro los datos Correctamente';
  select _codrespuesta as codigo,_detalle as mensaje;

  end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_spRegistrarPlanilla` (`_id` INT, `_idpersona` INT, `_idgruporiesgo` INT, `_idservicio` INT, `_idarea` INT, `_idpuestotrabajo` INT, `_observacion` VARCHAR(500), `_fechainicio` DATETIME, `_fechafin` DATETIME, `_estado` INT)  BEGIN

  declare _codrespuesta int default 0;
  declare _registros int;
  declare _detalle varchar(100);


  set _registros = (select count(*) from p_planilla where idplanilla=_id);
  if _registros >0 then

  UPDATE p_planilla set
  idpersona=_idpersona,
  idgruporiesgo=_idgruporiesgo,
  idservicio=_idservicio,
  idarea=_idarea,
  idpuestotrabajo=_idpuestotrabajo,
  observacion=_observacion,
  fechainicio=_fechainicio,
  fechafin=_fechafin,
  estado=_estado
  WHERE idplanilla =_id;
  SET _codrespuesta =1;
  set _detalle ='Se Actualizo la planilla Correctamente';
  select _codrespuesta as codigo,_detalle as mensaje;

  else
  INSERT INTO p_planilla (idpersona,
  idgruporiesgo,
  idservicio,
  idarea,
  idpuestotrabajo,
  observacion,
  fechainicio,
  fechafin,
  estado,
  usuario,
  perfil,
  equipo,
  fecha )
  VALUES(_idpersona,
  _idgruporiesgo,
  _idservicio,
  _idarea,
  _idpuestotrabajo,
  _observacion,
  _fechainicio,
  _fechafin,
  _estado,'US','PR','EQ','2021-08-02');
  SET _codrespuesta =1;
  set _detalle ='Se Registro la planilla Correctamente';
  select _codrespuesta as codigo,_detalle as mensaje;

  end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_spRegistrarPuestoTrabajo` (`_idpuesto` INT, `_descripcion` VARCHAR(200), `_estado` INT)  BEGIN

  declare _fecharegistro datetime;
  declare _codrespuesta int default 0;
  declare _registros int;
  declare _detalle varchar(100);

  set _fecharegistro = (select now());
  set _registros = (select count(*) from p_puestotrabajo where idpuesto=_idpuesto);

  if _registros >0 then

    UPDATE p_puestotrabajo set
    descripcion=_descripcion ,
    estado=_estado

    WHERE idpuesto =_idpuesto;
    SET _codrespuesta =1;
    set _detalle ='Se Actualizo los datos Correctamente';
    select _codrespuesta as codigo,_detalle as mensaje;

  else
    INSERT INTO p_puestotrabajo (descripcion, estado)
    VALUES(

    _descripcion ,
    _estado);

  SET _codrespuesta =1;
  set _detalle ='Se Registro los datos Correctamente';
  select _codrespuesta as codigo,_detalle as mensaje;

  end if;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_spRegistrarServicio` (`_idservicio` INT, `_idundorganizacional` INT, `_descripcion` VARCHAR(200), `_estado` INT)  BEGIN

  declare _fecharegistro datetime;
  declare _codrespuesta int default 0;
  declare _registros int;
  declare _detalle varchar(100);

  set _fecharegistro = (select now());
  set _registros = (select count(*) from p_servicio where idservicio=_idservicio);
  if _registros >0 then

  UPDATE p_servicio set
  idundorganizacional=_idundorganizacional,
  descripcion=_descripcion ,
  estado=_estado

  WHERE idservicio =_idservicio;
  SET _codrespuesta =1;
  set _detalle ='Se Actualizo los datos Correctamente';
  select _codrespuesta as codigo,_detalle as mensaje;

  else
  INSERT INTO p_servicio (idundorganizacional,descripcion, estado)
  VALUES(

  _idundorganizacional,
  _descripcion ,
  _estado);

  SET _codrespuesta =1;
  set _detalle ='Se Registro los datos Correctamente';
  select _codrespuesta as codigo,_detalle as mensaje;

  end if;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_spRegistrarTurnoAdmin` (IN `_idplanilla` INT, IN `_periodo` INT, IN `_mes` INT, IN `_dia` INT, IN `_idturno` INT, IN `_idhora` INT, IN `_idarea` INT, IN `_idtipomodalidad` INT, IN `_idusuarioAdmin` INT)  BEGIN
  declare _horaIngreso varchar(5) default '00:00';
	declare _horaegreso varchar(5) default '00:00';
	declare _nrohoras int default 0;
	declare _fechahoraingreso datetime default null;
	declare _fechahoraegreso datetime default null;
  declare _autoriza int default 0;
  declare _fecharegistro datetime;

  declare _codrespuesta int default 0;
  declare _detalle varchar(100) default 'Tiene un Horario Autorizado';

  set _fecharegistro=now();
                                                                                       
  select nombre into _horaIngreso
			from p_horas
			where idhora = _idhora limit 1 ;


  set _nrohoras =ifnull((SELECT horas FROM p_turnos WHERE idturno=_idturno),0);

  set _fechahoraingreso =(select concat(concat_ws('-',lpad(_periodo,4,'0'),lpad(_mes,2,'0'),lpad(_dia,2,'0')),' ',_horaIngreso));

  set _fechahoraegreso  =(select ADDDATE(_fechahoraingreso, INTERVAL _nrohoras hour) );

  set _horaegreso  = substring(_fechahoraegreso,12,5);


  set _autoriza = ifnull((SELECT idusuarioautoriza FROM `p_rolprogramacion` WHERE `idplanilla`=_idplanilla AND `periodo`=_periodo AND `mes`=_mes AND `dia`=_dia AND `idusuarioautoriza`<>0 limit 1),0) ;

  if _autoriza =0 then

    INSERT INTO p_rolprogramacion (idplanilla, periodo, mes, dia, idturno, idhora, idarea,idtipomodalidad, horaIngreso, horaegreso, fechahoraingreso, fechahoraegreso, idusuarioregistra, fecharegistro,nrohoras)
            VALUES          ( _idplanilla, _periodo, _mes, _dia, _idturno, _idhora, _idarea,_idtipomodalidad, _horaIngreso, _horaegreso, _fechahoraingreso, _fechahoraegreso, _idusuarioAdmin, _fecharegistro,_nrohoras)
            ON DUPLICATE KEY UPDATE idturno = VALUES(idturno),idhora = VALUES(idhora),idarea = VALUES(idarea),
            horaIngreso = VALUES(horaIngreso),horaegreso = VALUES(horaegreso),fechahoraingreso = VALUES(fechahoraingreso),
            fechahoraegreso = VALUES(fechahoraegreso),idusuarioregistra = VALUES(idusuarioregistra),fecharegistro = VALUES(fecharegistro),nrohoras = VALUES(nrohoras),
            idestado = 0;
  set _codrespuesta=1;
  set _detalle ='Se Registro el Horario Correctamente';

  end if;

  select _codrespuesta as codigo,_detalle as mensaje;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_accesosmenu`
--

CREATE TABLE `p_accesosmenu` (
  `idacceso` int(10) UNSIGNED NOT NULL,
  `idperfil` int(10) UNSIGNED NOT NULL,
  `idmenu` int(10) UNSIGNED NOT NULL,
  `idestado` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `p_accesosmenu`
--

INSERT INTO `p_accesosmenu` (`idacceso`, `idperfil`, `idmenu`, `idestado`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 1, 3, 1),
(4, 1, 4, 1),
(5, 1, 5, 1),
(6, 1, 6, 1),
(7, 1, 7, 1),
(8, 1, 8, 1),
(9, 1, 9, 1),
(10, 2, 1, 1),
(11, 2, 2, 1),
(12, 2, 4, 1),
(13, 2, 7, 1),
(14, 2, 8, 1),
(15, 2, 9, 1),
(16, 3, 1, 1),
(17, 3, 2, 1),
(18, 3, 4, 1),
(19, 3, 7, 1),
(20, 3, 8, 1),
(21, 3, 9, 1),
(22, 4, 1, 1),
(23, 4, 2, 1),
(24, 4, 4, 1),
(25, 4, 7, 1),
(26, 4, 8, 1),
(27, 4, 9, 1),
(28, 5, 1, 1),
(29, 5, 4, 1),
(30, 5, 7, 1),
(31, 5, 8, 1),
(32, 5, 9, 1),
(33, 6, 1, 1),
(34, 6, 4, 1),
(35, 6, 7, 1),
(36, 6, 8, 1),
(37, 7, 1, 1),
(38, 7, 2, 1),
(39, 7, 3, 1),
(40, 7, 4, 1),
(41, 7, 6, 1),
(42, 7, 7, 1),
(43, 7, 8, 1),
(44, 7, 9, 1),
(45, 1, 10, 1),
(46, 2, 10, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_actividad`
--

CREATE TABLE `p_actividad` (
  `idactividad` int(11) NOT NULL,
  `idrol` int(11) DEFAULT NULL,
  `id_actividades` varchar(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `cantidadeje` int(11) DEFAULT NULL,
  `observacion` varchar(500) DEFAULT NULL,
  `indjefe` bit(1) DEFAULT NULL,
  `indpersonal` int(11) DEFAULT NULL,
  `usuario` varchar(15) DEFAULT NULL,
  `perfil` varchar(15) DEFAULT NULL,
  `equipo` varchar(15) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuariomod` varchar(15) DEFAULT NULL,
  `perfilmod` varchar(15) DEFAULT NULL,
  `equipomod` varchar(15) DEFAULT NULL,
  `fechamod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `p_actividad`
--

-- INSERT INTO `p_actividad` (`idactividad`, `idrol`, `id_actividades`, `descripcion`, `cantidad`, `cantidadeje`, `observacion`, `indjefe`, `indpersonal`, `usuario`, `perfil`, `equipo`, `fecha`, `usuariomod`, `perfilmod`, `equipomod`, `fechamod`) VALUES
-- (17, 32, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_actividades`
--

CREATE TABLE `p_actividades` (
  `idactividades` int(11) NOT NULL,
  `idservicio` int(11) NOT NULL DEFAULT '0',
  `descripcion` varchar(200) NOT NULL DEFAULT '',
  `estado` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `color` varchar(45) DEFAULT NULL,
  `background` varchar(45) DEFAULT NULL,
  `clase` varchar(45) DEFAULT NULL,
  `clase2` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `p_actividades`
--

-- INSERT INTO `p_actividades` (`idactividades`, `idservicio`, `descripcion`, `estado`, `color`, `background`, `clase`, `clase2`) VALUES
-- (1, 1, 'REGISTRO', 0, NULL, NULL, NULL, NULL),
-- (14, 1, 'HIPERTENSION ARTERIAL NO CONTROLADA', 0, NULL, NULL, NULL, NULL),
-- (15, 3, 'CIRUGIA DE CORAZÃ“N', 0, NULL, NULL, NULL, NULL),
-- (16, 1, 'SERVICIO A', 0, NULL, NULL, NULL, NULL),
-- (17, 1, 'SERVICIO B', 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_area`
--

CREATE TABLE `p_area` (
  `idarea` int(11) NOT NULL,
  `idservicio` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `estado` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `color` varchar(45) DEFAULT NULL,
  `background` varchar(45) DEFAULT NULL,
  `clase` varchar(45) DEFAULT NULL,
  `clase2` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `p_area`
--

INSERT INTO `p_area` (`idarea`, `idservicio`, `descripcion`, `estado`, `color`, `background`, `clase`, `clase2`) VALUES
(1, 1, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(2, 2, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(3, 3, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(4, 4, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(5, 5, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(6, 6, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(7, 7, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(8, 8, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(9, 9, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(10, 10, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(11, 11, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(12, 12, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(13, 13, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(14, 14, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(15, 15, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(16, 16, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(17, 17, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(18, 18, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(19, 19, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(20, 20, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(21, 21, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(22, 22, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(23, 23, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(24, 24, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(25, 25, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(26, 26, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(27, 27, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(28, 28, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(29, 29, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(30, 30, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(31, 31, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(32, 32, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(33, 33, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(34, 34, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(35, 35, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(36, 36, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(37, 37, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(38, 38, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(39, 39, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(40, 40, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(41, 41, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(42, 42, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(43, 43, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(44, 44, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(45, 45, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(46, 46, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(47, 47, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(48, 48, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(49, 49, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(50, 50, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(51, 51, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(52, 52, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(53, 53, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(54, 54, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(55, 55, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(56, 56, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(57, 57, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(58, 58, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(59, 59, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(60, 60, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(61, 61, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(62, 62, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(63, 63, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(64, 64, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(65, 65, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(66, 66, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(67, 67, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(68, 68, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(69, 69, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(70, 70, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(71, 71, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(72, 72, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(73, 73, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(74, 74, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(75, 75, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(76, 76, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(77, 77, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(78, 78, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(79, 79, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(80, 80, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(81, 81, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(82, 82, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(83, 83, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(84, 84, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(85, 85, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(86, 86, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(87, 87, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(88, 88, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(89, 89, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(90, 90, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(91, 91, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(92, 92, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(93, 93, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(94, 94, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(95, 95, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(96, 96, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(97, 97, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(98, 98, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(99, 99, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(100, 100, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(101, 101, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(102, 102, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(103, 103, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(104, 104, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(105, 105, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(106, 106, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(107, 107, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(108, 108, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1'),
(109, 109, 'SIN AREA', 0, 'white', '#62D97D', 'color-1', 'color-1');


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_cargo`
--

CREATE TABLE `p_cargo` (
  `idcargo` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `estado` char(1) NOT NULL,
  `usuario` varchar(15) NOT NULL,
  `perfil` varchar(15) NOT NULL,
  `equipo` varchar(15) NOT NULL,
  `fecha` datetime NOT NULL,
  `usuariomod` varchar(15) DEFAULT NULL,
  `perfilmod` varchar(15) DEFAULT NULL,
  `equipomod` varchar(15) DEFAULT NULL,
  `fechamod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `p_cargo`
--

INSERT INTO `p_cargo` (`idcargo`, `descripcion`, `estado`, `usuario`, `perfil`, `equipo`, `fecha`, `usuariomod`, `perfilmod`, `equipomod`, `fechamod`) VALUES
(1, 'MEDICO', 'A', '71773541', '1', 'PC', '2021-07-04 00:00:00', NULL, NULL, NULL, NULL),
(2, 'DIGITADOR', 'A', '71773541', '2', 'PC', '2021-07-04 00:00:00', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_diassemana`
--

CREATE TABLE `p_diassemana` (
  `iddia` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `p_diassemana`
--

INSERT INTO `p_diassemana` (`iddia`, `nombre`) VALUES
(1, NULL),
(2, NULL),
(3, NULL),
(4, NULL),
(5, NULL),
(6, NULL),
(7, NULL),
(8, NULL),
(9, NULL),
(10, NULL),
(11, NULL),
(12, NULL),
(13, NULL),
(14, NULL),
(15, NULL),
(16, NULL),
(17, NULL),
(18, NULL),
(19, NULL),
(20, NULL),
(21, NULL),
(22, NULL),
(23, NULL),
(24, NULL),
(25, NULL),
(26, NULL),
(27, NULL),
(28, NULL),
(29, NULL),
(30, NULL),
(31, NULL),
(0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_especialidad`
--

CREATE TABLE `p_especialidad` (
  `idespecialidad` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `estado` char(1) DEFAULT NULL,
  `usuario` varchar(15) DEFAULT NULL,
  `perfil` varchar(15) DEFAULT NULL,
  `equipo` varchar(15) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuariomod` varchar(15) DEFAULT NULL,
  `perfilmod` varchar(15) DEFAULT NULL,
  `equipomod` varchar(15) DEFAULT NULL,
  `fechamod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_estadocivil`
--

CREATE TABLE `p_estadocivil` (
  `idestadocivil` int(11) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `p_estadocivil`
--

INSERT INTO `p_estadocivil` (`idestadocivil`, `descripcion`, `estado`) VALUES
(1, 'Soltero', 'A'),
(2, 'Casado', 'A'),
(3, 'Viudo', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_gruporiesgo`
--

CREATE TABLE `p_gruporiesgo` (
  `idgruporiesgo` int(11) NOT NULL,
  `idtipogruporiesgo` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `estado` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `usuario` varchar(15) DEFAULT NULL,
  `perfil` varchar(15) DEFAULT NULL,
  `equipo` varchar(15) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuariomod` varchar(15) DEFAULT NULL,
  `perfilmod` varchar(15) DEFAULT NULL,
  `equipomod` varchar(15) DEFAULT NULL,
  `fechamod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `p_gruporiesgo`
--

INSERT INTO `p_gruporiesgo` (`idgruporiesgo`, `idtipogruporiesgo`, `descripcion`, `estado`, `usuario`, `perfil`, `equipo`, `fecha`, `usuariomod`, `perfilmod`, `equipomod`, `fechamod`) VALUES
(1, 0, '--------SIN GRUPO DE RIESGO--------', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 0, 'EDAD MAYOR A 60 AÃ‘OS', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 0, 'HIPERTENSION ARTERIAL NO CONTROLADA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 0, 'ENFERMEDADES CARDIOVASCULARES GRAVES', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 'CANCÃ‰R', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 0, 'DIABETES MELLITUS', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 0, 'ASMA MODERADA O GRAVE', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 0, 'ENFERMEDAD PULMONAR CRONICA ', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 0, 'INSUFICIENCIA RENAL CRÃ“NICA EN TRATAMIENTO CON HEMODIALISIS', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 'ENFERMEDAD O TRATAMIENTO INMUNOSUPRESOR', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 0, 'OBESIDAD CON IMC DE 40 A MAS', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 0, 'GESTACIÃ“N', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_horaingreso`
--

CREATE TABLE `p_horaingreso` (
  `idhoraingreso` int(10) UNSIGNED NOT NULL,
  `idturno` int(10) UNSIGNED NOT NULL,
  `idhora` int(10) UNSIGNED NOT NULL,
  `idestado` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `p_horaingreso`
--

INSERT INTO `p_horaingreso` (`idhoraingreso`, `idturno`, `idhora`, `idestado`) VALUES
(1, 1, 2, 0),
(2, 2, 7, 0),
(3, 3, 2, 0),
(4, 3, 7, 0),
(5, 4, 2, 0),
(7, 5, 5, 0),
(8, 6, 2, 0),
(10, 7, 2, 0),
(12, 1, 1, 0),
(13, 2, 6, 0),
(17, 5, 4, 0),
(6, 4, 3, 0),
(9, 6, 3, 0),
(11, 7, 3, 0),
(14, 4, 1, 0),
(15, 5, 1, 0),
(16, 6, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_horas`
--

CREATE TABLE `p_horas` (
  `idhora` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(5) NOT NULL,
  `idestado` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `p_horas`
--

INSERT INTO `p_horas` (`idhora`, `nombre`, `idestado`) VALUES
(1, '07:00', 0),
(2, '08:00', 0),
(3, '09:00', 0),
(4, '13:00', 0),
(5, '14:00', 0),
(6, '19:00', 0),
(7, '20:00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_menu`
--

CREATE TABLE `p_menu` (
  `idmenu` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `referencia` varchar(45) NOT NULL,
  `idestado` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `idmenusub` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `etiqueta` varchar(2000) NOT NULL,
  `etiquetaActiva` varchar(2000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `p_menu`
--

INSERT INTO `p_menu` (`idmenu`, `descripcion`, `referencia`, `idestado`, `idmenusub`, `etiqueta`, `etiquetaActiva`) VALUES
(1, 'Principal', './principal.php', 1, 0, '<li class=\"nav-item\">\r\n	<a href=\"./principalf.php\" class=\"nav-link\">\r\n		<i class=\"nav-icon fa fa-home\"></i>\r\n		<p> Principal\r\n                </p>\r\n	</a>\r\n</li>', '<li class=\"nav-item\">\r\n	<a href=\"./principalf.php\" class=\"nav-link  active\">\r\n		<i class=\"nav-icon fa fa-home\"></i>\r\n		<p> Principal\r\n                </p>\r\n	</a>\r\n</li>'),
(2, 'Programacion', './programacionf.php', 1, 0, '<li class=\"nav-item\">\r\n	<a href=\"./programacionf.php\" class=\"nav-link\">\r\n		<i class=\"nav-icon far fa-calendar-alt\"></i>\r\n		<p> Programacion\r\n                </p>\r\n	</a>\r\n</li>', '<li class=\"nav-item\">\r\n	<a href=\"./programacionf.php\" class=\"nav-link  active\">\r\n		<i class=\"nav-icon far fa-calendar-alt\"></i>\r\n		<p> Programacion\r\n                </p>\r\n	</a>\r\n</li>'),
(3, 'Personal', './personalf.php', 1, 0, '<li class=\"nav-item\">\r\n	<a href=\"./personalf.php\" class=\"nav-link\">\r\n		<i class=\"nav-icon fa fa-users\"></i>\r\n		<p> Personal\r\n                </p>\r\n	</a>\r\n</li>', '<li class=\"nav-item\">\r\n	<a href=\"./personalf.php\" class=\"nav-link  active\">\r\n		<i class=\"nav-icon fa fa-users\"></i>\r\n		<p> Personal\r\n                </p>\r\n	</a>\r\n</li>'),
(4, 'Actividad', './actividad.php', 1, 0, '<li class=\"nav-item\">\r\n	<a href=\"./actividad3f.php\" class=\"nav-link\">\r\n		<i class=\"nav-icon fa fa-list-ul\"></i>\r\n		<p> Actividad\r\n                </p>\r\n	</a>\r\n</li>', '<li class=\"nav-item\">\r\n	<a href=\"./actividad3f.php\" class=\"nav-link  active\">\r\n		<i class=\"nav-icon fa fa-list-ul\"></i>\r\n		<p> Actividad\r\n                </p>\r\n	</a>\r\n</li>'),
(5, 'Mantenimiento', './mantenimiento.php', 1, 1, '<li class=\"nav-item has-treeview\">\r\n<a href=\"#\" class=\"nav-link\">\r\n<i class=\"nav-icon fa fa-cogs\"></i>\r\n<p>Mantenimiento<i class=\"fas fa-angle-left right\"></i></p></a>\r\n<ul class=\"nav nav-treeview\" style=\"display: none;\">\r\n<li class=\"nav-item\"><a href=\"./departamentof.php\" class=\"nav-link\"><i class=\"nav-icon far fa-building\"></i><p>Departamentos</p></a></li>\r\n<li class=\"nav-item\"><a href=\"./serviciof.php\" class=\"nav-link\"><i class=\"nav-icon fas fa-user-md\"></i><p>Servicios</p></a></li>\r\n<li class=\"nav-item\"><a href=\"./areasf.php\" class=\"nav-link\"><i class=\"nav-icon fas fa-desktop\"></i><p>Areas</p></a></li>\r\n<li class=\"nav-item\"><a href=\"./mantenimientof.php\" class=\"nav-link\"><i class=\"nav-icon fas fa-briefcase\"></i><p> Puesto de Trabajo</p></a></li>\r\n<li class=\"nav-item\"><a href=\"./grupoRiesgof.php\" class=\"nav-link\"><i class=\"nav-icon fas fa-briefcase-medical\"></i><p> Grupo de Riesgo</p></a></li>\r\n<li class=\"nav-item\"><a href=\"./perfilesf.php\" class=\"nav-link\"><i class=\"nav-icon fas fa-user\"></i><p> Usuarios</p></a></li>', '<li class=\"nav-item has-treeview\">\r\n<a href=\"#\" class=\"nav-link\">\r\n<i class=\"nav-icon fa fa-cogs\"></i>\r\n<p>Mantenimiento<i class=\"fas fa-angle-left right\"></i></p></a>\r\n<ul class=\"nav nav-treeview\" style=\"display: none;\">\r\n<li class=\"nav-item\"><a href=\"./departamentof.php\" class=\"nav-link\"><i class=\"nav-icon far fa-building\"></i><p>Departamentos</p></a></li>\r\n<li class=\"nav-item\"><a href=\"./serviciof.php\" class=\"nav-link\"><i class=\"nav-icon fas fa-user-md\"></i><p>Servicios</p></a></li>\r\n<li class=\"nav-item\"><a href=\"./areasf.php\" class=\"nav-link\"><i class=\"nav-icon fas fa-desktop\"></i><p>Areas</p></a></li>\r\n<li class=\"nav-item\"><a href=\"./mantenimientof.php\" class=\"nav-link\"><i class=\"nav-icon fas fa-briefcase\"></i><p> Puesto de Trabajo</p></a></li>\r\n<li class=\"nav-item\"><a href=\"./grupoRiesgof.php\" class=\"nav-link\"><i class=\"nav-icon fas fa-briefcase-medical\"></i><p> Grupo de Riesgo</p></a></li>\r\n<li class=\"nav-item\"><a href=\"./perfilesf.php\" class=\"nav-link\"><i class=\"nav-icon fas fa-user\"></i><p> Usuarios</p></a></li>'),
(9, 'Actividades', './actividadesf.php', 1, 0, '<li class=\"nav-item\">\r\n                 <a href=\"./actividadesf.php\" class=\"nav-link\">\r\n<i class=\"nav-icon fas far fa-list-alt\"></i><p> Actividades</p></a></li>', '<li class=\"nav-item\">\r\n                 <a href=\"./actividadesf.php\" class=\"nav-link active\">\r\n<i class=\"nav-icon fas far fa-list-alt\"></i><p> Actividades</p></a></li>'),
(6, 'Planilla GR', './planillaf.php', 1, 0, '<li class=\"nav-item\">\r\n	<a href=\"./planillaf.php\" class=\"nav-link\">\r\n		<i class=\"nav-icon fa fa-map\"></i>\r\n		<p> Planilla GR\r\n                </p>\r\n	</a>\r\n</li>', '<li class=\"nav-item\">\r\n	<a href=\"./planillaf.php\" class=\"nav-link  active\">\r\n		<i class=\"nav-icon fa fa-map\"></i>\r\n		<p> Planilla GR\r\n                </p>\r\n	</a>\r\n</li>'),
(7, 'Reporte Programacion', './reportef.php', 1, 0, '<li class=\"nav-item\">\r\n	<a href=\"./reportef.php\" class=\"nav-link\">\r\n		<i class=\"nav-icon fas fa-file-signature\"></i>\r\n		<p> Reporte Programacion\r\n                </p>\r\n	</a>\r\n</li>', '<li class=\"nav-item\">\r\n	<a href=\"./reportef.php\" class=\"nav-link\">\r\n		<i class=\"nav-icon fas fa-file-signature\"></i>\r\n		<p> Reporte Programacion\r\n                </p>\r\n	</a>\r\n</li>'),
(8, 'Reporte Actividad', './reporteActividadf.php', 1, 0, '<li class=\"nav-item\">\r\n	<a href=\"./reporteActividadf.php\" class=\"nav-link\">\r\n		<i class=\"nav-icon fas fa-file-signature\"></i>\r\n		<p> Reporte Actividad\r\n                </p>\r\n	</a>\r\n</li>', '<li class=\"nav-item\">\r\n	<a href=\"./reporteActividadf.php\" class=\"nav-link\">\r\n		<i class=\"nav-icon fas fa-file-signature\"></i>\r\n		<p> Reporte Actividad\r\n                </p>\r\n	</a>\r\n</li>'),
(10, 'Reporte Actividades Departamento', './reporteActividades.php', 1, 0, '<li class=\"nav-item\">\r\n	<a href=\"./reporteActividades.php\" class=\"nav-link\">\r\n	<i class=\"nav-icon fas fa-file-signature\"></i>	\r\n		<p> Reporte Actividades Dep.\r\n                </p>\r\n	</a>\r\n</li>', '<li class=\"nav-item\">\r\n	<a href=\"./reporteActividades.php\" class=\"nav-link  active\">\r\n		<i class=\"nav-icon fas fa-file-signature\"></i>\r\n		<p> Reporte Actividades Dep.\r\n                </p>\r\n	</a>\r\n</li>');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_perfil`
--

CREATE TABLE `p_perfil` (
  `idperfil` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `p_perfil`
--

INSERT INTO `p_perfil` (`idperfil`, `descripcion`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'JEFE DE DEPARTAMENTO'),
(3, 'JEFE DE SERVICIO'),
(4, 'SECRETARIA'),
(5, 'PERSONAL ASISTENCIAL'),
(6, 'PERSONAL ADMINISTRATIVO'),
(7, 'ADMINISTRADOR DE PERSONAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_personal`
--

CREATE TABLE `p_personal` (
  `idpersona` int(11) NOT NULL,
  `idplaza` int(11) NOT NULL,
  `tipoplaza` int(11) DEFAULT NULL,
  `apellidopaterno` varchar(200) NOT NULL,
  `apellidomaterno` varchar(200) NOT NULL,
  `primernombre` varchar(200) NOT NULL,
  `segundonombre` varchar(200) DEFAULT NULL,
  `nombrecompleto` varchar(500) NOT NULL,
  `tipodocumento` int(11) NOT NULL,
  `nrodocumento` varchar(12) NOT NULL,
  `fechanacimiento` datetime NOT NULL,
  `idsexo` int(11) NOT NULL,
  `idestadocivil` int(11) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `ruc` varchar(11) NOT NULL,
  `idpuestotrabajo` int(11) DEFAULT NULL,
  `fechaingreso` datetime DEFAULT NULL,
  `estado` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `idarea` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `p_personal`
--

-- INSERT INTO `p_personal` (`idpersona`, `idplaza`, `tipoplaza`, `apellidopaterno`, `apellidomaterno`, `primernombre`, `segundonombre`, `nombrecompleto`, `tipodocumento`, `nrodocumento`, `fechanacimiento`, `idsexo`, `idestadocivil`, `direccion`, `ruc`, `idpuestotrabajo`, `fechaingreso`, `estado`, `idarea`) VALUES
-- (12, 1, 1, 'TRUJILLO', 'IDONES', 'JUNIOR', 'DEYVI', 'TRUJILLO IDONES JUNIOR DEYVI', 1, '12345678', '2022-02-01 00:00:00', 1, 1, 'AV SAN IGNACIO DE LOYOLA 500', '', NULL, NULL, 0, 0),
-- (13, 2, 2, 'PEREZ', 'BRITO', 'JUAN', 'JOSE', 'PEREZ BRITO JUAN JOSE', 2, '13213131313', '2022-02-07 00:00:00', 1, 2, 'AV SAN MARINO CALLE 5000', '13123131313', NULL, NULL, 0, 0),
-- (14, 3, 1, 'BALADAN', 'GUZMAN', 'FELIPE', 'DAVID', 'BALADAN GUZMAN FELIPE DAVID', 1, '12313133', '2022-02-07 00:00:00', 1, 3, 'AV LA MOLINA 500', '1313131313', NULL, NULL, 0, 0);
INSERT INTO p_personal (idpersona,idplaza,tipoplaza, apellidopaterno, apellidomaterno, primernombre, segundonombre, nombrecompleto, tipodocumento, nrodocumento, fechanacimiento, idsexo, idestadocivil, direccion, ruc, idpuestotrabajo, fechaingreso, estado,idarea) VALUES (
1,980068,1,'ABREGU','ESPINOZA','LUCIO','AQUELINO','ABREGU ESPINOZA LUCIO AQUELINO',1,'25640921','1956-10-19 00:00:00',1,1,'','',NULL,'2011-04-01 00:00:00',0,0),(
2,098389,1,'ACERO','TUCO','MERCEDES',NULL,'ACERO TUCO MERCEDES',1,'08148281','1961-02-22 00:00:00',2,1,'','',NULL,'1989-12-15 00:00:00',0,0),(
3,117448,1,'ACOSTA','RODRIGUEZ','LEYLA','MARIFE','ACOSTA RODRIGUEZ LEYLA MARIFE',1,'07707129','1963-04-08 00:00:00',2,1,'','',NULL,'1990-12-13 00:00:00',0,0),(
4,980493,1,'ACOSTA','VARGAS','LUCRECIA','JOSELYN','ACOSTA VARGAS LUCRECIA JOSELYN',1,'41596956','1982-03-23 00:00:00',2,1,'','',NULL,'2018-01-16 00:00:00',0,0),(
5,800914,1,'ACUNA','MURILLO','MARIA','ELIZABETH','ACUNA MURILLO MARIA ELIZABETH',1,'08683107','1969-02-13 00:00:00',2,1,'','',NULL,'1999-06-01 00:00:00',0,0),(
6,980058,1,'ADAMA','ROSALES','ZULMA','NELSA','ADAMA ROSALES ZULMA NELSA',1,'21133901','1974-01-06 00:00:00',2,1,'','',NULL,'2011-04-01 00:00:00',0,0),(
7,049554,1,'ADAUTO','GABRIEL','NELY','ROSA','ADAUTO GABRIEL NELY ROSA',1,'10463790','1966-06-07 00:00:00',2,1,'','',NULL,'1994-08-01 00:00:00',0,0),(
8,960348,1,'ADRIANZEN','RODRIGUEZ','MARCO','ANTONIO','ADRIANZEN RODRIGUEZ MARCO ANTONIO',1,'46627760','1990-11-02 00:00:00',1,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
9,101784,1,'AEDO','BRANES','SILVIA','ROSA','AEDO BRANES SILVIA ROSA',1,'07384551','1961-08-03 00:00:00',2,1,'','',NULL,'1990-05-25 00:00:00',0,0),(
10,950120,1,'AGREDA','GAMBOA','NEDA','GEOVANNY','AGREDA GAMBOA NEDA GEOVANNY',1,'18085460','1971-05-27 00:00:00',2,1,'','',NULL,'2017-07-01 00:00:00',0,0),(
11,960387,1,'AGUILA','QUINTO','MONICA','DEL PILAR','AGUILA QUINTO MONICA DEL PILAR',1,'45120798','1988-03-29 00:00:00',2,1,'','',NULL,'2020-12-01 00:00:00',0,0),(
12,980418,1,'AGUILAR','CAMACHO','ROXANA','JUSTA','AGUILAR CAMACHO ROXANA JUSTA',1,'15754526','1972-12-20 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
13,980044,1,'AGUILAR','COLLANTES','GABY','MARITZA','AGUILAR COLLANTES GABY MARITZA',1,'09793977','1973-03-31 00:00:00',2,1,'','',NULL,'2010-07-05 00:00:00',0,0),(
14,960354,1,'AGUILAR','CONDE','MARIELA',NULL,'AGUILAR CONDE MARIELA',1,'47643547','1988-12-12 00:00:00',2,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
15,049258,1,'AGUILAR','PANTOJA','ELIANA','ESPERANZA','AGUILAR PANTOJA ELIANA ESPERANZA',1,'08522039','1957-04-24 00:00:00',2,1,'','',NULL,'1980-12-01 00:00:00',0,0),(
16,049502,1,'AGUIRRE','ACOSTA DE MAYMA','VICKY','ANDREA','AGUIRRE ACOSTA DE MAYMA VICKY ANDREA',1,'06230447','1960-03-22 00:00:00',2,1,'','',NULL,'1981-08-14 00:00:00',0,0),(
17,099866,1,'AGUIRRE','LEGUA','MIGUEL','ANGEL','AGUIRRE LEGUA MIGUEL ANGEL',1,'07004022','1963-04-22 00:00:00',1,1,'','',NULL,'1996-01-01 00:00:00',0,0),(
18,800424,1,'AGUIRRE','SOSA','ILDAURO',NULL,'AGUIRRE SOSA ILDAURO',1,'06899190','1961-10-15 00:00:00',1,1,'','',NULL,'1996-02-23 00:00:00',0,0),(
19,049429,1,'AGURTO','ZAPATA','WINI','MARITZA','AGURTO ZAPATA WINI MARITZA',1,'08784626','1953-01-24 00:00:00',2,1,'','',NULL,'1984-04-01 00:00:00',0,0),(
20,049260,1,'AIDA','KANASHIRO','ROSA','BERTHA','AIDA KANASHIRO ROSA BERTHA',1,'06097356','1960-12-25 00:00:00',2,1,'','',NULL,'1988-12-01 00:00:00',0,0),(
21,980354,1,'AJAHUANA','MEDINA','YOLANDA','MARISOL','AJAHUANA MEDINA YOLANDA MARISOL',1,'43804563','1986-05-21 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
22,049504,1,'ALAMO','BECERRA','OLGA',NULL,'ALAMO BECERRA OLGA',1,'10257773','1958-11-16 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
23,049293,1,'ALBORNOZ','CHAVEZ','JACINTA','SARA','ALBORNOZ CHAVEZ JACINTA SARA',1,'09208509','1963-12-11 00:00:00',2,1,'','',NULL,'1991-12-31 00:00:00',0,0),(
24,980069,1,'ALCANTARA','ULLOA','GUILLERMO',NULL,'ALCANTARA ULLOA GUILLERMO',1,'06899434','1958-09-16 00:00:00',1,1,'','',NULL,'2011-04-01 00:00:00',0,0),(
25,049507,1,'ALCARRAZ','CARBAJAL','ANA','MERCEDES','ALCARRAZ CARBAJAL ANA MERCEDES',1,'07060206','1962-09-12 00:00:00',2,1,'','',NULL,'1988-12-31 00:00:00',0,0),(
26,980001,1,'ALCAZAR','QUIRICA','NOEMI','RACHELL','ALCAZAR QUIRICA NOEMI RACHELL',1,'25508419','1964-07-29 00:00:00',2,1,'','',NULL,'2008-02-01 00:00:00',0,0),(
27,980270,1,'ALFARO','DE LA CRUZ','JULIA','MARITZA','ALFARO DE LA CRUZ JULIA MARITZA',1,'20564995','1970-10-03 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
28,980051,1,'ALFARO','MORALES','MILA','YOLANDA','ALFARO MORALES MILA YOLANDA',1,'28262679','1966-06-18 00:00:00',2,1,'','',NULL,'2010-09-17 00:00:00',0,0),(
29,980470,1,'ALIAGA','CARDENAS','NATALY',NULL,'ALIAGA CARDENAS NATALY',1,'46723366','1991-01-20 00:00:00',2,1,'','',NULL,'2018-02-01 00:00:00',0,0),(
30,049268,1,'ALIAGA','ORDONEZ','LUCY','JUANA','ALIAGA ORDONEZ LUCY JUANA',1,'10455742','1962-08-10 00:00:00',2,1,'','',NULL,'1991-12-31 00:00:00',0,0),(
31,049262,1,'ALIAGA','QUINTANA','CARMEN','SOFIA','ALIAGA QUINTANA CARMEN SOFIA',1,'07525955','1960-09-10 00:00:00',2,1,'','',NULL,'1983-11-01 00:00:00',0,0),(
32,049509,1,'ALLEMANT','SANCARRANCO','JANET','DELFINA','ALLEMANT SANCARRANCO JANET DELFINA',1,'07391464','1953-11-26 00:00:00',2,1,'','',NULL,'1980-12-01 00:00:00',0,0),(
33,049510,1,'ALOR','PACORA','NILDA','NATALIA','ALOR PACORA NILDA NATALIA',1,'10394008','1959-09-28 00:00:00',2,1,'','',NULL,'1981-10-01 00:00:00',0,0),(
34,049511,1,'ALTAMIRANO','HERRERA DE ANGELES','DELIA',NULL,'ALTAMIRANO HERRERA DE ANGELES DELIA',1,'06218285','1953-09-05 00:00:00',2,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
35,980151,1,'ALTAMIRANO','PALACIOS','ALACIEL','MILA','ALTAMIRANO PALACIOS ALACIEL MILA',1,'09894575','1974-02-26 00:00:00',2,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
36,049512,1,'ALTAMIRANO','ROJAS','INGRID','VITALINA','ALTAMIRANO ROJAS INGRID VITALINA',1,'06800755','1958-06-14 00:00:00',2,1,'','',NULL,'1988-01-01 00:00:00',0,0),(
37,049515,1,'ALVARADO','CIRILO','FERNANDO','DAVID','ALVARADO CIRILO FERNANDO DAVID',1,'07962249','1957-02-19 00:00:00',1,1,'','',NULL,'1984-11-16 00:00:00',0,0),(
38,970090,1,'ALVARADO','TECCO','ANGELA','MARLENI','ALVARADO TECCO ANGELA MARLENI',1,'22521525','1977-12-01 00:00:00',2,1,'','',NULL,'2016-08-16 00:00:00',0,0),(
39,980526,1,'ALVAREZ','ROMERO','DIANA','LUCIA','ALVAREZ ROMERO DIANA LUCIA',1,'44120929','1987-03-07 00:00:00',2,1,'','',NULL,'2018-12-28 00:00:00',0,0),(
40,049520,1,'ALVAREZ','SANTIAGO','JOSE','ENRIQUE','ALVAREZ SANTIAGO JOSE ENRIQUE',1,'07747322','1967-07-05 00:00:00',1,1,'','',NULL,'1988-09-01 00:00:00',0,0),(
41,980419,1,'AMBICHO','DA CRUZ','MONICA','BRIGGEETH','AMBICHO DA CRUZ MONICA BRIGGEETH',1,'43961000','1986-12-21 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
42,049522,1,'AMEZ','FALCON','ZOYLA','ESPERANZA','AMEZ FALCON ZOYLA ESPERANZA',1,'08808305','1956-05-10 00:00:00',2,1,'','',NULL,'1981-09-28 00:00:00',0,0),(
43,049265,1,'AMOROS','CORTES','AUGUSTO','CESAR','AMOROS CORTES AUGUSTO CESAR',1,'07243675','1951-12-12 00:00:00',1,1,'','',NULL,'1980-01-01 00:00:00',0,0),(
44,049503,1,'AMPUERO','SALAZAR','CARMEN','LUZ','AMPUERO SALAZAR CARMEN LUZ',1,'08094031','1956-04-17 00:00:00',2,1,'','',NULL,'1995-01-01 00:00:00',0,0),(
45,049523,1,'ANACLETO','DE LA CRUZ','EMILIO','ROMAN','ANACLETO DE LA CRUZ EMILIO ROMAN',1,'08530421','1964-05-21 00:00:00',1,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
46,980420,1,'ANDRES','BENITES','TIFFANY','BRISSETTE','ANDRES BENITES TIFFANY BRISSETTE',1,'46580721','1990-06-22 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
47,116343,1,'ANDRES','TENASOA','FLOR','MERCEDES','ANDRES TENASOA FLOR MERCEDES',1,'09475492','1968-09-24 00:00:00',2,1,'','',NULL,'2003-08-01 00:00:00',0,0),(
48,049525,1,'ANGELES','FELIPE','ANGELICA','JUANA','ANGELES FELIPE ANGELICA JUANA',1,'06751841','1966-08-25 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
49,949990,1,'ANGELES','GARCIA','MIGUEL','ALEJANDRO','ANGELES GARCIA MIGUEL ALEJANDRO',1,'32869795','1967-03-17 00:00:00',1,1,'','',NULL,'2004-12-11 00:00:00',0,0),(
50,980188,1,'ANGULO','VALDERRAMA','DIANA','KARIM','ANGULO VALDERRAMA DIANA KARIM',1,'40169238','1979-04-01 00:00:00',2,1,'','',NULL,'2014-02-01 00:00:00',0,0),(
51,970058,1,'ANTEZANA','BENDEZU','MARTHA','ASUNCION','ANTEZANA BENDEZU MARTHA ASUNCION',1,'00837496','1962-02-23 00:00:00',2,1,'','',NULL,'2021-01-01 00:00:00',0,0),(
52,960374,1,'APARICIO','ARAGON','YULIANA','MILAGROS','APARICIO ARAGON YULIANA MILAGROS',1,'45538763','1988-09-18 00:00:00',2,1,'','',NULL,'2020-12-01 00:00:00',0,0),(
53,800435,1,'APAZA','MAMANI','FLOR','DE MARIA','APAZA MAMANI FLOR DE MARIA',1,'29587007','1968-05-01 00:00:00',2,1,'','',NULL,'1995-12-31 00:00:00',0,0),(
54,980487,1,'APAZA','MAMANI','ROSI','IBERI','APAZA MAMANI ROSI IBERI',1,'41474176','1982-07-12 00:00:00',2,1,'','',NULL,'2018-02-01 00:00:00',0,0),(
55,089753,1,'APONTE','AVENDANO','JAVIER','DANIEL','APONTE AVENDANO JAVIER DANIEL',1,'09049741','1965-02-23 00:00:00',1,1,'','',NULL,'1988-12-31 00:00:00',0,0),(
56,049527,1,'APONTE','AVENDANO','LUZ','ELENA','APONTE AVENDANO LUZ ELENA',1,'07145935','1966-04-18 00:00:00',2,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
57,049528,1,'APONTE','LOPEZ DE CARRERA','MARICRUZ',NULL,'APONTE LOPEZ DE CARRERA MARICRUZ',1,'08083377','1958-11-30 00:00:00',2,1,'','',NULL,'1981-06-01 00:00:00',0,0),(
58,980297,1,'AQUINO','AQUINO','RONAL','HAMILTON','AQUINO AQUINO RONAL HAMILTON',1,'42231387','1982-06-11 00:00:00',1,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
59,980095,1,'AQUINO','OSORIO','LUPE','ELIZABETH','AQUINO OSORIO LUPE ELIZABETH',1,'09363061','1969-06-19 00:00:00',2,1,'','',NULL,'2012-07-01 00:00:00',0,0),(
60,980537,1,'AQUINO','RAFAEL','ELY','VERONICA','AQUINO RAFAEL ELY VERONICA',1,'45821034','1989-03-13 00:00:00',2,1,'','',NULL,'2019-01-15 00:00:00',0,0),(
61,980136,1,'ARA','CESPEDES','MARTIN','MIGUEL','ARA CESPEDES MARTIN MIGUEL',1,'07631082','1973-09-11 00:00:00',1,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
62,049531,1,'ARANA','TAPIA','HECTOR','JAIME','ARANA TAPIA HECTOR JAIME',1,'07869497','1959-02-19 00:00:00',1,1,'','',NULL,'1988-12-31 00:00:00',0,0),(
63,949993,1,'ARANDA','ALBERTO','MERY','YANET','ARANDA ALBERTO MERY YANET',1,'08126414','1968-03-21 00:00:00',2,1,'','',NULL,'2004-12-11 00:00:00',0,0),(
64,950098,1,'ARANDA','GUILLEN','REYNA','ELVIRA MARTINA','ARANDA GUILLEN REYNA ELVIRA MARTINA',1,'31676134','1964-03-22 00:00:00',2,1,'','',NULL,'2009-01-01 00:00:00',0,0),(
65,089756,1,'ARANZAMENDI','NAZARIO','JUAN','DAVID','ARANZAMENDI NAZARIO JUAN DAVID',1,'06779614','1971-10-22 00:00:00',1,1,'','',NULL,'1988-12-31 00:00:00',0,0),(
66,049534,1,'ARANZAMENDI','QUISPE','DOMITILA',NULL,'ARANZAMENDI QUISPE DOMITILA',1,'09890499','1952-09-10 00:00:00',2,1,'','',NULL,'1988-12-31 00:00:00',0,0),(
67,980536,1,'ARAPA','HALLASI','LUIS','ALFREDO','ARAPA HALLASI LUIS ALFREDO',1,'46636969','1990-08-07 00:00:00',1,1,'','',NULL,'2019-01-15 00:00:00',0,0),(
68,949991,1,'ARAUCO','CONDE','MERCEDES','JENNY','ARAUCO CONDE MERCEDES JENNY',1,'09872328','1973-07-15 00:00:00',2,1,'','',NULL,'2004-12-11 00:00:00',0,0),(
69,049535,1,'ARAUJO','APACLLA','LUZ','MATILDE','ARAUJO APACLLA LUZ MATILDE',1,'06917894','1952-01-26 00:00:00',2,1,'','',NULL,'1984-11-01 00:00:00',0,0),(
70,990174,1,'ARAUJO','JAUREGUI','ANDRES','CESAR','ARAUJO JAUREGUI ANDRES CESAR',1,'43362221','1985-11-01 00:00:00',1,1,'','',NULL,'2019-12-01 00:00:00',0,0),(
71,049536,1,'ARBAIZA','HUARANGA','BERNA','VICTORIA','ARBAIZA HUARANGA BERNA VICTORIA',1,'10582323','1966-01-12 00:00:00',2,1,'','',NULL,'1988-12-31 00:00:00',0,0),(
72,980120,1,'ARCE','BENITES','MIGUEL','ANGEL','ARCE BENITES MIGUEL ANGEL',1,'10342588','1975-10-18 00:00:00',1,1,'','',NULL,'2012-12-13 00:00:00',0,0),(
73,049538,1,'ARDILES','CORNEJO','RICARDO','FELIX','ARDILES CORNEJO RICARDO FELIX',1,'06192315','1959-02-21 00:00:00',1,1,'','',NULL,'1981-06-26 00:00:00',0,0),(
74,049539,1,'ARDILES','VILLEGAS','LUZ','DEL CARMEN','ARDILES VILLEGAS LUZ DEL CARMEN',1,'06185149','1962-07-12 00:00:00',2,1,'','',NULL,'1988-01-01 00:00:00',0,0),(
75,980278,1,'ARELLANO','IPANAMA','EVILA',NULL,'ARELLANO IPANAMA EVILA',1,'42298623','1984-04-06 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
76,098414,1,'ARELLANO','VASQUEZ','NELLY','GABRIELA','ARELLANO VASQUEZ NELLY GABRIELA',1,'08664888','1967-02-10 00:00:00',2,1,'','',NULL,'1989-12-31 00:00:00',0,0),(
77,800871,1,'ARGOTE','CARNERO','LAURA','AMELIA','ARGOTE CARNERO LAURA AMELIA',1,'07207208','1956-04-20 00:00:00',2,1,'','',NULL,'1986-12-01 00:00:00',0,0),(
78,049541,1,'ARIMBORGO','ARRIETA','CESAR','OSWALDO','ARIMBORGO ARRIETA CESAR OSWALDO',1,'09159153','1954-12-23 00:00:00',1,1,'','',NULL,'1973-04-01 00:00:00',0,0),(
79,101787,1,'ARIZAGA','PELAEZ','MERCEDES','ALICIA','ARIZAGA PELAEZ MERCEDES ALICIA',1,'06214336','1955-11-14 00:00:00',2,1,'','',NULL,'1990-05-25 00:00:00',0,0),(
80,980250,1,'ARMAS','ARANDA','DARIELA','EDITH','ARMAS ARANDA DARIELA EDITH',1,'09922919','1972-09-30 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
81,800432,1,'ARMAS','VILA','JOSE','GUILLERMO','ARMAS VILA JOSE GUILLERMO',1,'08202644','1962-01-27 00:00:00',1,1,'','',NULL,'1996-01-23 00:00:00',0,0),(
82,949994,1,'ARONES','CASTRO','FELICIANO',NULL,'ARONES CASTRO FELICIANO',1,'07049522','1964-02-02 00:00:00',1,1,'','',NULL,'2004-12-11 00:00:00',0,0),(
83,049270,1,'AROSTEGUI','SANCHEZ','ROSALUZ','ANGELICA','AROSTEGUI SANCHEZ ROSALUZ ANGELICA',1,'08239393','1953-04-29 00:00:00',2,1,'','',NULL,'1983-04-01 00:00:00',0,0),(
84,980421,1,'ARROYO','FERNANDEZ','SHARON','LILIANA','ARROYO FERNANDEZ SHARON LILIANA',1,'10623792','1977-12-08 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
85,980237,1,'ARTEAGA','MENDOZA','MARIA','MAGDALENA','ARTEAGA MENDOZA MARIA MAGDALENA',1,'15847628','1976-04-04 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
86,980028,1,'ARTEAGA','NUNEZ','CLAUDIA','ANGELA','ARTEAGA NUNEZ CLAUDIA ANGELA',1,'02440442','1976-04-06 00:00:00',2,1,'','',NULL,'2010-07-05 00:00:00',0,0),(
87,049544,1,'ARTEAGA','VERA','GLORIA','AMANDA','ARTEAGA VERA GLORIA AMANDA',1,'09223317','1955-07-18 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
88,049856,1,'ASALDE','SANCHEZ','DANIEL','DE LOS SANTOS','ASALDE SANCHEZ DANIEL DE LOS SANTOS',1,'07760410','1960-11-01 00:00:00',1,1,'','',NULL,'1995-01-01 00:00:00',0,0),(
89,980321,1,'ASAN','VELASQUEZ','MARIA','DEL PILAR','ASAN VELASQUEZ MARIA DEL PILAR',1,'40915104','1981-04-03 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
90,980416,1,'ASCA','CASTREJON','JULIO','CESAR','ASCA CASTREJON JULIO CESAR',1,'40599823','1976-12-30 00:00:00',1,1,'','',NULL,'2013-07-15 00:00:00',0,0),(
91,800845,1,'ASCA','NAKAMATSU','SUSANA',NULL,'ASCA NAKAMATSU SUSANA',1,'07686215','1968-07-22 00:00:00',2,1,'','',NULL,'1998-01-01 00:00:00',0,0),(
92,980422,1,'ASCONA','BRICENO','ADITA','ROSARIO','ASCONA BRICENO ADITA ROSARIO',1,'42939748','1985-02-15 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
93,980112,1,'ASENCIOS','PICON','SERAPIA','BENERANDA','ASENCIOS PICON SERAPIA BENERANDA',1,'32296824','1968-11-14 00:00:00',2,1,'','',NULL,'2012-07-01 00:00:00',0,0),(
94,980012,1,'ASMAT','BAUTISTA','GLORIA','ELIZABETH','ASMAT BAUTISTA GLORIA ELIZABETH',1,'25430303','1966-05-19 00:00:00',2,1,'','',NULL,'2008-02-01 00:00:00',0,0),(
95,980256,1,'ASTOCONDOR','ALANIA','MARIA','ELENA','ASTOCONDOR ALANIA MARIA ELENA',1,'09433829','1968-10-28 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
96,980285,1,'ASTUHUAMAN','ALIAGA','MARCO','ANTONIO','ASTUHUAMAN ALIAGA MARCO ANTONIO',1,'40961052','1980-09-16 00:00:00',1,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
97,049546,1,'ATAURIMA','RAMOS','FLOR','ELVIRA','ATAURIMA RAMOS FLOR ELVIRA',1,'06091356','1966-01-08 00:00:00',2,1,'','',NULL,'1987-12-15 00:00:00',0,0),(
98,980412,1,'AUQUI','SOLIS','FLOR','DE MARIA','AUQUI SOLIS FLOR DE MARIA',1,'40699377','1980-09-23 00:00:00',2,1,'','',NULL,'2016-11-01 00:00:00',0,0),(
99,800847,1,'AVILA','CARRION','NERIDA','ALEJANDRA','AVILA CARRION NERIDA ALEJANDRA',1,'10584545','1968-04-26 00:00:00',2,1,'','',NULL,'1998-01-01 00:00:00',0,0),(
100,960328,1,'AYALA','ESPINOZA','SHIRLEY','ANGELA','AYALA ESPINOZA SHIRLEY ANGELA',1,'70757025','1991-07-01 00:00:00',2,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
101,049548,1,'AYALA','PRADO','ALFREDO',NULL,'AYALA PRADO ALFREDO',1,'07085944','1965-11-14 00:00:00',1,1,'','',NULL,'1985-01-02 00:00:00',0,0),(
102,980413,1,'AYLLON','FIERRO','ELIDA',NULL,'AYLLON FIERRO ELIDA',1,'19812756','1962-08-23 00:00:00',2,1,'','',NULL,'2017-01-01 00:00:00',0,0),(
103,049549,1,'AYULO','JARA','LUIS','OCTAVIO','AYULO JARA LUIS OCTAVIO',1,'06221826','1963-08-07 00:00:00',1,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
104,960357,1,'AZURIN','SALAZAR','JOHN','CARLOS','AZURIN SALAZAR JOHN CARLOS',1,'43040850','1985-07-01 00:00:00',1,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
105,980152,1,'BACON','CRISOSTOMO','ANA','MIRIAM','BACON CRISOSTOMO ANA MIRIAM',1,'08627818','1966-11-20 00:00:00',2,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
106,980355,1,'BALBIN','DOMINGUEZ','JAZMIN','LAURA','BALBIN DOMINGUEZ JAZMIN LAURA',1,'10426094','1973-07-10 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
107,980261,1,'BALCAZAR','MALASQUEZ','CARMEN','ROSA','BALCAZAR MALASQUEZ CARMEN ROSA',1,'15434729','1976-08-31 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
108,800449,1,'BALDEON','REYES','JUAN','RAUL','BALDEON REYES JUAN RAUL',1,'40162978','1975-12-14 00:00:00',1,1,'','',NULL,'2000-01-01 00:00:00',0,0),(
109,049552,1,'BALLADARES','MELGAREJO','JULIANO',NULL,'BALLADARES MELGAREJO JULIANO',1,'08912245','1959-08-28 00:00:00',1,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
110,049553,1,'BALLON','CALLE','JORGE','DOMINGO','BALLON CALLE JORGE DOMINGO',1,'07221235','1958-06-19 00:00:00',1,1,'','',NULL,'1982-12-01 00:00:00',0,0),(
111,049555,1,'BAMBAREN','ALCALA','MICAELA','MAXIMINA','BAMBAREN ALCALA MICAELA MAXIMINA',1,'08893551','1962-04-08 00:00:00',2,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
112,980423,1,'BAQUERO','RUIZ','MIRIAN',NULL,'BAQUERO RUIZ MIRIAN',1,'41372117','1982-06-20 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
113,049873,1,'BARBOZA','LEON','FREDY','MAX','BARBOZA LEON FREDY MAX',1,'09864623','1966-06-14 00:00:00',1,1,'','',NULL,'1994-08-01 00:00:00',0,0),(
114,980356,1,'BARDALES','CRUZ','YESSENIA','SARINA','BARDALES CRUZ YESSENIA SARINA',1,'42551395','1984-04-30 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
115,980064,1,'BARDALES','MARTELL','MARIA','VICTORIA','BARDALES MARTELL MARIA VICTORIA',1,'18158086','1975-09-04 00:00:00',2,1,'','',NULL,'2011-04-01 00:00:00',0,0),(
116,049557,1,'BARRANTES','MENDOZA','CARLOS','WENDI','BARRANTES MENDOZA CARLOS WENDI',1,'07309985','1960-06-15 00:00:00',1,1,'','',NULL,'1983-10-16 00:00:00',0,0),(
117,049558,1,'BARRAZA','LOPEZ','MIGUEL','ANGEL','BARRAZA LOPEZ MIGUEL ANGEL',1,'25404303','1964-06-25 00:00:00',1,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
118,980233,1,'BARREDA','PONCE','MARGARET','KARINA','BARREDA PONCE MARGARET KARINA',1,'30960427','1972-11-30 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
119,049559,1,'BARREDA','RODRIGUEZ','GLADYS','FELICITA','BARREDA RODRIGUEZ GLADYS FELICITA',1,'07051458','1962-10-19 00:00:00',2,1,'','',NULL,'1987-11-23 00:00:00',0,0),(
120,098372,1,'BARRERA','RODRIGUEZ','GRETEL','DORIS','BARRERA RODRIGUEZ GRETEL DORIS',1,'08168239','1963-09-05 00:00:00',2,1,'','',NULL,'1989-12-15 00:00:00',0,0),(
121,960391,1,'BARRIOS','JUAREZ','LUIS','ENRIQUE','BARRIOS JUAREZ LUIS ENRIQUE',1,'46780649','1991-01-23 00:00:00',1,1,'','',NULL,'2020-12-01 00:00:00',0,0),(
122,980545,1,'BARRUETA','DE LA TORRE','SILVIA','JANETT','BARRUETA DE LA TORRE SILVIA JANETT',1,'22508054','1974-05-24 00:00:00',2,1,'','',NULL,'2021-01-01 00:00:00',0,0),(
123,980137,1,'BARTOLO','PENA','MILAGROS','SANDRA','BARTOLO PENA MILAGROS SANDRA',1,'10177265','1974-03-11 00:00:00',2,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
124,980173,1,'BARZOLA','ESPINAL','NANCY','ELENA','BARZOLA ESPINAL NANCY ELENA',1,'08892296','1962-06-01 00:00:00',2,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
125,049551,1,'BASILIO','MARCELO','ENRIQUETA','JULIA','BASILIO MARCELO ENRIQUETA JULIA',1,'08510018','1964-01-29 00:00:00',2,1,'','',NULL,'1988-01-01 00:00:00',0,0),(
126,800860,1,'BASILIO','MARCELO','LUISA','ISABEL','BASILIO MARCELO LUISA ISABEL',1,'08449899','1965-07-04 00:00:00',2,1,'','',NULL,'1998-01-01 00:00:00',0,0),(
127,049560,1,'BASTIDAS','TIRADO','JULIA','MAGDALENA','BASTIDAS TIRADO JULIA MAGDALENA',1,'07349491','1960-07-27 00:00:00',2,1,'','',NULL,'1981-11-16 00:00:00',0,0),(
128,980320,1,'BASUALDO','IBANEZ','MARCO','ANTONIO','BASUALDO IBANEZ MARCO ANTONIO',1,'01117817','1969-04-10 00:00:00',1,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
129,600127,1,'BASURCO','CHAMBILLA','ROSARIO',NULL,'BASURCO CHAMBILLA ROSARIO',1,'00415946','1958-10-02 00:00:00',2,1,'','',NULL,'2010-06-01 00:00:00',0,0),(
130,980189,1,'BAUTISTA','ECHAZU','EDGAR','FERNANDO','BAUTISTA ECHAZU EDGAR FERNANDO',1,'10317518','1975-10-13 00:00:00',1,1,'','',NULL,'2014-02-01 00:00:00',0,0),(
131,049562,1,'BAZAN','MARTOS','VICTOR','MARCIANO','BAZAN MARTOS VICTOR MARCIANO',1,'10407028','1961-03-06 00:00:00',1,1,'','',NULL,'1984-10-01 00:00:00',0,0),(
132,960323,1,'BECERRA','QUISPE','RONALD','JEAN CARLO','BECERRA QUISPE RONALD JEAN CARLO',1,'45426044','1988-10-03 00:00:00',1,1,'','',NULL,'2018-07-01 00:00:00',0,0),(
133,049563,1,'BEDON','MALLQUI','GENOVEVA','FLORENCIA','BEDON MALLQUI GENOVEVA FLORENCIA',1,'08504094','1964-01-03 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
134,980424,1,'BELTRAN','ALVAREZ','CYNTHIA','VANESSA','BELTRAN ALVAREZ CYNTHIA VANESSA',1,'43920828','1986-12-12 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
135,049564,1,'BENAVENTE','DIAZ','MARIA','ESTHER','BENAVENTE DIAZ MARIA ESTHER',1,'08109426','1961-04-03 00:00:00',2,1,'','',NULL,'1980-05-16 00:00:00',0,0),(
136,980190,1,'BENDEZU','IBARRA','FANNY','BEATRIZ','BENDEZU IBARRA FANNY BEATRIZ',1,'10544751','1973-03-27 00:00:00',2,1,'','',NULL,'2014-02-01 00:00:00',0,0),(
137,980121,1,'BENITES','LOPEZ','ELDER','OMAR','BENITES LOPEZ ELDER OMAR',1,'18011012','1971-12-29 00:00:00',1,1,'','',NULL,'2012-12-13 00:00:00',0,0),(
138,800849,1,'BERNABE','MATTOS','LUZ','YANINA','BERNABE MATTOS LUZ YANINA',1,'09978487','1974-02-26 00:00:00',2,1,'','',NULL,'1998-01-11 00:00:00',0,0),(
139,049565,1,'BERNABE','SANCHEZ','ANA','MAURA','BERNABE SANCHEZ ANA MAURA',1,'08695169','1963-08-06 00:00:00',2,1,'','',NULL,'1987-12-15 00:00:00',0,0),(
140,980242,1,'BERRIOS','PARDO','SONIA','ELIZABETH','BERRIOS PARDO SONIA ELIZABETH',1,'10538443','1967-09-18 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
141,600126,1,'BINDELS','DUBOIS','RUTH','ESPERANZA','BINDELS DUBOIS RUTH ESPERANZA',1,'07042659','1958-02-22 00:00:00',2,1,'','',NULL,'2005-01-01 00:00:00',0,0),(
142,980298,1,'BLAS','ESPINOZA','MARUJA','PILAR','BLAS ESPINOZA MARUJA PILAR',1,'10799113','1978-06-15 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
143,980323,1,'BLAS','JHON','JOANA','MELISA','BLAS JHON JOANA MELISA',1,'40034912','1978-11-28 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
144,980262,1,'BLAS','MORALES','LILIANA','VICTORIA','BLAS MORALES LILIANA VICTORIA',1,'40364981','1979-09-20 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
145,970030,1,'BOCANEGRA','ROJAS','DAISI','MARIA','BOCANEGRA ROJAS DAISI MARIA',1,'00804887','1961-08-16 00:00:00',2,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
146,980013,1,'BOLUARTE','SILVA','MILUSKA',NULL,'BOLUARTE SILVA MILUSKA',1,'09537875','1971-06-01 00:00:00',2,1,'','',NULL,'2008-02-01 00:00:00',0,0),(
147,049276,1,'BORJA','MOSQUEIRA','MANUEL',NULL,'BORJA MOSQUEIRA MANUEL',1,'07566047','1951-07-18 00:00:00',1,1,'','',NULL,'1981-07-01 00:00:00',0,0),(
148,980358,1,'BRAVO','ALCANTARA','MALI','AMINADAB','BRAVO ALCANTARA MALI AMINADAB',1,'44661947','1987-04-29 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
149,049567,1,'BRAVO','FRANCIA','ROSA','VICTORIA','BRAVO FRANCIA ROSA VICTORIA',1,'06757802','1958-08-26 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
150,049568,1,'BRAVO','HERRERA','GLORIA',NULL,'BRAVO HERRERA GLORIA',1,'06935176','1958-10-02 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
151,980357,1,'BRAVO','QUISPE','MARIA','JULIA','BRAVO QUISPE MARIA JULIA',1,'15433976','1974-12-05 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
152,980359,1,'BRICENO','FERNANDINI','JANET','DEBORAH','BRICENO FERNANDINI JANET DEBORAH',1,'10202615','1975-11-24 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
153,800592,1,'BRONCANO','VARGAS','YRMA','NILDA','BRONCANO VARGAS YRMA NILDA',1,'10106423','1973-05-09 00:00:00',2,1,'','',NULL,'1997-08-01 00:00:00',0,0),(
154,980425,1,'BULEJE','CHIPANA','YENIFER','SHIRLEY','BULEJE CHIPANA YENIFER SHIRLEY',1,'42093477','1983-11-18 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
155,980542,1,'BURGA','GUTIERREZ','JULISSA',NULL,'BURGA GUTIERREZ JULISSA',1,'21863064','1972-11-27 00:00:00',2,1,'','',NULL,'2019-06-01 00:00:00',0,0),(
156,049859,1,'BURGOS','MONTOYA','LUZMILA','YOLANDA','BURGOS MONTOYA LUZMILA YOLANDA',1,'09424181','1967-03-19 00:00:00',2,1,'','',NULL,'1996-07-23 00:00:00',0,0),(
157,049570,1,'BURGOS','MORALES','EDITH','JOSEFINA','BURGOS MORALES EDITH JOSEFINA',1,'09430079','1968-03-19 00:00:00',2,1,'','',NULL,'1988-09-09 00:00:00',0,0),(
158,049571,1,'BURGOS','MORALES','MAGNA','ILIANA','BURGOS MORALES MAGNA ILIANA',1,'06208991','1966-11-22 00:00:00',2,1,'','',NULL,'1989-01-18 00:00:00',0,0),(
159,049576,1,'CABALLERO','ZAVALA','VICTOR','MANUEL','CABALLERO ZAVALA VICTOR MANUEL',1,'07440223','1960-07-29 00:00:00',1,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
160,049577,1,'CABANAS','GUEVARA','PEDRO','ALBERTO','CABANAS GUEVARA PEDRO ALBERTO',1,'08270294','1962-06-08 00:00:00',1,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
161,050128,1,'CABANILLAS','ELLACURIAGA','BENEDICTA','GRAVIELA','CABANILLAS ELLACURIAGA BENEDICTA GRAVIELA',1,'09041528','1966-11-12 00:00:00',2,1,'','',NULL,'1994-12-26 00:00:00',0,0),(
162,970066,1,'CABANILLAS','MORENO','SILVIA','VIOLETA','CABANILLAS MORENO SILVIA VIOLETA',1,'31678128','1968-07-28 00:00:00',2,1,'','',NULL,'2013-05-01 00:00:00',0,0),(
163,950118,1,'CABANILLAS','SANCHEZ','ORESTEDES',NULL,'CABANILLAS SANCHEZ ORESTEDES',1,'08877492','1961-12-18 00:00:00',1,1,'','',NULL,'1996-06-01 00:00:00',0,0),(
164,005547,1,'CABRERA','RAMOS','SANTIAGO','GUILLERMO','CABRERA RAMOS SANTIAGO GUILLERMO',1,'08799819','1954-12-06 00:00:00',1,1,'','',NULL,'1985-04-01 00:00:00',0,0),(
165,049580,1,'CACERES','AEDO','MERCEDES','LOURDES','CACERES AEDO MERCEDES LOURDES',1,'06000536','1959-10-23 00:00:00',2,1,'','',NULL,'1984-11-01 00:00:00',0,0),(
166,049581,1,'CACERES','CARRASCO','PEDRO','VICENTE','CACERES CARRASCO PEDRO VICENTE',1,'06896137','1953-03-12 00:00:00',1,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
167,980360,1,'CACERES','GUARNIZ','CARMEN','DORIS','CACERES GUARNIZ CARMEN DORIS',1,'40440260','1978-04-23 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
168,980138,1,'CACHO','NAVARRETE','JOSE','FRANCISCO','CACHO NAVARRETE JOSE FRANCISCO',1,'06940543','1966-08-05 00:00:00',1,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
169,049584,1,'CAJO','CCENCHO','CARLOS','ALBERTO','CAJO CCENCHO CARLOS ALBERTO',1,'06850146','1965-11-22 00:00:00',1,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
170,049760,1,'CAJO','CESPEDES','LAURA',NULL,'CAJO CESPEDES LAURA',1,'08832098','1962-08-25 00:00:00',2,1,'','',NULL,'1987-11-23 00:00:00',0,0),(
171,980286,1,'CALDERON','AYVAR','IVETTE','GABRIELA','CALDERON AYVAR IVETTE GABRIELA',1,'10303593','1975-10-04 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
172,980176,1,'CALDERON','MURGA','GIOMAR','ELIZABETH','CALDERON MURGA GIOMAR ELIZABETH',1,'10383143','1976-04-17 00:00:00',2,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
173,116584,1,'CALDERON','QUIROZ','ANA','ELIDA','CALDERON QUIROZ ANA ELIDA',1,'16714630','1974-03-26 00:00:00',2,1,'','',NULL,'2004-01-01 00:00:00',0,0),(
174,980426,1,'CALDERON','VILLAVICENCIO','RAQUEL','MAGALY','CALDERON VILLAVICENCIO RAQUEL MAGALY',1,'41041944','1981-07-19 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
175,049585,1,'CALLA','CONTRERAS','ELIAS','CEFERINO','CALLA CONTRERAS ELIAS CEFERINO',1,'06700176','1960-02-15 00:00:00',1,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
176,800447,1,'CALLAN','ALEJOS','SARITA','ELIZABETH','CALLAN ALEJOS SARITA ELIZABETH',1,'07498165','1974-07-09 00:00:00',2,1,'','',NULL,'1995-12-31 00:00:00',0,0),(
177,800446,1,'CALLAN','HUARAZ','MARIA','ISABEL','CALLAN HUARAZ MARIA ISABEL',1,'08451374','1960-10-26 00:00:00',2,1,'','',NULL,'1996-12-31 00:00:00',0,0),(
178,980534,1,'CALLAN','SOTO','MONICA','MARGARITA','CALLAN SOTO MONICA MARGARITA',1,'09905890','1974-08-05 00:00:00',2,1,'','',NULL,'2019-01-15 00:00:00',0,0),(
179,980322,1,'CALLE','MEDINA','ROCIO','MERY','CALLE MEDINA ROCIO MERY',1,'10112236','1974-03-23 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
180,960383,1,'CALLIRGOS','SANCHEZ','ANA','BELEN','CALLIRGOS SANCHEZ ANA BELEN',1,'47094071','1992-01-04 00:00:00',2,1,'','',NULL,'2020-12-01 00:00:00',0,0),(
181,049587,1,'CALVO','RIOS','AUREA','ESTELA','CALVO RIOS AUREA ESTELA',1,'06202130','1956-07-12 00:00:00',2,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
182,040156,1,'CAMACHO','REINOSO DE GAMARRA','GIULIANA',NULL,'CAMACHO REINOSO DE GAMARRA GIULIANA',1,'10384629','1955-02-16 00:00:00',2,1,'','',NULL,'1980-01-01 00:00:00',0,0),(
183,980114,1,'CAMONES','AGUIRRE','SARA','JANET','CAMONES AGUIRRE SARA JANET',1,'09956124','1976-03-01 00:00:00',2,1,'','',NULL,'2012-07-01 00:00:00',0,0),(
184,049588,1,'CAMONES','CABELLO','LUIS','WALTER','CAMONES CABELLO LUIS WALTER',1,'06094569','1956-11-21 00:00:00',1,1,'','',NULL,'1988-09-01 00:00:00',0,0),(
185,950080,1,'CAMONES','SANDANA','JULIA','TEODORA','CAMONES SANDANA JULIA TEODORA',1,'31761505','1966-12-05 00:00:00',2,1,'','',NULL,'2010-06-01 00:00:00',0,0),(
186,980238,1,'CAMONES','SEMINO','GLENDA','VANESSA','CAMONES SEMINO GLENDA VANESSA',1,'40154941','1979-04-27 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
187,049589,1,'CAMPOBLANCO','CABRERA','GAMANIEL','OCTAVIO','CAMPOBLANCO CABRERA GAMANIEL OCTAVIO',1,'06268100','1962-08-03 00:00:00',1,1,'','',NULL,'1984-11-01 00:00:00',0,0),(
188,049590,1,'CAMPOS','CALDERON','NELIDA','AURELIA','CAMPOS CALDERON NELIDA AURELIA',1,'06888308','1957-12-02 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
189,949996,1,'CAMPOS','GUEVARA','FRANCISCO','EDUARDO','CAMPOS GUEVARA FRANCISCO EDUARDO',1,'09870766','1963-02-10 00:00:00',1,1,'','',NULL,'2004-12-11 00:00:00',0,0),(
190,800855,1,'CAMPOS','GUTIERREZ','JANET','PILAR','CAMPOS GUTIERREZ JANET PILAR',1,'09468288','1967-10-12 00:00:00',2,1,'','',NULL,'1998-01-01 00:00:00',0,0),(
191,049446,1,'CAMPOS','PARDO','ROSARIO',NULL,'CAMPOS PARDO ROSARIO',1,'21466127','1962-09-26 00:00:00',2,1,'','',NULL,'1991-12-31 00:00:00',0,0),(
192,950079,1,'CAMPOS','SANTA CRUZ','MARTHA','EDITH','CAMPOS SANTA CRUZ MARTHA EDITH',1,'16505690','1955-10-18 00:00:00',2,1,'','',NULL,'2010-06-01 00:00:00',0,0),(
193,949997,1,'CAMPOS','SICCHA','GERARDO','JIMMY','CAMPOS SICCHA GERARDO JIMMY',1,'17882414','1966-06-01 00:00:00',1,1,'','',NULL,'2004-12-11 00:00:00',0,0),(
194,980361,1,'CAMUS','RAMOS','NORMA','CONSUELO','CAMUS RAMOS NORMA CONSUELO',1,'40042918','1978-12-14 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
195,049592,1,'CANALES','MARCA','CARMEN','ROSA','CANALES MARCA CARMEN ROSA',1,'06140675','1962-02-11 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
196,101790,1,'CANCHI','SANTOS DE CAVERO','LUZ','MARINA','CANCHI SANTOS DE CAVERO LUZ MARINA',1,'06189894','1954-01-18 00:00:00',2,1,'','',NULL,'1990-05-25 00:00:00',0,0),(
197,980427,1,'CANDIA','FABIAN','CELESTE',NULL,'CANDIA FABIAN CELESTE',1,'45156773','1988-03-30 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
198,049453,1,'CANEZ','MARTICORENA','DINA','LUZ','CANEZ MARTICORENA DINA LUZ',1,'10581190','1965-10-26 00:00:00',2,1,'','',NULL,'1992-12-01 00:00:00',0,0),(
199,049287,1,'CANO','CARDENAS','JULIO','CARLOS JUAN','CANO CARDENAS JULIO CARLOS JUAN',1,'07958440','1951-12-20 00:00:00',1,1,'','',NULL,'1978-08-01 00:00:00',0,0),(
200,960326,1,'CANO','SANTOS','INGRID','LIZZETH XIOMARA','CANO SANTOS INGRID LIZZETH XIOMARA',1,'71497836','1993-05-14 00:00:00',2,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
201,098399,1,'CAPCHA','HUAMANI','OSCAR','FLORENCIO','CAPCHA HUAMANI OSCAR FLORENCIO',1,'06143710','1956-04-28 00:00:00',1,1,'','',NULL,'1989-12-31 00:00:00',0,0),(
202,800436,1,'CARBAJAL','CARBAJAL','ANA','MARIA','CARBAJAL CARBAJAL ANA MARIA',1,'06209960','1964-01-30 00:00:00',2,1,'','',NULL,'1995-12-31 00:00:00',0,0),(
203,980498,1,'CARBAJAL','MANTARI','JUDITH','KARINA','CARBAJAL MANTARI JUDITH KARINA',1,'42244534','1980-04-05 00:00:00',2,1,'','',NULL,'2018-11-22 00:00:00',0,0),(
204,049290,1,'CARDENAS','QUINTANA','JUSTA',NULL,'CARDENAS QUINTANA JUSTA',1,'07294402','1953-01-05 00:00:00',2,1,'','',NULL,'1986-12-01 00:00:00',0,0),(
205,049597,1,'CARDOZA','SANCARRANCO','DORIS','AMALIA','CARDOZA SANCARRANCO DORIS AMALIA',1,'09428633','1967-10-11 00:00:00',2,1,'','',NULL,'1988-12-31 00:00:00',0,0),(
206,980045,1,'CARHUALLANQUI','IPARRAGUIRRE','MILDRED','LUZ','CARHUALLANQUI IPARRAGUIRRE MILDRED LUZ',1,'06169965','1960-02-15 00:00:00',2,1,'','',NULL,'2010-07-05 00:00:00',0,0),(
207,049286,1,'CARHUAMACA','SANCHEZ','CARLOS','BERNARDO','CARHUAMACA SANCHEZ CARLOS BERNARDO',1,'08962602','1958-12-05 00:00:00',1,1,'','',NULL,'2000-01-01 00:00:00',0,0),(
208,116796,1,'CARRANZA','CASTILLO','TERESA','ISABEL','CARRANZA CASTILLO TERESA ISABEL',1,'17915682','1957-12-06 00:00:00',2,1,'','',NULL,'1982-12-01 00:00:00',0,0),(
209,980555,1,'CARRANZA','HEREDIA','ELIZABETH','JHOVANI','CARRANZA HEREDIA ELIZABETH JHOVANI',1,'44327329','1987-04-18 00:00:00',2,1,'','',NULL,'2020-12-31 00:00:00',0,0),(
210,980174,1,'CARRASCO','OLIVERA','ROSA','MARIA','CARRASCO OLIVERA ROSA MARIA',1,'15354729','1968-08-31 00:00:00',2,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
211,980014,1,'CASAS','QUISPE','KATHERINE','EVELYN','CASAS QUISPE KATHERINE EVELYN',1,'10178695','1966-05-31 00:00:00',2,1,'','',NULL,'2008-02-01 00:00:00',0,0),(
212,049282,1,'CASSANI','CAMARGO','MARIA',NULL,'CASSANI CAMARGO MARIA',1,'08594728','1955-01-08 00:00:00',2,1,'','',NULL,'1980-12-01 00:00:00',0,0),(
213,101758,1,'CASTANEDA','URBINA','VIRGINIA',NULL,'CASTANEDA URBINA VIRGINIA',1,'19211984','1969-05-21 00:00:00',2,1,'','',NULL,'1990-07-15 00:00:00',0,0),(
214,980177,1,'CASTILLA','BANCAYAN','JUAN','PABLO','CASTILLA BANCAYAN JUAN PABLO',1,'10179922','1975-02-08 00:00:00',1,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
215,098393,1,'CASTILLO','BONILLA','ANA','YSABEL','CASTILLO BONILLA ANA YSABEL',1,'16698360','1971-03-10 00:00:00',2,1,'','',NULL,'1989-12-31 00:00:00',0,0),(
216,980330,1,'CASTILLO','CARRANZA','FRANCISCA','MARCELINA','CASTILLO CARRANZA FRANCISCA MARCELINA',1,'31658805','1970-06-19 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
217,980260,1,'CASTILLO','CARRANZA','GLADYS','NELIDA','CASTILLO CARRANZA GLADYS NELIDA',1,'80530764','1977-06-01 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
218,049604,1,'CASTILLO','CARRANZA','LIBIA','CASILDA','CASTILLO CARRANZA LIBIA CASILDA',1,'09471326','1968-01-14 00:00:00',2,1,'','',NULL,'1988-12-31 00:00:00',0,0),(
219,970008,1,'CASTILLO','IGLESIAS','RUTH','ISABEL','CASTILLO IGLESIAS RUTH ISABEL',1,'27143596','1968-10-09 00:00:00',2,1,'','',NULL,'2009-02-01 00:00:00',0,0),(
220,049475,1,'CASTILLO','PRADA','MARCO','ANTONIO','CASTILLO PRADA MARCO ANTONIO',1,'10144158','1959-02-22 00:00:00',1,1,'','',NULL,'1995-01-16 00:00:00',0,0),(
221,049263,1,'CASTILLO','ROJO VASQUEZ','MERCEDES','MEDALIT','CASTILLO ROJO VASQUEZ MERCEDES MEDALIT',1,'07573113','1960-09-24 00:00:00',2,1,'','',NULL,'1991-12-31 00:00:00',0,0),(
222,980475,1,'CASTRO','ASTUPINA','ALEXANDER','FIDEL','CASTRO ASTUPINA ALEXANDER FIDEL',1,'43266200','1985-09-27 00:00:00',1,1,'','',NULL,'2018-02-01 00:00:00',0,0),(
223,980096,1,'CASTRO','CAUTI','JANET',NULL,'CASTRO CAUTI JANET',1,'09908099','1975-07-15 00:00:00',2,1,'','',NULL,'2012-07-01 00:00:00',0,0),(
224,049295,1,'CASTRO','ESPINOZA','DINA','SUSANA','CASTRO ESPINOZA DINA SUSANA',1,'06725184','1951-09-20 00:00:00',2,1,'','',NULL,'2017-07-01 00:00:00',0,0),(
225,980428,1,'CASTRO','GUTIERREZ','ENEDINA',NULL,'CASTRO GUTIERREZ ENEDINA',1,'06563735','1963-05-14 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
226,980563,1,'CASTRO','HORNA','EDA','MARIA','CASTRO HORNA EDA MARIA',1,'41105478','1981-02-20 00:00:00',2,1,'','',NULL,'2020-12-31 00:00:00',0,0),(
227,980362,1,'CASTRO','MICHCA','MERCEDES','ROXANA','CASTRO MICHCA MERCEDES ROXANA',1,'10881832','1978-05-21 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
228,049605,1,'CASTRO','OLASCOAGA','LILIANA','DEL CARMEN','CASTRO OLASCOAGA LILIANA DEL CARMEN',1,'06195343','1960-07-24 00:00:00',2,1,'','',NULL,'1981-11-16 00:00:00',0,0),(
229,980067,1,'CASTRO','PAIPAY','CARMEN','LILIANA','CASTRO PAIPAY CARMEN LILIANA',1,'07480204','1971-07-16 00:00:00',2,1,'','',NULL,'2011-04-01 00:00:00',0,0),(
230,970059,1,'CATIRE','OROPEZA','MARTIN','AURELIO','CATIRE OROPEZA MARTIN AURELIO',1,'31614449','1955-11-12 00:00:00',1,1,'','',NULL,'2017-07-01 00:00:00',0,0),(
231,049606,1,'CAUTI','ATIQUIPA','VICENTA','ESPERANZA','CAUTI ATIQUIPA VICENTA ESPERANZA',1,'06082284','1952-07-04 00:00:00',2,1,'','',NULL,'1982-11-16 00:00:00',0,0),(
232,980533,1,'CAUTI','CELEDONIO DE ZAVALAGA','ELIZABETH','YOLANDA','CAUTI CELEDONIO DE ZAVALAGA ELIZABETH YOLANDA',1,'10690189','1977-11-17 00:00:00',2,1,'','',NULL,'2019-01-15 00:00:00',0,0),(
233,970034,1,'CAVALIE','VILLEGAS','ESTELA','LUZMILA','CAVALIE VILLEGAS ESTELA LUZMILA',1,'22514417','1961-10-08 00:00:00',2,1,'','',NULL,'1995-12-19 00:00:00',0,0),(
234,049607,1,'CAYCHO','HUYHUA','DINO','JUAN','CAYCHO HUYHUA DINO JUAN',1,'08969458','1959-06-24 00:00:00',1,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
235,049608,1,'CAYCHO','HUYHUA','VICTOR','MARCIAL','CAYCHO HUYHUA VICTOR MARCIAL',1,'08983441','1957-03-07 00:00:00',1,1,'','',NULL,'1977-12-01 00:00:00',0,0),(
236,980263,1,'CAYETANO','HORNA','CARLOTA','DEL CARMEN','CAYETANO HORNA CARLOTA DEL CARMEN',1,'16790871','1973-08-13 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
237,980324,1,'CCACCYA','RODAS','LIDIA',NULL,'CCACCYA RODAS LIDIA',1,'10707108','1978-05-03 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
238,980482,1,'CCAHUAY','SALAS','MIRIAN','ROSA','CCAHUAY SALAS MIRIAN ROSA',1,'42003102','1983-07-16 00:00:00',2,1,'','',NULL,'2018-02-01 00:00:00',0,0),(
239,980299,1,'CCASA','MOLINA','NOEMI','SOLEDAD','CCASA MOLINA NOEMI SOLEDAD',1,'41345510','1982-04-06 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
240,980483,1,'CCOICCA','LOBATO','ERIKA','ROXANA','CCOICCA LOBATO ERIKA ROXANA',1,'41573731','1982-11-29 00:00:00',2,1,'','',NULL,'2018-02-01 00:00:00',0,0),(
241,980178,1,'CEDRON','GUTIERREZ','SUSAN',NULL,'CEDRON GUTIERREZ SUSAN',1,'16733246','1974-05-17 00:00:00',2,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
242,980471,1,'CERNA','PORTALES','ERIKA','LEYLA','CERNA PORTALES ERIKA LEYLA',1,'40217592','1979-05-28 00:00:00',2,1,'','',NULL,'2018-02-01 00:00:00',0,0),(
243,980562,1,'CERRO','GONZALES','MARITZA',NULL,'CERRO GONZALES MARITZA',1,'09985652','1972-08-27 00:00:00',2,1,'','',NULL,'2020-12-31 00:00:00',0,0),(
244,049618,1,'CERROY','MOZOMBITE','LOURDES','WILMA','CERROY MOZOMBITE LOURDES WILMA',1,'09634558','1964-02-23 00:00:00',2,1,'','',NULL,'1988-08-16 00:00:00',0,0),(
245,980231,1,'CERVANTES','OBLITAS DE PORTOCARRERO','ROSANI','LIZ','CERVANTES OBLITAS DE PORTOCARRERO ROSANI LIZ',1,'40455721','1980-01-08 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
246,980363,1,'CESPEDES','CASTRO','YANINNA','YAHAIRA','CESPEDES CASTRO YANINNA YAHAIRA',1,'40344157','1979-06-25 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
247,800425,1,'CETRARO','CARDO DE TENORIO','MARIA','DELFINA','CETRARO CARDO DE TENORIO MARIA DELFINA',1,'08237211','1961-05-17 00:00:00',2,1,'','',NULL,'1996-02-23 00:00:00',0,0),(
248,116700,1,'CHAFALOTE','VALLADARES','NANCY','ROSANA','CHAFALOTE VALLADARES NANCY ROSANA',1,'15741507','1972-08-08 00:00:00',2,1,'','',NULL,'2003-08-01 00:00:00',0,0),(
249,049619,1,'CHANGANA','GRADOS','GLORIA','JULIA','CHANGANA GRADOS GLORIA JULIA',1,'07078153','1956-07-18 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
250,049620,1,'CHAUCA','YACAS','ELSA','GLADIS','CHAUCA YACAS ELSA GLADIS',1,'06749142','1957-02-15 00:00:00',2,1,'','',NULL,'1980-11-01 00:00:00',0,0),(
251,049621,1,'CHAVARRI','DIAZ','NORMA','ESTHER','CHAVARRI DIAZ NORMA ESTHER',1,'06056127','1959-04-29 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
252,049622,1,'CHAVEZ','AGUILAR','SEGUNDO','ELISEO','CHAVEZ AGUILAR SEGUNDO ELISEO',1,'17828913','1955-06-22 00:00:00',1,1,'','',NULL,'1987-11-23 00:00:00',0,0),(
253,980070,1,'CHAVEZ','CASANO','SIMON','ENRIQUE','CHAVEZ CASANO SIMON ENRIQUE',1,'08308991','1955-01-05 00:00:00',1,1,'','',NULL,'2011-04-01 00:00:00',0,0),(
254,049625,1,'CHAVEZ','ESPIRITU','EDA','MARLENE','CHAVEZ ESPIRITU EDA MARLENE',1,'08075483','1961-07-10 00:00:00',2,1,'','',NULL,'1980-11-01 00:00:00',0,0),(
255,049626,1,'CHAVEZ','FLORES','REIDA',NULL,'CHAVEZ FLORES REIDA',1,'06028424','1960-06-28 00:00:00',2,1,'','',NULL,'1986-12-01 00:00:00',0,0),(
256,960331,1,'CHAVEZ','MINANO','HOMERO','IVAN','CHAVEZ MINANO HOMERO IVAN',1,'18211149','1974-10-14 00:00:00',1,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
257,800631,1,'CHAVEZ','PACHECO DE CORDOVA','JUDITH',NULL,'CHAVEZ PACHECO DE CORDOVA JUDITH',1,'19831872','1956-04-26 00:00:00',2,1,'','',NULL,'2001-04-02 00:00:00',0,0),(
258,098402,1,'CHAVEZ','REATEGUI','SARA','MERCEDES','CHAVEZ REATEGUI SARA MERCEDES',1,'06174840','1955-09-15 00:00:00',2,1,'','',NULL,'1989-12-31 00:00:00',0,0),(
259,949999,1,'CHAVEZ','SALAZAR','JOSE','LUIS','CHAVEZ SALAZAR JOSE LUIS',1,'09458055','1971-02-09 00:00:00',1,1,'','',NULL,'2004-12-11 00:00:00',0,0),(
260,970076,1,'CHECA','BERNAZZI','OSCAR','ERNESTO','CHECA BERNAZZI OSCAR ERNESTO',1,'05400583','1957-03-31 00:00:00',1,1,'','',NULL,'2017-01-01 00:00:00',0,0),(
261,049627,1,'CHOCANO','RODRIGUEZ','HUGO','SANTIAGO','CHOCANO RODRIGUEZ HUGO SANTIAGO',1,'07385799','1954-07-25 00:00:00',1,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
262,101773,1,'CHOCANO','RODRIGUEZ','NORMA','JUDITH','CHOCANO RODRIGUEZ NORMA JUDITH',1,'07420655','1964-07-05 00:00:00',2,1,'','',NULL,'1990-07-15 00:00:00',0,0),(
263,098410,1,'CHUPICA','MURILLO','MARY',NULL,'CHUPICA MURILLO MARY',1,'10073625','1961-03-20 00:00:00',2,1,'','',NULL,'1990-01-30 00:00:00',0,0),(
264,049632,1,'CHUQUICHAICO','FAICHIN','YOCELINDA',NULL,'CHUQUICHAICO FAICHIN YOCELINDA',1,'09280234','1961-04-22 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
265,980015,1,'CHUQUIMBALQUI','TAUMA','CECILIA',NULL,'CHUQUIMBALQUI TAUMA CECILIA',1,'00370822','1974-11-18 00:00:00',2,1,'','',NULL,'2008-02-01 00:00:00',0,0),(
266,049633,1,'CIEZA','TUMBAY','SUSANA',NULL,'CIEZA TUMBAY SUSANA',1,'07291276','1961-06-25 00:00:00',2,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
267,980105,1,'CIRILO','FLORES','ROSARIO','ISABEL','CIRILO FLORES ROSARIO ISABEL',1,'08567103','1959-02-18 00:00:00',2,1,'','',NULL,'2012-07-01 00:00:00',0,0),(
268,980002,1,'CISNEROS','CHOQUEHUANCA','VILMA','IRENE','CISNEROS CHOQUEHUANCA VILMA IRENE',1,'15688390','1963-06-05 00:00:00',2,1,'','',NULL,'2008-02-01 00:00:00',0,0),(
269,980300,1,'CISNEROS','MACHAHUAY','LILIANA',NULL,'CISNEROS MACHAHUAY LILIANA',1,'40437903','1979-12-28 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
270,980059,1,'CISNEROS','MACHAHUAY','YOVANA',NULL,'CISNEROS MACHAHUAY YOVANA',1,'28310851','1975-09-09 00:00:00',2,1,'','',NULL,'2011-04-01 00:00:00',0,0),(
271,980179,1,'CISNEROS','VASQUEZ','FERNANDO','ALONSO','CISNEROS VASQUEZ FERNANDO ALONSO',1,'06670330','1974-03-10 00:00:00',1,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
272,049634,1,'COELLO','CHINCHAY','CESAR','LEONARDO','COELLO CHINCHAY CESAR LEONARDO',1,'08325959','1954-01-10 00:00:00',1,1,'','',NULL,'1981-06-01 00:00:00',0,0),(
273,980066,1,'COLLANTES','SANDOVAL','MARIA','CECILIA','COLLANTES SANDOVAL MARIA CECILIA',1,'10330063','1970-01-23 00:00:00',2,1,'','',NULL,'2011-04-01 00:00:00',0,0),(
274,049288,1,'COLLAVINO','SEGOVIA','NELLY',NULL,'COLLAVINO SEGOVIA NELLY',1,'06271893','1967-01-27 00:00:00',2,1,'','',NULL,'2000-05-01 00:00:00',0,0),(
275,098394,1,'COLONIA','PADUA','SANTA','NORMA','COLONIA PADUA SANTA NORMA',1,'32030296','1962-08-02 00:00:00',2,1,'','',NULL,'1989-12-31 00:00:00',0,0),(
276,980029,1,'CONDOR','PALOMINO','MARTHA','BERTHA','CONDOR PALOMINO MARTHA BERTHA',1,'09453570','1970-02-23 00:00:00',2,1,'','',NULL,'2010-07-05 00:00:00',0,0),(
277,980430,1,'CONDORI','ARMUTO','JOVANA',NULL,'CONDORI ARMUTO JOVANA',1,'24005542','1978-05-30 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
278,980235,1,'CONDORI','CHACON','MARIA','YSABEL','CONDORI CHACON MARIA YSABEL',1,'22296908','1971-12-21 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
279,980331,1,'CORDOVA','ANAZCO','MARIA','CRISTINA','CORDOVA ANAZCO MARIA CRISTINA',1,'42240754','1984-01-08 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
280,980332,1,'CORDOVA','CHACON','ANA','ISABEL','CORDOVA CHACON ANA ISABEL',1,'22277566','1973-07-26 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
281,049306,1,'CORDOVA','CHAVEZ','IDANIA',NULL,'CORDOVA CHAVEZ IDANIA',1,'25735418','1954-06-18 00:00:00',2,1,'','',NULL,'1975-08-16 00:00:00',0,0),(
282,049639,1,'CORDOVA','CUSTODIO','ADA','OTILIA','CORDOVA CUSTODIO ADA OTILIA',1,'09096096','1959-07-04 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
283,980153,1,'CORDOVA','DOZA','LIZ','ZELMA','CORDOVA DOZA LIZ ZELMA',1,'10677471','1978-08-19 00:00:00',2,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
284,980539,1,'CORDOVA','GARCIA','ROSITA','OLIVIA','CORDOVA GARCIA ROSITA OLIVIA',1,'46272471','1989-09-14 00:00:00',2,1,'','',NULL,'2019-01-15 00:00:00',0,0),(
285,049640,1,'CORDOVA','NAPAN','MIRIAM','RUTH','CORDOVA NAPAN MIRIAM RUTH',1,'25419749','1964-12-22 00:00:00',2,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
286,980264,1,'CORDOVA','SANDOVAL','ROSA','AMELIA','CORDOVA SANDOVAL ROSA AMELIA',1,'25814892','1967-01-19 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
287,960371,1,'CORICAZA','CUARESMA','YONY','FRANCHESKA','CORICAZA CUARESMA YONY FRANCHESKA',1,'70007707','1994-12-19 00:00:00',2,1,'','',NULL,'2020-12-01 00:00:00',0,0),(
288,800016,1,'CORNEJO','FALCON','DAVID','HOMERO','CORNEJO FALCON DAVID HOMERO',1,'08096393','1959-04-25 00:00:00',1,1,'','',NULL,'2002-07-01 00:00:00',0,0),(
289,960377,1,'CORONADO','DAVILA','FERNANDO',NULL,'CORONADO DAVILA FERNANDO',1,'42376660','1984-03-13 00:00:00',1,1,'','',NULL,'2020-12-01 00:00:00',0,0),(
290,950099,1,'CORONEL','SCABARROZZI DE CASAS','LIZET',NULL,'CORONEL SCABARROZZI DE CASAS LIZET',1,'10430896','1974-01-19 00:00:00',2,1,'','',NULL,'2009-01-01 00:00:00',0,0),(
291,960356,1,'CORRALES','MORI','MERY','ROSA','CORRALES MORI MERY ROSA',1,'43953011','1986-04-29 00:00:00',2,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
292,049308,1,'CORTEZ','MARINO','MARIA','PETRONILA','CORTEZ MARINO MARIA PETRONILA',1,'10734571','1957-01-16 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
293,980083,1,'COSSIO','ANAZCO','MARIA','LILIANA','COSSIO ANAZCO MARIA LILIANA',1,'10700307','1978-03-30 00:00:00',2,1,'','',NULL,'2012-01-01 00:00:00',0,0),(
294,049641,1,'COTRINA','MONDRAGON','SENAIDA',NULL,'COTRINA MONDRAGON SENAIDA',1,'08413391','1958-01-29 00:00:00',2,1,'','',NULL,'1984-10-01 00:00:00',0,0),(
295,098374,1,'COZ','GONZALEZ','ANA','MARIA','COZ GONZALEZ ANA MARIA',1,'20008684','1959-03-18 00:00:00',2,1,'','',NULL,'1991-12-31 00:00:00',0,0),(
296,050044,1,'CRESPO','HUAMANI','GLORIA',NULL,'CRESPO HUAMANI GLORIA',1,'06936493','1961-04-17 00:00:00',2,1,'','',NULL,'1987-12-16 00:00:00',0,0),(
297,980276,1,'CRISTOBAL','ARZAPALO','NOEMI',NULL,'CRISTOBAL ARZAPALO NOEMI',1,'04070216','1973-03-01 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
298,980240,1,'CRUZ','VASQUEZ','CARMEN','DORIS','CRUZ VASQUEZ CARMEN DORIS',1,'32926099','1970-08-07 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
299,980365,1,'CRUZADO','REQUEJO','MARX',NULL,'CRUZADO REQUEJO MARX',1,'42863729','1981-12-29 00:00:00',1,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
300,980191,1,'CRUZATE','CABREJOS','VICENTE','LEANDRO','CRUZATE CABREJOS VICENTE LEANDRO',1,'16718644','1973-01-31 00:00:00',1,1,'','',NULL,'2014-02-01 00:00:00',0,0),(
301,049643,1,'CUADRA','MORENO','LUIS','ALFREDO','CUADRA MORENO LUIS ALFREDO',1,'26960978','1951-07-12 00:00:00',1,1,'','',NULL,'2017-06-25 00:00:00',0,0),(
302,949979,1,'CUADROS','GUTIERREZ','FERNANDO','ALEX','CUADROS GUTIERREZ FERNANDO ALEX',1,'07920707','1962-09-08 00:00:00',1,1,'','',NULL,'2001-06-25 00:00:00',0,0),(
303,949998,1,'CUBA','GONZALES','JUANA','ESPERANZA','CUBA GONZALES JUANA ESPERANZA',1,'08672494','1968-06-11 00:00:00',2,1,'','',NULL,'2004-12-11 00:00:00',0,0),(
304,049471,1,'CUENTAS','ROBLES','ADELMO','RODOMIRO','CUENTAS ROBLES ADELMO RODOMIRO',1,'06826470','1957-11-21 00:00:00',1,1,'','',NULL,'1996-01-10 00:00:00',0,0),(
305,049399,1,'CUETO','HIYO','ROSA','MARIA','CUETO HIYO ROSA MARIA',1,'07078530','1959-10-05 00:00:00',2,1,'','',NULL,'1991-12-31 00:00:00',0,0),(
306,049647,1,'CUEVA','FLORES DE MOSQUERA','LILIANA',NULL,'CUEVA FLORES DE MOSQUERA LILIANA',1,'08978193','1964-07-23 00:00:00',2,1,'','',NULL,'1982-08-16 00:00:00',0,0),(
307,980140,1,'CUEVA','FRETEL','JUAN',NULL,'CUEVA FRETEL JUAN',1,'06193903','1958-11-01 00:00:00',1,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
308,049768,1,'CUEVA','LUNA','GUILLERMO','ENRIQUE','CUEVA LUNA GUILLERMO ENRIQUE',1,'08688335','1969-11-18 00:00:00',1,1,'','',NULL,'1995-01-18 00:00:00',0,0),(
309,049648,1,'CUEVA','MENDOZA','LIDIA','RAMONA','CUEVA MENDOZA LIDIA RAMONA',1,'06148549','1954-04-10 00:00:00',2,1,'','',NULL,'1987-12-31 00:00:00',0,0),(
310,049649,1,'CUEVA','MORENO','ADA','FRANCISCA','CUEVA MORENO ADA FRANCISCA',1,'06265027','1960-06-17 00:00:00',2,1,'','',NULL,'1988-09-01 00:00:00',0,0),(
311,049650,1,'CUEVA','MORENO','ROSA','LUDGARDA','CUEVA MORENO ROSA LUDGARDA',1,'08645310','1966-03-06 00:00:00',2,1,'','',NULL,'1988-09-01 00:00:00',0,0),(
312,101781,1,'CUEVA','ROJAS','KEMIA',NULL,'CUEVA ROJAS KEMIA',1,'06680119','1958-11-16 00:00:00',2,1,'','',NULL,'1990-05-25 00:00:00',0,0),(
313,960373,1,'CUEVA','YOHANN','DIETER',NULL,'CUEVA YOHANN DIETER',1,'70416244','1991-07-26 00:00:00',1,1,'','',NULL,'2020-12-01 00:00:00',0,0),(
314,801035,1,'CURAHUA','NUNEZ','TRINIDAD','CONSUELO','CURAHUA NUNEZ TRINIDAD CONSUELO',1,'20033493','1968-04-15 00:00:00',2,1,'','',NULL,'2002-01-02 00:00:00',0,0),(
315,980025,1,'CUROTTO','CORNEJO','MARIA','MERCEDES','CUROTTO CORNEJO MARIA MERCEDES',1,'09138722','1955-05-12 00:00:00',2,1,'','',NULL,'2008-02-01 00:00:00',0,0),(
316,980538,1,'CUSI','ARIAS','KARLA','ISABEL','CUSI ARIAS KARLA ISABEL',1,'41512851','1982-08-06 00:00:00',2,1,'','',NULL,'2019-01-15 00:00:00',0,0),(
317,980180,1,'CUSICANQUI','SERRANO','SANDRA','MARGARITA','CUSICANQUI SERRANO SANDRA MARGARITA',1,'10192011','1974-05-13 00:00:00',2,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
318,050088,1,'CUTTI','CONGACHA','MARINO',NULL,'CUTTI CONGACHA MARINO',1,'07650648','1952-08-08 00:00:00',1,1,'','',NULL,'1995-01-01 00:00:00',0,0),(
319,049652,1,'CUYA','VALDERRAMA','JUAN','FRANCISCO','CUYA VALDERRAMA JUAN FRANCISCO',1,'07015079','1959-01-28 00:00:00',1,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
320,980366,1,'DAVALOS','GUERRA','ANGELA','ROSALINDA','DAVALOS GUERRA ANGELA ROSALINDA',1,'07622094','1970-08-06 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
321,980333,1,'DE LA CRUZ','AGUILAR','RICHARD','DANNY','DE LA CRUZ AGUILAR RICHARD DANNY',1,'40447628','1979-08-06 00:00:00',1,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
322,980367,1,'DE LA CRUZ','CARRION','ROSA','SUSANA','DE LA CRUZ CARRION ROSA SUSANA',1,'43102589','1985-07-24 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
323,049309,1,'DE LA CRUZ','COLLAO','FRANCISCO','URBANO','DE LA CRUZ COLLAO FRANCISCO URBANO',1,'06139646','1955-04-02 00:00:00',1,1,'','',NULL,'1988-12-01 00:00:00',0,0),(
324,980334,1,'DE LA CRUZ','PAJUELO','ALEJANDRA',NULL,'DE LA CRUZ PAJUELO ALEJANDRA',1,'10746060','1978-02-16 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
325,950023,1,'DE LA CRUZ','SOTO','AQUILA',NULL,'DE LA CRUZ SOTO AQUILA',1,'20077323','1956-10-19 00:00:00',2,1,'','',NULL,'2010-03-01 00:00:00',0,0),(
326,960366,1,'DEL AGUILA','UGARTE','WILHELM',NULL,'DEL AGUILA UGARTE WILHELM',1,'41769601','1983-06-20 00:00:00',1,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
327,980218,1,'DELGADILLO','ALANYA','KATIA',NULL,'DELGADILLO ALANYA KATIA',1,'28303401','1975-08-18 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
328,800839,1,'DELGADO','BARTRA','HUGO',NULL,'DELGADO BARTRA HUGO',1,'21448664','1960-05-02 00:00:00',1,1,'','',NULL,'1998-01-01 00:00:00',0,0),(
329,980432,1,'DELGADO','CASTRO','ADELA','MILAGROS','DELGADO CASTRO ADELA MILAGROS',1,'33262905','1973-03-18 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
330,980433,1,'DELGADO','DE LA CRUZ','AMADA','LESLY','DELGADO DE LA CRUZ AMADA LESLY',1,'42555975','1984-05-25 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
331,980224,1,'DELGADO','MORALES','DESLY','MARIA','DELGADO MORALES DESLY MARIA',1,'27752970','1978-05-24 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
332,049340,1,'DENEGRI','GIURFA','WILFREDO','EMILIO MARCO','DENEGRI GIURFA WILFREDO EMILIO MARCO',1,'10788028','1952-06-18 00:00:00',1,1,'','',NULL,'1995-05-10 00:00:00',0,0),(
333,980335,1,'DIAZ','ARBILDO','BERLISA',NULL,'DIAZ ARBILDO BERLISA',1,'41412200','1978-08-05 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
334,960360,1,'DIAZ','BALVIN','EDUARDO','BRANITS','DIAZ BALVIN EDUARDO BRANITS',1,'45187311','1987-10-16 00:00:00',1,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
335,980128,1,'DIAZ','CASTRO','CRISTINA','AURORA','DIAZ CASTRO CRISTINA AURORA',1,'10646140','1977-10-16 00:00:00',2,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
336,980434,1,'DIAZ','CCOPA','MARIA','CRISTINA','DIAZ CCOPA MARIA CRISTINA',1,'42287838','1984-03-27 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
337,980192,1,'DIAZ','INCA','GISSELLE','HAYDEE','DIAZ INCA GISSELLE HAYDEE',1,'06662322','1969-03-03 00:00:00',2,1,'','',NULL,'2014-02-01 00:00:00',0,0),(
338,800456,1,'DIAZ','IPARRAGUIRRE','BEATRIZ','SOLEDAD','DIAZ IPARRAGUIRRE BEATRIZ SOLEDAD',1,'08110216','1963-12-22 00:00:00',2,1,'','',NULL,'1995-12-31 00:00:00',0,0),(
339,049480,1,'DIAZ','MIRANDA','ROSA','IMELDA','DIAZ MIRANDA ROSA IMELDA',1,'09256796','1954-08-19 00:00:00',2,1,'','',NULL,'1995-05-01 00:00:00',0,0),(
340,049659,1,'DIAZ','SOSAYA','HERMELINDA','NORMA','DIAZ SOSAYA HERMELINDA NORMA',1,'08094019','1960-08-04 00:00:00',2,1,'','',NULL,'1988-12-01 00:00:00',0,0),(
341,049660,1,'DIAZ','SOSAYA','MARIA','CARIDAD','DIAZ SOSAYA MARIA CARIDAD',1,'08038036','1962-05-01 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
342,980435,1,'DIAZ','VIDAL','ANA','JESUS','DIAZ VIDAL ANA JESUS',1,'25779479','1968-12-19 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
343,107122,1,'DOMINGUEZ','GARCES','DANNY','HUMBERTO','DOMINGUEZ GARCES DANNY HUMBERTO',1,'08742469','1956-11-09 00:00:00',1,1,'','',NULL,'1987-04-01 00:00:00',0,0),(
344,101789,1,'DOMINGUEZ','LAURA','ERNESTINA',NULL,'DOMINGUEZ LAURA ERNESTINA',1,'06275140','1954-06-16 00:00:00',2,1,'','',NULL,'1990-05-25 00:00:00',0,0),(
345,101738,1,'DONAYRE','MAYURI','MARIA','DEL CARMEN','DONAYRE MAYURI MARIA DEL CARMEN',1,'06250409','1962-11-14 00:00:00',2,1,'','',NULL,'1990-07-15 00:00:00',0,0),(
346,980016,1,'DORREGARAY','LLERENA','MARIBEL',NULL,'DORREGARAY LLERENA MARIBEL',1,'06659179','1967-06-02 00:00:00',2,1,'','',NULL,'2008-02-01 00:00:00',0,0),(
347,970001,1,'DUENAS','DE LA TORRE','NANCY','MIRIAN','DUENAS DE LA TORRE NANCY MIRIAN',1,'19818108','1962-09-14 00:00:00',2,1,'','',NULL,'2010-06-01 00:00:00',0,0),(
348,098403,1,'DUPLEX','VALDERRAMA','MARIA',NULL,'DUPLEX VALDERRAMA MARIA',1,'06280167','1961-05-27 00:00:00',2,1,'','',NULL,'1989-12-31 00:00:00',0,0),(
349,980554,1,'DURAND','MEZA','ANA','LUZ','DURAND MEZA ANA LUZ',1,'44673623','1986-11-14 00:00:00',2,1,'','',NULL,'2020-12-31 00:00:00',0,0),(
350,980004,1,'DURAND','MEZA','NORMA','PILAR','DURAND MEZA NORMA PILAR',1,'10352012','1975-02-10 00:00:00',2,1,'','',NULL,'2008-02-01 00:00:00',0,0),(
351,980336,1,'DURAND','RUIZ','DEYSI','JANET','DURAND RUIZ DEYSI JANET',1,'42980829','1985-03-05 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
352,980115,1,'ELIAS','DIAZ','RICARDO','JOSE','ELIAS DIAZ RICARDO JOSE',1,'10280406','1975-12-26 00:00:00',1,1,'','',NULL,'2012-07-01 00:00:00',0,0),(
353,049672,1,'ERAZO','ROJAS','EMMA','OLGA','ERAZO ROJAS EMMA OLGA',1,'08484926','1959-03-30 00:00:00',2,1,'','',NULL,'1986-12-01 00:00:00',0,0),(
354,980492,1,'ESCUDERO','MAMANI','JORGE','EDUARDO','ESCUDERO MAMANI JORGE EDUARDO',1,'42361518','1984-02-25 00:00:00',1,1,'','',NULL,'2018-01-16 00:00:00',0,0),(
355,049674,1,'ESCURRA','CUEVA','JORGE','LUIS','ESCURRA CUEVA JORGE LUIS',1,'06051937','1963-05-03 00:00:00',1,1,'','',NULL,'1988-09-01 00:00:00',0,0),(
356,800856,1,'ESLAVA','HUAMANI','FILOMENA',NULL,'ESLAVA HUAMANI FILOMENA',1,'10538304','1959-07-05 00:00:00',2,1,'','',NULL,'1998-01-01 00:00:00',0,0),(
357,980154,1,'ESPINO','VILLANUEVA','RUTTE','YSABEL','ESPINO VILLANUEVA RUTTE YSABEL',1,'10778898','1962-09-16 00:00:00',2,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
358,980337,1,'ESPINOZA','ALEGRE','KARINA',NULL,'ESPINOZA ALEGRE KARINA',1,'41558741','1982-10-04 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
359,980436,1,'ESPINOZA','APOLINARIO','YESICA','GUISSETTE','ESPINOZA APOLINARIO YESICA GUISSETTE',1,'41012194','1981-07-13 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
360,980106,1,'ESPINOZA','FORTUN','LIDIA','INMACULADA','ESPINOZA FORTUN LIDIA INMACULADA',1,'06267672','1966-12-07 00:00:00',2,1,'','',NULL,'2012-07-01 00:00:00',0,0),(
361,049676,1,'ESPINOZA','GUTIERREZ','BEATRIZ','TULA','ESPINOZA GUTIERREZ BEATRIZ TULA',1,'06103044','1962-09-22 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
362,980325,1,'ESPINOZA','PIZARRO','ROCIO','MARGOT','ESPINOZA PIZARRO ROCIO MARGOT',1,'40494017','1977-08-17 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
363,980020,1,'ESPINOZA','RIVERA','JENNY','HELLY','ESPINOZA RIVERA JENNY HELLY',1,'10123130','1975-04-25 00:00:00',2,1,'','',NULL,'2008-02-01 00:00:00',0,0),(
364,101779,1,'ESPINOZA','RODRIGUEZ DE TORIBIO','JULIA','ROSA','ESPINOZA RODRIGUEZ DE TORIBIO JULIA ROSA',1,'08049288','1956-05-23 00:00:00',2,1,'','',NULL,'2000-06-30 00:00:00',0,0),(
365,980046,1,'ESPIRITU','REYES','CHRISTIAN','MANUEL','ESPIRITU REYES CHRISTIAN MANUEL',1,'06802648','1977-04-11 00:00:00',1,1,'','',NULL,'2010-07-05 00:00:00',0,0),(
366,600089,1,'ESQUEN','SEMBRERA','OLGA','YOLANDA','ESQUEN SEMBRERA OLGA YOLANDA',1,'16524692','1961-09-01 00:00:00',2,1,'','',NULL,'2002-09-11 00:00:00',0,0),(
367,960389,1,'ESTACIO','SANTAMARIA','HERLINDA','YESENIA','ESTACIO SANTAMARIA HERLINDA YESENIA',1,'70440901','1988-08-29 00:00:00',2,1,'','',NULL,'2020-12-01 00:00:00',0,0),(
368,049372,1,'ESTEBAN','MUNAYCO','LUIS','FERNANDO','ESTEBAN MUNAYCO LUIS FERNANDO',1,'09959990','1963-12-15 00:00:00',1,1,'','',NULL,'1988-12-01 00:00:00',0,0),(
369,049680,1,'ESTEBAN','VILLEGAS DE JARA','CELINA',NULL,'ESTEBAN VILLEGAS DE JARA CELINA',1,'07077176','1961-10-16 00:00:00',2,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
370,049998,1,'ESTEVES','OSSO','FRANCISCO','OSCAR ENRIQUE','ESTEVES OSSO FRANCISCO OSCAR ENRIQUE',1,'07827813','1961-03-11 00:00:00',1,1,'','',NULL,'2002-07-01 00:00:00',0,0),(
371,101760,1,'ESTRADA','GUTIERREZ','MARIA','BEATRIZ','ESTRADA GUTIERREZ MARIA BEATRIZ',1,'07206188','1957-08-14 00:00:00',2,1,'','',NULL,'1990-07-15 00:00:00',0,0),(
372,960368,1,'FABIAN','ESPINOZA','SHIRLEY','KATERINE','FABIAN ESPINOZA SHIRLEY KATERINE',1,'45508278','1988-07-24 00:00:00',2,1,'','',NULL,'2017-08-01 00:00:00',0,0),(
373,049684,1,'FACUNDO','QUISPE','SEGUNDO','ALEJANDRO','FACUNDO QUISPE SEGUNDO ALEJANDRO',1,'15699124','1964-08-04 00:00:00',1,1,'','',NULL,'1985-08-01 00:00:00',0,0),(
374,980227,1,'FAJARDO','NORIA','LEYLA','ROSA','FAJARDO NORIA LEYLA ROSA',1,'25820467','1976-07-24 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
375,980437,1,'FALCONI','CORDOVA','SHARMYLLA','DESSIRETH','FALCONI CORDOVA SHARMYLLA DESSIRETH',1,'47754581','1992-05-02 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
376,049685,1,'FARFAN','FANARRAGA','EFREN','RICHARD','FARFAN FANARRAGA EFREN RICHARD',1,'06901653','1964-06-18 00:00:00',1,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
377,980338,1,'FARFAN','MOLINA','MARIA','YNES','FARFAN MOLINA MARIA YNES',1,'40142000','1979-04-05 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
378,980438,1,'FERNANDEZ','HUARANGA','ROSA','YESENIA','FERNANDEZ HUARANGA ROSA YESENIA',1,'45277366','1988-08-21 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
379,049324,1,'FERNANDEZ','MATSUBARA','ROGER','JESUS','FERNANDEZ MATSUBARA ROGER JESUS',1,'25691059','1965-04-17 00:00:00',1,1,'','',NULL,'2002-06-01 00:00:00',0,0),(
380,970074,1,'FERNANDEZ','MEJIA','MARIA','DEL ROSARIO','FERNANDEZ MEJIA MARIA DEL ROSARIO',1,'21510378','1960-05-25 00:00:00',2,1,'','',NULL,'2021-01-01 00:00:00',0,0),(
381,049688,1,'FERNANDEZ','MOYA DE ASALDE','MARIA','DE GUADALUPE','FERNANDEZ MOYA DE ASALDE MARIA DE GUADALUPE',1,'25463481','1962-08-23 00:00:00',2,1,'','',NULL,'1982-10-01 00:00:00',0,0),(
382,980078,1,'FERNANDEZ','PIMENTEL','JESUS','ANTONIO','FERNANDEZ PIMENTEL JESUS ANTONIO',1,'08476954','1955-06-02 00:00:00',1,1,'','',NULL,'2011-04-01 00:00:00',0,0),(
383,049319,1,'FERNANDEZ','TORRES','ELSA','VICTORIA','FERNANDEZ TORRES ELSA VICTORIA',1,'06083599','1956-03-04 00:00:00',2,1,'','',NULL,'1981-08-16 00:00:00',0,0),(
384,980565,1,'FIGUEROA','CABANILLAS','MERLY','MELINA','FIGUEROA CABANILLAS MERLY MELINA',1,'09914049','1975-09-19 00:00:00',2,1,'','',NULL,'2020-12-31 00:00:00',0,0),(
385,980122,1,'FIGUEROA','GONZALES','JUAN','CARLOS','FIGUEROA GONZALES JUAN CARLOS',1,'09979791','1974-10-16 00:00:00',1,1,'','',NULL,'2012-12-13 00:00:00',0,0),(
386,980265,1,'FLOR','RAMOS','MAYLENA','EVELYN','FLOR RAMOS MAYLENA EVELYN',1,'10080276','1972-11-03 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
387,960378,1,'FLORES','BLANCAS','LUIS','FERNANDO','FLORES BLANCAS LUIS FERNANDO',1,'46532498','1990-09-10 00:00:00',1,1,'','',NULL,'2020-12-01 00:00:00',0,0),(
388,980414,1,'FLORES','CASTILLO','JUAN','PABLO','FLORES CASTILLO JUAN PABLO',1,'08300783','1962-07-03 00:00:00',1,1,'','',NULL,'2012-06-15 00:00:00',0,0),(
389,050009,1,'FLORES','CHUYES','VIRGINIA',NULL,'FLORES CHUYES VIRGINIA',1,'06893300','1954-09-02 00:00:00',2,1,'','',NULL,'1987-11-23 00:00:00',0,0),(
390,049693,1,'FLORES','GOMEZ','CARMEN','CONSUELO','FLORES GOMEZ CARMEN CONSUELO',1,'06280057','1964-07-26 00:00:00',2,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
391,980368,1,'FLORES','OLOYA','NANCY','MARITZA','FLORES OLOYA NANCY MARITZA',1,'43049060','1985-07-01 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
392,800426,1,'FLORES','PALMER','MARIA','LUISA','FLORES PALMER MARIA LUISA',1,'07210965','1957-12-05 00:00:00',2,1,'','',NULL,'1995-12-31 00:00:00',0,0),(
393,980369,1,'FLORES','PALOMINO','MARISOL','VIOLETA','FLORES PALOMINO MARISOL VIOLETA',1,'46462490','1990-04-10 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
394,980439,1,'FLORES','PALOMINO','PAMELA','YUDITH','FLORES PALOMINO PAMELA YUDITH',1,'42079786','1983-09-25 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
395,049694,1,'FLORES','QUISPE','LOURDES',NULL,'FLORES QUISPE LOURDES',1,'25816104','1965-04-02 00:00:00',2,1,'','',NULL,'1984-11-01 00:00:00',0,0),(
396,980531,1,'FLORES','SANCHEZ','JORGE','JAVIER','FLORES SANCHEZ JORGE JAVIER',1,'42713244','1984-09-19 00:00:00',1,1,'','',NULL,'2018-12-28 00:00:00',0,0),(
397,049695,1,'FLORES','TANTARUNA','MIGUEL','ANTONIO','FLORES TANTARUNA MIGUEL ANTONIO',1,'07168983','1962-12-14 00:00:00',1,1,'','',NULL,'1987-12-15 00:00:00',0,0),(
398,980370,1,'FLORES','YAROS','EDITH',NULL,'FLORES YAROS EDITH',1,'44090782','1986-11-25 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
399,049696,1,'FLORIAN','CACHAY','NANCY','AMPARO','FLORIAN CACHAY NANCY AMPARO',1,'06173506','1965-12-11 00:00:00',2,1,'','',NULL,'1986-12-01 00:00:00',0,0),(
400,800437,1,'FLORIAN','PLASENCIA','LIDIA','YULE','FLORIAN PLASENCIA LIDIA YULE',1,'18016223','1962-03-29 00:00:00',2,1,'','',NULL,'1996-01-23 00:00:00',0,0),(
401,049698,1,'FLORIAN','PLASENCIA','WILLIAM','ASCENCIO','FLORIAN PLASENCIA WILLIAM ASCENCIO',1,'09303213','1967-03-24 00:00:00',1,1,'','',NULL,'1985-08-01 00:00:00',0,0),(
402,800843,1,'FRANCO','NAJAR','ERWIN',NULL,'FRANCO NAJAR ERWIN',1,'08118245','1966-06-13 00:00:00',1,1,'','',NULL,'1998-01-01 00:00:00',0,0),(
403,980371,1,'FRANCO','SALAZAR','TATIANA',NULL,'FRANCO SALAZAR TATIANA',1,'21555243','1976-03-20 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
404,980212,1,'FRANCO','VITTERI','ALBERTO','RAFAEL','FRANCO VITTERI ALBERTO RAFAEL',1,'09999527','1974-12-23 00:00:00',1,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
405,134222,1,'FRIAS','PENA','CRUZ','PERSEVERANDA','FRIAS PENA CRUZ PERSEVERANDA',1,'08673274','1969-06-26 00:00:00',2,1,'','',NULL,'1991-12-31 00:00:00',0,0),(
406,980123,1,'GALAN','FIESTAS','WILFREDO','ARTURO','GALAN FIESTAS WILFREDO ARTURO',1,'06774793','1970-06-02 00:00:00',1,1,'','',NULL,'2012-12-13 00:00:00',0,0),(
407,049699,1,'GALIANO','SUAREZ','NOE','ALEJANDRO','GALIANO SUAREZ NOE ALEJANDRO',1,'10432086','1959-02-17 00:00:00',1,1,'','',NULL,'1980-03-01 00:00:00',0,0),(
408,980005,1,'GALINDO','CANALES','MARIA','BERTHA','GALINDO CANALES MARIA BERTHA',1,'08889018','1974-12-21 00:00:00',2,1,'','',NULL,'2008-02-01 00:00:00',0,0),(
409,049757,1,'GALINDO','VELASQUEZ','MARITZA','LEONOR','GALINDO VELASQUEZ MARITZA LEONOR',1,'08609481','1962-10-05 00:00:00',2,1,'','',NULL,'1991-12-31 00:00:00',0,0),(
410,980193,1,'GALVEZ','SALAZAR','DAVID','MIGUEL','GALVEZ SALAZAR DAVID MIGUEL',1,'08143083','1971-04-25 00:00:00',1,1,'','',NULL,'2014-02-01 00:00:00',0,0),(
411,980440,1,'GAMARRA','CAMACHO','ROSARIO','DEL PILAR','GAMARRA CAMACHO ROSARIO DEL PILAR',1,'41477891','1982-10-01 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
412,970038,1,'GAMARRA','CHUQUILLANQUI','NORMA','MARISOL','GAMARRA CHUQUILLANQUI NORMA MARISOL',1,'19804109','1964-10-30 00:00:00',2,1,'','',NULL,'2011-04-01 00:00:00',0,0),(
413,049703,1,'GAMARRA','ESPINOZA','MARYSOL',NULL,'GAMARRA ESPINOZA MARYSOL',1,'08505280','1966-12-29 00:00:00',2,1,'','',NULL,'1988-09-01 00:00:00',0,0),(
414,980441,1,'GAMARRA','FALCONI','HUGO','JESUS','GAMARRA FALCONI HUGO JESUS',1,'42958588','1987-03-02 00:00:00',1,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
415,980442,1,'GAMARRA','GAMARRA','ROXANA','JACKELINE','GAMARRA GAMARRA ROXANA JACKELINE',1,'42662966','1984-09-13 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
416,980524,1,'GAMARRA','HUAMAN','ZULMA',NULL,'GAMARRA HUAMAN ZULMA',1,'23998700','1977-10-13 00:00:00',2,1,'','',NULL,'2018-12-28 00:00:00',0,0),(
417,980476,1,'GAMARRA','MAURICIO','WILMER','RAUL','GAMARRA MAURICIO WILMER RAUL',1,'42510135','1984-07-09 00:00:00',1,1,'','',NULL,'2018-02-01 00:00:00',0,0),(
418,049704,1,'GAMBOA','OCHOA DE GUTIERREZ','FELICITA',NULL,'GAMBOA OCHOA DE GUTIERREZ FELICITA',1,'06841089','1956-03-07 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
419,980239,1,'GAMEZ','RIVAS','LUCY','BEATRIZ','GAMEZ RIVAS LUCY BEATRIZ',1,'08129149','1968-02-06 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
420,800851,1,'GAONA','ARANA','MARIA','SALOME','GAONA ARANA MARIA SALOME',1,'09776311','1967-10-24 00:00:00',2,1,'','',NULL,'1998-01-01 00:00:00',0,0),(
421,980477,1,'GARAY','CARDENAS','YOLANDA','MARIA','GARAY CARDENAS YOLANDA MARIA',1,'10335068','1976-10-11 00:00:00',2,1,'','',NULL,'2018-02-01 00:00:00',0,0),(
422,101759,1,'GARCIA','AMAYA','GRACIELA','ELVIRA','GARCIA AMAYA GRACIELA ELVIRA',1,'18868165','1965-12-22 00:00:00',2,1,'','',NULL,'1994-08-01 00:00:00',0,0),(
423,049353,1,'GARCIA','AYALA','MARIA','TERESA','GARCIA AYALA MARIA TERESA',1,'06215082','1955-11-07 00:00:00',2,1,'','',NULL,'1975-09-16 00:00:00',0,0),(
424,980141,1,'GARCIA','BUSTAMANTE','HECTOR','FERNANDO','GARCIA BUSTAMANTE HECTOR FERNANDO',1,'40934306','1981-04-29 00:00:00',1,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
425,049707,1,'GARCIA','CORDERO','LUCIA','ELENA','GARCIA CORDERO LUCIA ELENA',1,'07707165','1956-07-06 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
426,049709,1,'GARCIA','GUEVARA DE SAAVEDRA','IRENE',NULL,'GARCIA GUEVARA DE SAAVEDRA IRENE',1,'10363072','1952-05-08 00:00:00',2,1,'','',NULL,'1980-04-16 00:00:00',0,0),(
427,980142,1,'GARCIA','LAURENCIO','GREGORIA',NULL,'GARCIA LAURENCIO GREGORIA',1,'06794449','1975-03-12 00:00:00',2,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
428,980301,1,'GARCIA','NEYRA','EDITH','ELVA','GARCIA NEYRA EDITH ELVA',1,'40744375','1980-11-23 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
429,980181,1,'GARCIA','TABOADA','JESSICA','ELVIRA','GARCIA TABOADA JESSICA ELVIRA',1,'07970497','1969-05-20 00:00:00',2,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
430,049327,1,'GAYOSA','NAVARRETE DE DIAZ','ELISA','MICAELA','GAYOSA NAVARRETE DE DIAZ ELISA MICAELA',1,'08560854','1953-04-09 00:00:00',2,1,'','',NULL,'1988-09-01 00:00:00',0,0),(
431,800842,1,'GENG','BLAS','JUANA','PATRICIA','GENG BLAS JUANA PATRICIA',1,'07184008','1966-01-30 00:00:00',2,1,'','',NULL,'1998-01-01 00:00:00',0,0),(
432,970091,1,'GERMAN','SALAZAR','EDUARDO','EUSEBIO','GERMAN SALAZAR EDUARDO EUSEBIO',1,'25588505','1958-03-11 00:00:00',1,1,'','',NULL,'2017-12-31 00:00:00',0,0),(
433,098409,1,'GIL','LOPEZ','VICTORINA','ROSA','GIL LOPEZ VICTORINA ROSA',1,'25544225','1965-03-21 00:00:00',2,1,'','',NULL,'1989-12-31 00:00:00',0,0),(
434,980253,1,'GODOY','GUILLEN','LISSET','RAQUEL','GODOY GUILLEN LISSET RAQUEL',1,'42705575','1984-06-24 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
435,980372,1,'GOMEZ','PAIMA','YOVANA',NULL,'GOMEZ PAIMA YOVANA',1,'43556891','1986-01-19 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
436,980302,1,'GOMEZ','RIVERA','REBECA','AYDEE','GOMEZ RIVERA REBECA AYDEE',1,'20118777','1978-05-16 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
437,801036,1,'GOMEZ','ROMERO','TANIA','ROSARIO','GOMEZ ROMERO TANIA ROSARIO',1,'02423709','1966-11-25 00:00:00',2,1,'','',NULL,'2010-06-01 00:00:00',0,0),(
438,980030,1,'GOMEZ','TAGUCHI DE MORENO','ELEANA','PATRICIA','GOMEZ TAGUCHI DE MORENO ELEANA PATRICIA',1,'06785522','1964-01-24 00:00:00',2,1,'','',NULL,'2010-07-05 00:00:00',0,0),(
439,980187,1,'GOMEZ','VILLAVICENCIO','GRACIELA',NULL,'GOMEZ VILLAVICENCIO GRACIELA',1,'28207203','1963-12-06 00:00:00',2,1,'','',NULL,'2013-12-31 00:00:00',0,0),(
440,960330,1,'GONZALES','AVALOS','MONICA','ELIZABETH','GONZALES AVALOS MONICA ELIZABETH',1,'43686851','1986-03-23 00:00:00',2,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
441,101765,1,'GONZALES','MAROQUILCA','CARLOS','ENRIQUE','GONZALES MAROQUILCA CARLOS ENRIQUE',1,'06278375','1967-03-25 00:00:00',1,1,'','',NULL,'1990-07-15 00:00:00',0,0),(
442,049717,1,'GONZALES','MENDOZA','SANTOS','ELEODORA','GONZALES MENDOZA SANTOS ELEODORA',1,'06905278','1954-07-03 00:00:00',2,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
443,980194,1,'GONZALES','MORA','JORGE','ARTURO','GONZALES MORA JORGE ARTURO',1,'08244780','1955-11-04 00:00:00',1,1,'','',NULL,'2014-02-01 00:00:00',0,0),(
444,049718,1,'GONZALES','RIVERA','ALEXANDER',NULL,'GONZALES RIVERA ALEXANDER',1,'06263644','1966-06-25 00:00:00',1,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
445,049721,1,'GONZALES','SANDOVAL','MARTHA','NELLY','GONZALES SANDOVAL MARTHA NELLY',1,'09180885','1952-11-23 00:00:00',2,1,'','',NULL,'1981-07-16 00:00:00',0,0),(
446,101736,1,'GONZALEZ','ESPINOZA','EDY','ELIANA','GONZALEZ ESPINOZA EDY ELIANA',1,'06203008','1963-02-17 00:00:00',2,1,'','',NULL,'2013-03-01 00:00:00',0,0),(
447,950081,1,'GONZALEZ','PALACIOS','PATRICIA','SOLEDAD','GONZALEZ PALACIOS PATRICIA SOLEDAD',1,'02839448','1971-10-10 00:00:00',2,1,'','',NULL,'2010-06-01 00:00:00',0,0),(
448,970097,1,'GOYCOCHEA','AMBROSIO','ROSA','HERMELINDA','GOYCOCHEA AMBROSIO ROSA HERMELINDA',1,'06229833','1960-10-25 00:00:00',2,1,'','',NULL,'2017-06-01 00:00:00',0,0),(
449,050048,1,'GRADOS','ALVA','ENRIQUE',NULL,'GRADOS ALVA ARTURO ENRIQUE',1,'08685646','1969-05-06 00:00:00',1,1,'','',NULL,'2000-01-01 00:00:00',0,0),(
450,800852,1,'GRADOS','ALVA','MATILDE',NULL,'GRADOS ALVA LITA MATILDE',1,'08477844','1966-06-15 00:00:00',2,1,'','',NULL,'1998-01-01 00:00:00',0,0),(
451,049914,1,'GRADOS','GARCIA DE BEDREGAL','ANGELICA',NULL,'GRADOS GARCIA DE BEDREGAL MARIA ANGELICA',1,'09230715','1951-08-23 00:00:00',2,1,'','',NULL,'1991-12-31 00:00:00',0,0),(
452,049329,1,'GRADOS','LOZA','DAYSY',NULL,'GRADOS LOZA LYLY DAYSY',1,'08743935','1954-10-06 00:00:00',2,1,'','',NULL,'1980-04-16 00:00:00',0,0),(
453,049408,1,'GRANDA','ZAPATA','EMPERATRIZ',NULL,'GRANDA ZAPATA ROSARIO EMPERATRIZ',1,'07317501','1957-10-05 00:00:00',2,1,'','',NULL,'1980-11-03 00:00:00',0,0),(
454,980303,1,'GRIMALDO','CARDENAS','ISABEL',NULL,'GRIMALDO CARDENAS YESENIA ISABEL',1,'40730759','1980-06-08 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
455,049729,1,'GUANILO','TEJADA','VIOLETA',NULL,'GUANILO TEJADA MIRIAM VIOLETA',1,'06124325','1951-11-27 00:00:00',2,1,'','',NULL,'2017-02-01 00:00:00',0,0),(
456,980017,1,'GUAYLUPO','REYES','VICTORIA',NULL,'GUAYLUPO REYES MARIA VICTORIA',1,'02840981','1973-12-15 00:00:00',2,1,'','',NULL,'2008-02-01 00:00:00',0,0),(
457,980195,1,'GUERRA','BARRERA','EDUARDO',NULL,'GUERRA BARRERA ROBERTO EDUARDO',1,'06792800','1974-09-06 00:00:00',1,1,'','',NULL,'2014-02-01 00:00:00',0,0),(
458,116773,1,'GUERRA','VALVERDE','MARTIN',NULL,'GUERRA VALVERDE RICARDO MARTIN',1,'09640476','1969-06-12 00:00:00',1,1,'','',NULL,'2003-08-01 00:00:00',0,0),(
459,980339,1,'GUERRERO','CUETO','MANUEL',NULL,'GUERRERO CUETO JUAN MANUEL',1,'41390905','1979-08-20 00:00:00',1,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
460,049731,1,'GUERRERO','ORE','ENRIQUETA',NULL,'GUERRERO ORE IRMA ENRIQUETA',1,'08033551','1959-01-06 00:00:00',2,1,'','',NULL,'1982-09-01 00:00:00',0,0),(
461,970095,1,'GUERRERO','POMA','BETSI','LIZ','GUERRERO POMA BETSI LIZ',1,'20071544','1975-11-25 00:00:00',2,1,'','',NULL,'2017-07-01 00:00:00',0,0),(
462,049997,1,'GUEVARA','VILLANUEVA','RUTH','ELIZABETH','GUEVARA VILLANUEVA RUTH ELIZABETH',1,'06796493','1960-07-26 00:00:00',2,1,'','',NULL,'1986-07-01 00:00:00',0,0),(
463,050075,1,'GUILLEN','LUNA DE GODOY','BETZABE','NEMECIA','GUILLEN LUNA DE GODOY BETZABE NEMECIA',1,'31631474','1951-12-19 00:00:00',2,1,'','',NULL,'1974-04-01 00:00:00',0,0),(
464,980060,1,'GURMENDI','MEDINA','JANET','TERESA','GURMENDI MEDINA JANET TERESA',1,'08580215','1965-11-21 00:00:00',2,1,'','',NULL,'2011-04-01 00:00:00',0,0),(
465,049478,1,'GUTARRA','CANCHUCAJA','JORGE','EDGARDO','GUTARRA CANCHUCAJA JORGE EDGARDO',1,'07353008','1956-12-26 00:00:00',1,1,'','',NULL,'1996-01-11 00:00:00',0,0),(
466,980148,1,'GUTIERREZ','ARTEAGA','MARCO','ANTONIO','GUTIERREZ ARTEAGA MARCO ANTONIO',1,'19912323','1955-06-25 00:00:00',1,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
467,049459,1,'GUTIERREZ','CAHUANA','JULIA','VIRGINIA','GUTIERREZ CAHUANA JULIA VIRGINIA',1,'29295267','1963-02-16 00:00:00',2,1,'','',NULL,'1991-12-31 00:00:00',0,0),(
468,980229,1,'GUTIERREZ','CAHUANA','REGINA','MIRTHA','GUTIERREZ CAHUANA REGINA MIRTHA',1,'29601256','1971-09-07 00:00:00',2,1,'','',NULL,'2006-06-12 00:00:00',0,0),(
469,980373,1,'GUTIERREZ','GRADOS','MARIA','SOLEDAD','GUTIERREZ GRADOS MARIA SOLEDAD',1,'40306824','1979-08-08 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
470,980528,1,'GUTIERREZ','JUAREZ','VICTOR','FISHER','GUTIERREZ JUAREZ VICTOR FISHER',1,'40986194','1979-05-05 00:00:00',1,1,'','',NULL,'2018-12-28 00:00:00',0,0),(
471,049734,1,'GUTIERREZ','MEJIA','ANA','ROSARIO GODILIA','GUTIERREZ MEJIA ANA ROSARIO GODILIA',1,'06879493','1961-09-29 00:00:00',2,1,'','',NULL,'1985-08-01 00:00:00',0,0),(
472,049736,1,'GUTIERREZ','SANCARRANCO','NILDA','SOCORRO','GUTIERREZ SANCARRANCO NILDA SOCORRO',1,'07403186','1959-09-04 00:00:00',2,1,'','',NULL,'1984-10-01 00:00:00',0,0),(
473,049846,1,'GUZMAN','VELIZ','ANA',NULL,'GUZMAN VELIZ ANA',1,'08668670','1967-10-28 00:00:00',2,1,'','',NULL,'1995-01-01 00:00:00',0,0),(
474,049737,1,'HERNANDEZ','ARAUJO','GRACIELA',NULL,'HERNANDEZ ARAUJO GRACIELA',1,'06120227','1960-12-07 00:00:00',2,1,'','',NULL,'1988-12-31 00:00:00',0,0),(
475,116889,1,'HERNANDEZ','BUSTAMANTE','MYRTHA','LUCY','HERNANDEZ BUSTAMANTE MYRTHA LUCY',1,'07223195','1963-10-03 00:00:00',2,1,'','',NULL,'2002-07-15 00:00:00',0,0),(
476,980102,1,'HERNANDEZ','VENTURA','PAOLA','ROCIO','HERNANDEZ VENTURA PAOLA ROCIO',1,'21577186','1978-02-13 00:00:00',2,1,'','',NULL,'2012-07-01 00:00:00',0,0),(
477,049739,1,'HERRERA','CORTEGANA','CARMEN','AMELIA','HERRERA CORTEGANA CARMEN AMELIA',1,'06179826','1953-03-12 00:00:00',2,1,'','',NULL,'1982-12-01 00:00:00',0,0),(
478,101772,1,'HERRERA','LEDESMA','CARLOS','ALBERTO','HERRERA LEDESMA CARLOS ALBERTO',1,'18056234','1960-01-28 00:00:00',1,1,'','',NULL,'1990-07-15 00:00:00',0,0),(
479,116723,1,'HERRERA','MALAGA','ROCIO','CECILIA','HERRERA MALAGA ROCIO CECILIA',1,'29548581','1969-11-06 00:00:00',2,1,'','',NULL,'2003-08-01 00:00:00',0,0),(
480,980211,1,'HERRERA','TORRES','MERICE','BERCELIA','HERRERA TORRES MERICE BERCELIA',1,'16440734','1966-05-30 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
481,116444,1,'HERRERA','VENTURA','MARIA','LUISA','HERRERA VENTURA MARIA LUISA',1,'07407820','1960-12-13 00:00:00',2,1,'','',NULL,'2003-08-01 00:00:00',0,0),(
482,980079,1,'HIDALGO','GOMEZ','JANETH','MELINA','HIDALGO GOMEZ JANETH MELINA',1,'21461186','1967-04-10 00:00:00',2,1,'','',NULL,'2011-04-01 00:00:00',0,0),(
483,801017,1,'HIDALGO','QUEZADA','SANTOS','MILAGROS','HIDALGO QUEZADA SANTOS MILAGROS',1,'08587776','1963-10-29 00:00:00',2,1,'','',NULL,'2010-06-01 00:00:00',0,0),(
484,980031,1,'HIDALGO','SOTO','JUANA','LIDIA','HIDALGO SOTO JUANA LIDIA',1,'10536820','1972-06-24 00:00:00',2,1,'','',NULL,'2010-07-05 00:00:00',0,0),(
485,980491,1,'HIJAR','SIFUENTES','YECENIA','ADELITA','HIJAR SIFUENTES YECENIA ADELITA',1,'42048494','1983-10-23 00:00:00',2,1,'','',NULL,'2018-01-16 00:00:00',0,0),(
486,980443,1,'HILARES','SORIA','MABEL',NULL,'HILARES SORIA MABEL',1,'41322445','1982-01-24 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
487,980304,1,'HILARIO','CAJAVILCA','LUISA','VICTORIA','HILARIO CAJAVILCA LUISA VICTORIA',1,'10190488','1974-05-17 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
488,049742,1,'HILARIO','COCHACHI','MACEDONIO','ALEJANDRO','HILARIO COCHACHI MACEDONIO ALEJANDRO',1,'10046582','1953-08-12 00:00:00',1,1,'','',NULL,'1987-12-31 00:00:00',0,0),(
489,049743,1,'HILARIO','RUBINA','NORMA',NULL,'HILARIO RUBINA NORMA',1,'09384302','1968-07-24 00:00:00',2,1,'','',NULL,'1988-12-31 00:00:00',0,0),(
490,980340,1,'HILARION','VALERIANO DE VASQUEZ','GISSELA','SILVIA','HILARION VALERIANO DE VASQUEZ GISSELA SILVIA',1,'09990962','1975-09-03 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
491,980341,1,'HINOSTROZA','BOLIGE','NATALY','ANDREA','HINOSTROZA BOLIGE NATALY ANDREA',1,'43654298','1986-04-25 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
492,980305,1,'HINOSTROZA','CAMARENA','JANET','MARLENI','HINOSTROZA CAMARENA JANET MARLENI',1,'10812151','1971-09-12 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
493,049336,1,'HINOSTROZA','GOYAS','SUSANA','NILDA','HINOSTROZA GOYAS SUSANA NILDA',1,'08532499','1954-05-24 00:00:00',2,1,'','',NULL,'1988-08-16 00:00:00',0,0),(
494,049746,1,'HINOSTROZA','HUAYTALLA','NANCY','MARIA','HINOSTROZA HUAYTALLA NANCY MARIA',1,'09208055','1956-09-11 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
495,980257,1,'HOYOS','ROJAS','ROCIO','CAROL','HOYOS ROJAS ROCIO CAROL',1,'08692381','1970-03-19 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
496,980374,1,'HUACHACA','BENITES','CYNTHIA',NULL,'HUACHACA BENITES CYNTHIA',1,'43385895','1985-12-19 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
497,980375,1,'HUACHOS','VEGA','DIANA','MARGARITA','HUACHOS VEGA DIANA MARGARITA',1,'42653043','1983-12-30 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
498,049749,1,'HUAIRA','FLORES','RODOLFO',NULL,'HUAIRA FLORES RODOLFO',1,'08626912','1959-08-30 00:00:00',1,1,'','',NULL,'1984-11-01 00:00:00',0,0),(
499,049956,1,'HUALLPA','SALAS','LAURA','LUZMILA','HUALLPA SALAS LAURA LUZMILA',1,'09788369','1971-07-24 00:00:00',2,1,'','',NULL,'1994-08-01 00:00:00',0,0),(
500,101771,1,'HUAMAN','ROCIO','.',NULL,'HUAMAN  ROCIO .',1,'07457768','1969-02-10 00:00:00',2,1,'','',NULL,'1990-07-15 00:00:00',0,0),(
501,049338,1,'HUAMAN','ASTOCONDOR','FLOR','DE MARIA','HUAMAN ASTOCONDOR FLOR DE MARIA',1,'08066883','1964-05-23 00:00:00',2,1,'','',NULL,'1988-09-01 00:00:00',0,0),(
502,980376,1,'HUAMAN','BECERRA','JESSICA','EVELINA','HUAMAN BECERRA JESSICA EVELINA',1,'44582578','1987-03-11 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
503,980073,1,'HUAMAN','CHINGUEL','ADELMA',NULL,'HUAMAN CHINGUEL ADELMA',1,'09948170','1974-10-16 00:00:00',2,1,'','',NULL,'2011-05-01 00:00:00',0,0),(
504,049751,1,'HUAMAN','CORDOVA DE MEJIA','MARIA',NULL,'HUAMAN CORDOVA DE MEJIA MARIA',1,'06139685','1951-07-10 00:00:00',2,1,'','',NULL,'2017-08-01 00:00:00',0,0),(
505,980130,1,'HUAMAN','GUEVARA','ROMELIO','TELMO','HUAMAN GUEVARA ROMELIO TELMO',1,'27567436','1972-10-18 00:00:00',1,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
506,049752,1,'HUAMAN','GUEVARA','WILDER','MARCIAL','HUAMAN GUEVARA WILDER MARCIAL',1,'06816349','1965-04-22 00:00:00',1,1,'','',NULL,'1988-09-01 00:00:00',0,0),(
507,049753,1,'HUAMAN','HUACHUPOMA','MARINA','ISABEL','HUAMAN HUACHUPOMA MARINA ISABEL',1,'07300061','1957-06-18 00:00:00',2,1,'','',NULL,'1985-08-01 00:00:00',0,0),(
508,049467,1,'HUAMAN','NAUPARI','CARMEN','CECILIA','HUAMAN NAUPARI CARMEN CECILIA',1,'08015058','1956-10-18 00:00:00',2,1,'','',NULL,'1986-07-01 00:00:00',0,0),(
509,049754,1,'HUAMAN','QUINONES','MARINA',NULL,'HUAMAN QUINONES MARINA',1,'08106232','1956-06-18 00:00:00',2,1,'','',NULL,'1987-12-15 00:00:00',0,0),(
510,049755,1,'HUAMAN','RODRIGUEZ','ELSA','ESTELA','HUAMAN RODRIGUEZ ELSA ESTELA',1,'07087194','1952-09-03 00:00:00',2,1,'','',NULL,'1988-09-17 00:00:00',0,0),(
511,980377,1,'HUAMAN','SALAZAR','RUTH','YOVANA','HUAMAN SALAZAR RUTH YOVANA',1,'43167085','1985-07-01 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
512,049971,1,'HUAMAN','TORRES','ALEYDA','PATRICIA','HUAMAN TORRES ALEYDA PATRICIA',1,'09939302','1967-09-13 00:00:00',2,1,'','',NULL,'1991-12-31 00:00:00',0,0),(
513,049866,1,'HUAMANI','ARIAS','JUDITH','SANDRA','HUAMANI ARIAS JUDITH SANDRA',1,'09431923','1968-09-27 00:00:00',2,1,'','',NULL,'1994-08-01 00:00:00',0,0),(
514,950041,1,'HUAMANI','ARIAS','RUTH','INES','HUAMANI ARIAS RUTH INES',1,'09943564','1975-02-28 00:00:00',2,1,'','',NULL,'2007-06-01 00:00:00',0,0),(
515,980481,1,'HUAMANI','LORENZO','JACQUELINE','MERY','HUAMANI LORENZO JACQUELINE MERY',1,'40596448','1980-09-12 00:00:00',2,1,'','',NULL,'2018-02-01 00:00:00',0,0),(
516,091227,1,'HUAMANI','RUIZ','CARLOS','ENRIQUE','HUAMANI RUIZ CARLOS ENRIQUE',1,'08089655','1957-01-27 00:00:00',1,1,'','',NULL,'1989-07-04 00:00:00',0,0),(
517,049758,1,'HUAMANI','TAYA','GAVI','VIVIANA','HUAMANI TAYA GAVI VIVIANA',1,'08909071','1956-12-20 00:00:00',2,1,'','',NULL,'1980-11-01 00:00:00',0,0),(
518,049681,1,'HUAMANI','TORRES','RINA','FLOR','HUAMANI TORRES RINA FLOR',1,'06188845','1959-05-31 00:00:00',2,1,'','',NULL,'1987-12-01 00:00:00',0,0),(
519,049396,1,'HUAMANI','VALDIVIA','FELIA',NULL,'HUAMANI VALDIVIA FELIA',1,'10539878','1968-03-30 00:00:00',2,1,'','',NULL,'1996-12-31 00:00:00',0,0),(
520,800418,1,'HUAPAYA','REYNA','CLORINDA','LEONOR','HUAPAYA REYNA CLORINDA LEONOR',1,'06148719','1954-12-29 00:00:00',2,1,'','',NULL,'1976-03-01 00:00:00',0,0),(
521,949981,1,'HUARCAYA','HUAYPAR','CELSO',NULL,'HUARCAYA HUAYPAR CELSO',1,'23847711','1962-04-06 00:00:00',1,1,'','',NULL,'2004-04-01 00:00:00',0,0),(
522,980546,1,'HUARHUACHI','PARIONA','ANGELICA',NULL,'HUARHUACHI PARIONA ANGELICA',1,'44807954','1986-04-02 00:00:00',2,1,'','',NULL,'2020-12-31 00:00:00',0,0),(
523,980378,1,'HUAUYA','GAGO','KAREN','DONICIA','HUAUYA GAGO KAREN DONICIA',1,'44078869','1986-07-18 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
524,049529,1,'HUAYAPA','YPARRAGUIRRE','EUGENIA',NULL,'HUAYAPA YPARRAGUIRRE EUGENIA',1,'06856069','1955-04-23 00:00:00',2,1,'','',NULL,'1976-02-01 00:00:00',0,0),(
525,970069,1,'HUAYCANI','CACERES','ROCIO','DEL CARMEN','HUAYCANI CACERES ROCIO DEL CARMEN',1,'00497126','1973-03-17 00:00:00',2,1,'','',NULL,'2019-06-01 00:00:00',0,0),(
526,980444,1,'HUAYHUAPUMA','AMAO','ELIZABETH',NULL,'HUAYHUAPUMA AMAO ELIZABETH',1,'43452811','1986-02-20 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
527,980288,1,'HUAYNATE','YALI','OSWALDO','MOISES','HUAYNATE YALI OSWALDO MOISES',1,'08644228','1965-02-03 00:00:00',1,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
528,980074,1,'HUAYTALLA','RAMOS DE CRIADO','OLGA','MARIA','HUAYTALLA RAMOS DE CRIADO OLGA MARIA',1,'06118088','1965-06-06 00:00:00',2,1,'','',NULL,'2011-04-01 00:00:00',0,0),(
529,980131,1,'HUERTA','TARAZONA','LIDA','BIBIANA','HUERTA TARAZONA LIDA BIBIANA',1,'10553945','1972-12-17 00:00:00',2,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
530,049368,1,'HUERTAS','FELIX','CARLOS',NULL,'HUERTAS FELIX CARLOS',1,'07238662','1957-04-30 00:00:00',1,1,'','',NULL,'1991-12-31 00:00:00',0,0),(
531,960355,1,'HUERTAS','MOGOLLON','GABRIEL',NULL,'HUERTAS MOGOLLON GABRIEL',1,'46367784','1990-06-08 00:00:00',1,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
532,980556,1,'HUILLCA','ORTIZ','MANUEL','MARTIN','HUILLCA ORTIZ MANUEL MARTIN',1,'40998385','1981-01-14 00:00:00',1,1,'','',NULL,'2020-12-31 00:00:00',0,0),(
533,980512,1,'HUILLCA','ORTIZ','MARCO','ANTONIO','HUILLCA ORTIZ MARCO ANTONIO',1,'41415793','1982-05-26 00:00:00',1,1,'','',NULL,'2018-11-22 00:00:00',0,0),(
534,980196,1,'HUIVIN','GAMARRA','ZAAVINCY','YORYELINDA','HUIVIN GAMARRA ZAAVINCY YORYELINDA',1,'09873240','1973-09-08 00:00:00',2,1,'','',NULL,'2014-02-01 00:00:00',0,0),(
535,107123,1,'HUIZA','ESPINOZA','LILIA','FRANCISCA','HUIZA ESPINOZA LILIA FRANCISCA',1,'07719317','1955-10-04 00:00:00',2,1,'','',NULL,'1991-12-31 00:00:00',0,0),(
536,980540,1,'HUIZA','RICALDI','JEANETH','ROXANA','HUIZA RICALDI JEANETH ROXANA',1,'41433772','1982-06-27 00:00:00',2,1,'','',NULL,'2019-01-15 00:00:00',0,0),(
537,970049,1,'HURTADO','TAPIA','ELVIA',NULL,'HURTADO TAPIA ELVIA',1,'27722610','1971-11-10 00:00:00',2,1,'','',NULL,'2013-12-01 00:00:00',0,0),(
538,960385,1,'IANNUCCILLI','LLERENA','PATRICIA','CAROLINA','IANNUCCILLI LLERENA PATRICIA CAROLINA',1,'73122522','1992-11-20 00:00:00',2,1,'','',NULL,'2020-12-01 00:00:00',0,0),(
539,980097,1,'IBANEZ','TRUJILLO','YECIKA','DEICY','IBANEZ TRUJILLO YECIKA DEICY',1,'09604724','1969-10-15 00:00:00',2,1,'','',NULL,'2012-07-01 00:00:00',0,0),(
540,049769,1,'IBERICO','CALLA','MARINA',NULL,'IBERICO CALLA MARINA',1,'07194859','1959-12-28 00:00:00',2,1,'','',NULL,'1981-06-01 00:00:00',0,0),(
541,980266,1,'ICHIPARRA','REYES','SILVIA',NULL,'ICHIPARRA REYES SILVIA',1,'40365094','1979-11-26 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
542,800431,1,'ICHPAS','CUBA','FREDY','ANGEL','ICHPAS CUBA FREDY ANGEL',1,'08469972','1963-01-17 00:00:00',1,1,'','',NULL,'1995-12-31 00:00:00',0,0),(
543,980566,1,'ILAZACA','CAHUATA','FRANK',NULL,'ILAZACA CAHUATA FRANK',1,'01333415','1975-10-20 00:00:00',1,1,'','',NULL,'2017-07-01 00:00:00',0,0),(
544,960361,1,'ILDEFONSO','GARCIA','ZOELY','JACKELYN','ILDEFONSO GARCIA ZOELY JACKELYN',1,'42942584','1985-01-30 00:00:00',2,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
545,980109,1,'INFANTE','ZAPATA','DIANA','SOLEDAD','INFANTE ZAPATA DIANA SOLEDAD',1,'25744177','1970-10-10 00:00:00',2,1,'','',NULL,'2012-07-01 00:00:00',0,0),(
546,090994,1,'INGAR','ARMIJO','WILFREDO','HUMBERTO','INGAR ARMIJO WILFREDO HUMBERTO',1,'09997873','1953-09-30 00:00:00',1,1,'','',NULL,'1988-10-01 00:00:00',0,0),(
547,960375,1,'IPARRAGUIRRE','CASTRO','DANNY','DAVID','IPARRAGUIRRE CASTRO DANNY DAVID',1,'43832818','1986-10-10 00:00:00',1,1,'','',NULL,'2020-12-01 00:00:00',0,0),(
548,116774,1,'ISHIYAMA','NIETO','EMILIA','DE LOURDES','ISHIYAMA NIETO EMILIA DE LOURDES',1,'07971832','1969-09-22 00:00:00',2,1,'','',NULL,'2003-08-01 00:00:00',0,0),(
549,049771,1,'ISLA','DURAN','HUGO','JULIAN','ISLA DURAN HUGO JULIAN',1,'07313809','1962-01-27 00:00:00',1,1,'','',NULL,'1982-12-01 00:00:00',0,0),(
550,980515,1,'ISLACHIN','YUTO','LILIAN','JUDITH','ISLACHIN YUTO LILIAN JUDITH',1,'43676175','1986-08-20 00:00:00',2,1,'','',NULL,'2018-11-22 00:00:00',0,0),(
551,980006,1,'IZARRA','CRUZ','ANA','KARINA','IZARRA CRUZ ANA KARINA',1,'09997158','1974-06-04 00:00:00',2,1,'','',NULL,'2008-02-01 00:00:00',0,0),(
552,101782,1,'JARAMILLO','ALVA','OLGA','LIDIA','JARAMILLO ALVA OLGA LIDIA',1,'08669287','1968-01-15 00:00:00',2,1,'','',NULL,'1990-05-25 00:00:00',0,0),(
553,980445,1,'JARAMILLO','CABALLERO','JUDITH','JUANA','JARAMILLO CABALLERO JUDITH JUANA',1,'44335941','1986-07-26 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
554,049773,1,'JAULIZ','GOSE','ROSALBINA','VICTORIA','JAULIZ GOSE ROSALBINA VICTORIA',1,'10134556','1963-07-21 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
555,960379,1,'JAVES','PERTUZ','ALEJANDRO','DAVID','JAVES PERTUZ ALEJANDRO DAVID',1,'46824206','1992-03-04 00:00:00',1,1,'','',NULL,'2020-12-01 00:00:00',0,0),(
556,049775,1,'JIMENEZ','ALZAMORA','CELSA','NOEMI','JIMENEZ ALZAMORA CELSA NOEMI',1,'09285954','1967-06-11 00:00:00',2,1,'','',NULL,'1988-09-01 00:00:00',0,0),(
557,980380,1,'JIMENEZ','DONAYRE','DORIS','OFELIA','JIMENEZ DONAYRE DORIS OFELIA',1,'43085955','1985-06-13 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
558,049679,1,'JIMENEZ','ESPINOZA','ROSMERY',NULL,'JIMENEZ ESPINOZA ROSMERY',1,'32770124','1966-05-27 00:00:00',2,1,'','',NULL,'1994-08-01 00:00:00',0,0),(
559,800450,1,'JUAREZ','RIVERA','JULIA',NULL,'JUAREZ RIVERA JULIA',1,'07331111','1965-04-19 00:00:00',2,1,'','',NULL,'1995-12-31 00:00:00',0,0),(
560,980446,1,'JUAREZ','RIVERA','MARIA','MAGDALENA','JUAREZ RIVERA MARIA MAGDALENA',1,'42051754','1983-09-25 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
561,980289,1,'JUGO','REBAZA','JAVIER','NICOLAZ','JUGO REBAZA JAVIER NICOLAZ',1,'08048996','1964-06-19 00:00:00',1,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
562,049344,1,'JULCA','MACHUCA','NANCY','BETTY','JULCA MACHUCA NANCY BETTY',1,'06071564','1955-09-11 00:00:00',2,1,'','',NULL,'1980-03-01 00:00:00',0,0),(
563,980251,1,'JULCAMANYAN','TANTAVILCA','EDWARD','NORMAN','JULCAMANYAN TANTAVILCA EDWARD NORMAN',1,'25758748','1973-12-03 00:00:00',1,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
564,049572,1,'JURADO','LOPEZ','LUZ',NULL,'JURADO LOPEZ LUZ',1,'08092590','1965-11-09 00:00:00',2,1,'','',NULL,'1987-12-01 00:00:00',0,0),(
565,101767,1,'JUSCAMAITA','LAURA','MAXIMIANA',NULL,'JUSCAMAITA LAURA MAXIMIANA',1,'08515823','1961-07-27 00:00:00',2,1,'','',NULL,'1990-07-15 00:00:00',0,0),(
566,049780,1,'KENCHAU','SHAPIAMA DE ACEVEDO','LUZ','CONSUELO','KENCHAU SHAPIAMA DE ACEVEDO LUZ CONSUELO',1,'06013886','1960-02-26 00:00:00',2,1,'','',NULL,'1987-12-31 00:00:00',0,0),(
567,049782,1,'KOC','GODINEZ','REBECA','EMPERATRIZ','KOC GODINEZ REBECA EMPERATRIZ',1,'07108422','1959-05-28 00:00:00',2,1,'','',NULL,'1981-11-16 00:00:00',0,0),(
568,101735,1,'LA MADRID','ROJAS','JENNY','MABEL','LA MADRID ROJAS JENNY MABEL',1,'09926202','1972-12-30 00:00:00',2,1,'','',NULL,'2000-03-01 00:00:00',0,0),(
569,960347,1,'LA TORRE','DAVILA','ROSA','ANDREA','LA TORRE DAVILA ROSA ANDREA',1,'44367252','1987-06-08 00:00:00',2,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
570,980197,1,'LANDEO','ALIAGA','VICTOR',NULL,'LANDEO ALIAGA VICTOR',1,'07500093','1973-01-20 00:00:00',1,1,'','',NULL,'2014-02-01 00:00:00',0,0),(
571,049280,1,'LANFRANCO','ASPAJO DE TIMANA','MIRIAM','VICTORIA','LANFRANCO ASPAJO DE TIMANA MIRIAM VICTORIA',1,'07167636','1962-12-19 00:00:00',2,1,'','',NULL,'1995-01-16 00:00:00',0,0),(
572,980084,1,'LAPA','BARZOLA','HAYDEE','BERTHA','LAPA BARZOLA HAYDEE BERTHA',1,'09366845','1970-04-25 00:00:00',2,1,'','',NULL,'2012-03-01 00:00:00',0,0),(
573,049784,1,'LAPA','GRACIANO','FERNANDO','ALFREDO','LAPA GRACIANO FERNANDO ALFREDO',1,'07990113','1962-05-26 00:00:00',1,1,'','',NULL,'1988-12-31 00:00:00',0,0),(
574,049785,1,'LAPA','GRACIANO','RODOLFO','VICTOR','LAPA GRACIANO RODOLFO VICTOR',1,'09527304','1967-06-23 00:00:00',1,1,'','',NULL,'1988-09-01 00:00:00',0,0),(
575,049788,1,'LARA','MUNOZ DE ROJAS','LUZ','BENILDE','LARA MUNOZ DE ROJAS LUZ BENILDE',1,'09621418','1959-01-12 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
576,049787,1,'LARA','MUNOZ','JOSE','ALCIVIADES','LARA MUNOZ JOSE ALCIVIADES',1,'06090871','1966-07-02 00:00:00',1,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
577,098377,1,'LARA','RODRIGUEZ','LUIS','ANDRES','LARA RODRIGUEZ LUIS ANDRES',1,'06203806','1960-02-28 00:00:00',1,1,'','',NULL,'1989-12-15 00:00:00',0,0),(
578,049790,1,'LAURA','CRUCES','MANUEL','ANGEL','LAURA CRUCES MANUEL ANGEL',1,'06277467','1958-04-19 00:00:00',1,1,'','',NULL,'1980-11-01 00:00:00',0,0),(
579,049791,1,'LAURA','DE LA CRUZ','ELISA','MARIA','LAURA DE LA CRUZ ELISA MARIA',1,'07399537','1963-04-17 00:00:00',2,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
580,980513,1,'LAVANTO','CHIARA','MARIA','DEL PILAR','LAVANTO CHIARA MARIA DEL PILAR',1,'42218223','1982-10-23 00:00:00',2,1,'','',NULL,'2018-11-22 00:00:00',0,0),(
581,049792,1,'LAYSECA','REINOSO','BERTHA','CONSUELO','LAYSECA REINOSO BERTHA CONSUELO',1,'08208461','1963-09-26 00:00:00',2,1,'','',NULL,'1984-11-01 00:00:00',0,0),(
582,980007,1,'LAZO','SOLIS','MARIA','ELENA','LAZO SOLIS MARIA ELENA',1,'19819977','1960-09-29 00:00:00',2,1,'','',NULL,'2008-02-01 00:00:00',0,0),(
583,107124,1,'LEANDRO','MARTINEZ','GLORIA','ALCIRA','LEANDRO MARTINEZ GLORIA ALCIRA',1,'10374616','1963-02-26 00:00:00',2,1,'','',NULL,'1987-11-23 00:00:00',0,0),(
584,049347,1,'LEIVA','BERAUN','JORGE','MANUEL','LEIVA BERAUN JORGE MANUEL',1,'07856780','1954-03-12 00:00:00',1,1,'','',NULL,'1991-12-31 00:00:00',0,0),(
585,950064,1,'LEMA','RODRIGUEZ','MARITZA','RAQUEL','LEMA RODRIGUEZ MARITZA RAQUEL',1,'06756682','1960-02-23 00:00:00',2,1,'','',NULL,'2007-06-01 00:00:00',0,0),(
586,970046,1,'LEON','HUAPAYA','JOHN','SERGIO','LEON HUAPAYA JOHN SERGIO',1,'15427132','1972-12-16 00:00:00',1,1,'','',NULL,'2014-07-01 00:00:00',0,0),(
587,980008,1,'LEON','MALDONADO','RINA','BERENICE','LEON MALDONADO RINA BERENICE',1,'21134191','1974-04-08 00:00:00',2,1,'','',NULL,'2008-02-01 00:00:00',0,0),(
588,950002,1,'LEON','RODRIGUEZ','ROCIO','DE LAS MERCEDES','LEON RODRIGUEZ DE LEZCANO ROCIO DE LAS MERCEDES',1,'18095205','1968-09-23 00:00:00',2,1,'','',NULL,'2004-12-11 00:00:00',0,0),(
589,980027,1,'LEON','VELASQUEZ','MANOLO','ALBERTO','LEON VELASQUEZ MANOLO ALBERTO',1,'16005260','1970-12-28 00:00:00',1,1,'','',NULL,'2008-02-01 00:00:00',0,0),(
590,980198,1,'LEON','VELIZ','JUANA','AMANDA','LEON VELIZ JUANA AMANDA',1,'06622739','1952-05-20 00:00:00',2,1,'','',NULL,'2014-02-01 00:00:00',0,0),(
591,049797,1,'LESCANO','AGUIRRE','GUILLERMO',NULL,'LESCANO AGUIRRE GUILLERMO',1,'07593953','1955-12-17 00:00:00',1,1,'','',NULL,'1977-08-01 00:00:00',0,0),(
592,980510,1,'LESCANO','GUERRA','DANY','GABRIEL','LESCANO GUERRA DANY GABRIEL',1,'40714649','1980-09-07 00:00:00',1,1,'','',NULL,'2018-11-22 00:00:00',0,0),(
593,980327,1,'LEVANO','SALAZAR','MARIA','LUISA','LEVANO SALAZAR MARIA LUISA',1,'21556174','1975-09-11 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
594,960327,1,'LEZAMA','ALVA','WILLIAM','DANIEL','LEZAMA ALVA WILLIAM DANIEL',1,'70618508','1994-06-04 00:00:00',1,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
595,800846,1,'LEZMA','ROJAS','PURA','MILENA','LEZMA ROJAS PURA MILENA',1,'27913411','1967-12-08 00:00:00',2,1,'','',NULL,'1998-01-01 00:00:00',0,0),(
596,800618,1,'LI','MANRIQUE','JORGE','LUIS','LI MANRIQUE JORGE LUIS',1,'05364189','1959-07-16 00:00:00',1,1,'','',NULL,'1998-08-01 00:00:00',0,0),(
597,980447,1,'LINARES','ESTELA','GUADALUPE','NELLY','LINARES ESTELA GUADALUPE NELLY',1,'46961107','1990-11-04 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
598,049800,1,'LINARES','MEDINA','SEGUNDA','CIRILA','LINARES MEDINA SEGUNDA CIRILA',1,'10590622','1953-03-29 00:00:00',2,1,'','',NULL,'1988-09-01 00:00:00',0,0),(
599,133516,1,'LINARES','MONGE','BLANCA','MARLENY','LINARES MONGE BLANCA MARLENY',1,'07294345','1960-07-17 00:00:00',2,1,'','',NULL,'1993-09-01 00:00:00',0,0),(
600,037718,1,'LINARES','MONGE','GLADYS','ELIANA','LINARES MONGE GLADYS ELIANA',1,'07958873','1961-08-12 00:00:00',2,1,'','',NULL,'1984-01-18 00:00:00',0,0),(
601,049716,1,'LINCHE','GOICOCHEA','PEDRO','PABLO','LINCHE GOICOCHEA PEDRO PABLO',1,'07468962','1970-06-29 00:00:00',1,1,'','',NULL,'1995-01-01 00:00:00',0,0),(
602,049803,1,'LLACZA','CAMARENA','LOURDES','DEL PILAR','LLACZA CAMARENA LOURDES DEL PILAR',1,'06091463','1965-11-08 00:00:00',2,1,'','',NULL,'1987-11-23 00:00:00',0,0),(
603,950003,1,'LLANA','YUFRA','EVER','GONZALO','LLANA YUFRA EVER GONZALO',1,'09897444','1970-09-10 00:00:00',1,1,'','',NULL,'2004-12-11 00:00:00',0,0),(
604,970041,1,'LLANOS','QUIROZ','HERMELINDA',NULL,'LLANOS QUIROZ HERMELINDA',1,'33402746','1959-07-08 00:00:00',2,1,'','',NULL,'2012-11-01 00:00:00',0,0),(
605,049804,1,'LLAQUE','YLIZARBE','ROSA','ISABEL','LLAQUE YLIZARBE ROSA ISABEL',1,'08567203','1964-09-14 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
606,980382,1,'LLEMPEN','TARRILLO','GIOVANNA','YSCELA','LLEMPEN TARRILLO GIOVANNA YSCELA',1,'10680576','1977-01-31 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
607,960341,1,'LLERENA','APAZA','GUIDO','FERNANDO','LLERENA APAZA GUIDO FERNANDO',1,'29571433','1968-10-03 00:00:00',1,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
608,098370,1,'LLERENA','SALAS','MORAIMA','ELENA','LLERENA SALAS MORAIMA ELENA',1,'07825351','1954-11-13 00:00:00',2,1,'','',NULL,'1989-12-15 00:00:00',0,0),(
609,980342,1,'LLICA','SULLCA','NANNY','LORENZA','LLICA SULLCA NANNY LORENZA',1,'10625370','1977-12-05 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
610,049807,1,'LOA','CESPEDES','MARIA','MILAGROS','LOA CESPEDES MARIA MILAGROS',1,'09222862','1964-12-09 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
611,049808,1,'LOAYZA','GAMARRA','VICTORIA',NULL,'LOAYZA GAMARRA VICTORIA',1,'06069699','1954-11-17 00:00:00',2,1,'','',NULL,'1982-12-01 00:00:00',0,0),(
612,980124,1,'LOAYZA','PEREZ','GERARDO','IVAN','LOAYZA PEREZ GERARDO IVAN',1,'06441402','1973-10-16 00:00:00',1,1,'','',NULL,'2012-12-13 00:00:00',0,0),(
613,049811,1,'LOPEZ','JARA','NANCI','BERTHA','LOPEZ JARA NANCI BERTHA',1,'06278443','1965-04-09 00:00:00',2,1,'','',NULL,'1984-11-01 00:00:00',0,0),(
614,980448,1,'LOPEZ','MUNOZ','MARIA','SARITA BERENICE','LOPEZ MUNOZ MARIA SARITA BERENICE',1,'40948102','1981-05-15 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
615,049972,1,'LOPEZ','MURILLO','EPIFANIO','REYES','LOPEZ MURILLO EPIFANIO REYES',1,'25715063','1971-01-04 00:00:00',1,1,'','',NULL,'1995-06-01 00:00:00',0,0),(
616,049349,1,'LOPEZ','PALMA','ROSA','MEDALIT','LOPEZ PALMA ROSA MEDALIT',1,'08719062','1961-12-10 00:00:00',2,1,'','',NULL,'1983-11-01 00:00:00',0,0),(
617,980560,1,'LOPEZ','VARGAS','DAVIS','GERICSON','LOPEZ VARGAS DAVIS GERICSON',1,'73772677','1996-05-13 00:00:00',1,1,'','',NULL,'2020-12-31 00:00:00',0,0),(
618,049689,1,'LORENZO','HERNANDEZ','BALTAZARA',NULL,'LORENZO HERNANDEZ BALTAZARA',1,'10183891','1965-02-06 00:00:00',2,1,'','',NULL,'1987-11-23 00:00:00',0,0),(
619,049351,1,'LOVERA','AVILES','EUDOCIA','VICTORIA','LOVERA AVILES EUDOCIA VICTORIA',1,'25621724','1964-09-15 00:00:00',2,1,'','',NULL,'1988-12-01 00:00:00',0,0),(
620,980558,1,'LOYOLA','AYQUIPA','ZEINA','KATTY','LOYOLA AYQUIPA ZEINA KATTY',1,'43552598','1985-12-26 00:00:00',2,1,'','',NULL,'2020-12-31 00:00:00',0,0),(
621,049814,1,'LOYOLA','LISETI','ELIZABETH','MARINA','LOYOLA LISETI ELIZABETH MARINA',1,'06123358','1961-03-31 00:00:00',2,1,'','',NULL,'1985-08-01 00:00:00',0,0),(
622,980033,1,'LOZA','COLLANTES','MARIETTA','NOEMI','LOZA COLLANTES MARIETTA NOEMI',1,'10137778','1974-12-24 00:00:00',2,1,'','',NULL,'2010-07-05 00:00:00',0,0),(
623,980343,1,'LOZA','HUERTA','JESSICA','SUSAN','LOZA HUERTA JESSICA SUSAN',1,'41727608','1983-02-25 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
624,049352,1,'LOZA','SAMANAMUD','NORMA','MEDALIT','LOZA SAMANAMUD NORMA MEDALIT',1,'15644557','1960-09-29 00:00:00',2,1,'','',NULL,'1981-12-01 00:00:00',0,0),(
625,980228,1,'LOZANO','VIVANCO','MARIA','DE LOS ANGELES','LOZANO VIVANCO MARIA DE LOS ANGELES',1,'40480084','1980-03-20 00:00:00',2,1,'','',NULL,'2006-06-12 00:00:00',0,0),(
626,049815,1,'LUJAN','CALDERON DE ALARCON','ROSA','JOVINA','LUJAN CALDERON DE ALARCON ROSA JOVINA',1,'08405332','1956-03-02 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
627,970062,1,'LUJAN','ZUASNABAR','HULDA',NULL,'LUJAN ZUASNABAR HULDA LIDIA',1,'19853256','1961-03-16 00:00:00',2,1,'','',NULL,'2014-06-01 00:00:00',0,0),(
628,970082,1,'LUNA','RAMOS','NELIDA','GUICELA','LUNA RAMOS NELIDA GUICELA',1,'22511163','1975-04-23 00:00:00',2,1,'','',NULL,'2016-01-01 00:00:00',0,0),(
629,980103,1,'LUQUE','CONTRERAS','ALICIA',NULL,'LUQUE CONTRERAS ALICIA',1,'09998401','1975-01-21 00:00:00',2,1,'','',NULL,'2012-07-01 00:00:00',0,0),(
630,049817,1,'LURITA','HERNANDEZ','MARIA','JESUS','LURITA HERNANDEZ MARIA JESUS',1,'06873402','1960-12-21 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
631,049818,1,'LURITA','HERNANDEZ','ROSARIO','RAUL','LURITA HERNANDEZ ROSARIO RAUL',1,'06872460','1958-08-30 00:00:00',1,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
632,980383,1,'LUYO','HERRERA','KATTY','TERESA','LUYO HERRERA KATTY TERESA',1,'43644837','1986-07-06 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
633,117451,1,'MACASSI','MEZA','MARIA','DOLORES','MACASSI MEZA MARIA DOLORES',1,'21246174','1961-12-31 00:00:00',2,1,'','',NULL,'1991-12-15 00:00:00',0,0),(
634,980143,1,'MACHA','QUISPE','ANTONIO',NULL,'MACHA QUISPE ANTONIO',1,'10342845','1973-11-25 00:00:00',1,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
635,049822,1,'MACKUADO','NURENA','ARTIDORO','FERNANDO','MACKUADO NURENA ARTIDORO FERNANDO',1,'16515994','1959-06-13 00:00:00',1,1,'','',NULL,'1989-01-18 00:00:00',0,0),(
636,980306,1,'MAGALLANES','HERNANDEZ','MARIA','MIRIAN','MAGALLANES HERNANDEZ MARIA MIRIAN',1,'21887510','1978-06-05 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
637,049320,1,'MAGALLANES','SEBASTIAN','MARTIN','GASPAR','MAGALLANES SEBASTIAN MARTIN GASPAR',1,'21811014','1967-06-12 00:00:00',1,1,'','',NULL,'1996-12-31 00:00:00',0,0),(
638,980384,1,'MAGUINA','ANASTACIO','SILVIA','YESENIA','MAGUINA ANASTACIO SILVIA YESENIA',1,'07504985','1976-01-11 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
639,049824,1,'MAGUINO','VELIZ','CARMEN','AUREA','MAGUINO VELIZ CARMEN AUREA',1,'15987051','1956-07-05 00:00:00',2,1,'','',NULL,'1977-08-01 00:00:00',0,0),(
640,980449,1,'MAICELO','PUERTA','MARCOS','ANTONIO','MAICELO PUERTA MARCOS ANTONIO',1,'43865146','1986-04-04 00:00:00',1,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
641,970050,1,'MALDONADO','QUISPE','YOLANDA',NULL,'MALDONADO QUISPE YOLANDA',1,'28220978','1965-09-10 00:00:00',2,1,'','',NULL,'1987-11-23 00:00:00',0,0),(
642,949984,1,'MALLQUI','CERVANTES','WALTER','GUSTAVO','MALLQUI CERVANTES WALTER GUSTAVO',1,'06744865','1963-02-18 00:00:00',1,1,'','',NULL,'2004-04-01 00:00:00',0,0),(
643,980494,1,'MALPARTIDA','LOZANO','SILVIA','ROCIO','MALPARTIDA LOZANO SILVIA ROCIO',1,'41826426','1983-06-15 00:00:00',2,1,'','',NULL,'2018-01-16 00:00:00',0,0),(
644,049825,1,'MALQUI','FERNANDEZ DE HUAMAN','SEVERA',NULL,'MALQUI FERNANDEZ DE HUAMAN SEVERA',1,'07338843','1955-10-01 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
645,980275,1,'MAMANI','GUTIERREZ','MERY','YANETH','MAMANI GUTIERREZ MERY YANETH',1,'29647749','1975-03-06 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
646,049826,1,'MAMANI','HUANCCO DE VILCA','CELESTINA',NULL,'MAMANI HUANCCO DE VILCA CELESTINA',1,'08790926','1957-05-19 00:00:00',2,1,'','',NULL,'1980-12-01 00:00:00',0,0),(
647,980385,1,'MARAVI','TUMBALOVOS','JEANNE','LILY','MARAVI TUMBALOVOS JEANNE LILY',1,'06974019','1965-09-16 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
648,980213,1,'MARCELO','PACHECO','HUMBERTO','PAUL','MARCELO PACHECO HUMBERTO PAUL',1,'09985091','1974-11-09 00:00:00',1,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
649,049487,1,'MARIMON','PACHECO','AUGUSTO','ADAN','MARIMON PACHECO AUGUSTO ADAN',1,'08312113','1960-07-04 00:00:00',1,1,'','',NULL,'1995-01-18 00:00:00',0,0),(
650,960376,1,'MARMANILLO','MELENDEZ','REYNA','FIORELLA','MARMANILLO MELENDEZ REYNA FIORELLA',1,'43520871','1986-04-21 00:00:00',2,1,'','',NULL,'2020-12-01 00:00:00',0,0),(
651,980386,1,'MARQUEZ','MOSCOL','MARLENY','TATIANA','MARQUEZ MOSCOL MARLENY TATIANA',1,'09799498','1971-09-23 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
652,049833,1,'MARQUEZ','VEGA','CARMEN','YOLANDA','MARQUEZ VEGA CARMEN YOLANDA',1,'06088092','1953-08-25 00:00:00',2,1,'','',NULL,'1977-08-01 00:00:00',0,0),(
653,800445,1,'MARTEL','MORALES','GLORIA','MARIA','MARTEL MORALES GLORIA MARIA',1,'07245728','1966-12-27 00:00:00',2,1,'','',NULL,'1995-12-31 00:00:00',0,0),(
654,980150,1,'MARTINEZ','ALARCON','ANA','MARLENNE','MARTINEZ ALARCON ANA MARLENNE',1,'07210421','1964-10-04 00:00:00',2,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
655,049835,1,'MARTINEZ','ALARCON','MIRIAM','LETICIA','MARTINEZ ALARCON MIRIAM LETICIA',1,'07210635','1963-05-05 00:00:00',2,1,'','',NULL,'1984-11-01 00:00:00',0,0),(
656,049836,1,'MARTINEZ','ALFARO','SABINA','YMELDA','MARTINEZ ALFARO SABINA YMELDA',1,'06171508','1953-10-27 00:00:00',2,1,'','',NULL,'1984-11-01 00:00:00',0,0),(
657,960342,1,'MARTINEZ','CAPRISTAN','ELIZABETH','DE FATIMA','MARTINEZ CAPRISTAN ELIZABETH DE FATIMA',1,'70404070','1990-07-24 00:00:00',2,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
658,049837,1,'MARTINEZ','CORDOVA','EYDEN','FORTUNATO','MARTINEZ CORDOVA EYDEN FORTUNATO',1,'06966106','1964-06-04 00:00:00',1,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
659,980061,1,'MARTINEZ','MUNIVE','ROSA','ELVIRA','MARTINEZ MUNIVE ROSA ELVIRA',1,'21539863','1975-02-21 00:00:00',2,1,'','',NULL,'2011-04-01 00:00:00',0,0),(
660,049839,1,'MARTINEZ','PUENTE DE LA','VEGA','JESUS MOISES','MARTINEZ PUENTE DE LA VEGA JESUS MOISES',1,'10513520','1959-12-31 00:00:00',1,1,'','',NULL,'1987-11-23 00:00:00',0,0),(
661,101768,1,'MARTINEZ','RAMOS','ROSA','ESTHER','MARTINEZ RAMOS ROSA ESTHER',1,'06280128','1960-03-25 00:00:00',2,1,'','',NULL,'1990-07-15 00:00:00',0,0),(
662,049840,1,'MASSIRONI','MARQUEZ','SABINA','ELIZABETH','MASSIRONI MARQUEZ SABINA ELIZABETH',1,'06103137','1962-02-15 00:00:00',2,1,'','',NULL,'1982-12-01 00:00:00',0,0),(
663,049266,1,'MATEO','QUISPE','YRENE','EVARISTA','MATEO QUISPE YRENE EVARISTA',1,'21784247','1965-05-22 00:00:00',2,1,'','',NULL,'1991-12-31 00:00:00',0,0),(
664,049285,1,'MAUTINO','ROMERO','NELLY',NULL,'MAUTINO ROMERO NELLY',1,'06733941','1962-11-25 00:00:00',2,1,'','',NULL,'1991-12-31 00:00:00',0,0),(
665,980473,1,'MAYNA','AGUILAR','CARLOS','MAGNO','MAYNA AGUILAR CARLOS MAGNO',1,'41243032','1981-05-30 00:00:00',1,1,'','',NULL,'2018-02-01 00:00:00',0,0),(
666,980387,1,'MAYORGA','ROJAS','GABY','MYRIAM','MAYORGA ROJAS GABY MYRIAM',1,'02046575','1978-02-23 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
667,049658,1,'MAZA','MILLA','MARIA','LUISA','MAZA MILLA MARIA LUISA',1,'32872406','1970-01-29 00:00:00',2,1,'','',NULL,'1995-12-31 00:00:00',0,0),(
668,949980,1,'MECA','GIL','CARLA','ELENA','MECA GIL CARLA ELENA',1,'07571095','1964-07-11 00:00:00',2,1,'','',NULL,'2004-04-01 00:00:00',0,0),(
669,049842,1,'MEDINA','DE LA CRUZ','GLORIA','MARIETTA','MEDINA DE LA CRUZ GLORIA MARIETTA',1,'25588772','1958-02-14 00:00:00',2,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
670,980307,1,'MEDINA','GRIMALDO','GUILIANA','CRISTINA','MEDINA GRIMALDO GUILIANA CRISTINA',1,'40404025','1979-11-15 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
671,049843,1,'MEDINA','LLERENA','ZOILA','HAYDEE','MEDINA LLERENA ZOILA HAYDEE',1,'07145704','1956-06-28 00:00:00',2,1,'','',NULL,'1981-10-01 00:00:00',0,0),(
672,049362,1,'MEDINA','NINACONDOR','MARTHA','ASUNCION','MEDINA NINACONDOR MARTHA ASUNCION',1,'06074879','1954-08-15 00:00:00',2,1,'','',NULL,'1988-12-01 00:00:00',0,0),(
673,980271,1,'MEDINA','QUISPE','MARIA','INES','MEDINA QUISPE MARIA INES',1,'28251583','1970-01-21 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
674,980290,1,'MEDINA','VASQUEZ','ROSA','MARILU','MEDINA VASQUEZ ROSA MARILU',1,'21520260','1974-03-30 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
675,980505,1,'MEDINA','VIVAR','EMERSON','ALEJANDRO','MEDINA VIVAR EMERSON ALEJANDRO',1,'42033248','1983-06-19 00:00:00',1,1,'','',NULL,'2018-11-22 00:00:00',0,0),(
676,800566,1,'MEJIA','ALIAGA','PEDRO','FRANCISCO','MEJIA ALIAGA PEDRO FRANCISCO',1,'08223035','1965-01-31 00:00:00',1,1,'','',NULL,'1994-06-21 00:00:00',0,0),(
677,980144,1,'MELENDEZ','ARISTA','LUIS','ALEJANDRO','MELENDEZ ARISTA LUIS ALEJANDRO',1,'80616569','1978-05-22 00:00:00',1,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
678,980511,1,'MELENDEZ','RIEGA','HERNAN','JOHNATHAN','MELENDEZ RIEGA HERNAN JOHNATHAN',1,'44228728','1986-06-07 00:00:00',1,1,'','',NULL,'2018-11-22 00:00:00',0,0),(
679,800439,1,'MELGAR','SALCEDO','PILAR','NANCY','MELGAR SALCEDO PILAR NANCY',1,'21426076','1966-04-22 00:00:00',2,1,'','',NULL,'1995-12-31 00:00:00',0,0),(
680,044036,1,'MELGAR','SALCEDO','VILMA','CARMEN','MELGAR SALCEDO VILMA CARMEN',1,'06686742','1961-05-31 00:00:00',2,1,'','',NULL,'1986-08-01 00:00:00',0,0),(
681,049845,1,'MELGAREJO','MEDINA','LEONCIO','CESAR','MELGAREJO MEDINA LEONCIO CESAR',1,'06953726','1964-01-15 00:00:00',1,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
682,980086,1,'MELLADO','BACA','YRMA',NULL,'MELLADO BACA YRMA',1,'23969097','1955-05-05 00:00:00',2,1,'','',NULL,'2012-03-01 00:00:00',0,0),(
683,049848,1,'MENDOCILLA','ALVAREZ','VICTOR','PEDRO','MENDOCILLA ALVAREZ VICTOR PEDRO',1,'07196510','1964-07-04 00:00:00',1,1,'','',NULL,'1984-10-01 00:00:00',0,0),(
684,049849,1,'MENDOZA','ALEJANDRO','FABIOLA','RINA','MENDOZA ALEJANDRO FABIOLA RINA',1,'06733839','1957-07-31 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
685,980389,1,'MENDOZA','CANCHO','NANCY',NULL,'MENDOZA CANCHO NANCY',1,'10307798','1967-12-23 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
686,980417,1,'MENDOZA','CELESTINO','YRMA','CECILIA','MENDOZA CELESTINO YRMA CECILIA',1,'09790270','1972-03-03 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
687,980104,1,'MENDOZA','COLQUI','LAURA','LEONOR','MENDOZA COLQUI LAURA LEONOR',1,'09746119','1972-06-18 00:00:00',2,1,'','',NULL,'2012-07-01 00:00:00',0,0),(
688,049851,1,'MENDOZA','CORDOVA','BETTY','DONATILA','MENDOZA CORDOVA BETTY DONATILA',1,'07087166','1957-04-07 00:00:00',2,1,'','',NULL,'1981-06-01 00:00:00',0,0),(
689,980156,1,'MENDOZA','CUZCANO','JOHN','SMITH','MENDOZA CUZCANO JOHN SMITH',1,'10381866','1976-04-23 00:00:00',1,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
690,960333,1,'MENDOZA','JACINTO','CLAUDIA','CRISTINA','MENDOZA JACINTO CLAUDIA CRISTINA',1,'72500488','1993-03-13 00:00:00',2,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
691,980450,1,'MENDOZA','OCHOA','RENE',NULL,'MENDOZA OCHOA RENE',1,'10660182','1977-03-01 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
692,980308,1,'MENDOZA','SOLIS','OLGA','LUZ','MENDOZA SOLIS OLGA LUZ',1,'41532430','1982-10-25 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
693,049321,1,'MESTANZA','MALASPINA','FRANCISCO','MIGUEL','MESTANZA MALASPINA FRANCISCO MIGUEL',1,'07235001','1964-04-08 00:00:00',1,1,'','',NULL,'1996-12-31 00:00:00',0,0),(
694,970067,1,'MEZA','BUSTAMANTE DE SAN MARTIN','CARMEN','ROSA','MEZA BUSTAMANTE DE SAN MARTIN CARMEN ROSA',1,'06246545','1962-03-13 00:00:00',2,1,'','',NULL,'2016-10-14 00:00:00',0,0),(
695,980244,1,'MEZA','CANARI','ADOLFO','JAIME','MEZA CANARI ADOLFO JAIME',1,'10004513','1970-10-16 00:00:00',1,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
696,049855,1,'MEZA','FELIX','MARIA','DEL CARMEN','MEZA FELIX MARIA DEL CARMEN',1,'08511780','1963-09-29 00:00:00',2,1,'','',NULL,'1987-11-23 00:00:00',0,0),(
697,980157,1,'MEZA','GONZALES','ZOILA','AURORA','MEZA GONZALES ZOILA AURORA',1,'10017357','1974-05-30 00:00:00',2,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
698,049366,1,'MEZA','HUAMAN','FLOR','DE MARIA METILINA','MEZA HUAMAN FLOR DE MARIA METILINA',1,'08609941','1951-09-15 00:00:00',2,1,'','',NULL,'2017-01-01 00:00:00',0,0),(
699,980547,1,'MINANO','SANJINEZ','GEORGIA','MAGALY','MINANO SANJINEZ GEORGIA MAGALY',1,'00256139','1978-04-19 00:00:00',2,1,'','',NULL,'2020-12-31 00:00:00',0,0),(
700,800862,1,'MINAYA','LOPEZ','CONSUELO',NULL,'MINAYA LOPEZ CONSUELO MARTINA',1,'16773781','1963-09-13 00:00:00',2,1,'','',NULL,'1998-01-01 00:00:00',0,0),(
701,980100,1,'MINAYA','MORENO','KARINA','LUZ','MINAYA MORENO KARINA LUZ',1,'10677867','1978-08-07 00:00:00',2,1,'','',NULL,'2012-07-01 00:00:00',0,0),(
702,980451,1,'MOGOLLON','VIGO','JESSICA','YESENIA','MOGOLLON VIGO JESSICA YESENIA',1,'45493823','1988-08-18 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
703,049370,1,'MOLINA','DE BRAVO','VICTORIA','EUFEMIA','MOLINA DE BRAVO VICTORIA EUFEMIA',1,'08582534','1955-03-20 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
704,980108,1,'MOLINA','VASQUEZ','SUSANA','CECILIA','MOLINA VASQUEZ SUSANA CECILIA',1,'09926711','1973-04-08 00:00:00',2,1,'','',NULL,'2012-07-01 00:00:00',0,0),(
705,049860,1,'MONGE','GOMEZ','SERGIO','TEODORO','MONGE GOMEZ SERGIO TEODORO',1,'08635224','1962-10-25 00:00:00',1,1,'','',NULL,'2005-11-20 00:00:00',0,0),(
706,980241,1,'MONROY','DIAZ','SANDRA','MARIETA','MONROY DIAZ SANDRA MARIETA',1,'29529733','1968-01-27 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
707,116883,1,'MONTALVO','RAMOS','SADITH','ROSSANA','MONTALVO RAMOS SADITH ROSSANA',1,'21123029','1976-05-19 00:00:00',2,1,'','',NULL,'2003-08-01 00:00:00',0,0),(
708,980489,1,'MONTENEGRO','CRUZ','JUSTO','IVAN','MONTENEGRO CRUZ JUSTO IVAN',1,'03883017','1972-09-08 00:00:00',1,1,'','',NULL,'2018-01-16 00:00:00',0,0),(
709,980557,1,'MONTENEGRO','MAYORGA','LUIS','MARTIN','MONTENEGRO MAYORGA LUIS MARTIN',1,'09679305','1975-02-10 00:00:00',1,1,'','',NULL,'2019-04-03 00:00:00',0,0),(
710,049861,1,'MONTERO','FALCON','MARIA','JESUS','MONTERO FALCON MARIA JESUS',1,'06100657','1964-06-08 00:00:00',2,1,'','',NULL,'1985-08-01 00:00:00',0,0),(
711,049862,1,'MONTERO','VARGAS','ESTHER',NULL,'MONTERO VARGAS ESTHER',1,'07598096','1959-09-14 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
712,050432,1,'MONTOYA','MAURY','VICENTA','MARINA','MONTOYA MAURY VICENTA MARINA',1,'29281001','1956-04-11 00:00:00',2,1,'','',NULL,'1986-12-01 00:00:00',0,0),(
713,980258,1,'MONTOYA','VILCHEZ','MIRIAM','ELENA','MONTOYA VILCHEZ MIRIAM ELENA',1,'09271919','1967-06-15 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
714,049864,1,'MONTOYA','VILCHEZ','ROSA','NANCY','MONTOYA VILCHEZ ROSA NANCY',1,'25413273','1962-10-03 00:00:00',2,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
715,101764,1,'MORALES','CAMARGO','MARIO','JESUS','MORALES CAMARGO MARIO JESUS',1,'09498653','1968-06-05 00:00:00',1,1,'','',NULL,'1990-07-15 00:00:00',0,0),(
716,980273,1,'MORALES','GUTIERREZ','AZUCENA','CATALINA','MORALES GUTIERREZ AZUCENA CATALINA',1,'08468737','1964-11-25 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
717,960332,1,'MORALES','IPANAQUE','LUIS','ALEXANDER','MORALES IPANAQUE LUIS ALEXANDER',1,'70432869','1988-03-01 00:00:00',1,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
718,050130,1,'MORAN','QUISPE','ROSA',NULL,'MORAN QUISPE ROSA',1,'25462580','1966-09-17 00:00:00',2,1,'','',NULL,'1995-12-31 00:00:00',0,0),(
719,980506,1,'MORENO','ARGANDONA','JOYSI',NULL,'MORENO ARGANDONA JOYSI',1,'22666053','1982-05-26 00:00:00',2,1,'','',NULL,'2018-11-22 00:00:00',0,0),(
720,970103,1,'MORENO','CISNEROS','CRISTO','JESUS','MORENO CISNEROS CRISTO JESUS',1,'28311105','1971-05-29 00:00:00',1,1,'','',NULL,'2017-11-22 00:00:00',0,0),(
721,980168,1,'MORENO','CISNEROS','FERNANDO','RAFAEL AGUSTIN','MORENO CISNEROS FERNANDO RAFAEL AGUSTIN',1,'40922131','1981-02-04 00:00:00',1,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
722,980504,1,'MORENO','ZAMORA','SHIRLEY','BETSY','MORENO ZAMORA SHIRLEY BETSY',1,'43989644','1986-12-06 00:00:00',2,1,'','',NULL,'2018-11-22 00:00:00',0,0),(
723,980499,1,'MORENO','ZURITA','ROSA','LELYS','MORENO ZURITA ROSA LELYS',1,'70435391','1989-02-18 00:00:00',2,1,'','',NULL,'2018-11-22 00:00:00',0,0),(
724,950005,1,'MOREYRA','MARROU','RAFAEL','MARTIN','MOREYRA MARROU RAFAEL MARTIN',1,'09338404','1971-03-18 00:00:00',1,1,'','',NULL,'2004-12-11 00:00:00',0,0),(
725,049283,1,'MOSCOL','GOMEZ','OSWALDO',NULL,'MOSCOL GOMEZ OSWALDO',1,'07432037','1961-10-22 00:00:00',1,1,'','',NULL,'1995-01-16 00:00:00',0,0),(
726,970068,1,'MOSTTO','BLANCO','FABIOLA','LICELLY','MOSTTO BLANCO FABIOLA LICELLY',1,'00489332','1970-02-24 00:00:00',2,1,'','',NULL,'2017-12-15 00:00:00',0,0),(
727,949988,1,'MOTA','RIVERA','JOEL','NESEFORO','MOTA RIVERA JOEL NESEFORO',1,'31042843','1963-03-01 00:00:00',1,1,'','',NULL,'2005-11-20 00:00:00',0,0),(
728,960337,1,'MOTTA','JARA','FRANCISCO','ALEX','MOTTA JARA FRANCISCO ALEX',1,'46555115','1990-10-07 00:00:00',1,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
729,960346,1,'MOYA','ESPINOZA','PAUL','CRISTIAM','MOYA ESPINOZA PAUL CRISTIAM',1,'42715669','1984-10-16 00:00:00',1,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
730,980132,1,'MUCHA','POMACHAGUA','MIRIAM','MARLENY','MUCHA POMACHAGUA MIRIAM MARLENY',1,'09566846','1969-12-19 00:00:00',2,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
731,049869,1,'MUERAS','LEYVA','WALTER','MANUEL','MUERAS LEYVA WALTER MANUEL',1,'06887163','1957-10-01 00:00:00',1,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
732,980390,1,'MUGURUZA','NICHO','MILAGROS','ELIZABETH','MUGURUZA NICHO MILAGROS ELIZABETH',1,'42137074','1983-10-06 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
733,107136,1,'MUNIZ','SOLORZANO','ADELA',NULL,'MUNIZ SOLORZANO ADELA',1,'07598149','1955-01-29 00:00:00',2,1,'','',NULL,'1987-04-01 00:00:00',0,0),(
734,980391,1,'MUNOZ','ACASIETE','DEYSI','AYME','MUNOZ ACASIETE DEYSI AYME',1,'43104963','1984-02-07 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
735,049723,1,'MUNOZ','CARHUAPOMA','CARMEN','MARITZA','MUNOZ CARHUAPOMA CARMEN MARITZA',1,'25761058','1966-11-10 00:00:00',2,1,'','',NULL,'1995-12-31 00:00:00',0,0),(
736,049872,1,'MUNOZ','LOJA','VICTORINA','ESPERANZA','MUNOZ LOJA VICTORINA ESPERANZA',1,'06019737','1952-10-01 00:00:00',2,1,'','',NULL,'1985-08-01 00:00:00',0,0),(
737,049874,1,'MURRUGARRA','TAMARIZ','LAURA','BERTHA','MURRUGARRA TAMARIZ LAURA BERTHA',1,'07023727','1962-09-25 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
738,980220,1,'NAVARRO','CORTIJO','MARGARITA','ROSILU','NAVARRO CORTIJO MARGARITA ROSILU',1,'07999934','1970-10-01 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
739,049875,1,'NAVARRO','GARCIA','MARIELLA',NULL,'NAVARRO GARCIA MARIELLA',1,'08277170','1963-12-09 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
740,980272,1,'NAVARRO','QUISPE','DARIA',NULL,'NAVARRO QUISPE DARIA',1,'20566053','1972-01-14 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
741,980392,1,'NEYRA','LOPEZ','LIZBETH','KATERINA','NEYRA LOPEZ LIZBETH KATERINA',1,'41099245','1981-10-30 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
742,980107,1,'NINAMAQUE','BRAVO','XIOMARA','RUTH','NINAMAQUE BRAVO XIOMARA RUTH',1,'15434088','1974-08-08 00:00:00',2,1,'','',NULL,'2012-07-01 00:00:00',0,0),(
743,970098,1,'NOBLEJAS','HERRERA','YENI','AKENI','NOBLEJAS HERRERA YENI AKENI',1,'22520761','1977-04-04 00:00:00',2,1,'','',NULL,'2018-05-01 00:00:00',0,0),(
744,049881,1,'NOLASCO','ORE','OLGA',NULL,'NOLASCO ORE OLGA',1,'08516705','1966-04-25 00:00:00',2,1,'','',NULL,'1988-08-16 00:00:00',0,0),(
745,101770,1,'NUNEZ','CASTRO','RONALD',NULL,'NUNEZ CASTRO RONALD',1,'09030151','1966-12-21 00:00:00',1,1,'','',NULL,'1990-07-15 00:00:00',0,0),(
746,980488,1,'NUNEZ','MARQUEZ','BORIS','IVAN','NUNEZ MARQUEZ BORIS IVAN',1,'73179962','1994-09-28 00:00:00',1,1,'','',NULL,'2018-02-01 00:00:00',0,0),(
747,980507,1,'NUNEZ','RAMIREZ','DORIS','MARCELA','NUNEZ RAMIREZ DORIS MARCELA',1,'09612906','1971-03-17 00:00:00',2,1,'','',NULL,'2018-11-22 00:00:00',0,0),(
748,950006,1,'OBANDO','PORRAS','LUZ','MARIA MERCEDES','OBANDO PORRAS LUZ MARIA MERCEDES',1,'09671948','1972-08-31 00:00:00',2,1,'','',NULL,'2004-12-11 00:00:00',0,0),(
749,049883,1,'OBREGON','USURIN','YUDY','ELENA','OBREGON USURIN YUDY ELENA',1,'09286853','1967-05-15 00:00:00',2,1,'','',NULL,'1988-09-01 00:00:00',0,0),(
750,980452,1,'OCHOA','CARPIO','VERONICA','ANDREA','OCHOA CARPIO VERONICA ANDREA',1,'41759618','1983-03-31 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
751,049884,1,'OCHOA','LOAYZA','MARIA','SUSANA','OCHOA LOAYZA MARIA SUSANA',1,'08345680','1959-12-25 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
752,049545,1,'OCROSPOMA','JUMPA','MARIA','ANDREA','OCROSPOMA JUMPA MARIA ANDREA',1,'10531723','1959-02-08 00:00:00',2,1,'','',NULL,'1982-03-15 00:00:00',0,0),(
753,049885,1,'OJEDA','ALEGRIA','NANCY','JUDITH','OJEDA ALEGRIA NANCY JUDITH',1,'06215779','1965-10-01 00:00:00',2,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
754,980082,1,'OJEDA','TORPOCO','MARY','MARITA','OJEDA TORPOCO MARY MARITA',1,'19967821','1967-02-04 00:00:00',2,1,'','',NULL,'2011-12-01 00:00:00',0,0),(
755,950007,1,'OLIVERA','SAFORA','KELLY',NULL,'OLIVERA SAFORA KELLY',1,'09929465','1972-10-24 00:00:00',2,1,'','',NULL,'2017-12-31 00:00:00',0,0),(
756,980549,1,'ORBEGOZO','HOYOS','KARINA','LILIANA','ORBEGOZO HOYOS KARINA LILIANA',1,'41103677','1980-03-13 00:00:00',2,1,'','',NULL,'2020-12-31 00:00:00',0,0),(
757,960367,1,'ORIHUELA','SALMON','JEAN','PIERRE','ORIHUELA SALMON JEAN PIERRE',1,'41225781','1981-11-08 00:00:00',1,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
758,049989,1,'OROPEZA','YRIGOYEN','MIRIAM',NULL,'OROPEZA YRIGOYEN MIRIAM',1,'08675745','1968-08-30 00:00:00',2,1,'','',NULL,'1991-12-31 00:00:00',0,0),(
759,800679,1,'ORTECHO','ANGULO','ELVA','SOLEDAD','ORTECHO ANGULO ELVA SOLEDAD',1,'17886978','1961-09-11 00:00:00',2,1,'','',NULL,'1998-01-22 00:00:00',0,0),(
760,980519,1,'ORTEGA','ALVARADO','NORCA','ISABEL','ORTEGA ALVARADO NORCA ISABEL',1,'06019736','1964-02-13 00:00:00',2,1,'','',NULL,'2018-12-27 00:00:00',0,0),(
761,950085,1,'ORTEGA','CASIQUE','ROCIO','ASUNTA','ORTEGA CASIQUE ROCIO ASUNTA',1,'08544057','1964-02-21 00:00:00',2,1,'','',NULL,'1984-01-01 00:00:00',0,0),(
762,980501,1,'ORTIZ','DUENAS','KELLY','VANESSA','ORTIZ DUENAS KELLY VANESSA',1,'41020431','1980-12-06 00:00:00',2,1,'','',NULL,'2018-11-22 00:00:00',0,0),(
763,049890,1,'ORTIZ','EGUILUZ DE VERA','VICTORIA','MELIANA','ORTIZ EGUILUZ DE VERA VICTORIA MELIANA',1,'08301359','1957-12-31 00:00:00',2,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
764,049390,1,'ORTIZ','ESPINOZA','MIRIAM','ESTHER','ORTIZ ESPINOZA MIRIAM ESTHER',1,'07507955','1957-10-03 00:00:00',2,1,'','',NULL,'1983-11-01 00:00:00',0,0),(
765,049392,1,'ORTIZ','ROJAS','EULALIA','JULIA','ORTIZ ROJAS EULALIA JULIA',1,'10047994','1954-12-10 00:00:00',2,1,'','',NULL,'1981-09-16 00:00:00',0,0),(
766,800440,1,'ORTIZ','SOCUALAYA','MARY','MERCEDES','ORTIZ SOCUALAYA MARY MERCEDES',1,'20006798','1967-12-21 00:00:00',2,1,'','',NULL,'1995-12-31 00:00:00',0,0),(
767,970019,1,'OSCCO','CORDOVA','MARISA',NULL,'OSCCO CORDOVA MARISA',1,'31009310','1964-12-26 00:00:00',2,1,'','',NULL,'2009-08-01 00:00:00',0,0),(
768,980309,1,'OSCCO','VALENZA','LIZET',NULL,'OSCCO VALENZA LIZET',1,'41272082','1981-06-06 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
769,980081,1,'OSORIO','LOZANO','MARIA','ISABEL','OSORIO LOZANO MARIA ISABEL',1,'08448815','1965-02-25 00:00:00',2,1,'','',NULL,'2011-09-01 00:00:00',0,0),(
770,067183,1,'OSORIO','MUNGUIA','MARTHA','GLADIS','OSORIO MUNGUIA MARTHA GLADIS',1,'10464881','1953-05-05 00:00:00',2,1,'','',NULL,'1982-11-01 00:00:00',0,0),(
771,980503,1,'OTERO','ALCARRAZ','JHOANA','JHOMAYRA','OTERO ALCARRAZ JHOANA JHOMAYRA',1,'45845271','1989-07-06 00:00:00',2,1,'','',NULL,'2018-11-22 00:00:00',0,0),(
772,049891,1,'OVALLE','POMAR','GUILLERMINA','ANTONIETA','OVALLE POMAR GUILLERMINA ANTONIETA',1,'07335994','1962-11-12 00:00:00',2,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
773,950061,1,'OYARCE','RIVA','IRMA',NULL,'OYARCE RIVA IRMA',1,'07301474','1962-03-03 00:00:00',2,1,'','',NULL,'2010-06-01 00:00:00',0,0),(
774,049893,1,'PABLO','CACNAHUARAY','ELVA',NULL,'PABLO CACNAHUARAY ELVA',1,'06061063','1952-05-17 00:00:00',2,1,'','',NULL,'1980-11-01 00:00:00',0,0),(
775,980159,1,'PACHECO','ASTO','JOSE','BERNARDO','PACHECO ASTO JOSE BERNARDO',1,'10362532','1971-08-26 00:00:00',1,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
776,049894,1,'PACHECO','ASTO','ROSA','EMILIA','PACHECO ASTO ROSA EMILIA',1,'07215004','1963-08-29 00:00:00',2,1,'','',NULL,'1984-11-16 00:00:00',0,0),(
777,101208,1,'PACHECO','MACETAS','LILIAN','RUFA','PACHECO MACETAS LILIAN RUFA',1,'20887489','1955-11-07 00:00:00',2,1,'','',NULL,'2017-07-15 00:00:00',0,0),(
778,050114,1,'PACHECO','ROCA','JORGE','LUIS','PACHECO ROCA JORGE LUIS',1,'09576077','1970-08-14 00:00:00',1,1,'','',NULL,'1990-07-15 00:00:00',0,0),(
779,980310,1,'PACO','RAMOS','AMPARO',NULL,'PACO RAMOS AMPARO',1,'23266156','1970-05-01 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
780,970056,1,'PADILLA','MAGUINA','LOURDES','EDITH','PADILLA MAGUINA LOURDES EDITH',1,'08616622','1962-03-03 00:00:00',2,1,'','',NULL,'2012-08-06 00:00:00',0,0),(
781,980344,1,'PADILLA','PADILLA','ELIZABETH','MONICA','PADILLA PADILLA ELIZABETH MONICA',1,'42072314','1983-10-12 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
782,980291,1,'PAJUELO','LA ROSA','ALEJANDRO','MARX LENIN','PAJUELO LA ROSA ALEJANDRO MARX LENIN',1,'10813083','1978-04-17 00:00:00',1,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
783,049898,1,'PALACIOS','RAMIREZ','LUZ','LOURDES','PALACIOS RAMIREZ LUZ LOURDES',1,'08451207','1955-01-07 00:00:00',2,1,'','',NULL,'1984-11-16 00:00:00',0,0),(
784,980075,1,'PALACIOS','ROSALES','FLORA','BEATRIZ','PALACIOS ROSALES FLORA BEATRIZ',1,'09432452','1968-07-29 00:00:00',2,1,'','',NULL,'2011-04-01 00:00:00',0,0),(
785,980535,1,'PALIZA','FRANCO','KATHERINE','ROCIO','PALIZA FRANCO KATHERINE ROCIO',1,'71618105','1992-10-28 00:00:00',2,1,'','',NULL,'2019-01-15 00:00:00',0,0),(
786,980561,1,'PALOMINO','CERON','DANIEL',NULL,'PALOMINO CERON DANIEL',1,'72730999','1990-12-31 00:00:00',1,1,'','',NULL,'2020-12-31 00:00:00',0,0),(
787,049902,1,'PALOMINO','NICOLAS','SANTOS','GILBERTO','PALOMINO NICOLAS SANTOS GILBERTO',1,'10307787','1964-02-06 00:00:00',1,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
788,980393,1,'PALOMINO','NUNEZ','NATHALI','RUTH','PALOMINO NUNEZ NATHALI RUTH',1,'43121825','1985-05-10 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
789,049903,1,'PALOMINO','TORRES','HERMINIA','PAULINA','PALOMINO TORRES HERMINIA PAULINA',1,'08585031','1960-08-04 00:00:00',2,1,'','',NULL,'1981-11-16 00:00:00',0,0),(
790,049906,1,'PAREDES','SANCHEZ','ESTHER',NULL,'PAREDES SANCHEZ ESTHER',1,'06010909','1961-02-11 00:00:00',2,1,'','',NULL,'1980-12-01 00:00:00',0,0),(
791,800441,1,'PAREDES','SORIANO','CARMEN','GLADYS','PAREDES SORIANO CARMEN GLADYS',1,'06984624','1966-03-21 00:00:00',2,1,'','',NULL,'1995-12-31 00:00:00',0,0),(
792,980453,1,'PAREDES','SUANA','ERIKA','JENNY','PAREDES SUANA ERIKA JENNY',1,'43942257','1986-06-27 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
793,049395,1,'PAREJA','BELLIDO','ZULEMA',NULL,'PAREJA BELLIDO ZULEMA',1,'07992731','1958-07-25 00:00:00',2,1,'','',NULL,'1988-09-01 00:00:00',0,0),(
794,049910,1,'PARIONA','DE MIRANDA','DEODATA',NULL,'PARIONA DE MIRANDA DEODATA',1,'25450411','1959-08-02 00:00:00',2,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
795,049397,1,'PARRA','GUTIERREZ','VICTOR','MANUEL','PARRA GUTIERREZ VICTOR MANUEL',1,'08025587','1959-08-23 00:00:00',1,1,'','',NULL,'1988-12-01 00:00:00',0,0),(
796,980226,1,'PARRA','TELLO','YENY','MABEL','PARRA TELLO YENY MABEL',1,'22513858','1974-07-06 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
797,049398,1,'PARRAGA','QUINTANILLA','NORMA','ALICIA','PARRAGA QUINTANILLA NORMA ALICIA',1,'10283968','1958-10-06 00:00:00',2,1,'','',NULL,'1984-11-01 00:00:00',0,0),(
798,980497,1,'PATILLA','BUENO','ROCIO','MARLENE','PATILLA BUENO ROCIO MARLENE',1,'43986606','1986-11-07 00:00:00',2,1,'','',NULL,'2018-11-22 00:00:00',0,0),(
799,980455,1,'PAUCAR','CHUCTAYA','JANE','MARY','PAUCAR CHUCTAYA JANE MARY',1,'41138348','1981-11-25 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
800,101780,1,'PAUCAR','CONTRERAS DE PIMENTEL','MARITZA','ESTHER','PAUCAR CONTRERAS DE PIMENTEL MARITZA ESTHER',1,'25832039','1972-04-10 00:00:00',2,1,'','',NULL,'2000-01-01 00:00:00',0,0),(
801,980282,1,'PAYANO','LAZARO','JYP','MARKS','PAYANO LAZARO JYP MARKS',1,'40017679','1978-01-05 00:00:00',1,1,'','',NULL,'2015-03-01 00:00:00',0,0),(
802,980219,1,'PECHO','DONAYRE','MARIA','DEL CARMEN','PECHO DONAYRE MARIA DEL CARMEN',1,'21531244','1974-02-07 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
803,094978,1,'PEDREROS','CAMPOS','JORGE','AURELIO','PEDREROS CAMPOS JORGE AURELIO',1,'10608751','1952-07-27 00:00:00',1,1,'','',NULL,'1989-07-01 00:00:00',0,0),(
804,049915,1,'PELAES','REY DE CHOCANO','LUZ','ANGELICA','PELAES REY DE CHOCANO LUZ ANGELICA',1,'06081994','1956-08-02 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
805,980527,1,'PELAEZ','CHOMBA','MELISSA','SINDY LISSET','PELAEZ CHOMBA MELISSA SINDY LISSET',1,'45842902','1988-11-16 00:00:00',2,1,'','',NULL,'2018-12-28 00:00:00',0,0),(
806,800020,1,'PELAEZ','MAMANI','MIGUEL','BERNARDINO','PELAEZ MAMANI MIGUEL BERNARDINO',1,'10306241','1959-03-08 00:00:00',1,1,'','',NULL,'2012-10-01 00:00:00',0,0),(
807,049916,1,'PENA','BUSTAMANTE','GUSTAVO','FELIX','PENA BUSTAMANTE GUSTAVO FELIX',1,'08967891','1956-03-07 00:00:00',1,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
808,049436,1,'PENA','ENCISO','SONIA','DEL CARMEN','PENA ENCISO SONIA DEL CARMEN',1,'08048835','1954-02-18 00:00:00',2,1,'','',NULL,'1989-12-29 00:00:00',0,0),(
809,049919,1,'PENALOZA','ESPINOZA','OLINDA','LUZ','PENALOZA ESPINOZA OLINDA LUZ',1,'06143316','1958-01-17 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
810,980062,1,'PERALTA','RAMOS','MIRIAM','NANCY','PERALTA RAMOS MIRIAM NANCY',1,'19194189','1955-04-20 00:00:00',2,1,'','',NULL,'2011-04-01 00:00:00',0,0),(
811,049499,1,'PERALTA','RAMOS','MIRTHA','FANNY','PERALTA RAMOS MIRTHA FANNY',1,'08388456','1964-04-04 00:00:00',2,1,'','',NULL,'1995-01-01 00:00:00',0,0),(
812,949500,1,'PERALTA','VARGAS','DANIEL',NULL,'PERALTA VARGAS DANIEL',1,'07184806','1955-07-21 00:00:00',1,1,'','',NULL,'2001-06-22 00:00:00',0,0),(
813,098392,1,'PEREDA','LIZARRAGA DE YUPANQUI','HORTENCIA','AURORA','PEREDA LIZARRAGA DE YUPANQUI HORTENCIA AURORA',1,'09021512','1953-10-30 00:00:00',2,1,'','',NULL,'1984-10-01 00:00:00',0,0),(
814,980034,1,'PEREGRINO','MENDOZA','PATRICIA','ALEJANDRINA','PEREGRINO MENDOZA PATRICIA ALEJANDRINA',1,'25711880','1971-06-12 00:00:00',2,1,'','',NULL,'2010-07-05 00:00:00',0,0),(
815,960369,1,'PEREIRA','GARCIA','KAREN','GABRIELLA','PEREIRA GARCIA KAREN GABRIELLA',1,'49026568','1990-04-20 00:00:00',2,1,'','',NULL,'2020-12-01 00:00:00',0,0),(
816,980039,1,'PEREZ','LUJAN','CAROLINA','MARISOL','PEREZ LUJAN CAROLINA MARISOL',1,'09489281','1970-06-02 00:00:00',2,1,'','',NULL,'2010-07-05 00:00:00',0,0),(
817,049925,1,'PEREZ','ROJAS','MARIA','DEL PILAR','PEREZ ROJAS MARIA DEL PILAR',1,'08121197','1966-12-17 00:00:00',2,1,'','',NULL,'1987-12-31 00:00:00',0,0),(
818,049926,1,'PEREZ','VELASQUEZ','NILDA',NULL,'PEREZ VELASQUEZ NILDA',1,'06970394','1966-03-09 00:00:00',2,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
819,980160,1,'PHILIPPON','CHANG','ADOLFO','FRANCISCO','PHILIPPON CHANG ADOLFO FRANCISCO',1,'10332864','1963-03-02 00:00:00',1,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
820,980080,1,'PICHILINGUE','ROMERO','CLAUDIA','SANDY','PICHILINGUE ROMERO CLAUDIA SANDY',1,'06779678','1972-03-18 00:00:00',2,1,'','',NULL,'2011-04-01 00:00:00',0,0),(
821,049928,1,'PILLACA','OCHOA','SABINA',NULL,'PILLACA OCHOA SABINA',1,'06053026','1957-12-11 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
822,950018,1,'PINEDA','QUISPE','OLGA',NULL,'PINEDA QUISPE OLGA',1,'29400647','1963-10-29 00:00:00',2,1,'','',NULL,'1996-01-05 00:00:00',0,0),(
823,049420,1,'PISCOYA','CAJO','VICKY','PALMIRA','PISCOYA CAJO VICKY PALMIRA',1,'08223326','1959-04-23 00:00:00',2,1,'','',NULL,'1990-10-15 00:00:00',0,0),(
824,960362,1,'PLASENCIA','MAS','LUIS','MIGUEL','PLASENCIA MAS LUIS MIGUEL',1,'43703826','1986-07-04 00:00:00',1,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
825,980161,1,'POMAR','DURAND','JORGE','ANTONIO','POMAR DURAND JORGE ANTONIO',1,'07591305','1954-01-13 00:00:00',1,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
826,800949,1,'PONCE','CONTRERAS','LUSIN','ANTONIO','PONCE CONTRERAS LUSIN ANTONIO',1,'06794361','1975-12-22 00:00:00',1,1,'','',NULL,'2002-08-01 00:00:00',0,0),(
827,980495,1,'PONCE','DIAZ','SALLY','VANESSA','PONCE DIAZ SALLY VANESSA',1,'40669305','1980-11-06 00:00:00',2,1,'','',NULL,'2018-01-16 00:00:00',0,0),(
828,960352,1,'PONCE','FLORES','DEBBIE','SHIRLEY','PONCE FLORES DEBBIE SHIRLEY',1,'46786964','1991-02-07 00:00:00',2,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
829,980201,1,'PONCE','GAMBINI','JENNY','PATRICIA','PONCE GAMBINI JENNY PATRICIA',1,'10790900','1978-02-20 00:00:00',2,1,'','',NULL,'2014-02-01 00:00:00',0,0),(
830,049933,1,'PORRAS','PULIDO','YOLANDA','BEATRIZ','PORRAS PULIDO YOLANDA BEATRIZ',1,'07572273','1955-12-28 00:00:00',2,1,'','',NULL,'1982-10-01 00:00:00',0,0),(
831,980247,1,'PORTILLO','LLANCO','GRACIELA',NULL,'PORTILLO LLANCO GRACIELA',1,'06076760','1965-12-21 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
832,980169,1,'PORTOCARRERO','HERRERA','ROGER',NULL,'PORTOCARRERO HERRERA ROGER',1,'07748687','1968-06-16 00:00:00',1,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
833,980292,1,'PORTOCARRERO','TAFUR','MARLIS','ROXANA','PORTOCARRERO TAFUR MARLIS ROXANA',1,'40481740','1980-01-22 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
834,980022,1,'POVIS','VEGA','MARLENE','DOMINGA','POVIS VEGA MARLENE DOMINGA',1,'16155220','1968-03-02 00:00:00',2,1,'','',NULL,'2008-02-01 00:00:00',0,0),(
835,980110,1,'PRADO','GUTIERREZ','DANY','SIMON','PRADO GUTIERREZ DANY SIMON',1,'09592013','1972-08-21 00:00:00',1,1,'','',NULL,'2012-07-01 00:00:00',0,0),(
836,980170,1,'PRADO','RUIZ','MADELEYNE','MILAGROS','PRADO RUIZ MADELEYNE MILAGROS',1,'25740719','1969-02-19 00:00:00',2,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
837,980048,1,'PRADO','VARGAS','SATURNINO',NULL,'PRADO VARGAS SATURNINO',1,'07346466','1959-03-22 00:00:00',1,1,'','',NULL,'2010-07-05 00:00:00',0,0),(
838,049935,1,'PRADO','VASQUEZ','CHARITO','ROSA','PRADO VASQUEZ CHARITO ROSA',1,'07095045','1965-04-26 00:00:00',2,1,'','',NULL,'1988-12-31 00:00:00',0,0),(
839,980329,1,'QUEA','MAMANI','ROCIO','LOURDES','QUEA MAMANI ROCIO LOURDES',1,'09741015','1971-02-13 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
840,980548,1,'QUEA','VELEZ','FLOR','DE MARIA ANGELA','QUEA VELEZ FLOR DE MARIA ANGELA',1,'45542548','1989-01-27 00:00:00',2,1,'','',NULL,'2020-12-31 00:00:00',0,0),(
841,049405,1,'QUEREVALU','GONZALES','PEDRO','PABLO','QUEREVALU GONZALES PEDRO PABLO',1,'06080909','1952-07-02 00:00:00',1,1,'','',NULL,'1986-12-01 00:00:00',0,0),(
842,049937,1,'QUEVEDO','MENDOZA','NELLY','HAYDEE','QUEVEDO MENDOZA NELLY HAYDEE',1,'06104002','1959-01-11 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
843,980345,1,'QUIJANDRIA','CUETO','JHONATAN','RENATO','QUIJANDRIA CUETO JHONATAN RENATO',1,'42366056','1984-03-23 00:00:00',1,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
844,049939,1,'QUILCA','SIMON','YOLANDA','BERTHA','QUILCA SIMON YOLANDA BERTHA',1,'09496643','1967-12-31 00:00:00',2,1,'','',NULL,'1988-12-31 00:00:00',0,0),(
845,049942,1,'QUINTO','CASTANEDA','HUMBERTO','ANDRES','QUINTO CASTANEDA HUMBERTO ANDRES',1,'06062034','1953-03-16 00:00:00',1,1,'','',NULL,'1974-09-01 00:00:00',0,0),(
846,970048,1,'QUINTO','CASTILLA DE BASURTO','MARIA','BELEN','QUINTO CASTILLA DE BASURTO MARIA BELEN',1,'19841526','1952-10-05 00:00:00',2,1,'','',NULL,'1982-10-01 00:00:00',0,0),(
847,095552,1,'QUINTO','GUTIERREZ','ANA','ELENA','QUINTO GUTIERREZ ANA ELENA',1,'09572496','1967-10-15 00:00:00',2,1,'','',NULL,'1989-09-10 00:00:00',0,0),(
848,980394,1,'QUINTO','PAULINO','JANET','ROXANA','QUINTO PAULINO JANET ROXANA',1,'40702459','1978-11-26 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
849,800452,1,'QUIROZ','AQUINO','DOYLA',NULL,'QUIROZ AQUINO DOYLA',1,'09767893','1971-12-31 00:00:00',2,1,'','',NULL,'1995-12-31 00:00:00',0,0),(
850,980035,1,'QUIROZ','ROQUE','MARICELA','ANTONIETA','QUIROZ ROQUE MARICELA ANTONIETA',1,'00455580','1965-01-14 00:00:00',2,1,'','',NULL,'2010-07-05 00:00:00',0,0),(
851,980217,1,'QUIROZ','SORIA','PERCY',NULL,'QUIROZ SORIA PERCY',1,'31037704','1973-04-07 00:00:00',1,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
852,960384,1,'QUISPE','CABEZA','KLINSMANN','THEO','QUISPE CABEZA KLINSMANN THEO',1,'47356133','1991-06-12 00:00:00',1,1,'','',NULL,'2020-12-01 00:00:00',0,0),(
853,049943,1,'QUISPE','CAILLAHUA','RAUL',NULL,'QUISPE CAILLAHUA RAUL',1,'07087837','1963-09-07 00:00:00',1,1,'','',NULL,'1981-11-16 00:00:00',0,0),(
854,980346,1,'QUISPE','CALIXTRO','ELIO','IVAN','QUISPE CALIXTRO ELIO IVAN',1,'43228745','1985-11-01 00:00:00',1,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
855,980032,1,'QUISPE','ECHAJAYA','CARMEN','ROSANA','QUISPE ECHAJAYA CARMEN ROSANA',1,'21526501','1970-04-21 00:00:00',2,1,'','',NULL,'2010-07-05 00:00:00',0,0),(
856,980347,1,'QUISPE','HUISA','DIANA','LUCY','QUISPE HUISA DIANA LUCY',1,'42094648','1983-10-25 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
857,980525,1,'QUISPE','LUZA','KATHY','NENNA','QUISPE LUZA KATHY NENNA',1,'40875957','1981-04-03 00:00:00',2,1,'','',NULL,'2018-12-28 00:00:00',0,0),(
858,049947,1,'QUISPE','SALAZAR','ISABEL',NULL,'QUISPE SALAZAR ISABEL',1,'06158098','1962-07-08 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
859,800444,1,'QUISPE','TANG','ANA','LIDIA','QUISPE TANG ANA LIDIA',1,'15353979','1967-06-26 00:00:00',2,1,'','',NULL,'1996-02-01 00:00:00',0,0),(
860,980456,1,'QUISPE','VIVANCO','JACKELINE','YRAIDA','QUISPE VIVANCO JACKELINE YRAIDA',1,'44296500','1987-06-10 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
861,049948,1,'RACCHUMI','ESQUEN','ROSA','MIRIAM','RACCHUMI ESQUEN ROSA MIRIAM',1,'08056621','1960-01-11 00:00:00',2,1,'','',NULL,'1988-12-31 00:00:00',0,0),(
862,098406,1,'RADO','BLAS DE DUPLEX','ROSA',NULL,'RADO BLAS DE DUPLEX ROSA',1,'07109320','1960-02-27 00:00:00',2,1,'','',NULL,'1989-12-31 00:00:00',0,0),(
863,960329,1,'RAFAEL','CHAVEZ','MARLOM','HERCY','RAFAEL CHAVEZ MARLOM HERCY',1,'43164479','1985-09-02 00:00:00',1,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
864,049949,1,'RAFFO','CARRANZA','MANUEL','ALFREDO','RAFFO CARRANZA MANUEL ALFREDO',1,'08568547','1956-12-27 00:00:00',1,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
865,980480,1,'RAGAS','GONZALES','KATIA','ANAKARI','RAGAS GONZALES KATIA ANAKARI',1,'46057787','1989-11-15 00:00:00',2,1,'','',NULL,'2018-02-01 00:00:00',0,0),(
866,980553,1,'RAMIREZ','CABRERA','JOSE','ENRIQUE','RAMIREZ CABRERA JOSE ENRIQUE',1,'40719030','1980-12-30 00:00:00',2,1,'','',NULL,'2020-12-31 00:00:00',0,0),(
867,117993,1,'RAMIREZ','CABRERA','JUAN','ORESTES','RAMIREZ CABRERA JUAN ORESTES',1,'07209167','1964-03-30 00:00:00',1,1,'','',NULL,'2004-03-09 00:00:00',0,0),(
868,950008,1,'RAMIREZ','CARDENAS','JHONNY','IVAN','RAMIREZ CARDENAS JHONNY IVAN',1,'09899397','1969-12-09 00:00:00',1,1,'','',NULL,'2004-12-11 00:00:00',0,0),(
869,600061,1,'RAMIREZ','CARDENAS','NANCY','LUZ','RAMIREZ CARDENAS NANCY LUZ',1,'01109853','1963-08-27 00:00:00',2,1,'','',NULL,'2003-02-01 00:00:00',0,0),(
870,049951,1,'RAMIREZ','FLOREZ','ESTEBAN',NULL,'RAMIREZ FLOREZ ESTEBAN',1,'25491035','1959-01-24 00:00:00',1,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
871,980395,1,'RAMIREZ','HERNANDEZ','YULISA','ROSSINA','RAMIREZ HERNANDEZ YULISA ROSSINA',1,'43399756','1985-11-11 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
872,980479,1,'RAMIREZ','LUJAN','MARIA','ROSA','RAMIREZ LUJAN MARIA ROSA',1,'40516461','1980-05-11 00:00:00',2,1,'','',NULL,'2018-02-01 00:00:00',0,0),(
873,049952,1,'RAMIREZ','OBREGON','LUZ','AMELIA','RAMIREZ OBREGON LUZ AMELIA',1,'08578060','1962-10-15 00:00:00',2,1,'','',NULL,'1987-12-15 00:00:00',0,0),(
874,980551,1,'RAMIREZ','POPAYAN','DIANA','SOLEDAD','RAMIREZ POPAYAN DIANA SOLEDAD',1,'43579934','1986-03-13 00:00:00',2,1,'','',NULL,'2020-12-31 00:00:00',0,0),(
875,960358,1,'RAMIREZ','RODRIGUEZ','JHARDIS','MILUSKA','RAMIREZ RODRIGUEZ JHARDIS MILUSKA',1,'70855876','1994-08-23 00:00:00',2,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
876,980396,1,'RAMIREZ','ROSELLO','VERONICA','JUDITH','RAMIREZ ROSELLO VERONICA JUDITH',1,'45433798','1988-11-24 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
877,950009,1,'RAMIREZ','VALLADARES','MARIA','JESUS','RAMIREZ VALLADARES MARIA JESUS',1,'09301622','1968-06-04 00:00:00',2,1,'','',NULL,'2004-12-11 00:00:00',0,0),(
878,600128,1,'RAMIREZ','VASQUEZ','DULA','NANCY','RAMIREZ VASQUEZ DULA NANCY',1,'08645816','1961-07-21 00:00:00',2,1,'','',NULL,'2002-01-02 00:00:00',0,0),(
879,980397,1,'RAMOS','AGUERO','NOEMI','VERONICA','RAMOS AGUERO NOEMI VERONICA',1,'40623384','1980-07-10 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
880,049409,1,'RAMOS','BEDREGAL','GLADIS','FELICITAS','RAMOS BEDREGAL GLADIS FELICITAS',1,'07724588','1952-05-26 00:00:00',2,1,'','',NULL,'1981-06-01 00:00:00',0,0),(
881,049954,1,'RAMOS','CUETO','BETTY','AZUCENA','RAMOS CUETO BETTY AZUCENA',1,'06116068','1962-02-19 00:00:00',2,1,'','',NULL,'1987-12-15 00:00:00',0,0),(
882,980009,1,'RAMOS','GARAY DE PATINO','CELIA','ASUNTA','RAMOS GARAY DE PATINO CELIA ASUNTA',1,'09193635','1954-06-26 00:00:00',2,1,'','',NULL,'2008-02-01 00:00:00',0,0),(
883,101762,1,'RAMOS','GUERRERO','HILDA','ESTHER','RAMOS GUERRERO HILDA ESTHER',1,'09556447','1968-10-16 00:00:00',2,1,'','',NULL,'1991-12-31 00:00:00',0,0),(
884,049958,1,'RAMOS','LARICO','ROSARIO',NULL,'RAMOS LARICO ROSARIO',1,'09128518','1967-04-15 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
885,980500,1,'RAMOS','NORABUENA','ALICIA',NULL,'RAMOS NORABUENA ALICIA',1,'42396348','1984-05-09 00:00:00',2,1,'','',NULL,'2018-11-22 00:00:00',0,0),(
886,980311,1,'RAMOS','PILLACA','MARIA','LUZ','RAMOS PILLACA MARIA LUZ',1,'09952750','1975-11-23 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
887,101776,1,'RAMOS','PILLACA','RAQUEL','CLAUDIA','RAMOS PILLACA RAQUEL CLAUDIA',1,'09449497','1970-05-11 00:00:00',2,1,'','',NULL,'1990-07-15 00:00:00',0,0),(
888,049961,1,'RAMOS','ROJAS','ELIZABETH',NULL,'RAMOS ROJAS ELIZABETH',1,'06214985','1964-02-11 00:00:00',2,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
889,980457,1,'RAMOS','TAYPE','MARGOTH','ELIZABETH','RAMOS TAYPE MARGOTH ELIZABETH',1,'10685529','1977-07-26 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
890,049410,1,'REATEGUI','COAHILA','ANA','LOURDES','REATEGUI COAHILA ANA LOURDES',1,'06752043','1955-01-18 00:00:00',2,1,'','',NULL,'1976-06-01 00:00:00',0,0),(
891,049411,1,'REATEGUI','COAHILA','OLGA','LEONOR','REATEGUI COAHILA OLGA LEONOR',1,'06720689','1956-01-04 00:00:00',2,1,'','',NULL,'1974-10-01 00:00:00',0,0),(
892,980478,1,'REBOLLEDO','ROQUE','YESSICA','MARLENE','REBOLLEDO ROQUE YESSICA MARLENE',1,'40143263','1979-03-01 00:00:00',2,1,'','',NULL,'2018-02-01 00:00:00',0,0),(
893,800442,1,'REGALADO','VILLEGAS','DIANIRA',NULL,'REGALADO VILLEGAS DIANIRA',1,'16430635','1962-05-09 00:00:00',2,1,'','',NULL,'1996-01-23 00:00:00',0,0),(
894,049963,1,'REINOSO','RODRIGUEZ','CINEIDA','AMELIA','REINOSO RODRIGUEZ CINEIDA AMELIA',1,'06616247','1956-11-17 00:00:00',2,1,'','',NULL,'1981-07-16 00:00:00',0,0),(
895,970033,1,'REQUE','GARCIA','ARMANDO',NULL,'REQUE GARCIA ARMANDO',1,'08909937','1961-04-03 00:00:00',1,1,'','',NULL,'2011-01-01 00:00:00',0,0),(
896,049965,1,'REQUENA','VILLAVICENCIO','SERGIO','ALEJANDRINO','REQUENA VILLAVICENCIO SERGIO ALEJANDRINO',1,'08582677','1958-06-02 00:00:00',1,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
897,980026,1,'RESPICIO','LOPEZ','PATRICIA','MILAGROS','RESPICIO LOPEZ PATRICIA MILAGROS',1,'15840930','1970-10-09 00:00:00',2,1,'','',NULL,'2008-02-01 00:00:00',0,0),(
898,049966,1,'RETAMOZO','CAYLLAHUA','CARMELA',NULL,'RETAMOZO CAYLLAHUA CARMELA',1,'06151070','1966-10-01 00:00:00',2,1,'','',NULL,'1986-12-01 00:00:00',0,0),(
899,101775,1,'RETAMOZO','PANTOJA','JOSE','ANDRES','RETAMOZO PANTOJA JOSE ANDRES',1,'06616511','1962-11-10 00:00:00',1,1,'','',NULL,'1990-07-15 00:00:00',0,0),(
900,049968,1,'RETAMOZO','RAMIREZ','ELENA',NULL,'RETAMOZO RAMIREZ ELENA',1,'06677745','1960-08-13 00:00:00',2,1,'','',NULL,'1987-12-15 00:00:00',0,0),(
901,980215,1,'REYES','ARMAS','IVAN','GABOR','REYES ARMAS IVAN GABOR',1,'40767465','1979-11-13 00:00:00',1,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
902,980312,1,'REYES','BOBADILLA','RAQUEL','MARISOL','REYES BOBADILLA RAQUEL MARISOL',1,'19248505','1974-06-02 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
903,028174,1,'REYES','CORDOVA','MARIA','EMPERATRIZ','REYES CORDOVA MARIA EMPERATRIZ',1,'25692417','1953-04-25 00:00:00',2,1,'','',NULL,'1993-09-16 00:00:00',0,0),(
904,980398,1,'REYES','GELDRES','MIRNA','MILAGROS','REYES GELDRES MIRNA MILAGROS',1,'40407708','1979-10-28 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
905,980162,1,'REYES','MORANTE','GLADYS','JAZMIN','REYES MORANTE GLADYS JAZMIN',1,'10760746','1977-03-16 00:00:00',2,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
906,980171,1,'REYES','RENGIFO','LUIS','DANIEL','REYES RENGIFO LUIS DANIEL',1,'41129538','1981-09-13 00:00:00',1,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
907,980147,1,'REYES','SOLANO','IRENE','MERCEDES','REYES SOLANO IRENE MERCEDES',1,'40765485','1981-01-04 00:00:00',2,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
908,980532,1,'REYES','VEGA','MADELEINE','SULAY','REYES VEGA MADELEINE SULAY',1,'42979746','1983-12-06 00:00:00',2,1,'','',NULL,'2018-12-28 00:00:00',0,0),(
909,970018,1,'REYNA','SILVA','LUZ','ANGELICA','REYNA SILVA LUZ ANGELICA',1,'08262863','1963-04-10 00:00:00',2,1,'','',NULL,'2010-06-01 00:00:00',0,0),(
910,980248,1,'RICALDES','LEIVA','NELI','MARCIANA','RICALDES LEIVA NELI MARCIANA',1,'09934491','1973-12-23 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
911,980280,1,'RICALDI','MAITA','OSCAR',NULL,'RICALDI MAITA OSCAR',1,'41855229','1983-07-23 00:00:00',1,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
912,049973,1,'RIMACHI','BENDEZU','SAN','SEBASTIAN','RIMACHI BENDEZU SAN SEBASTIAN',1,'08610137','1963-02-25 00:00:00',1,1,'','',NULL,'1986-12-01 00:00:00',0,0),(
913,980530,1,'RINCON','PANTOJA','ERICA','CAROLAN','RINCON PANTOJA ERICA CAROLAN',1,'40761392','1980-10-01 00:00:00',2,1,'','',NULL,'2018-12-28 00:00:00',0,0),(
914,970028,1,'RIOJAS','CASTRO','HENRY',NULL,'RIOJAS CASTRO HENRY',1,'17624184','1963-05-18 00:00:00',1,1,'','',NULL,'2018-12-31 00:00:00',0,0),(
915,049977,1,'RIOS','FERNANDEZ','ORIELE','MARGARITA','RIOS FERNANDEZ ORIELE MARGARITA',1,'06221199','1956-02-07 00:00:00',2,1,'','',NULL,'1988-12-31 00:00:00',0,0),(
916,800606,1,'RIOS','HUAYTAN','ANTONIA','CIRILA','RIOS HUAYTAN ANTONIA CIRILA',1,'09197739','1964-03-16 00:00:00',2,1,'','',NULL,'1997-09-01 00:00:00',0,0),(
917,950011,1,'RIOS','MARROQUIN','TANIA',NULL,'RIOS MARROQUIN TANIA',1,'21526353','1970-09-05 00:00:00',2,1,'','',NULL,'2004-12-11 00:00:00',0,0),(
918,049980,1,'RIOS','PAJAR','ELIZABETH','MERIDA','RIOS PAJAR ELIZABETH MERIDA',1,'09486140','1969-09-12 00:00:00',2,1,'','',NULL,'1988-09-01 00:00:00',0,0),(
919,133513,1,'RIOS','VARILLAS','ARTURO',NULL,'RIOS VARILLAS ARTURO',1,'08212660','1952-05-21 00:00:00',1,1,'','',NULL,'1991-12-31 00:00:00',0,0),(
920,980175,1,'RIOS','VELA','YANED','ZOILA','RIOS VELA YANED ZOILA',1,'10747516','1978-03-20 00:00:00',2,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
921,049981,1,'RIVAS','CUADROS','JOHNNY','MANUEL','RIVAS CUADROS JOHNNY MANUEL',1,'06140684','1965-05-21 00:00:00',1,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
922,800844,1,'RIVAS','LOZAN','MARIA','DEL ROSARIO','RIVAS LOZAN MARIA DEL ROSARIO',1,'21403862','1962-04-14 00:00:00',2,1,'','',NULL,'1998-01-01 00:00:00',0,0),(
923,049982,1,'RIVERA','ABAD','MARIA','PERSEVERANDA','RIVERA ABAD MARIA PERSEVERANDA',1,'09055481','1959-10-12 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
924,800853,1,'RIVERA','LUNA DE ROMERO','ALICIA','FELICITA','RIVERA LUNA DE ROMERO ALICIA FELICITA',1,'10863955','1978-10-24 00:00:00',2,1,'','',NULL,'1998-01-01 00:00:00',0,0),(
925,980458,1,'RIVERA','PAZ','ZULMY','JUDITH','RIVERA PAZ ZULMY JUDITH',1,'16713187','1973-09-02 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
926,050073,1,'RIVEROS','NAGARRO DE GUTIERREZ','SONIA','MARIA','RIVEROS NAGARRO DE GUTIERREZ SONIA MARIA',1,'06257991','1963-03-11 00:00:00',2,1,'','',NULL,'1996-07-23 00:00:00',0,0),(
927,049400,1,'RIVEROS','QUINTANA','JUAN','CARLOS','RIVEROS QUINTANA JUAN CARLOS',1,'06113088','1963-11-11 00:00:00',1,1,'','',NULL,'1994-04-02 00:00:00',0,0),(
928,980348,1,'ROA','SOTO','GIOVANA',NULL,'ROA SOTO GIOVANA',1,'40598569','1980-08-14 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
929,980399,1,'RODRIGUEZ','CAYETANO','EVELYN','KATHERINE','RODRIGUEZ CAYETANO EVELYN KATHERINE',1,'45960029','1989-09-26 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
930,049322,1,'RODRIGUEZ','DE RODRIGUEZ','ESMEREGILDA','PASTORA','RODRIGUEZ DE RODRIGUEZ ESMEREGILDA PASTORA',1,'29268379','1959-01-18 00:00:00',2,1,'','',NULL,'1991-12-31 00:00:00',0,0),(
931,980111,1,'RODRIGUEZ','JULCAMANYAN','JESUS','BLANCA','RODRIGUEZ JULCAMANYAN JESUS BLANCA',1,'10618538','1977-03-26 00:00:00',2,1,'','',NULL,'2012-07-01 00:00:00',0,0),(
932,980010,1,'RODRIGUEZ','SANCHEZ','MARTA','NORA','RODRIGUEZ SANCHEZ MARTA NORA',1,'26624784','1961-07-30 00:00:00',2,1,'','',NULL,'2008-02-01 00:00:00',0,0),(
933,049990,1,'RODRIGUEZ','TELLO','DELIA','CARMEN','RODRIGUEZ TELLO DELIA CARMEN',1,'07069020','1960-10-20 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
934,980018,1,'RODRIGUEZ','TOVAR','SARA','LOURDES','RODRIGUEZ TOVAR SARA LOURDES',1,'07151129','1964-04-24 00:00:00',2,1,'','',NULL,'2008-02-01 00:00:00',0,0),(
935,980232,1,'RODRIGUEZ','VALDERRAMA','RAQUEL','ELIZABETH','RODRIGUEZ VALDERRAMA RAQUEL ELIZABETH',1,'40644097','1980-06-30 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
936,049992,1,'ROJAS','ALEJO','AMANCIO',NULL,'ROJAS ALEJO AMANCIO',1,'08512874','1957-09-01 00:00:00',1,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
937,980098,1,'ROJAS','BARDON','GABY','MERCEDES','ROJAS BARDON GABY MERCEDES',1,'22507257','1969-09-22 00:00:00',2,1,'','',NULL,'2012-07-01 00:00:00',0,0),(
938,049421,1,'ROJAS','CARDENAS DE GARAY','FLOR','ERALDICA','ROJAS CARDENAS DE GARAY FLOR ERALDICA',1,'10518830','1955-04-15 00:00:00',2,1,'','',NULL,'1987-11-23 00:00:00',0,0),(
939,049882,1,'ROJAS','HERRERA','ELIDA','ESPERANZA','ROJAS HERRERA ELIDA ESPERANZA',1,'06798266','1963-12-18 00:00:00',2,1,'','',NULL,'1994-08-01 00:00:00',0,0),(
940,980182,1,'ROJAS','LARA','ELIZABETH','ROSA','ROJAS LARA ELIZABETH ROSA',1,'19934171','1972-08-31 00:00:00',2,1,'','',NULL,'2017-08-01 00:00:00',0,0),(
941,980277,1,'ROJAS','MAGALLANES','JUDY',NULL,'ROJAS MAGALLANES JUDY',1,'21879994','1977-01-28 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
942,980517,1,'ROJAS','MARTOS','MEDALY',NULL,'ROJAS MARTOS MEDALY',1,'45208300','1988-08-13 00:00:00',2,1,'','',NULL,'2018-11-22 00:00:00',0,0),(
943,049412,1,'ROJAS','MATURANO','CESAR','AUGUSTO','ROJAS MATURANO CESAR AUGUSTO',1,'16663022','1952-07-04 00:00:00',1,1,'','',NULL,'1988-08-16 00:00:00',0,0),(
944,049388,1,'ROJAS','MEDINA','AUREA','ROSA','ROJAS MEDINA AUREA ROSA',1,'10318594','1957-03-06 00:00:00',2,1,'','',NULL,'1991-04-01 00:00:00',0,0),(
945,950036,1,'ROJAS','ORTIZ','GINA','ISOLINA','ROJAS ORTIZ GINA ISOLINA',1,'06159008','1961-05-14 00:00:00',2,1,'','',NULL,'2005-06-14 00:00:00',0,0),(
946,970007,1,'ROJAS','QUISPE','ELIZAVETH',NULL,'ROJAS QUISPE ELIZAVETH',1,'15661858','1961-09-06 00:00:00',2,1,'','',NULL,'2009-02-01 00:00:00',0,0),(
947,980254,1,'ROJAS','RAMOS','ROSARIO','DEL PILAR','ROJAS RAMOS ROSARIO DEL PILAR',1,'10195176','1974-01-17 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
948,980234,1,'ROJAS','SALINAS DE GUERRERO','NANCY','MADELEY','ROJAS SALINAS DE GUERRERO NANCY MADELEY',1,'00124150','1977-07-06 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
949,116675,1,'ROJAS','TORRES','CARMEN','ELVIRA','ROJAS TORRES CARMEN ELVIRA',1,'21522563','1971-07-03 00:00:00',2,1,'','',NULL,'2003-08-01 00:00:00',0,0),(
950,980023,1,'ROJAS','TORRES','ELVIRA','ADELAIDA','ROJAS TORRES ELVIRA ADELAIDA',1,'15721789','1967-12-12 00:00:00',2,1,'','',NULL,'2008-02-01 00:00:00',0,0),(
951,980127,1,'ROJAS','ZUMARAN','VICTOR','ABRAHAM','ROJAS ZUMARAN VICTOR ABRAHAM',1,'08583507','1957-03-05 00:00:00',1,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
952,980313,1,'ROLDAN','ESPINOZA','ROXANA',NULL,'ROLDAN ESPINOZA ROXANA ESTHER',1,'40936903','1981-07-18 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
953,980459,1,'ROMAN','CARRANZA','PATRICIA','FIORELA','ROMAN CARRANZA PATRICIA FIORELA',1,'43620373','1985-11-29 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
954,800591,1,'ROMAN','MALDONADO DE MACAVILCA','JESUS','ISABEL','ROMAN MALDONADO DE MACAVILCA JESUS ISABEL',1,'07093290','1958-07-31 00:00:00',2,1,'','',NULL,'1997-08-01 00:00:00',0,0),(
955,049417,1,'ROMAN','MALDONADO','MARCO','ANTONIO','ROMAN MALDONADO MARCO ANTONIO',1,'09524545','1960-10-06 00:00:00',1,1,'','',NULL,'1996-07-23 00:00:00',0,0),(
956,050001,1,'ROMERO','BALLARDO','AIDEE','MARUJA','ROMERO BALLARDO AIDEE MARUJA',1,'09033817','1967-07-27 00:00:00',2,1,'','',NULL,'1985-08-01 00:00:00',0,0),(
957,980460,1,'ROMERO','MEJIA','BELU','TATIANA','ROMERO MEJIA BELU TATIANA',1,'42690978','1982-06-06 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
958,980202,1,'ROMERO','NARVAEZ','CAROLINA','JEANETTE','ROMERO NARVAEZ CAROLINA JEANETTE',1,'10689968','1978-07-03 00:00:00',2,1,'','',NULL,'2014-02-01 00:00:00',0,0),(
959,050003,1,'ROMERO','RAMIREZ','JULIA','AIDA','ROMERO RAMIREZ JULIA AIDA',1,'07339049','1960-03-28 00:00:00',2,1,'','',NULL,'1984-11-01 00:00:00',0,0),(
960,980314,1,'ROQUE','BENDEZU','DIANA','CECILIA','ROQUE BENDEZU DIANA CECILIA',1,'41221197','1982-03-15 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
961,960372,1,'ROSADO','ARANA','MARIELLA','GIULIANA','ROSADO ARANA MARIELLA GIULIANA',1,'70246433','1994-09-10 00:00:00',2,1,'','',NULL,'2020-12-01 00:00:00',0,0),(
962,101756,1,'ROSADO','LINAN','GLADIS','GLORIA','ROSADO LINAN GLADIS GLORIA',1,'06160788','1958-12-28 00:00:00',2,1,'','',NULL,'1990-07-15 00:00:00',0,0),(
963,980400,1,'ROSAS','MAZA','EMILI','INGRID','ROSAS MAZA EMILI INGRID',1,'45338636','1988-08-22 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
964,980552,1,'ROSAS','MAZA','MIRELLA','ISAMAR','ROSAS MAZA MIRELLA ISAMAR',1,'70134468','1991-07-12 00:00:00',2,1,'','',NULL,'2020-12-31 00:00:00',0,0),(
965,600108,1,'ROSAS','VARGAS','LUZ','AMERICA','ROSAS VARGAS LUZ AMERICA',1,'04349670','1959-04-29 00:00:00',2,1,'','',NULL,'2003-04-01 00:00:00',0,0),(
966,980243,1,'RUIZ','COCHRANE','MONICA','GIANETT','RUIZ COCHRANE MONICA GIANETT',1,'06192085','1964-11-01 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
967,049424,1,'RUIZ','CRUZ','SILVIA','CARMEN','RUIZ CRUZ SILVIA CARMEN',1,'06253151','1960-11-16 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
968,970075,1,'RUIZ','CUMAPA','SARA',NULL,'RUIZ CUMAPA SARA',1,'00802223','1956-12-10 00:00:00',2,1,'','',NULL,'2009-01-01 00:00:00',0,0),(
969,049256,1,'RUIZ','FLORES DE PALOMINO','GLADYS',NULL,'RUIZ FLORES DE PALOMINO GLADYS',1,'10371160','1959-03-25 00:00:00',2,1,'','',NULL,'1980-04-16 00:00:00',0,0),(
970,980269,1,'RUIZ','GARCIA','MARIAN',NULL,'RUIZ GARCIA MARIAN',1,'09749990','1972-11-09 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
971,800596,1,'RUIZ','RAVICHAGUA','LUZ','SANTANA','RUIZ RAVICHAGUA LUZ SANTANA',1,'08054753','1964-02-25 00:00:00',2,1,'','',NULL,'1997-08-06 00:00:00',0,0),(
972,980559,1,'SAAVEDRA','MONCADA','MARIA','ISABEL','SAAVEDRA MONCADA MARIA ISABEL',1,'46106534','1989-10-04 00:00:00',2,1,'','',NULL,'2020-12-31 00:00:00',0,0),(
973,980293,1,'SAENZ','CASTANEDA','ANA','CECILIA','SAENZ CASTANEDA ANA CECILIA',1,'40298010','1979-07-24 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
974,980401,1,'SAENZ','HERNANDEZ','ANA','MARIA','SAENZ HERNANDEZ ANA MARIA',1,'40229330','1979-07-25 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
975,980485,1,'SAENZ','VERASTEGUI DE CHOZO','MARIA','LUISA','SAENZ VERASTEGUI DE CHOZO MARIA LUISA',1,'09138866','1961-03-14 00:00:00',2,1,'','',NULL,'2018-02-01 00:00:00',0,0),(
976,960392,1,'SALAS','VILLAR','JOSMARY','ANTUANETTE','SALAS VILLAR JOSMARY ANTUANETTE',1,'46419685','1990-07-19 00:00:00',2,1,'','',NULL,'2020-12-01 00:00:00',0,0),(
977,980564,1,'SALAZAR','ABAD','KARIN','GIANINNA','SALAZAR ABAD KARIN GIANINNA',1,'41947737','1983-07-22 00:00:00',2,1,'','',NULL,'2020-12-31 00:00:00',0,0),(
978,980274,1,'SALAZAR','MATEO','MARIBEL',NULL,'SALAZAR MATEO MARIBEL',1,'10674816','1977-12-03 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
979,050010,1,'SALAZAR','ORTIZ','DAYMI','CARIDAD','SALAZAR ORTIZ DAYMI CARIDAD',1,'06165912','1960-02-13 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
980,050011,1,'SALAZAR','PEREZ','FELICITAS',NULL,'SALAZAR PEREZ FELICITAS',1,'06052741','1952-11-24 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
981,980183,1,'SALAZAR','REYNA','FERNANDO','LUIS','SALAZAR REYNA FERNANDO LUIS',1,'07873891','1971-02-23 00:00:00',1,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
982,101734,1,'SALAZAR','SALAS','SANTOS','MARILU','SALAZAR SALAS SANTOS MARILU',1,'25617481','1962-11-05 00:00:00',2,1,'','',NULL,'1990-07-15 00:00:00',0,0),(
983,044661,1,'SALAZAR','SALAZAR','NANCY','SOLEDAD','SALAZAR SALAZAR NANCY SOLEDAD',1,'09923498','1972-09-29 00:00:00',2,1,'','',NULL,'1989-12-15 00:00:00',0,0),(
984,980246,1,'SALAZAR','TUANAMA','RITA','HAYDEE','SALAZAR TUANAMA RITA HAYDEE',1,'08488669','1958-08-20 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
985,980024,1,'SALAZAR','VILLA','MARIA','YOLANDA','SALAZAR VILLA MARIA YOLANDA',1,'08794894','1961-11-29 00:00:00',2,1,'','',NULL,'2008-02-01 00:00:00',0,0),(
986,800453,1,'SALCEDO','MOLINA','PATRICIA',NULL,'SALCEDO MOLINA PATRICIA',1,'09686824','1972-01-16 00:00:00',2,1,'','',NULL,'1995-12-31 00:00:00',0,0),(
987,049427,1,'SALDANA','SALTACHIN','ROSA','LUZ','SALDANA SALTACHIN ROSA LUZ',1,'06798960','1959-09-13 00:00:00',2,1,'','',NULL,'1986-07-01 00:00:00',0,0),(
988,050014,1,'SALDIVAR','PAREDES','ELSA',NULL,'SALDIVAR PAREDES ELSA',1,'07560004','1962-01-06 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
989,049764,1,'SALGADO','QUISPE','CRISTINA','ROSA','SALGADO QUISPE CRISTINA ROSA',1,'09028976','1967-03-11 00:00:00',2,1,'','',NULL,'1995-05-01 00:00:00',0,0),(
990,117450,1,'SALVATIERRA','HUAYNALAYA','ALBERTO','PEDRO','SALVATIERRA HUAYNALAYA ALBERTO PEDRO',1,'08652071','1959-09-27 00:00:00',1,1,'','',NULL,'1990-12-13 00:00:00',0,0),(
991,950012,1,'SAMAME','ARRASCO','CESAR','ALBERTO','SAMAME ARRASCO CESAR ALBERTO',1,'10580572','1968-11-30 00:00:00',1,1,'','',NULL,'2004-12-11 00:00:00',0,0),(
992,980037,1,'SAN MARTIN','LOPEZ','MARITZA','ROXANA','SAN MARTIN LOPEZ MARITZA ROXANA',1,'06772693','1969-10-21 00:00:00',2,1,'','',NULL,'2010-07-05 00:00:00',0,0),(
993,980402,1,'SAN MIGUEL','EGUSQUIZA','CAROLINA','VICTORIA','SAN MIGUEL EGUSQUIZA CAROLINA VICTORIA',1,'10808539','1977-08-16 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
994,800500,1,'SANCHEZ','AREVALO','GLORIA',NULL,'SANCHEZ AREVALO GLORIA',1,'08634596','1956-11-26 00:00:00',2,1,'','',NULL,'2002-10-01 00:00:00',0,0),(
995,950013,1,'SANCHEZ','CAMPOS','MARIANELLA',NULL,'SANCHEZ CAMPOS MARIANELLA',1,'07258006','1969-10-10 00:00:00',2,1,'','',NULL,'2004-12-11 00:00:00',0,0),(
996,980036,1,'SANCHEZ','CONDORI','NANCY','VIRGINIA','SANCHEZ CONDORI NANCY VIRGINIA',1,'07687245','1969-04-13 00:00:00',2,1,'','',NULL,'2010-07-05 00:00:00',0,0),(
997,980403,1,'SANCHEZ','LEON','NELIDA',NULL,'SANCHEZ LEON NELIDA',1,'41743024','1983-04-26 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
998,960394,1,'SANCHEZ','PASTOR','LENIN','BENEDICTO','SANCHEZ PASTOR LENIN BENEDICTO',1,'27730638','1974-08-19 00:00:00',1,1,'','',NULL,'2020-12-01 00:00:00',0,0),(
999,101754,1,'SANCHEZ','PEREZ','LUIS','ENRIQUE','SANCHEZ PEREZ LUIS ENRIQUE',1,'06177701','1955-09-17 00:00:00',1,1,'','',NULL,'1990-07-15 00:00:00',0,0),(
1000,980125,1,'SANCHEZ','PONCE','EDGARD','EDILBERTO','SANCHEZ PONCE EDGARD EDILBERTO',1,'29703526','1970-03-25 00:00:00',1,1,'','',NULL,'2012-12-13 00:00:00',0,0),(
1001,050017,1,'SANCHEZ','QUINTANA','CARMEN','YOLANDA','SANCHEZ QUINTANA CARMEN YOLANDA',1,'10626457','1962-07-14 00:00:00',2,1,'','',NULL,'1987-12-15 00:00:00',0,0),(
1002,980349,1,'SANCHEZ','SAAVEDRA','FLOR','MARIA','SANCHEZ SAAVEDRA FLOR MARIA',1,'09919792','1967-07-24 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
1003,050018,1,'SANCHEZ','VALVERDE','JOSE','FELICIANO','SANCHEZ VALVERDE JOSE FELICIANO',1,'09123292','1956-01-24 00:00:00',1,1,'','',NULL,'1980-11-01 00:00:00',0,0),(
1004,050020,1,'SANCHEZ','VILLAGOMEZ','MAYBI','ANGELA','SANCHEZ VILLAGOMEZ MAYBI ANGELA',1,'06721362','1955-10-01 00:00:00',2,1,'','',NULL,'1986-12-01 00:00:00',0,0),(
1005,970070,1,'SANDOVAL','LARA','AMERICO',NULL,'SANDOVAL LARA AMERICO',1,'09442663','1969-02-21 00:00:00',1,1,'','',NULL,'2013-03-01 00:00:00',0,0),(
1006,116260,1,'SANTA GADEA','MENDEZ VDA DE DELANGE','ESTHER','SABINA','SANTA GADEA MENDEZ VDA DE DELANGE ESTHER SABINA',1,'08062842','1953-03-18 00:00:00',2,1,'','',NULL,'2003-08-01 00:00:00',0,0),(
1007,980203,1,'SANTAMARIA','RELAYZA','PERCY','DAVID','SANTAMARIA RELAYZA PERCY DAVID',1,'10710346','1978-06-02 00:00:00',1,1,'','',NULL,'2014-02-01 00:00:00',0,0),(
1008,950067,1,'SANTIAGO','FIGUEROA','SERAPIA',NULL,'SANTIAGO FIGUEROA SERAPIA',1,'32262172','1956-07-13 00:00:00',2,1,'','',NULL,'2007-07-01 00:00:00',0,0),(
1009,050105,1,'SANTILLAN','MENDOZA','NANCY','MANUELA','SANTILLAN MENDOZA NANCY MANUELA',1,'33407804','1969-04-19 00:00:00',2,1,'','',NULL,'1988-12-01 00:00:00',0,0),(
1010,117447,1,'SANTILLAN','RAMIREZ','CARLOS','EDUARDO','SANTILLAN RAMIREZ CARLOS EDUARDO',1,'09080277','1958-10-24 00:00:00',1,1,'','',NULL,'2017-09-01 00:00:00',0,0),(
1011,800932,1,'SANTIVANEZ','PIMENTEL','ALVARO','CESAR','SANTIVANEZ PIMENTEL ALVARO CESAR',1,'08778244','1962-06-09 00:00:00',1,1,'','',NULL,'1998-06-22 00:00:00',0,0),(
1012,980509,1,'SANTOS','GOMEZ','MARIBEL','RITA','SANTOS GOMEZ MARIBEL RITA',1,'42794991','1984-12-08 00:00:00',2,1,'','',NULL,'2018-11-22 00:00:00',0,0),(
1013,800433,1,'SANTOS','GOYENA','SILVIA','ELENA','SANTOS GOYENA SILVIA ELENA',1,'09330366','1967-10-20 00:00:00',2,1,'','',NULL,'1995-12-31 00:00:00',0,0),(
1014,980474,1,'SARAZA','SEVILLA','DANTE','DANIEL','SARAZA SEVILLA DANTE DANIEL',1,'09446229','1969-12-14 00:00:00',1,1,'','',NULL,'2018-02-01 00:00:00',0,0),(
1015,960338,1,'SARMIENTO','BUSTINZA','WENDY','NELLY','SARMIENTO BUSTINZA WENDY NELLY',1,'73042442','1993-03-22 00:00:00',2,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
1016,800443,1,'SEGOVIA','TAPIA','PATRICIA','ASUNCION','SEGOVIA TAPIA PATRICIA ASUNCION',1,'07071103','1966-08-15 00:00:00',2,1,'','',NULL,'1995-12-31 00:00:00',0,0),(
1017,049434,1,'SEGURA','CALLE','CARLOS','DARIO','SEGURA CALLE CARLOS DARIO',1,'07804988','1955-07-02 00:00:00',1,1,'','',NULL,'1981-07-01 00:00:00',0,0),(
1018,960381,1,'SEMINARIO','RAMIREZ','BARBARA','DEL MILAGRO','SEMINARIO RAMIREZ BARBARA DEL MILAGRO',1,'46683393','1990-11-05 00:00:00',2,1,'','',NULL,'2020-12-01 00:00:00',0,0),(
1019,049300,1,'SERPA','VERGARA','LOLA','RENEE','SERPA VERGARA LOLA RENEE',1,'08828553','1956-03-08 00:00:00',2,1,'','',NULL,'1995-01-16 00:00:00',0,0),(
1020,800454,1,'SERRANO','AROTINCO','ALICIA',NULL,'SERRANO AROTINCO ALICIA',1,'07516069','1968-06-02 00:00:00',2,1,'','',NULL,'1995-12-31 00:00:00',0,0),(
1021,960340,1,'SILVA','ALEJANDRO','GERARDO','LUIS','SILVA ALEJANDRO GERARDO LUIS',1,'09908671','1975-05-14 00:00:00',1,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
1022,044189,1,'SILVA','ASTETE DE PATTARONE','LUCIA','ANTONIETA','SILVA ASTETE DE PATTARONE LUCIA ANTONIETA',1,'09910145','1957-02-24 00:00:00',2,1,'','',NULL,'1986-08-01 00:00:00',0,0),(
1023,980252,1,'SILVA','JAIMES','CLORINDA','LUZMILA','SILVA JAIMES CLORINDA LUZMILA',1,'07061232','1961-06-05 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
1024,098401,1,'SILVERA','SILVERA','YOLANDA',NULL,'SILVERA SILVERA YOLANDA',1,'10533661','1964-03-06 00:00:00',2,1,'','',NULL,'1989-12-31 00:00:00',0,0),(
1025,050030,1,'SIMON','MORENO DE VALLEJOS','ANTIA','SOCORRO','SIMON MORENO DE VALLEJOS ANTIA SOCORRO',1,'10690159','1958-04-18 00:00:00',2,1,'','',NULL,'1984-11-01 00:00:00',0,0),(
1026,960359,1,'SIMON','MORI','RAY','JOSEPH','SIMON MORI RAY JOSEPH',1,'42246316','1983-12-17 00:00:00',1,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
1027,949986,1,'SOBREVILLA','JAUREGUI','ILIANA','CARMEN','SOBREVILLA JAUREGUI ILIANA CARMEN',1,'06749769','1962-07-24 00:00:00',2,1,'','',NULL,'2004-04-01 00:00:00',0,0),(
1028,980350,1,'SOBREVILLA','ZAPATA','JENY','TERESA','SOBREVILLA ZAPATA JENY TERESA',1,'07333109','1963-09-21 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
1029,980113,1,'SOLANO','SOTO','BERTHA','AMALIA','SOLANO SOTO BERTHA AMALIA',1,'09414721','1965-08-08 00:00:00',2,1,'','',NULL,'2012-07-01 00:00:00',0,0),(
1030,970072,1,'SOLDEVILLA','BALBIN','ANA','MARIA DELFINA','SOLDEVILLA BALBIN ANA MARIA DELFINA',1,'19828282','1958-10-06 00:00:00',2,1,'','',NULL,'2014-02-01 00:00:00',0,0),(
1031,960395,1,'SOLIS','CHUCOS','LUDWIG','GLEB','SOLIS CHUCOS LUDWIG GLEB',1,'40460849','1980-03-16 00:00:00',1,1,'','',NULL,'2017-02-01 00:00:00',0,0),(
1032,050031,1,'SOLIS','LUYO','MARITZA','GUADALUPE','SOLIS LUYO MARITZA GUADALUPE',1,'15373167','1966-03-03 00:00:00',2,1,'','',NULL,'1988-12-31 00:00:00',0,0),(
1033,050032,1,'SOLIS','SULCA','LUCILA','VICTORIA','SOLIS SULCA LUCILA VICTORIA',1,'07080095','1959-03-29 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
1034,049439,1,'SORIA','CANAS DE RODRIGUEZ','FLOR','DE MARIA','SORIA CANAS DE RODRIGUEZ FLOR DE MARIA',1,'06712546','1955-08-24 00:00:00',2,1,'','',NULL,'1988-12-01 00:00:00',0,0),(
1035,980049,1,'SORIANO','CASTRO','JUAN',NULL,'SORIANO CASTRO JUAN',1,'06060442','1954-05-06 00:00:00',1,1,'','',NULL,'2010-07-05 00:00:00',0,0),(
1036,050035,1,'SOSA','DE LARA','MARIANA','BENIGNA','SOSA DE LARA MARIANA BENIGNA',1,'25534385','1955-02-09 00:00:00',2,1,'','',NULL,'1988-09-01 00:00:00',0,0),(
1037,980516,1,'SOTA','YAURI','FIORELLA','DEL ROSARIO','SOTA YAURI FIORELLA DEL ROSARIO',1,'44182846','1987-04-01 00:00:00',2,1,'','',NULL,'2018-11-22 00:00:00',0,0),(
1038,980283,1,'SOTIL','BINDELS','KAREN','AMELIA','SOTIL BINDELS KAREN AMELIA',1,'40796969','1980-02-19 00:00:00',2,1,'','',NULL,'2014-02-01 00:00:00',0,0),(
1039,980165,1,'SOTO','MORALES','ADELINA','DEL CARMEN','SOTO MORALES ADELINA DEL CARMEN',1,'25748890','1972-09-18 00:00:00',2,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
1040,049442,1,'SOTO','PASTRANA','JAVIER','ORLANDO','SOTO PASTRANA JAVIER ORLANDO',1,'06234659','1960-02-25 00:00:00',1,1,'','',NULL,'1988-12-01 00:00:00',0,0),(
1041,980172,1,'SOTO','RENGIFO','JUAN','JOSE','SOTO RENGIFO JUAN JOSE',1,'16011133','1974-02-26 00:00:00',1,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
1042,049443,1,'SOTOMAYOR','OLIVERA DE RIOS','BLANCA','LUZ','SOTOMAYOR OLIVERA DE RIOS BLANCA LUZ',1,'06687989','1956-02-01 00:00:00',2,1,'','',NULL,'1981-12-01 00:00:00',0,0),(
1043,980204,1,'STIGLICH','WATSON','MARIA','LUISA','STIGLICH WATSON MARIA LUISA',1,'06530138','1973-05-12 00:00:00',2,1,'','',NULL,'2014-02-01 00:00:00',0,0),(
1044,050039,1,'SUAREZ','ANAYA','JULIA','VICTORIA','SUAREZ ANAYA JULIA VICTORIA',1,'07384186','1962-01-21 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
1045,980404,1,'SUAREZ','OBREGON','EVERT','SEGUNDO','SUAREZ OBREGON EVERT SEGUNDO',1,'10666462','1977-08-30 00:00:00',1,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
1046,980255,1,'SUAREZ','PRETEL','FRITZ','NACION','SUAREZ PRETEL FRITZ NACION',1,'10602551','1977-07-03 00:00:00',1,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
1047,980315,1,'SULCA','TUPINO','MIRIAN',NULL,'SULCA TUPINO MIRIAN',1,'40266323','1979-02-28 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
1048,980518,1,'SULLON','CRUZ','JANINA','MARIBEL','SULLON CRUZ JANINA MARIBEL',1,'46789176','1991-01-06 00:00:00',2,1,'','',NULL,'2018-11-22 00:00:00',0,0),(
1049,049671,1,'SURICHAQUI','ORTIZ','CARMELA','MARIA','SURICHAQUI ORTIZ CARMELA MARIA',1,'08060824','1951-08-14 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
1050,049445,1,'SUYO','HERRERA','LUCY','ELIZABETH','SUYO HERRERA LUCY ELIZABETH',1,'10047882','1955-10-25 00:00:00',2,1,'','',NULL,'1984-10-01 00:00:00',0,0),(
1051,049456,1,'TABOADA','TELLO','JOSE','CARLOS','TABOADA TELLO JOSE CARLOS',1,'07318640','1963-10-01 00:00:00',1,1,'','',NULL,'1996-12-31 00:00:00',0,0),(
1052,980405,1,'TABORI','POMA','JORGE','LUIS','TABORI POMA JORGE LUIS',1,'41228780','1981-12-16 00:00:00',1,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
1053,980461,1,'TADEO','TORIBIO','JUAN','ZOSIMO','TADEO TORIBIO JUAN ZOSIMO',1,'08492271','1962-04-04 00:00:00',1,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
1054,980462,1,'TAFUR','VARGAS','TONY','WILLY','TAFUR VARGAS TONY WILLY',1,'42209119','1983-03-11 00:00:00',1,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
1055,050042,1,'TAMARIZ','GOMEZ','SONIA','BEATRIZ','TAMARIZ GOMEZ SONIA BEATRIZ',1,'06085536','1953-12-05 00:00:00',2,1,'','',NULL,'1986-12-01 00:00:00',0,0),(
1056,980463,1,'TANCO','CIRILO','ANA','JANET','TANCO CIRILO ANA JANET',1,'25797677','1975-05-25 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
1057,800854,1,'TANCO','CIRILO','MYRIAM','CECILIA','TANCO CIRILO MYRIAM CECILIA',1,'25582034','1973-02-06 00:00:00',2,1,'','',NULL,'1998-01-01 00:00:00',0,0),(
1058,980406,1,'TANCO','CIRILO','YOVANA','MARTINA','TANCO CIRILO YOVANA MARTINA',1,'41807230','1983-07-13 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
1059,980294,1,'TANTARUNA','VALLES','LAURA','TERESA','TANTARUNA VALLES LAURA TERESA',1,'40505664','1980-02-23 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
1060,050046,1,'TAPARA','JANAMPA','LUISA','MAGDALENA','TAPARA JANAMPA LUISA MAGDALENA',1,'06090754','1955-07-20 00:00:00',2,1,'','',NULL,'1984-10-01 00:00:00',0,0),(
1061,049447,1,'TAPIA','GALLEGOS','ROSARIO',NULL,'TAPIA GALLEGOS ROSARIO',1,'08215241','1961-03-11 00:00:00',2,1,'','',NULL,'1988-12-01 00:00:00',0,0),(
1062,800850,1,'TARAZONA','REYES','ROSA','LUZ','TARAZONA REYES ROSA LUZ',1,'09312688','1968-07-23 00:00:00',2,1,'','',NULL,'1998-01-01 00:00:00',0,0),(
1063,980351,1,'TARAZONA','TUCTO','PILAR',NULL,'TARAZONA TUCTO PILAR',1,'40488766','1978-03-11 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
1064,049449,1,'TASAYCO','RETUERTO','ELSA','ANTONIA','TASAYCO RETUERTO ELSA ANTONIA',1,'08644725','1959-09-13 00:00:00',2,1,'','',NULL,'1987-11-23 00:00:00',0,0),(
1065,049450,1,'TEJEDA','IPANAQUE DE POLO','LINDAURA',NULL,'TEJEDA IPANAQUE DE POLO LINDAURA',1,'08547539','1953-07-01 00:00:00',2,1,'','',NULL,'1984-10-01 00:00:00',0,0),(
1066,050049,1,'TELLO','DE LA CRUZ','MAGDA','RICARDINA','TELLO DE LA CRUZ MAGDA RICARDINA',1,'06883528','1964-04-03 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
1067,042458,1,'TELLO','MACAVILCA','JULIA','TELMA','TELLO MACAVILCA JULIA TELMA',1,'07066728','1959-01-31 00:00:00',2,1,'','',NULL,'1986-12-01 00:00:00',0,0),(
1068,960388,1,'TELLO','VELASQUEZ','ANA','CLAUDIA','TELLO VELASQUEZ ANA CLAUDIA',1,'73240526','1993-11-17 00:00:00',2,1,'','',NULL,'2020-12-01 00:00:00',0,0),(
1069,101753,1,'TERAN','VASQUEZ','JOSE','ALFONSO','TERAN VASQUEZ JOSE ALFONSO',1,'09327250','1967-03-27 00:00:00',1,1,'','',NULL,'1990-07-15 00:00:00',0,0),(
1070,950121,1,'TICSE','CUADRADO','VICTOR','HUGO','TICSE CUADRADO VICTOR HUGO',1,'20072513','1976-02-14 00:00:00',1,1,'','',NULL,'2014-07-01 00:00:00',0,0),(
1071,600110,1,'TINOCO','TORRES','HELI','BENJAMIN','TINOCO TORRES HELI BENJAMIN',1,'28573424','1959-04-15 00:00:00',1,1,'','',NULL,'2001-03-16 00:00:00',0,0),(
1072,050055,1,'TIPE','LUQUE','ALICIA',NULL,'TIPE LUQUE ALICIA',1,'08432789','1962-07-11 00:00:00',2,1,'','',NULL,'1986-12-01 00:00:00',0,0),(
1073,050056,1,'TIPE','LUQUE','NAZARIO','FELIX','TIPE LUQUE NAZARIO FELIX',1,'09232631','1966-02-19 00:00:00',1,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
1074,050057,1,'TIPIANA','CORNEJO','ERNESTO','MARTIN','TIPIANA CORNEJO ERNESTO MARTIN',1,'08054945','1963-12-16 00:00:00',1,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
1075,980205,1,'TIPTE','HERRERA','MAURO','ANTONIO','TIPTE HERRERA MAURO ANTONIO',1,'10092492','1975-10-17 00:00:00',1,1,'','',NULL,'2014-02-01 00:00:00',0,0),(
1076,980040,1,'TIPULA','TIPULA','BENEDICTA',NULL,'TIPULA TIPULA BENEDICTA',1,'08297635','1960-01-04 00:00:00',2,1,'','',NULL,'2010-07-05 00:00:00',0,0),(
1077,980407,1,'TIPULA','TIPULA','ESTEBAN',NULL,'TIPULA TIPULA ESTEBAN',1,'10132325','1974-08-16 00:00:00',1,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
1078,050058,1,'TIPULA','TIPULA','JUANA','LUISA','TIPULA TIPULA JUANA LUISA',1,'08323475','1956-02-05 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
1079,960380,1,'TITO','YEPEZ','ERROL','DEDWIN','TITO YEPEZ ERROL DEDWIN',1,'45488971','1988-01-14 00:00:00',1,1,'','',NULL,'2020-12-01 00:00:00',0,0),(
1080,980316,1,'TOLEDO','CASTILLO','ALI','MARINO','TOLEDO CASTILLO ALI MARINO',1,'41095500','1981-02-06 00:00:00',1,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
1081,980408,1,'TOMAYLLA','RAMIREZ','ANA','SOLEDAD','TOMAYLLA RAMIREZ ANA SOLEDAD',1,'10358196','1976-07-04 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
1082,980259,1,'TORIBIO','ALARCON','MARIA','MAGDALENA','TORIBIO ALARCON MARIA MAGDALENA',1,'41368588','1982-05-25 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
1083,960365,1,'TORPOCO','GONZALES','ROCIO','PRISCILA','TORPOCO GONZALES ROCIO PRISCILA',1,'80634403','1978-11-26 00:00:00',2,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
1084,980464,1,'TORRES','GUERRERO','CYNTHIA','YALITZA','TORRES GUERRERO CYNTHIA YALITZA',1,'42778941','1984-10-21 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
1085,980071,1,'TORRES','MARTINEZ','RONALD','JOSE','TORRES MARTINEZ RONALD JOSE',1,'25730371','1967-03-05 00:00:00',1,1,'','',NULL,'2011-04-01 00:00:00',0,0),(
1086,980184,1,'TORRES','MIRANDA','CESAR','LUIS','TORRES MIRANDA CESAR LUIS',1,'09753683','1972-11-02 00:00:00',1,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
1087,049455,1,'TORRES','NAVARRETE','NINFA','NICERETA','TORRES NAVARRETE NINFA NICERETA',1,'09133403','1961-10-11 00:00:00',2,1,'','',NULL,'1988-12-01 00:00:00',0,0),(
1088,050063,1,'TORRES','ROMERO','CESAR','ANTONIO','TORRES ROMERO CESAR ANTONIO',1,'06143318','1956-01-17 00:00:00',1,1,'','',NULL,'1981-12-01 00:00:00',0,0),(
1089,800861,1,'TORRES','SALAS','ROMY','DOMINGA','TORRES SALAS ROMY DOMINGA',1,'10656067','1959-08-04 00:00:00',2,1,'','',NULL,'1998-01-01 00:00:00',0,0),(
1090,050065,1,'TORRES','VEGA','CARMEN','LUZ','TORRES VEGA CARMEN LUZ',1,'06164472','1962-10-01 00:00:00',2,1,'','',NULL,'1984-11-01 00:00:00',0,0),(
1091,050066,1,'TORRES','ZAPATA','ELBA','ROSA','TORRES ZAPATA ELBA ROSA',1,'09244219','1964-08-17 00:00:00',2,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
1092,101732,1,'TORRES','ZEGARRA','SOCORRO','LILIANA','TORRES ZEGARRA SOCORRO LILIANA',1,'06198799','1964-06-27 00:00:00',2,1,'','',NULL,'1990-07-15 00:00:00',0,0),(
1093,600139,1,'TOSCANO','TRINIDAD','MARCO','ANTONIO SEGUNDO','TOSCANO TRINIDAD MARCO ANTONIO SEGUNDO',1,'09439806','1969-05-28 00:00:00',1,1,'','',NULL,'2004-01-04 00:00:00',0,0),(
1094,101739,1,'TOVAR','MADUENO','VIOLETA','ZENOBIA','TOVAR MADUENO VIOLETA ZENOBIA',1,'09428759','1967-12-15 00:00:00',2,1,'','',NULL,'2000-01-01 00:00:00',0,0),(
1095,980409,1,'TREJO','DIAZ','MAIRA','CARIDAD','TREJO DIAZ MAIRA CARIDAD',1,'15744443','1976-04-03 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
1096,980047,1,'TREJO','DIAZ','SUSAN','JANETH','TREJO DIAZ SUSAN JANETH',1,'15731695','1972-02-27 00:00:00',2,1,'','',NULL,'2010-07-05 00:00:00',0,0),(
1097,050070,1,'TRUJILLANO','RIVERA','DORIS','JANET','TRUJILLANO RIVERA DORIS JANET',1,'06249829','1966-11-01 00:00:00',2,1,'','',NULL,'2017-05-25 00:00:00',0,0),(
1098,101783,1,'TRUJILLO','ESPINOZA','HILARION',NULL,'TRUJILLO ESPINOZA HILARION',1,'07097602','1962-10-21 00:00:00',1,1,'','',NULL,'1990-05-25 00:00:00',0,0),(
1099,980502,1,'TRUJILLO','LEAL','PAMELA','ANTONIA','TRUJILLO LEAL PAMELA ANTONIA',1,'41090354','1970-11-23 00:00:00',2,1,'','',NULL,'2018-11-22 00:00:00',0,0),(
1100,980352,1,'TRUJILLO','SANTE','WILDER','EDUARDO','TRUJILLO SANTE WILDER EDUARDO',1,'42666526','1984-09-04 00:00:00',1,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
1101,050071,1,'TUANAMA','AMASIFUEN','TERESA',NULL,'TUANAMA AMASIFUEN TERESA',1,'07157198','1959-07-13 00:00:00',2,1,'','',NULL,'1988-12-31 00:00:00',0,0),(
1102,990152,1,'TUESTA','TAFUR','JANELLE','MERCEDES','TUESTA TAFUR JANELLE MERCEDES',1,'31682860','1978-06-13 00:00:00',2,1,'','',NULL,'2021-04-26 00:00:00',0,0),(
1103,980410,1,'TUMPAY','QUISPE','ZAIDA',NULL,'TUMPAY QUISPE ZAIDA',1,'42134028','1983-12-20 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
1104,980063,1,'UBILLUS','PADILLA','NANCY','LETICIA','UBILLUS PADILLA NANCY LETICIA',1,'25523021','1964-05-13 00:00:00',2,1,'','',NULL,'2011-04-01 00:00:00',0,0),(
1105,050074,1,'UNTIVEROS','PRADO','IRENE',NULL,'UNTIVEROS PRADO IRENE',1,'08030358','1954-05-05 00:00:00',2,1,'','',NULL,'1980-11-01 00:00:00',0,0),(
1106,050076,1,'URBINA','LLASACCE','ANGELICA','TEOFILA','URBINA LLASACCE ANGELICA TEOFILA',1,'07074681','1955-10-02 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
1107,050077,1,'URCIA','TRUJILLO','MARINA','DORALIZA','URCIA TRUJILLO MARINA DORALIZA',1,'06925937','1951-09-17 00:00:00',2,1,'','',NULL,'2017-12-01 00:00:00',0,0),(
1108,960393,1,'URIBE','POMA','MARIA','ZARELA','URIBE POMA MARIA ZARELA',1,'44822521','1988-01-08 00:00:00',2,1,'','',NULL,'2020-12-01 00:00:00',0,0),(
1109,980522,1,'URRIBARRI','ZEVALLOS','PABLO','ESTEBAN','URRIBARRI ZEVALLOS PABLO ESTEBAN',1,'06243302','1965-11-11 00:00:00',1,1,'','',NULL,'2019-01-02 00:00:00',0,0),(
1110,980465,1,'URTECHO','PAZ','KARINA','ALEXANDRA','URTECHO PAZ KARINA ALEXANDRA',1,'42719310','1984-09-30 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
1111,980267,1,'VACA','COLONIO','MIRIAM','ELAIDA','VACA COLONIO MIRIAM ELAIDA',1,'10725772','1977-10-27 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
1112,101757,1,'VALDERRAMA','ALTAMIRANO','MARIA','DEL PILAR','VALDERRAMA ALTAMIRANO MARIA DEL PILAR',1,'09501687','1969-03-08 00:00:00',2,1,'','',NULL,'1990-07-15 00:00:00',0,0),(
1113,980019,1,'VALDEZ','ORTIZ','ALINA','MERCEDES','VALDEZ ORTIZ ALINA MERCEDES',1,'30833129','1968-04-23 00:00:00',2,1,'','',NULL,'2008-02-01 00:00:00',0,0),(
1114,980317,1,'VALDEZ','RAMOS','SONIA',NULL,'VALDEZ RAMOS SONIA',1,'09776373','1974-06-23 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
1115,980101,1,'VALDEZ','RODRIGUEZ','PATRICIA','EMMA','VALDEZ RODRIGUEZ PATRICIA EMMA',1,'30832688','1968-01-27 00:00:00',2,1,'','',NULL,'2012-07-01 00:00:00',0,0),(
1116,950039,1,'VALDIVIA','MESTANZA','MARIANELA',NULL,'VALDIVIA MESTANZA MARIANELA',1,'27360474','1962-10-19 00:00:00',2,1,'','',NULL,'2005-08-01 00:00:00',0,0),(
1117,970065,1,'VALDIVIA','VERA','EDSON',NULL,'VALDIVIA VERA EDSON',1,'23834101','1962-11-17 00:00:00',1,1,'','',NULL,'2013-10-01 00:00:00',0,0),(
1118,980295,1,'VALDIVIESO','FALCON','LIDIA','PATRICIA','VALDIVIESO FALCON LIDIA PATRICIA',1,'40833147','1981-02-23 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
1119,039258,1,'VALDIVIESO','LUJAN DE GAMARRA','AUREA','FREDESBINDA','VALDIVIESO LUJAN DE GAMARRA AUREA FREDESBINDA',1,'10402897','1953-09-05 00:00:00',2,1,'','',NULL,'1981-08-01 00:00:00',0,0),(
1120,980011,1,'VALDIVIEZO','SAAVEDRA','ELIZABETH','GABRIELA','VALDIVIEZO SAAVEDRA ELIZABETH GABRIELA',1,'22296537','1972-02-21 00:00:00',2,1,'','',NULL,'2008-02-01 00:00:00',0,0),(
1121,970084,1,'VALENCIA','ANGLAS','IRENE','GUADALUPE','VALENCIA ANGLAS IRENE GUADALUPE',1,'28308753','1965-05-06 00:00:00',2,1,'','',NULL,'2015-07-07 00:00:00',0,0),(
1122,980166,1,'VALENCIA','GONZALES','NORA','JUDITH','VALENCIA GONZALES NORA JUDITH',1,'09017241','1960-10-17 00:00:00',2,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
1123,980523,1,'VALENCIA','VELIZ','MELISSA','LORENA','VALENCIA VELIZ MELISSA LORENA',1,'41340187','1981-12-05 00:00:00',2,1,'','',NULL,'2018-12-14 00:00:00',0,0),(
1124,049462,1,'VALENZUELA','ALVINO DE RODRIGUEZ','CRISTINA','LEONO','VALENZUELA ALVINO DE RODRIGUEZ CRISTINA LEONO',1,'08338001','1955-04-11 00:00:00',2,1,'','',NULL,'1981-06-01 00:00:00',0,0),(
1125,980514,1,'VALER','RAMOS','ESTHER',NULL,'VALER RAMOS ESTHER',1,'44161791','1987-03-15 00:00:00',2,1,'','',NULL,'2018-11-22 00:00:00',0,0),(
1126,980076,1,'VALLEJO','QUISPE','HILDA','FELICITAS','VALLEJO QUISPE HILDA FELICITAS',1,'09849797','1974-03-06 00:00:00',2,1,'','',NULL,'2011-04-01 00:00:00',0,0),(
1127,050084,1,'VALLEJOS','SALDARRIAGA','JIMMI','ORLANDO','VALLEJOS SALDARRIAGA JIMMI ORLANDO',1,'10690158','1957-05-19 00:00:00',1,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
1128,970040,1,'VALVERDE','TARAZONA','SILVIA','SONIA','VALVERDE TARAZONA SILVIA SONIA',1,'22196533','1965-05-01 00:00:00',2,1,'','',NULL,'1984-12-10 00:00:00',0,0),(
1129,049463,1,'VARGAS','BORBOR','LUZ','EDITH','VARGAS BORBOR LUZ EDITH',1,'07956469','1956-04-16 00:00:00',2,1,'','',NULL,'1978-07-01 00:00:00',0,0),(
1130,960349,1,'VARGAS','CHAVEZ','JULIO','ALFONSO','VARGAS CHAVEZ JULIO ALFONSO',1,'40094517','1978-03-05 00:00:00',1,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
1131,980099,1,'VARGAS','CHAVEZ','MARLENE',NULL,'VARGAS CHAVEZ MARLENE',1,'09612492','1971-07-18 00:00:00',2,1,'','',NULL,'2012-07-01 00:00:00',0,0),(
1132,050086,1,'VARGAS','MENDEZ','CESAR','AUGUSTO','VARGAS MENDEZ CESAR AUGUSTO',1,'09813891','1968-01-20 00:00:00',1,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
1133,101766,1,'VARGAS','MONTALVO','OLGA',NULL,'VARGAS MONTALVO OLGA',1,'09425935','1967-10-29 00:00:00',2,1,'','',NULL,'1990-07-15 00:00:00',0,0),(
1134,101786,1,'VARGAS','MORON','ELIZABETH','MIRYAM','VARGAS MORON ELIZABETH MIRYAM',1,'07816057','1964-07-05 00:00:00',2,1,'','',NULL,'1990-05-25 00:00:00',0,0),(
1135,980038,1,'VARGAS','OTERO','JULIO','CESAR','VARGAS OTERO JULIO CESAR',1,'25755130','1957-07-18 00:00:00',1,1,'','',NULL,'2010-07-05 00:00:00',0,0),(
1136,950015,1,'VARGAS','PACHECO','PAMELA',NULL,'VARGAS PACHECO PAMELA',1,'08876717','1970-01-28 00:00:00',2,1,'','',NULL,'2004-12-11 00:00:00',0,0),(
1137,049508,1,'VARGAS','SALDANA','CORITA',NULL,'VARGAS SALDANA CORITA',1,'10410735','1968-09-17 00:00:00',2,1,'','',NULL,'1994-08-01 00:00:00',0,0),(
1138,050089,1,'VARGAS','SALDANA','JOBITA',NULL,'VARGAS SALDANA JOBITA',1,'07913285','1963-12-27 00:00:00',2,1,'','',NULL,'1986-12-01 00:00:00',0,0),(
1139,980466,1,'VARGAS','TORRES','VILMA','MAGALY','VARGAS TORRES VILMA MAGALY',1,'40339988','1979-03-22 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
1140,980222,1,'VARGAS','VILCA','ELSA','RUTH','VARGAS VILCA ELSA RUTH',1,'40755058','1980-09-09 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
1141,049465,1,'VASQUEZ','CASTILLO','ROSA','LUZ','VASQUEZ CASTILLO ROSA LUZ',1,'06103318','1953-03-07 00:00:00',2,1,'','',NULL,'1979-07-01 00:00:00',0,0),(
1142,800837,1,'VASQUEZ','GOMEZ','GUILLERMO','RAUL','VASQUEZ GOMEZ GUILLERMO RAUL',1,'08313750','1963-06-25 00:00:00',1,1,'','',NULL,'1998-01-01 00:00:00',0,0),(
1143,050093,1,'VASQUEZ','LAGALA DE LI','MIRTHA','SOLEDAD','VASQUEZ LAGALA DE LI MIRTHA SOLEDAD',1,'08734207','1956-06-13 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
1144,050094,1,'VASQUEZ','NIQUE','CARMEN','AURORA','VASQUEZ NIQUE CARMEN AURORA',1,'06554562','1960-11-06 00:00:00',2,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
1145,049945,1,'VASQUEZ','ROBLES','VICTOR','MIGUEL','VASQUEZ ROBLES VICTOR MIGUEL',1,'06946235','1966-09-10 00:00:00',1,1,'','',NULL,'1995-01-01 00:00:00',0,0),(
1146,970060,1,'VASQUEZ','RODRIGUEZ','CECILIA','MARIBEL','VASQUEZ RODRIGUEZ CECILIA MARIBEL',1,'15740349','1972-01-29 00:00:00',2,1,'','',NULL,'2013-02-01 00:00:00',0,0),(
1147,960335,1,'VEGA','ORTEGA','RICARDO','RAUL','VEGA ORTEGA RICARDO RAUL',1,'43612120','1985-03-14 00:00:00',1,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
1148,980245,1,'VEGA','QUINONES','MARLENE','ROCIO','VEGA QUINONES MARLENE ROCIO',1,'09634126','1973-02-03 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
1149,960370,1,'VEGA','RUIZ','LUIS','FRANCISCO','VEGA RUIZ LUIS FRANCISCO',1,'46891995','1991-03-12 00:00:00',1,1,'','',NULL,'2020-12-01 00:00:00',0,0),(
1150,049444,1,'VEGA','VERA','RAFAEL',NULL,'VEGA VERA RAFAEL',1,'08411474','1964-01-19 00:00:00',1,1,'','',NULL,'1995-01-16 00:00:00',0,0),(
1151,980133,1,'VELA','GUZMAN','DORA','ALICIA','VELA GUZMAN DORA ALICIA',1,'25810381','1971-07-13 00:00:00',2,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
1152,960343,1,'VELA','ULLOA','GUNDI','ISABEL','VELA ULLOA GUNDI ISABEL',1,'47545873','1991-11-17 00:00:00',2,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
1153,950109,1,'VELA','YOVERA','ROSA','YSABEL DEL ROSARIO','VELA YOVERA ROSA YSABEL DEL ROSARIO',1,'03661989','1972-08-29 00:00:00',2,1,'','',NULL,'2009-07-03 00:00:00',0,0),(
1154,050098,1,'VELARDE','RIOS','MARIA','VIRGINIA','VELARDE RIOS MARIA VIRGINIA',1,'06119808','1955-11-25 00:00:00',2,1,'','',NULL,'1984-11-01 00:00:00',0,0),(
1155,050099,1,'VELASCO','SEGOVIA','ANA','MARIA','VELASCO SEGOVIA ANA MARIA',1,'07940156','1954-07-26 00:00:00',2,1,'','',NULL,'1980-12-01 00:00:00',0,0),(
1156,050101,1,'VELASQUEZ','VALLES','GUILLERMO','ENRIQUE','VELASQUEZ VALLES GUILLERMO ENRIQUE',1,'07068030','1964-09-14 00:00:00',1,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
1157,970009,1,'VELAZCO','LORENZO','YURI',NULL,'VELAZCO LORENZO YURI',1,'08293113','1962-12-11 00:00:00',2,1,'','',NULL,'2012-12-01 00:00:00',0,0),(
1158,980296,1,'VELEZ','ARAUJO','MARGHIA','GIOVANNA','VELEZ ARAUJO MARGHIA GIOVANNA',1,'40631011','1980-07-05 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
1159,050103,1,'VELIZ','APOLINARIO','MARIA','FLOR','VELIZ APOLINARIO MARIA FLOR',1,'10582737','1963-06-16 00:00:00',2,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
1160,049828,1,'VELIZ','CHACON','MARITZA','ANGELICA','VELIZ CHACON MARITZA ANGELICA',1,'09559532','1969-07-29 00:00:00',2,1,'','',NULL,'2000-01-01 00:00:00',0,0),(
1161,049291,1,'VENEGAS','PALOMINO','NELLY','DORIS','VENEGAS PALOMINO NELLY DORIS',1,'06903824','1962-10-09 00:00:00',2,1,'','',NULL,'1991-12-31 00:00:00',0,0),(
1162,098375,1,'VENTURA','CANO','ELSA','YNES','VENTURA CANO ELSA YNES',1,'06079525','1957-11-10 00:00:00',2,1,'','',NULL,'1990-12-07 00:00:00',0,0),(
1163,980318,1,'VENTURA','FLORES','JULY','ANGELICA','VENTURA FLORES JULY ANGELICA',1,'40361134','1979-10-02 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
1164,960390,1,'VENTURA','HUAMAN','LISSETTE','DEL ROSARIO','VENTURA HUAMAN LISSETTE DEL ROSARIO',1,'42787600','1984-11-06 00:00:00',2,1,'','',NULL,'2020-12-01 00:00:00',0,0),(
1165,980268,1,'VENTURA','MEZA','FIORELLA','JEANETTE','VENTURA MEZA FIORELLA JEANETTE',1,'42940235','1985-03-21 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
1166,950016,1,'VERA','LOYOLA','EDY','MARTIN','VERA LOYOLA EDY MARTIN',1,'07462302','1968-05-20 00:00:00',1,1,'','',NULL,'2004-12-11 00:00:00',0,0),(
1167,980134,1,'VERA','ORTIZ','YURI','GARY','VERA ORTIZ YURI GARY',1,'42276363','1984-02-03 00:00:00',1,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
1168,980319,1,'VERA','PALOMINO','JUANA','REYNALDA','VERA PALOMINO JUANA REYNALDA',1,'40765976','1980-10-13 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
1169,980467,1,'VERANO','DE WATANABE','JANINE','LUCILA','VERANO DE WATANABE JANINE LUCILA',1,'10724757','1968-08-24 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
1170,960345,1,'VERDE','LEON','ALEJANDRA','VANESA','VERDE LEON ALEJANDRA VANESA',1,'71662687','1991-09-21 00:00:00',2,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
1171,800455,1,'VIDAL','HUAMANI','LAURA','MARCELINA','VIDAL HUAMANI LAURA MARCELINA',1,'09334829','1968-07-10 00:00:00',2,1,'','',NULL,'1995-12-31 00:00:00',0,0),(
1172,049477,1,'VIGILIO','SUAREZ','ZONIA','MARIA','VIGILIO SUAREZ ZONIA MARIA',1,'08341762','1963-05-15 00:00:00',2,1,'','',NULL,'1987-12-15 00:00:00',0,0),(
1173,050110,1,'VILCA','PALMA DE ORDAYA','MARINA','ELVIRA','VILCA PALMA DE ORDAYA MARINA ELVIRA',1,'07401339','1956-10-21 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
1174,980281,1,'VILCA','ZUNIGA','ERICKA','LIBIA','VILCA ZUNIGA ERICKA LIBIA',1,'40260417','1979-06-09 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
1175,050112,1,'VILCHEZ','DE LA CRUZ','HORTENCIA','CORINA','VILCHEZ DE LA CRUZ HORTENCIA CORINA',1,'06260713','1944-11-07 00:00:00',2,1,'','',NULL,'2021-12-01 00:00:00',0,0),(
1176,800434,1,'VILCHEZ','OLIVA','JESUS','NARCISO','VILCHEZ OLIVA JESUS NARCISO',1,'06770795','1968-01-02 00:00:00',1,1,'','',NULL,'1995-12-31 00:00:00',0,0),(
1177,101761,1,'VILCHEZ','SALVATIERRA','JUANA','GEORGINA','VILCHEZ SALVATIERRA JUANA GEORGINA',1,'07373520','1958-11-24 00:00:00',2,1,'','',NULL,'1990-07-15 00:00:00',0,0),(
1178,970036,1,'VILCHEZ','SANABRIA','MARIA','ISABEL','VILCHEZ SANABRIA MARIA ISABEL',1,'19932469','1954-05-08 00:00:00',2,1,'','',NULL,'2011-03-22 00:00:00',0,0),(
1179,980223,1,'VILLA','GONZALES','BEATRIZ',NULL,'VILLA GONZALES BEATRIZ',1,'40304056','1979-07-21 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
1180,094121,1,'VILLA','SOLLER','JULIO','CESAR','VILLA SOLLER JULIO CESAR',1,'07528615','1957-07-28 00:00:00',1,1,'','',NULL,'1988-06-28 00:00:00',0,0),(
1181,950021,1,'VILLAFUERTE','GAMBOA','JANET',NULL,'VILLAFUERTE GAMBOA JANET',1,'31033222','1970-12-27 00:00:00',2,1,'','',NULL,'2005-05-19 00:00:00',0,0),(
1182,980221,1,'VILLAFUERTE','GAMBOA','LIZ',NULL,'VILLAFUERTE GAMBOA LIZ',1,'31045106','1978-05-06 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
1183,980206,1,'VILLANUEVA','GAVIDIA','KARIN','ALICIA','VILLANUEVA GAVIDIA KARIN ALICIA',1,'40313005','1978-07-13 00:00:00',2,1,'','',NULL,'2014-02-01 00:00:00',0,0),(
1184,050115,1,'VILLANUEVA','LAVADO','CESARIO','APARICIO','VILLANUEVA LAVADO CESARIO APARICIO',1,'06026360','1963-02-24 00:00:00',1,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
1185,980230,1,'VILLANUEVA','MUNANTE','CARMEN','MARIBEL','VILLANUEVA MUNANTE CARMEN MARIBEL',1,'40252435','1979-07-03 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
1186,980541,1,'VILLANUEVA','NONATO','DEYSI','ARICELLY','VILLANUEVA NONATO DEYSI ARICELLY',1,'41641308','1983-02-18 00:00:00',2,1,'','',NULL,'2020-12-31 00:00:00',0,0),(
1187,980167,1,'VILLAR','FARFAN','PATRICIA','MADELEINE','VILLAR FARFAN PATRICIA MADELEINE',1,'08123054','1967-11-13 00:00:00',2,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
1188,980077,1,'VILLARREAL','TIRADO','GRACIELA','MARITZA','VILLARREAL TIRADO GRACIELA MARITZA',1,'07626937','1972-05-14 00:00:00',2,1,'','',NULL,'2011-04-01 00:00:00',0,0),(
1189,090995,1,'VILLASANTE','VALERA','SONIA','VIOLETA','VILLASANTE VALERA SONIA VIOLETA',1,'07370868','1956-06-01 00:00:00',2,1,'','',NULL,'1987-01-01 00:00:00',0,0),(
1190,980484,1,'VILLAVERDE','VENTURA','CINTHYA','SINDI','VILLAVERDE VENTURA CINTHYA SINDI',1,'42679391','1984-10-20 00:00:00',2,1,'','',NULL,'2018-02-01 00:00:00',0,0),(
1191,101769,1,'VILLEGAS','CRUZADO','MATILDE',NULL,'VILLEGAS CRUZADO MATILDE',1,'09446910','1970-02-24 00:00:00',2,1,'','',NULL,'1990-07-15 00:00:00',0,0),(
1192,049484,1,'VILLEGAS','VERA','NORMA','CATALINA','VILLEGAS VERA NORMA CATALINA',1,'06712924','1963-02-13 00:00:00',2,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
1193,980468,1,'VILLEGAS','VISUNA','MARYBEL','BENITA','VILLEGAS VISUNA MARYBEL BENITA',1,'42959285','1985-03-05 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
1194,980550,1,'VILLODAS','TRUJILLO','GLADIVEL',NULL,'VILLODAS TRUJILLO GLADIVEL',1,'47444647','1991-07-26 00:00:00',2,1,'','',NULL,'2020-12-31 00:00:00',0,0),(
1195,980411,1,'VILLODAS','TRUJILLO','YALENA',NULL,'VILLODAS TRUJILLO YALENA',1,'41318315','1982-02-08 00:00:00',2,1,'','',NULL,'2016-10-01 00:00:00',0,0),(
1196,098390,1,'VITES','HERRERA','MARIA','DEL CARMEN','VITES HERRERA MARIA DEL CARMEN',1,'25629645','1959-07-15 00:00:00',2,1,'','',NULL,'2000-06-30 00:00:00',0,0),(
1197,950017,1,'VIVANCO','RAMOS','MILUSKA','OLGA ANGELICA','VIVANCO RAMOS MILUSKA OLGA ANGELICA',1,'23249171','1967-06-15 00:00:00',2,1,'','',NULL,'2004-12-11 00:00:00',0,0),(
1198,980041,1,'VIVANCO','RAMOS','MIRYAN','DEL ROSARIO','VIVANCO RAMOS MIRYAN DEL ROSARIO',1,'10421715','1971-06-04 00:00:00',2,1,'','',NULL,'2010-07-05 00:00:00',0,0),(
1199,980236,1,'VIVAS','CHUQUILLANQUI','MARLENE','EULALIA','VIVAS CHUQUILLANQUI MARLENE EULALIA',1,'09926778','1973-03-26 00:00:00',2,1,'','',NULL,'2015-01-01 00:00:00',0,0),(
1200,050121,1,'WARA','VASQUEZ','LEONCIO',NULL,'WARA VASQUEZ LEONCIO',1,'07399660','1956-01-02 00:00:00',1,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
1201,050122,1,'WESTON','SPINO','MARIA','OLINDA','WESTON SPINO MARIA OLINDA',1,'07369604','1955-10-16 00:00:00',2,1,'','',NULL,'1987-12-15 00:00:00',0,0),(
1202,980185,1,'WONG','VALDIVIA','JOSE','ANTONIO','WONG VALDIVIA JOSE ANTONIO',1,'07194035','1954-07-01 00:00:00',1,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
1203,050123,1,'YACTAYO','MARTINEZ','LUZ','DIANA','YACTAYO MARTINEZ LUZ DIANA',1,'08585100','1959-05-20 00:00:00',2,1,'','',NULL,'1988-09-01 00:00:00',0,0),(
1204,050124,1,'YALAN','CUBAS','ANA','MARIA','YALAN CUBAS ANA MARIA',1,'07144348','1966-02-04 00:00:00',2,1,'','',NULL,'1984-12-01 00:00:00',0,0),(
1205,980207,1,'YANEZ','IBARCENA','PATRICIA',NULL,'YANEZ IBARCENA PATRICIA',1,'10143238','1962-12-30 00:00:00',2,1,'','',NULL,'2014-02-01 00:00:00',0,0),(
1206,050127,1,'YESQUEN','CABALLERO','LUZ','MARIA','YESQUEN CABALLERO LUZ MARIA',1,'07484913','1967-02-19 00:00:00',2,1,'','',NULL,'1988-12-31 00:00:00',0,0),(
1207,970027,1,'YLLANES','FRANCIA','MARY','ROSA','YLLANES FRANCIA MARY ROSA',1,'06037974','1965-08-08 00:00:00',2,1,'','',NULL,'2010-07-01 00:00:00',0,0),(
1208,980353,1,'YUPANQUI','HUAMAN','JANET','MABEL','YUPANQUI HUAMAN JANET MABEL',1,'09556498','1968-10-26 00:00:00',2,1,'','',NULL,'2015-12-31 00:00:00',0,0),(
1209,980042,1,'ZAMBRANO','CESPEDES','NORA','LUZ','ZAMBRANO CESPEDES NORA LUZ',1,'09850743','1972-11-22 00:00:00',2,1,'','',NULL,'2010-07-05 00:00:00',0,0),(
1210,050129,1,'ZAMBRANO','RUCOBA','WALTER','ENRIQUE','ZAMBRANO RUCOBA WALTER ENRIQUE',1,'09016347','1962-10-15 00:00:00',1,1,'','',NULL,'1981-10-16 00:00:00',0,0),(
1211,980469,1,'ZAMUDIO','ESLAVA','LUISA','ANGELICA','ZAMUDIO ESLAVA LUISA ANGELICA',1,'43921062','1986-11-04 00:00:00',2,1,'','',NULL,'2017-10-01 00:00:00',0,0),(
1212,980208,1,'ZAMUDIO','RODRIGUEZ','GUIDO','ALBERTO','ZAMUDIO RODRIGUEZ GUIDO ALBERTO',1,'21148137','1965-01-29 00:00:00',1,1,'','',NULL,'2014-02-01 00:00:00',0,0),(
1213,949982,1,'ZANA','ASUNCION','MANUEL','ALBERTO','ZANA ASUNCION MANUEL ALBERTO',1,'18001859','1963-12-29 00:00:00',1,1,'','',NULL,'2004-04-01 00:00:00',0,0),(
1214,980186,1,'ZAPATA','CHERO','GERARDO','SEGUNDO','ZAPATA CHERO GERARDO SEGUNDO',1,'09669773','1973-04-08 00:00:00',1,1,'','',NULL,'2013-08-01 00:00:00',0,0),(
1215,960386,1,'ZAPATA','CORITOMA','YESICA','PAOLA','ZAPATA CORITOMA YESICA PAOLA',1,'44855602','1986-12-06 00:00:00',2,1,'','',NULL,'2020-12-01 00:00:00',0,0),(
1216,980490,1,'ZAPATA','DIAZ','BETSY','MICOL','ZAPATA DIAZ BETSY MICOL',1,'42776908','1984-07-04 00:00:00',2,1,'','',NULL,'2018-01-16 00:00:00',0,0),(
1217,049278,1,'ZAPATA','ROMERO','LIDIA','TEODORA','ZAPATA ROMERO LIDIA TEODORA',1,'06111004','1957-08-03 00:00:00',2,1,'','',NULL,'1991-12-31 00:00:00',0,0),(
1218,960336,1,'ZAVALA','PICHEN','MAX','GUILLERMO','ZAVALA PICHEN MAX GUILLERMO',1,'40371236','1979-03-19 00:00:00',1,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
1219,050134,1,'ZEGARRA','RIOS DE ALIAGA','MARIA','FRANCISCA','ZEGARRA RIOS DE ALIAGA MARIA FRANCISCA',1,'06047857','1954-10-04 00:00:00',2,1,'','',NULL,'1986-12-01 00:00:00',0,0),(
1220,050136,1,'ZEVALLOS','HUAMAN','MARIA','ROSA','ZEVALLOS HUAMAN MARIA ROSA',1,'09180393','1964-08-21 00:00:00',2,1,'','',NULL,'1983-12-01 00:00:00',0,0),(
1221,960351,1,'ZEVALLOS','ORTEGA','DOLIBETH','KRISS','ZEVALLOS ORTEGA DOLIBETH KRISS',1,'42381273','1984-04-18 00:00:00',2,1,'','',NULL,'2019-07-01 00:00:00',0,0),(
1222,960382,1,'ZORRILLA','ACEVEDO','MARGARETH','INDIRA','ZORRILLA ACEVEDO MARGARETH INDIRA',1,'46051806','1989-09-13 00:00:00',2,1,'','',NULL,'2020-12-01 00:00:00',0,0),(
1223,980210,1,'ZUBIETA','QUINECHE','ALEXIS','FLAVIO','ZUBIETA QUINECHE ALEXIS FLAVIO',1,'40200897','1979-04-14 00:00:00',1,1,'','',NULL,'2014-02-01 00:00:00',0,0),(
1224,116771,1,'ZUNIGA','LAVINI','MARLENE','JANET','ZUNIGA LAVINI MARLENE JANET',1,'07598640','1963-08-03 00:00:00',2,1,'','',NULL,'1991-12-31 00:00:00',0,0),(
1225,050137,1,'ZUNIGA','PASTOR','ROSA','ELVIRA','ZUNIGA PASTOR ROSA ELVIRA',1,'25506083','1951-09-08 00:00:00',2,1,'','',NULL,'2017-12-01 00:00:00',0,0),(
1226,003055,2,'ACASIETE','HERNANDEZ DE SEGOVIA','KELLY',NULL,'ACASIETE HERNANDEZ DE SEGOVIA KELLY',1,'41274565','1982-03-14 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1227,002810,2,'ACUNA','ARONE','LUCERO','GERALDINE','ACUNA ARONE LUCERO GERALDINE',1,'46265714','1990-03-25 00:00:00',2,1,'','',NULL,'2019-12-26 00:00:00',0,0),(
1228,002880,2,'ACUNA','TAYPE','EDGARDO','FRANCISCO','ACUNA TAYPE EDGARDO FRANCISCO',1,'10648587','1978-01-16 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1229,003042,2,'AGUAYO','CORDOVA','JOSE','JOSE','AGUAYO CORDOVA JOSE JOSE',1,'42918862','1985-02-27 00:00:00',1,1,'','',NULL,'2020-06-01 00:00:00',0,0),(
1230,002875,2,'ALCARRAZ','VEGA','GIANINA','IVONNE','ALCARRAZ VEGA GIANINA IVONNE',1,'48119470','1993-01-05 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1231,002925,2,'ALVA','CABANILLAS','DEBORA','BETSABE','ALVA CABANILLAS DEBORA BETSABE',1,'42515500','1984-06-24 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1232,002918,2,'ALVARADO','JUAREZ','FERNANDO','MAURICIO','ALVARADO JUAREZ FERNANDO MAURICIO',1,'42676848','1984-01-27 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1233,002886,2,'ALVAREZ','SUELDO','RAUL','ARMANDO','ALVAREZ SUELDO RAUL ARMANDO',1,'09418367','1967-12-26 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1234,002730,2,'AMPUERO','GUERRERO','MICAELA','DELIA','AMPUERO GUERRERO MICAELA DELIA',1,'10238872','1976-04-09 00:00:00',2,1,'','',NULL,'2018-08-18 00:00:00',0,0),(
1235,002815,2,'ANICAMA','REY','JOSE','MIGUEL','ANICAMA REY JOSE MIGUEL',1,'41278942','1981-12-27 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1236,002713,2,'ARAUJO','PEREZ','ESTEBAN','WILDER','ARAUJO PEREZ ESTEBAN WILDER',1,'10179843','1975-10-28 00:00:00',1,1,'','',NULL,'2015-08-03 00:00:00',0,0),(
1237,002850,2,'ARDILES','RODRIGUEZ','MARINA','YSABEL','ARDILES RODRIGUEZ MARINA YSABEL',1,'42531269','1984-05-31 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1238,002778,2,'AREVALO','BASTANTE','ROXANA','ELIZABETH','AREVALO BASTANTE ROXANA ELIZABETH',1,'46342482','1990-05-18 00:00:00',2,1,'','',NULL,'2019-10-22 00:00:00',0,0),(
1239,002951,2,'ARIAS','FLORES','CARMEN','VANESSA','ARIAS FLORES CARMEN VANESSA',1,'43563626','1985-12-22 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1240,003056,2,'ARIAS','LULO','MELYZA','JUDITH','ARIAS LULO MELYZA JUDITH',1,'47864486','1992-07-06 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1241,002803,2,'ARROYO','ROMERO','ALBERTO','ROMEL','ARROYO ROMERO ALBERTO ROMEL',1,'06433278','1959-02-03 00:00:00',1,1,'','',NULL,'2019-12-26 00:00:00',0,0),(
1242,002798,2,'ARTEAGA','PACHECO','ROGER','ALBERTO','ARTEAGA PACHECO ROGER ALBERTO',1,'41460293','1982-09-18 00:00:00',1,1,'','',NULL,'2019-12-26 00:00:00',0,0),(
1243,002816,2,'ASTUPUMA','JIMENEZ','CARLOS','RAUL','ASTUPUMA JIMENEZ CARLOS RAUL',1,'06103138','1960-08-16 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1244,002963,2,'ASTUPUMA','MASSIRONI','CARLOS','EDUARDO','ASTUPUMA MASSIRONI CARLOS EDUARDO',1,'73264397','1992-09-06 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1245,002666,2,'ATENCIO','TORRES','KATHERINE','ROSMERY','ATENCIO TORRES KATHERINE ROSMERY',1,'60285131','1995-05-07 00:00:00',2,1,'','',NULL,'2019-12-16 00:00:00',0,0),(
1246,003057,2,'BALDEON','CRUZ','YESICA','PILAR','BALDEON CRUZ YESICA PILAR',1,'44729586','1987-09-06 00:00:00',2,1,'','',NULL,'2020-07-06 00:00:00',0,0),(
1247,002817,2,'BARRIOS','NINAQUISPE','MARIA','JESUS','BARRIOS NINAQUISPE MARIA JESUS',1,'08622760','1962-11-28 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1248,002932,2,'BEDON','CABANILLAS','EDITH','JACKELINE','BEDON CABANILLAS EDITH JACKELINE',1,'44292453','1987-03-17 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1249,002838,2,'BEDREGAL','GRADOS','MARIA','DEL MILAGRO','BEDREGAL GRADOS MARIA DEL MILAGRO',1,'41558521','1982-11-03 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1250,002839,2,'BENDEZU','SAYAS','AUGUSTO',NULL,'BENDEZU SAYAS AUGUSTO',1,'08515175','1963-07-05 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1251,820472,1,'BENITES','GONZALES','SONIA','LORENA','BENITES GONZALES SONIA LORENA',1,'40313450','1992-12-14 00:00:00',2,1,'','',NULL,'2021-10-11 00:00:00',0,0),(
1252,002837,2,'BERNAOLA','RIVEROS','CESAR','ANTONIO','BERNAOLA RIVEROS CESAR ANTONIO',1,'42611604','1980-05-25 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1253,002923,2,'BERROCAL','GODOY','MAYRA',NULL,'BERROCAL GODOY MAYRA',1,'70251659','1989-05-13 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1254,003059,2,'BUTRICA','FERRE','NITZA','MILAGROS','BUTRICA FERRE NITZA MILAGROS',1,'44765499','1987-12-19 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1255,003019,2,'CACERES','APAZA','MELANI','SINDYAN','CACERES APAZA MELANI SINDYAN',1,'71002993','1991-09-21 00:00:00',2,1,'','',NULL,'2020-06-01 00:00:00',0,0),(
1256,002915,2,'CACERES','GUARNIZ','KATHIA','ISRAEL','CACERES GUARNIZ KATHIA ISRAEL',1,'41325235','1982-04-15 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1257,002902,2,'CADILLO','CHAPETON','HILDA','JUANA','CADILLO CHAPETON HILDA JUANA',1,'40556186','1980-03-17 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1258,002737,2,'CAJALEON','AYALA','CESAR','AUGUSTO','CAJALEON AYALA CESAR AUGUSTO',1,'06921748','1961-06-27 00:00:00',1,1,'','',NULL,'2018-10-04 00:00:00',0,0),(
1259,002773,2,'CALDERON','AREVALO','MARCO','ANTONIO','CALDERON AREVALO MARCO ANTONIO',1,'25780079','1974-02-09 00:00:00',1,1,'','',NULL,'2019-01-25 00:00:00',0,0),(
1260,002941,2,'CALDERON','GRIJALBA','ELEANA','CONSTANTINA','CALDERON GRIJALBA ELEANA CONSTANTINA',1,'10000202','1974-12-04 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1261,002746,2,'CALIZAYA','GUTIERREZ','ULISES',NULL,'CALIZAYA GUTIERREZ ULISES',1,'00799099','1974-07-17 00:00:00',1,1,'','',NULL,'2018-10-04 00:00:00',0,0),(
1262,003060,2,'CAMA','YACTAYO','JUDITH','ROSARIO','CAMA YACTAYO JUDITH ROSARIO',1,'45519417','1989-01-04 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1263,002793,2,'CAMARGO','MARCELO','DAVID','RICARDO','CAMARGO MARCELO DAVID RICARDO',1,'41034526','1981-10-02 00:00:00',1,1,'','',NULL,'2019-12-26 00:00:00',0,0),(
1264,002758,2,'CANO','SARAVIA','ROSA','ANDREA','CANO SARAVIA ROSA ANDREA',1,'46917201','1991-08-25 00:00:00',2,1,'','',NULL,'2018-12-05 00:00:00',0,0),(
1265,002845,2,'CAPCHA','URBANO','KAREN','GERALDINE','CAPCHA URBANO KAREN GERALDINE',1,'45539038','1988-12-28 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1266,002771,2,'CAPPA','TICONA','FRANKLIN','SILVESTRE','CAPPA TICONA FRANKLIN SILVESTRE',1,'45037010','1988-04-10 00:00:00',1,1,'','',NULL,'2019-01-25 00:00:00',0,0),(
1267,002745,2,'CARDENAS','CAMPOS','KARINA','MARICELL','CARDENAS CAMPOS KARINA MARICELL',1,'70303683','1993-10-06 00:00:00',2,1,'','',NULL,'2018-10-04 00:00:00',0,0),(
1268,003061,2,'CARDENAS','ESTRELLA','JULIA','PATRICIA','CARDENAS ESTRELLA JULIA PATRICIA',1,'47255064','1992-07-29 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1269,002874,2,'CARHUAS','VELASQUEZ','MARCO','ROBERT','CARHUAS VELASQUEZ MARCO ROBERT',1,'43138625','1985-03-30 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1270,002921,2,'CARPIO','SOTELO','LOURDES','CECILIA','CARPIO SOTELO LOURDES CECILIA',1,'08828965','1961-11-21 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1271,002818,2,'CASTILLO','TRIGOSO','ALBERTO',NULL,'CASTILLO TRIGOSO ALBERTO',1,'09720709','1971-12-29 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1272,002859,2,'CAVERO','CANCHI','CLAUDIA','LUZ','CAVERO CANCHI CLAUDIA LUZ',1,'10718895','1975-06-23 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1273,002942,2,'CCANTO','AUCCAPUMA','SUSANA','SHELLEY','CCANTO AUCCAPUMA SUSANA SHELLEY',1,'44764726','1987-10-09 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1274,002947,2,'CECILIANO','YOPAN','LENIN','FERRIOL','CECILIANO YOPAN LENIN FERRIOL',1,'43937552','1986-05-24 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1275,002721,2,'CELIS','RAMIREZ','GABRIELA','PATRICIA','CELIS RAMIREZ GABRIELA PATRICIA',1,'41616687','1981-05-10 00:00:00',2,1,'','',NULL,'2017-08-18 00:00:00',0,0),(
1276,002819,2,'CERRO','GONZALES','CRISTINA',NULL,'CERRO GONZALES CRISTINA',1,'09980854','1974-11-20 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1277,002884,2,'CERRO','GONZALES','LUIS','GABRIEL','CERRO GONZALES LUIS GABRIEL',1,'09746428','1970-08-03 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1278,002741,2,'CHACON','BYRNE','GLADYS','CECILIA','CHACON BYRNE GLADYS CECILIA',1,'40971286','1981-08-12 00:00:00',2,1,'','',NULL,'2018-10-04 00:00:00',0,0),(
1279,002935,2,'CHACON','CABRERA','ANGGIE','INES','CHACON CABRERA ANGGIE INES',1,'46293997','1989-12-12 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1280,002869,2,'CHACON','ZOLANO','JHONY','CRISOLDO','CHACON ZOLANO JHONY CRISOLDO',1,'43382551','1986-01-21 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1281,002943,2,'CHAMORRO','MONTES','MADELEINE',NULL,'CHAMORRO MONTES MADELEINE',1,'40592398','1980-02-09 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1282,002908,2,'CHAMORRO','PALMA','SANDRA','GELACIA','CHAMORRO PALMA SANDRA GELACIA',1,'46895738','1988-10-08 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1283,002799,2,'CHANAME','QUISPE','ARIANA','XIOMARA','CHANAME QUISPE ARIANA XIOMARA',1,'75116097','1998-08-04 00:00:00',2,1,'','',NULL,'2019-12-26 00:00:00',0,0),(
1284,002957,2,'CHANGA','MURGA','ROSA','CRISTINA','CHANGA MURGA ROSA CRISTINA',1,'45711341','1989-03-30 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1285,003337,2,'CHATTI','CCAHUANA','JUANA',NULL,'CHATTI CCAHUANA JUANA',1,'06250655','1966-10-22 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1286,003062,2,'CHIPANA','GONZALES','MAYOMI','MERCEDES','CHIPANA GONZALES MAYOMI MERCEDES',1,'47515522','1992-10-26 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1287,002740,2,'CHUJUTALLI','TAPULLIMA','NELIDA',NULL,'CHUJUTALLI TAPULLIMA NELIDA',1,'45558015','1989-02-09 00:00:00',2,1,'','',NULL,'2018-10-04 00:00:00',0,0),(
1288,003063,2,'COCHACHI','VASQUEZ','GERALDINE','SANTALI','COCHACHI VASQUEZ GERALDINE SANTALI',1,'45974338','1989-04-25 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1289,002735,2,'CONDORI','FLORES','SANTIAGO',NULL,'CONDORI FLORES SANTIAGO',1,'09940868','1962-07-25 00:00:00',1,1,'','',NULL,'2018-10-04 00:00:00',0,0),(
1290,002916,2,'CONTRERAS','CANORIO','RAFHAEL','HEDSON','CONTRERAS CANORIO RAFHAEL HEDSON',1,'09432008','1968-07-10 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1291,003064,2,'CONTRERAS','ROJAS','MAYRA',NULL,'CONTRERAS ROJAS MAYRA',1,'46179087','1989-04-04 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1292,003065,2,'COPAJA','MAZUELOS','DIEGO','ALONSO','COPAJA MAZUELOS DIEGO ALONSO',1,'43158651','1985-09-10 00:00:00',1,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1293,002914,2,'CORDERO','QUISPE','LIZBETH','YOCELIN','CORDERO QUISPE LIZBETH YOCELIN',1,'45550887','1988-01-26 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1294,003035,2,'CORDOVA','OLAYUNCA','LAURA','EDITH','CORDOVA OLAYUNCA LAURA EDITH',1,'40692235','1980-09-11 00:00:00',2,1,'','',NULL,'2020-05-26 00:00:00',0,0),(
1295,002858,2,'CORRALES','AGUILAR','JESSICA','GERALDINE','CORRALES AGUILAR JESSICA GERALDINE',1,'41749306','1976-09-28 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1296,003020,2,'CORTEZ','MORE','JACKELINE','NANCY','CORTEZ MORE JACKELINE NANCY',1,'43169072','1984-10-01 00:00:00',2,1,'','',NULL,'2020-06-01 00:00:00',0,0),(
1297,003022,2,'CUENTAS','DIAZ','THALIA','CRISTINA','CUENTAS DIAZ THALIA CRISTINA',1,'71752631','1992-11-22 00:00:00',2,1,'','',NULL,'2020-06-01 00:00:00',0,0),(
1298,002965,2,'DAMAS','CASTILLO','KLEDY','KATHERINE','DAMAS CASTILLO KLEDY KATHERINE',1,'46829427','1991-03-09 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1299,002934,2,'DAVILA','MELENDEZ','SALLY',NULL,'DAVILA MELENDEZ SALLY',1,'74035080','1993-04-01 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1300,002762,2,'DE LA CRUZ','ALARCON','WILMER',NULL,'DE LA CRUZ ALARCON WILMER',1,'47222577','1991-07-13 00:00:00',1,1,'','',NULL,'2018-12-26 00:00:00',0,0),(
1301,002706,2,'DE LA CRUZ','RODRIGUEZ','CESAR','AUGUSTO','DE LA CRUZ RODRIGUEZ CESAR AUGUSTO',1,'08329512','1965-12-09 00:00:00',1,1,'','',NULL,'2014-08-01 00:00:00',0,0),(
1302,002917,2,'DE LA TORRE','SEMINARIO','URSULA','DEL CARMEN','DE LA TORRE SEMINARIO URSULA DEL CARMEN',1,'09994056','1973-08-21 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1303,002857,2,'DELGADO','GUTIERREZ','YULISA','MABEL','DELGADO GUTIERREZ YULISA MABEL',1,'10693981','1978-05-21 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1304,002891,2,'DIAZ','CACERES','KATHERINE','IVONNE','DIAZ CACERES KATHERINE IVONNE',1,'42186227','1981-07-26 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1305,002893,2,'DIAZ','CACERES','MAYRA','YVETTE','DIAZ CACERES MAYRA YVETTE',1,'46714420','1991-01-03 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1306,003202,2,'DIAZ','FALCON','AUGUSTO','WILFREDO','DIAZ FALCON AUGUSTO WILFREDO',1,'10185832','1955-04-30 00:00:00',1,1,'','',NULL,'2021-03-19 00:00:00',0,0),(
1307,002956,2,'DIAZ','VALDIVIA','ERIKA','ASTRID','DIAZ VALDIVIA ERIKA ASTRID',1,'46789978','1990-12-01 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1308,002904,2,'DURAN','VALVERDE','WILLY','OSCAR','DURAN VALVERDE WILLY OSCAR',1,'25615035','1961-07-28 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1309,003067,2,'EGOAVIL','CALDERON','CARLOS','MANUEL','EGOAVIL CALDERON CARLOS MANUEL',1,'70683555','1991-02-21 00:00:00',1,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1310,003068,2,'ESCOBEDO','DAVILA','FIORELLA','CAROLINA','ESCOBEDO DAVILA FIORELLA CAROLINA',1,'43700104','1986-08-18 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1311,003338,2,'ESCRIBA','BENDEZU','RUFINA','DONATILDA','ESCRIBA BENDEZU RUFINA DONATILDA',1,'06552503','1966-07-30 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1312,002820,2,'ESPINOZA','ALVARADO','JOSE','ATILIO','ESPINOZA ALVARADO JOSE ATILIO',1,'06952265','1961-02-16 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1313,002928,2,'ESPINOZA','ATOCHE','SANTOS','EMILIA','ESPINOZA ATOCHE SANTOS EMILIA',1,'06728213','1963-07-28 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1314,002919,2,'ESTEBAN','LLALLICO','MILAGROS','KAREN','ESTEBAN LLALLICO MILAGROS KAREN',1,'46653278','1989-10-20 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1315,002920,2,'ESTEBAN','SALVADOR','MILAGROS',NULL,'ESTEBAN SALVADOR MILAGROS',1,'45143838','1988-03-29 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1316,002821,2,'ESTRADA','REYES','EDWARD','JORGE','ESTRADA REYES EDWARD JORGE',1,'08558108','1963-07-30 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1317,003331,2,'FLORENTINI','CARRASCO','BRYAN','ADALBERTO','FLORENTINI CARRASCO BRYAN ADALBERTO',1,'74455536','1994-03-11 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1318,002813,2,'FLORES','CASTRO','NATALIA','ANDREA','FLORES CASTRO NATALIA ANDREA',1,'44210368','1987-03-03 00:00:00',2,1,'','',NULL,'2019-12-26 00:00:00',0,0),(
1319,002871,2,'FLORES','CHUQUITAYPE','JOSE','LUIS','FLORES CHUQUITAYPE JOSE LUIS',1,'41604890','1981-05-22 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1320,002814,2,'FLORES','GUEVARA','KATHERINE','IVONNE','FLORES GUEVARA KATHERINE IVONNE',1,'44604350','1987-09-10 00:00:00',2,1,'','',NULL,'2019-12-26 00:00:00',0,0),(
1321,002797,2,'FLORES','ROMERO','EDY','FRANS','FLORES ROMERO EDY FRANS',1,'10397619','1976-07-18 00:00:00',1,1,'','',NULL,'2019-12-26 00:00:00',0,0),(
1322,002903,2,'FLORES','SERNADES','ARHALY',NULL,'FLORES SERNADES ARHALY',1,'42323336','1984-02-16 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1323,003200,2,'FLORIAN','PLASENCIA','VICTOR','RAMON','FLORIAN PLASENCIA VICTOR RAMON',1,'10450704','1964-10-01 00:00:00',1,1,'','',NULL,'2021-03-18 00:00:00',0,0),(
1324,002757,2,'FONSECA','MELGAREJO','MARIA','LUISA','FONSECA MELGAREJO MARIA LUISA',1,'45385991','1988-09-05 00:00:00',2,1,'','',NULL,'2018-12-05 00:00:00',0,0),(
1325,002888,2,'FRANCO','BOCANEGRA','ALVARO',NULL,'FRANCO BOCANEGRA ALVARO',1,'43039932','1984-06-25 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1326,003027,2,'FRANCO','VALENTIN','KATHERINE','IRIS','FRANCO VALENTIN KATHERINE IRIS',1,'40787893','1979-03-19 00:00:00',2,1,'','',NULL,'2020-06-01 00:00:00',0,0),(
1327,003072,2,'FRIAS','CHUQUILLANQUE','ETELMIRA',NULL,'FRIAS CHUQUILLANQUE ETELMIRA',1,'76622050','1994-09-24 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1328,003073,2,'FUENTES','AVENDANO','JULIANA',NULL,'FUENTES AVENDANO JULIANA',1,'46921480','1990-03-07 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1329,003074,2,'GAMBOA','CALDERON','IRMA','LUZ','GAMBOA CALDERON IRMA LUZ',1,'42733662','1984-09-21 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1330,002714,2,'GAMEZ','MEDINA','PAOLA','XENIA','GAMEZ MEDINA PAOLA XENIA',1,'10697745','1977-05-09 00:00:00',2,1,'','',NULL,'2015-08-03 00:00:00',0,0),(
1331,002930,2,'GANTO','TORREJON','LISBETH','KAAREN','GANTO TORREJON LISBETH KAAREN',1,'44418659','1987-07-11 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1332,002770,2,'GARCIA','AGUILAR','JOSE','ARMANDO JUNIOR','GARCIA AGUILAR JOSE ARMANDO JUNIOR',1,'47695104','1992-10-27 00:00:00',1,1,'','',NULL,'2019-01-25 00:00:00',0,0),(
1333,003190,2,'GARCIA','GRIMALDO','ALAN','VLADIMIR','GARCIA GRIMALDO ALAN VLADIMIR',1,'43730335','1986-06-09 00:00:00',1,1,'','',NULL,'2021-02-01 00:00:00',0,0),(
1334,002754,2,'GARCIA','RIOS','CRISTINA','VICTORIA','GARCIA RIOS CRISTINA VICTORIA',1,'43972805','1986-12-25 00:00:00',2,1,'','',NULL,'2018-12-05 00:00:00',0,0),(
1335,002940,2,'GIL','IBANEZ','FIORELLA','ISABEL','GIL IBANEZ FIORELLA ISABEL',1,'70262859','1989-06-29 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1336,003076,2,'GOMEZ','ALIAGA','JESUS','ALBERTO','GOMEZ ALIAGA JESUS ALBERTO',1,'44000831','1986-12-15 00:00:00',1,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1337,002822,2,'GOMEZ','BAUTISTA','MILAGROS','DEL PILAR','GOMEZ BAUTISTA MILAGROS DEL PILAR',1,'10177549','1974-10-12 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1338,003077,2,'GOMEZ','HUAMAN','REDHER','RONALD','GOMEZ HUAMAN REDHER RONALD',1,'44021135','1986-11-21 00:00:00',1,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1339,002763,2,'GOMEZ','JAIMES','ISAURA','SUSANA','GOMEZ JAIMES ISAURA SUSANA',1,'42253433','1984-02-19 00:00:00',2,1,'','',NULL,'2019-01-25 00:00:00',0,0),(
1340,002823,2,'GONZALES','BAMBAREN','JUAN','CARLOS','GONZALES BAMBAREN JUAN CARLOS',1,'43616925','1986-03-16 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1341,002806,2,'GONZALES','GAMARRA','ALIS','RAMIRO','GONZALES GAMARRA ALIS RAMIRO',1,'42547755','1984-08-17 00:00:00',1,1,'','',NULL,'2019-12-26 00:00:00',0,0),(
1342,002824,2,'GONZALES','MARTINEZ','ERIKA','GABRIELA','GONZALES MARTINEZ ERIKA GABRIELA',1,'42459257','1982-03-21 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1343,003079,2,'GONZALES','TORRES','LIDA','FLOR','GONZALES TORRES LIDA FLOR',1,'70441510','1989-05-16 00:00:00',2,1,'','',NULL,'2020-07-06 00:00:00',0,0),(
1344,003080,2,'GONZALEZ','ARTEAGA','MARIA','DEL PILAR','GONZALEZ ARTEAGA MARIA DEL PILAR',1,'41765526','1983-03-28 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1345,002909,2,'GONZALEZ','PAUCARHUANCA','LUCY',NULL,'GONZALEZ PAUCARHUANCA LUCY',1,'21521828','1972-02-07 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1346,002849,2,'GRANDA','CHAVEZ','CECILIA','JESSICA','GRANDA CHAVEZ CECILIA JESSICA',1,'25827146','1976-07-28 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1347,003081,2,'GUERRA','CENEPO','ZOILA',NULL,'GUERRA CENEPO ZOILA',1,'44633301','1987-07-30 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1348,003082,2,'GUTARRA','LEYTON','VERONICA','VANESSA','GUTARRA LEYTON VERONICA VANESSA',1,'73179594','1993-10-28 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1349,002944,2,'HARO','MILLA','HELGA','HILDEGARD','HARO MILLA HELGA HILDEGARD',1,'25800754','1968-01-02 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1350,002924,2,'HERNANDEZ','BECERRA','GLORIA','MILAGRITOS','HERNANDEZ BECERRA GLORIA MILAGRITOS',1,'41427855','1980-03-30 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1351,003037,2,'HIJAR','SIFUENTES','YADIRA',NULL,'HIJAR SIFUENTES YADIRA',1,'44035859','1981-11-19 00:00:00',2,1,'','',NULL,'2020-05-26 00:00:00',0,0),(
1352,003017,2,'HUACCHO','CALDERON','MABEL','PAOLA','HUACCHO CALDERON MABEL PAOLA',1,'46051384','1989-11-11 00:00:00',2,1,'','',NULL,'2020-06-01 00:00:00',0,0),(
1353,003028,2,'HUAMAN','BAUTISTA','GLEISI',NULL,'HUAMAN BAUTISTA GLEISI',1,'47348682','1992-09-10 00:00:00',2,1,'','',NULL,'2020-06-01 00:00:00',0,0),(
1354,003024,2,'HUAMAN','MATOS','NORMA','ESTELA','HUAMAN MATOS NORMA ESTELA',1,'48269759','1993-09-07 00:00:00',2,1,'','',NULL,'2020-06-01 00:00:00',0,0),(
1355,002854,2,'HUARANGA','PARRAGA','STEFANY','BLANCA','HUARANGA PARRAGA STEFANY BLANCA',1,'47040548','1991-05-11 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1356,003333,2,'HUARCAYA','BENDEZU','IBET',NULL,'HUARCAYA BENDEZU IBET',1,'43511137','1986-02-19 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1357,003025,2,'INCA','RICRA','MERY','JEDDY','INCA RICRA MERY JEDDY',1,'46309365','1990-05-06 00:00:00',2,1,'','',NULL,'2020-06-01 00:00:00',0,0),(
1358,003085,2,'INGA','PUJAY','ZULEMA','ALEJANDRINA','INGA PUJAY ZULEMA ALEJANDRINA',1,'43283355','1985-09-08 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1359,002708,2,'IPARRAGUIRRE','CASTRO','JOHN','PETER','IPARRAGUIRRE CASTRO JOHN PETER',1,'40737014','1980-10-22 00:00:00',1,1,'','',NULL,'2015-01-08 00:00:00',0,0),(
1360,002906,2,'ISLACHIN','CASTRO','SONIA','TERESA','ISLACHIN CASTRO SONIA TERESA',1,'41812276','1982-11-20 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1361,002772,2,'JALIXTO','QUISPE','TEOFILO',NULL,'JALIXTO QUISPE TEOFILO',1,'04642317','1972-03-12 00:00:00',1,1,'','',NULL,'2019-01-25 00:00:00',0,0),(
1362,003038,2,'JANAMPA','CAPILLO','ALEXANDRA','VIOLETA','JANAMPA CAPILLO ALEXANDRA VIOLETA',1,'45309271','1988-10-06 00:00:00',2,1,'','',NULL,'2020-05-26 00:00:00',0,0),(
1363,002860,2,'JAULIS','PRADO','WILLIAMS','ALEXANDER','JAULIS PRADO WILLIAMS ALEXANDER',1,'44481502','1987-06-06 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1364,002900,2,'JULCARIMA','BRICENO','JHONNY','JOSMELL','JULCARIMA BRICENO JHONNY JOSMELL',1,'46365178','1984-11-30 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1365,003211,2,'LEON','FONSECA','ALEXANDER','IVAN','LEON FONSECA ALEXANDER IVAN',1,'43066536','1985-05-24 00:00:00',1,1,'','',NULL,'2015-07-06 00:00:00',0,0),(
1366,003326,2,'LIMO','GAMARRA','MARCOS','GUILLERMO','LIMO GAMARRA MARCOS GUILLERMO',1,'10477898','1950-04-16 00:00:00',1,1,'','',NULL,'2021-03-30 00:00:00',0,0),(
1367,003086,2,'LLACZA','MINAYA','RUTH','GERALDINE','LLACZA MINAYA RUTH GERALDINE',1,'47917087','1993-09-15 00:00:00',2,1,'','',NULL,'2020-07-06 00:00:00',0,0),(
1368,002945,2,'LLUFIRE','CAHUANA','LELIS','ROCIO','LLUFIRE CAHUANA LELIS ROCIO',1,'42363164','1984-02-24 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1369,002738,2,'LOPEZ','HIDALGO','LIZETH','VANESSA','LOPEZ HIDALGO LIZETH VANESSA',1,'43513721','1983-03-01 00:00:00',2,1,'','',NULL,'2018-10-04 00:00:00',0,0),(
1370,002716,2,'LOPEZ','VASQUEZ','ANA','ISABEL','LOPEZ VASQUEZ ANA ISABEL',1,'40742392','1980-06-15 00:00:00',2,1,'','',NULL,'2016-07-01 00:00:00',0,0),(
1371,002922,2,'LOZANO','SALVADOR','ELIZABETH','SOLEDAD','LOZANO SALVADOR ELIZABETH SOLEDAD',1,'42545118','1984-07-16 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1372,003334,2,'MACASSI','MEZA','CARMEN','JACKELINE','MACASSI MEZA CARMEN JACKELINE',1,'21253967','1965-08-07 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1373,002877,2,'MALASQUEZ','AGAPITO','EDWARD','EDWIN','MALASQUEZ AGAPITO EDWARD EDWIN',1,'06751540','1954-03-07 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1374,003339,2,'MALPARTIDA','BRAVO','ROSA','BERTHA','MALPARTIDA BRAVO ROSA BERTHA',1,'25781972','1975-07-01 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1375,003191,2,'MALPARTIDA','CHAVEZ','EULALIA',NULL,'MALPARTIDA CHAVEZ EULALIA',1,'42425595','1984-03-03 00:00:00',2,1,'','',NULL,'2021-02-01 00:00:00',0,0),(
1376,002907,2,'MAMANI','MAMANI','SUSY','YULISSA','MAMANI MAMANI SUSY YULISSA',1,'43181823','1985-10-05 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1377,002852,2,'MANDUJANO','CHUMBEMUNE','LUIS','FERNANDO','MANDUJANO CHUMBEMUNE LUIS FERNANDO',1,'10730562','1978-02-22 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1378,002724,2,'MAROCHO','ORE','ISAAC',NULL,'MAROCHO ORE ISAAC',1,'23869618','1966-06-03 00:00:00',2,1,'','',NULL,'2017-12-30 00:00:00',0,0),(
1379,002734,2,'MARQUEZ','CCENCHO','CARMEN','LIDIA','MARQUEZ CCENCHO CARMEN LIDIA',1,'09482048','1969-07-29 00:00:00',2,1,'','',NULL,'2018-10-04 00:00:00',0,0),(
1380,002960,2,'MARTINEZ','ALARCON','ROSA','VIOLETA','MARTINEZ ALARCON ROSA VIOLETA',1,'07261113','1970-08-25 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1381,003039,2,'MATTA','COSAR','JESSENIA','DEL PILAR','MATTA COSAR JESSENIA DEL PILAR',1,'72410724','1993-09-18 00:00:00',2,1,'','',NULL,'2020-05-26 00:00:00',0,0),(
1382,002910,2,'MELGAR','SALCEDO','KARINA','DEYSA','MELGAR SALCEDO KARINA DEYSA',1,'21575119','1978-01-23 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1383,003026,2,'MENDOZA','CHAVEZ','MARIA','CLARA','MENDOZA CHAVEZ MARIA CLARA',1,'48164267','1975-03-15 00:00:00',2,1,'','',NULL,'2020-06-01 00:00:00',0,0),(
1384,002959,2,'MENDOZA','GARAY','SONIA',NULL,'MENDOZA GARAY SONIA',1,'09835582','1975-03-15 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1385,003089,2,'MERCEDES','ROJAS','PAULINA',NULL,'MERCEDES ROJAS PAULINA',1,'72022499','1998-06-22 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1386,003090,2,'MERINO','MEDINA','FLOR','NANCY','MERINO MEDINA FLOR NANCY',1,'28605181','1978-02-10 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1387,003030,2,'MEZA','NALVARTE','WILLIAM','ALBERTO','MEZA NALVARTE WILLIAM ALBERTO',1,'43569108','1975-09-11 00:00:00',1,1,'','',NULL,'2020-06-01 00:00:00',0,0),(
1388,003040,2,'MILLA','PORTUGUEZ','JOANNE','PIERINA','MILLA PORTUGUEZ JOANNE PIERINA',1,'47154838','1991-09-11 00:00:00',2,1,'','',NULL,'2020-06-01 00:00:00',0,0),(
1389,002790,2,'MIRANO','ALVARADO','ERIKA','DEL CARMEN','MIRANO ALVARADO ERIKA DEL CARMEN',1,'10085832','1974-10-21 00:00:00',2,1,'','',NULL,'2019-12-16 00:00:00',0,0),(
1390,002868,2,'MONTOYA','CORONADO','JESICA','RAQUEL','MONTOYA CORONADO JESICA RAQUEL',1,'40913419','1981-02-16 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1391,003091,2,'MORA','WALDE','MYRNA','NATHALI','MORA WALDE MYRNA NATHALI',1,'41748409','1982-11-28 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1392,002866,2,'MORALES','GARCIA','GLADYS','ANTONIA','MORALES GARCIA GLADYS ANTONIA',1,'09272605','1967-06-13 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1393,002752,2,'MOSCOSO','ALVARINO','JESUS','GONZALO','MOSCOSO ALVARINO JESUS GONZALO',1,'06521571','1944-09-24 00:00:00',1,1,'','',NULL,'2018-10-05 00:00:00',0,0),(
1394,002950,2,'MUNOZ','GRADOS','JULIA','GLADYS','MUNOZ GRADOS JULIA GLADYS',1,'09160841','1961-04-14 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1395,002939,2,'MURGADO','BLAS','RICARDO','ESTEBAN','MURGADO BLAS RICARDO ESTEBAN',1,'41647095','1983-01-12 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1396,003093,2,'NEYRA','VASQUEZ','ZULMA','CELINDA','NEYRA VASQUEZ ZULMA CELINDA',1,'70220391','1997-10-11 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1397,002889,2,'NOEL','MENDOZA','CESAR','AUGUSTO','NOEL MENDOZA CESAR AUGUSTO',1,'44826273','1987-10-25 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1398,002091,2,'OBLITAS','BALDARRAGO','EDGARD','CESAR HUGO','OBLITAS BALDARRAGO EDGARD CESAR HUGO',1,'07846582','1944-11-22 00:00:00',1,1,'','',NULL,'2015-07-06 00:00:00',0,0),(
1399,003212,2,'OCHOA','DELGADO','ISABEL','MILAGROS','OCHOA DELGADO ISABEL MILAGROS',1,'06790130','1974-08-16 00:00:00',2,1,'','',NULL,'2019-12-26 00:00:00',0,0),(
1400,002970,2,'OLAYA','HIDALGO','HEIDI','ELIZABETH','OLAYA HIDALGO HEIDI ELIZABETH',1,'47359233','1992-10-27 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1401,003095,2,'OLIVARES','MENESES','SOFIA',NULL,'OLIVARES MENESES SOFIA',1,'41817089','1983-05-20 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1402,002836,2,'ORDUNA','BURGOS','VICTOR','RAUL','ORDUNA BURGOS VICTOR RAUL',1,'08442514','1958-05-21 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1403,003021,2,'OSORIO','RIQUELME','TANIA','LUZ','OSORIO RIQUELME TANIA LUZ',1,'46031886','1989-02-19 00:00:00',2,1,'','',NULL,'2020-06-01 00:00:00',0,0),(
1404,003096,2,'OTERO','ALCARRAZ','PAOLA','MERCEDES','OTERO ALCARRAZ PAOLA MERCEDES',1,'76809253','1995-04-22 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1405,003097,2,'OVIEDO','ADRIANZEN','CRISTIAN','JESUS','OVIEDO ADRIANZEN CRISTIAN JESUS',1,'47562749','1990-01-02 00:00:00',1,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1406,002736,2,'OVIEDO','FIGUEROA','YOLANDA',NULL,'OVIEDO FIGUEROA YOLANDA',1,'42180550','1982-03-05 00:00:00',2,1,'','',NULL,'2018-10-04 00:00:00',0,0),(
1407,003098,2,'OYOLA','VARGAS','DERMIA',NULL,'OYOLA VARGAS DERMIA',1,'23862740','1970-05-05 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1408,003099,2,'PACHAS','LEVANO','PAOLA','MARLENE','PACHAS LEVANO PAOLA MARLENE',1,'47850818','1993-06-29 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1409,003100,2,'PACHAS','PALACIOS','JESSICA','MARGOT','PACHAS PALACIOS JESSICA MARGOT',1,'40231556','1979-06-23 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1410,002825,2,'PACHECO','BRIOSO','EVELYN','RUTH','PACHECO BRIOSO EVELYN RUTH',1,'43375941','1985-10-27 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1411,003335,2,'PACHECO','TINOCO','LUIS','GIANCARLO','PACHECO TINOCO LUIS GIANCARLO',1,'41464904','1982-07-22 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1412,003031,2,'PAICO','ROMERO','CLAUDIA','NATALIA','PAICO ROMERO CLAUDIA NATALIA',1,'70411037','1989-12-16 00:00:00',2,1,'','',NULL,'2020-06-01 00:00:00',0,0),(
1413,002933,2,'PAREJA','AYERVE','FANY',NULL,'PAREJA AYERVE FANY',1,'45826844','1989-06-22 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1414,003101,2,'PARI','TANG','PAUL','CRISTHIAN','PARI TANG PAUL CRISTHIAN',1,'44288629','1987-05-01 00:00:00',1,1,'','',NULL,'2020-07-06 00:00:00',0,0),(
1415,002733,2,'PAUCAR','ORTIZ','MARIA','DEL PILAR GEORGINA','PAUCAR ORTIZ MARIA DEL PILAR GEORGINA',1,'45692789','1989-03-14 00:00:00',2,1,'','',NULL,'2018-10-04 00:00:00',0,0),(
1416,002826,2,'PENA','JIMENEZ','PATRICIA','ELIZABETH','PENA JIMENEZ PATRICIA ELIZABETH',1,'03213638','1968-10-27 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1417,002707,2,'PEREDA','RAMIREZ','FRED','VLADIMIR','PEREDA RAMIREZ FRED VLADIMIR',1,'09606768','1971-01-28 00:00:00',1,1,'','',NULL,'2014-08-01 00:00:00',0,0),(
1418,002948,2,'PEREZ','ARIS','SADITH',NULL,'PEREZ ARIS SADITH',1,'41638018','1982-09-08 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1419,002842,2,'PEREZ','HUAMANI','VLADIMIR','HERNAN','PEREZ HUAMANI VLADIMIR HERNAN',1,'45920416','1989-09-20 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1420,002892,2,'PEREZ','RETAMOZO','DIANA','CAROLINA','PEREZ RETAMOZO DIANA CAROLINA',1,'44775926','1987-08-08 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1421,002966,2,'PEREZ','ROCA','AVALOS','SAMUEL ALFONSO','PEREZ ROCA AVALOS SAMUEL ALFONSO',1,'71220470','1992-09-22 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1422,003102,2,'PEZANTES','LAZO','ELIZABETH','JANINNA','PEZANTES LAZO ELIZABETH JANINNA',1,'43650725','1986-05-01 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1423,003201,2,'PIMENTEL','IBARRA','JOSE','NICANOR','PIMENTEL IBARRA JOSE NICANOR',1,'18098868','1968-08-07 00:00:00',1,1,'','',NULL,'2021-03-19 00:00:00',0,0),(
1424,003103,2,'PIZANGO','PUA','JENNY',NULL,'PIZANGO PUA JENNY',1,'43995842','1984-02-27 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1425,002779,2,'POCCO','HINOSTROZA','DIANA','JANNETH','POCCO HINOSTROZA DIANA JANNETH',1,'40227025','1979-06-07 00:00:00',2,1,'','',NULL,'2019-10-22 00:00:00',0,0),(
1426,002767,2,'POMA','PAUCAR','MARTHA','MIRIAN','POMA PAUCAR MARTHA MIRIAN',1,'42555383','1984-03-24 00:00:00',2,1,'','',NULL,'2019-01-25 00:00:00',0,0),(
1427,002796,2,'POMAR','GONZALES','JORGE','ARTURO','POMAR GONZALES JORGE ARTURO',1,'40395194','1979-12-18 00:00:00',1,1,'','',NULL,'2019-12-26 00:00:00',0,0),(
1428,002795,2,'PONCIANO','ESPINO','GRACIELA','MILAGROS','PONCIANO ESPINO GRACIELA MILAGROS',1,'46124620','1969-10-24 00:00:00',2,1,'','',NULL,'2019-12-26 00:00:00',0,0),(
1429,002894,2,'PORRAS','PICON','SARA','ROSARIO','PORRAS PICON SARA ROSARIO',1,'07524783','1977-01-12 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1430,003104,2,'PULACHE','LIZARRAGA','DANIEL','ENRIQUE','PULACHE LIZARRAGA DANIEL ENRIQUE',1,'41198773','1980-01-26 00:00:00',1,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1431,003106,2,'QUINCHO','VILCAPUMA','FLOR','EDITH','QUINCHO VILCAPUMA FLOR EDITH',1,'46819244','1989-12-18 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1432,003329,2,'QUISPE','ANTONIO','KELY','VANESSA','QUISPE ANTONIO KELY VANESSA',1,'44324541','1982-07-05 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1433,002872,2,'QUISPE','CADILLO','NIELL','ARTURO','QUISPE CADILLO NIELL ARTURO',1,'45231316','1988-04-01 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1434,002851,2,'QUISPE','CALDERON','JULIO','CESAR','QUISPE CALDERON JULIO CESAR',1,'42189554','1982-05-16 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1435,002898,2,'QUISPE','MIRANDA','GREGORIO','AMADOR','QUISPE MIRANDA GREGORIO AMADOR',1,'43277140','1985-09-30 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1436,003109,2,'RAFAEL','RAFAEL','KATY','ARLENY','RAFAEL RAFAEL KATY ARLENY',1,'71703854','1995-08-16 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1437,003111,2,'RAMIREZ','CALLALLI','KARINA','MILAGROS','RAMIREZ CALLALLI KARINA MILAGROS',1,'45990867','1989-10-03 00:00:00',2,1,'','',NULL,'2020-07-09 00:00:00',0,0),(
1438,002936,2,'RAMIREZ','PANDURO','GRACIELA',NULL,'RAMIREZ PANDURO GRACIELA',1,'44388756','1987-08-01 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1439,002913,2,'RAMON','VALVERDE','MIRTHA','JESSICA','RAMON VALVERDE MIRTHA JESSICA',1,'41240911','1982-01-11 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1440,002827,2,'RAMOS','SUAZO','MARIA','DOLORES','RAMOS SUAZO MARIA DOLORES',1,'07071550','1965-09-15 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1441,003011,2,'RAMOS','IZARRA','MARLENY',NULL,'RAMOS IZARRA MARLENY',1,'44758170','1987-11-04 00:00:00',2,1,'','',NULL,'2020-06-01 00:00:00',0,0),(
1442,003327,2,'REBAZA','ALFARO','DANIEL','RICARDO','REBAZA ALFARO DANIEL RICARDO',1,'43136535','1983-10-17 00:00:00',1,1,'','',NULL,'2015-04-01 00:00:00',0,0),(
1443,002846,2,'REYES','CHUMBEMUNE','EDWAR','ANGEL','REYES CHUMBEMUNE EDWAR ANGEL',1,'06004383','1962-12-26 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1444,002717,2,'REYES','VILLALOBOS','ALICE','DEL CARMEN','REYES VILLALOBOS ALICE DEL CARMEN',1,'42652526','1984-10-01 00:00:00',2,1,'','',NULL,'2016-07-01 00:00:00',0,0),(
1445,003114,2,'RIOJAS','FARRONAN','MILAGROS','ARACELI','RIOJAS FARRONAN MILAGROS ARACELI',1,'73025398','1993-10-30 00:00:00',2,1,'','',NULL,'2020-07-06 00:00:00',0,0),(
1446,002867,2,'RIOS','SALAZAR','DIANA','YOLANDA','RIOS SALAZAR DIANA YOLANDA',1,'42845023','1985-03-05 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1447,003115,2,'RIVAS','MARTINOVICH','SARITA','GUDELIA','RIVAS MARTINOVICH SARITA GUDELIA',1,'46786094','1991-02-09 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1448,002715,2,'RIVERA','ALTAMIRANO','PORFIRIO',NULL,'RIVERA ALTAMIRANO PORFIRIO',1,'43517783','1986-03-20 00:00:00',1,1,'','',NULL,'2015-10-19 00:00:00',0,0),(
1449,002968,2,'RIVEROS','UPIACHIHUA','EDELMIRA','LIZBETH','RIVEROS UPIACHIHUA EDELMIRA LIZBETH',1,'70510856','1997-05-16 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1450,002881,2,'RODRIGUEZ','CERNA','LUCIA',NULL,'RODRIGUEZ CERNA LUCIA',1,'43080260','1984-10-24 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1451,003328,2,'RODRIGUEZ','SAAVEDRA','GABRIELA','EDITH CAROL','RODRIGUEZ SAAVEDRA GABRIELA EDITH CAROL',1,'44691305','1987-09-25 00:00:00',2,1,'','',NULL,'2018-10-04 00:00:00',0,0),(
1452,002828,2,'RODRIGUEZ','URBINA','EDGAR','VENANCIO','RODRIGUEZ URBINA EDGAR VENANCIO',1,'10464681','1976-03-03 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1453,002829,2,'ROJAS','LARA','ROMENIN','RENATO','ROJAS LARA ROMENIN RENATO',1,'43716306','1986-07-21 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1454,002865,2,'ROJAS','RIOS DE SILLAU','EVELYN','PATRICIA','ROJAS RIOS DE SILLAU EVELYN PATRICIA',1,'40289828','1979-07-14 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1455,002731,2,'ROSALES','CUBAS','CARLA','DENISSE','ROSALES CUBAS CARLA DENISSE',1,'44508395','1987-08-17 00:00:00',2,1,'','',NULL,'2018-09-06 00:00:00',0,0),(
1456,002722,2,'RUIZ','PORTILLA','SUSY',NULL,'RUIZ PORTILLA SUSY',1,'43026369','1985-06-04 00:00:00',2,1,'','',NULL,'2017-08-18 00:00:00',0,0),(
1457,002929,2,'RUIZ','RUIZ','LIGIA','HANNEDA','RUIZ RUIZ LIGIA HANNEDA',1,'00860993','1978-07-29 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1458,002887,2,'RUIZ','ULLOA','JAIME','RAUL','RUIZ ULLOA JAIME RAUL',1,'09299997','1967-05-21 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1459,003116,2,'RUMICHE','PAZO','LISBET','ALICIA','RUMICHE PAZO LISBET ALICIA',1,'47130729','1992-07-20 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1460,002955,2,'SAAVEDRA','PAREDES','KATHERINE','LISETH','SAAVEDRA PAREDES KATHERINE LISETH',1,'47620375','1992-04-28 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1461,002830,2,'SALAS','ESPEJO','ANA','CECILIA','SALAS ESPEJO ANA CECILIA',1,'07580018','1965-08-01 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1462,002791,2,'SALDANA','GOMEZ','MERLY','ELIZABETH','SALDANA GOMEZ MERLY ELIZABETH',1,'42930293','1985-04-08 00:00:00',2,1,'','',NULL,'2019-12-16 00:00:00',0,0),(
1463,002809,2,'SALINAS','PUYEN','ANGELA','NATIVIDAD','SALINAS PUYEN ANGELA NATIVIDAD',1,'43221032','1985-09-20 00:00:00',2,1,'','',NULL,'2019-12-26 00:00:00',0,0),(
1464,002764,2,'SAMANIEGO','LOZANO','CYNTHIA','LUZ','SAMANIEGO LOZANO CYNTHIA LUZ',1,'43490671','1985-12-16 00:00:00',2,1,'','',NULL,'2019-01-25 00:00:00',0,0),(
1465,002841,2,'SANCHEZ','DE LA CRUZ','WALDYR','HENRY','SANCHEZ DE LA CRUZ WALDYR HENRY',1,'09832274','1974-08-25 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1466,002705,2,'SANCHEZ','HARO','VANESSA','PAOLA','SANCHEZ HARO VANESSA PAOLA',1,'41423968','1982-07-17 00:00:00',2,1,'','',NULL,'2014-07-01 00:00:00',0,0),(
1467,002853,2,'SANCHEZ','SURICHAQUI','EDDY','JOEL','SANCHEZ SURICHAQUI EDDY JOEL',1,'40995786','1981-08-04 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1468,002967,2,'SANDOVAL','ALOR','HUMBERTO','OSCAR','SANDOVAL ALOR HUMBERTO OSCAR',1,'25812510','1972-01-20 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1469,003117,2,'SEGUNDO','SOTO','NATHALY','YESSENIA','SEGUNDO SOTO NATHALY YESSENIA',1,'44052376','1987-02-05 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1470,003117,2,'SEGURA','YURIVILCA','MEDALIT','THALIA','SEGURA YURIVILCA MEDALIT THALIA',1,'47177944','1992-08-10 00:00:00',2,1,'','',NULL,'2020-06-01 00:00:00',0,0),(
1471,003014,2,'SEMINARIO','MIRANDA','ANA','PAOLA','SEMINARIO MIRANDA ANA PAOLA',1,'47341744','1992-02-18 00:00:00',2,1,'','',NULL,'2020-06-01 00:00:00',0,0),(
1472,002783,2,'SIANCAS','FERNANDEZ','LUIS','MARTIN','SIANCAS FERNANDEZ LUIS MARTIN',1,'43997374','1986-07-16 00:00:00',1,1,'','',NULL,'2019-10-22 00:00:00',0,0),(
1473,002759,2,'SIESQUEN','DELGADO','JAIME','CESAR','SIESQUEN DELGADO JAIME CESAR',1,'42304972','1984-03-12 00:00:00',1,1,'','',NULL,'2018-12-05 00:00:00',0,0),(
1474,003276,2,'SIFUENTES','GOMERO','CHRISTIAN','MANUEL','SIFUENTES GOMERO CHRISTIAN MANUEL',1,'45566833','1988-11-26 00:00:00',1,1,'','',NULL,'2021-10-11 00:00:00',0,0),(
1475,002883,2,'SIHUAY','CONDEMARIN','JORGE','ERNESTO','SIHUAY CONDEMARIN JORGE ERNESTO',1,'10699376','1978-02-21 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1476,002897,2,'SILVA','ALATRISTA','MARICRUZ',NULL,'SILVA ALATRISTA MARICRUZ',1,'10623962','1977-10-31 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1477,002912,2,'SILVESTRE','PEREZ','MILEYDI','FLOR','SILVESTRE PEREZ MILEYDI FLOR',1,'44739718','1987-10-02 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1478,002831,2,'SINARAHUA','GALVEZ','BENJAMIN',NULL,'SINARAHUA GALVEZ BENJAMIN',1,'10371602','1965-11-19 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1479,002804,2,'SIU','MELENDEZ','SUSY',NULL,'SIU MELENDEZ SUSY',1,'46379528','1990-04-10 00:00:00',2,1,'','',NULL,'2019-12-26 00:00:00',0,0),(
1480,003004,2,'SOLARI','YATACO','HENRY',NULL,'SOLARI YATACO HENRY',1,'21868071','1974-10-17 00:00:00',1,1,'','',NULL,'2020-04-13 00:00:00',0,0),(
1481,002749,2,'SUAREZ','HERMOZA','SULEMA','OFELIA','SUAREZ HERMOZA SULEMA OFELIA',1,'40684086','1980-12-07 00:00:00',2,1,'','',NULL,'2018-10-04 00:00:00',0,0),(
1482,002702,2,'SUAREZ','PACO','OTILIA',NULL,'SUAREZ PACO OTILIA',1,'21545061','1973-01-21 00:00:00',2,1,'','',NULL,'2012-08-16 00:00:00',0,0),(
1483,003013,2,'SUAREZ','PAUCAR','KAREN','NAYSHA','SUAREZ PAUCAR KAREN NAYSHA',1,'70200289','1992-04-20 00:00:00',2,1,'','',NULL,'2020-06-01 00:00:00',0,0),(
1484,002833,2,'SURICHAQUI','DIAZ','ELIZABETH',NULL,'SURICHAQUI DIAZ ELIZABETH',1,'25710070','1971-02-27 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1485,002768,2,'TACUCHE','HUERTA','YARITHA','REGINA','TACUCHE HUERTA YARITHA REGINA',1,'46843711','1992-02-03 00:00:00',2,1,'','',NULL,'2019-01-25 00:00:00',0,0),(
1486,002781,2,'TAIPE','RUIZ','BLANCA','REGINA','TAIPE RUIZ BLANCA REGINA',1,'40952797','1981-06-09 00:00:00',2,1,'','',NULL,'2019-10-22 00:00:00',0,0),(
1487,002700,2,'TERAN','VASQUEZ','MILUSKA','ARACELI','TERAN VASQUEZ MILUSKA ARACELI',1,'10130452','1975-10-14 00:00:00',2,1,'','',NULL,'2007-12-21 00:00:00',0,0),(
1488,002834,2,'TICONA','AREVALO','MARIA','DEL CARMEN','TICONA AREVALO MARIA DEL CARMEN',1,'10783223','1978-02-08 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1489,002856,2,'TIPIANA','GUEVARA','SARITA','ESTHER','TIPIANA GUEVARA SARITA ESTHER',1,'41825506','1982-05-26 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1490,002855,2,'TOLEDO','VELARDE','RONALD','MARTIN','TOLEDO VELARDE RONALD MARTIN',1,'40251688','1979-07-09 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1491,002879,2,'TORREBLANCA','RAMOS','JANET','MARY','TORREBLANCA RAMOS JANET MARY',1,'10725841','1977-10-17 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1492,002870,2,'TORRES','MEZA','DANNY','ISMAEL','TORRES MEZA DANNY ISMAEL',1,'41951937','1983-07-19 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1493,003023,2,'TORRES','PRINCIPE','CARLA','CARLITA','TORRES PRINCIPE CARLA CARLITA',1,'42634052','1984-08-24 00:00:00',2,1,'','',NULL,'2020-06-01 00:00:00',0,0),(
1494,002882,2,'TORRES','REQUEJO','CAMILO','ALBERTO','TORRES REQUEJO CAMILO ALBERTO',1,'16662195','1970-05-19 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1495,002927,2,'TORRES','SEIJAS','ROSSE','MERY','TORRES SEIJAS ROSSE MERY',1,'44118940','1986-09-23 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1496,003121,2,'TREJO','DEL','CASTILLO','CARLA GEOVANA','TREJO DEL CASTILLO CARLA GEOVANA',1,'45153836','1988-04-03 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1497,002885,2,'ULLOA','LARA','ALEXANDER',NULL,'ULLOA LARA ALEXANDER',1,'40063182','1978-04-16 00:00:00',1,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1498,002863,2,'VALENZUELA','ORTEGA','MOREYMA','DEL CARMEN','VALENZUELA ORTEGA MOREYMA DEL CARMEN',1,'10395167','1973-04-17 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1499,002926,2,'VALLADARES','NUNUVERA','SUJAIRI','MILAGROS','VALLADARES NUNUVERA SUJAIRI MILAGROS',1,'42648179','1982-02-18 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1500,002954,2,'VALLE','DIAZ','KATTIA',NULL,'VALLE DIAZ KATTIA',1,'46706881','1990-11-11 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1501,002938,2,'VALLEJOS','CHAUCA','ELENA','GENOVEVA','VALLEJOS CHAUCA ELENA GENOVEVA',1,'46174756','1990-02-13 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1502,002896,2,'VARGAS','ALFARO','SANDRA','IOVANA','VARGAS ALFARO SANDRA IOVANA',1,'28308972','1976-06-15 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1503,002895,2,'VARGAS','ALVAREZ','ROXANA',NULL,'VARGAS ALVAREZ ROXANA',1,'10613800','1978-01-17 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1504,002769,2,'VASQUEZ','COAGUILA','SUSANA','CONSUELO','VASQUEZ COAGUILA SUSANA CONSUELO',1,'44100317','1987-01-21 00:00:00',2,1,'','',NULL,'2019-01-25 00:00:00',0,0),(
1505,002835,2,'VELA','RUIZ','MIRIAN','GABRIELA','VELA RUIZ MIRIAN GABRIELA',1,'43220679','1985-04-22 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1506,003122,2,'VELASQUEZ','TAPIA','EDUARD','JARRY','VELASQUEZ TAPIA EDUARD JARRY',1,'44347019','1987-06-17 00:00:00',1,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1507,003123,2,'VERA','CARRASCO','FIORELA','MARINA','VERA CARRASCO FIORELA MARINA',1,'44987730','1988-03-04 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1508,003124,2,'VERA','ORTIZ','MARYORI',NULL,'VERA ORTIZ MARYORI',1,'73263608','1995-06-05 00:00:00',2,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1509,002744,2,'VERTIZ','GARATE','KATHERINE','MILAGROS','VERTIZ GARATE KATHERINE MILAGROS',1,'46040546','1989-11-08 00:00:00',2,1,'','',NULL,'2018-10-04 00:00:00',0,0),(
1510,003243,2,'VIDAL','ESPINOZA','ANA','CECILIA','VIDAL ESPINOZA ANA CECILIA',1,'45842052','1989-07-26 00:00:00',2,1,'','',NULL,'2019-01-25 00:00:00',0,0),(
1511,003125,2,'VIGO','CABALLERO','JUAN','DIEGO','VIGO CABALLERO JUAN DIEGO',1,'72944186','1991-06-16 00:00:00',1,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1512,002931,2,'VILCHEZ','PAZ','STEFANY','BERNITA','VILCHEZ PAZ STEFANY BERNITA',1,'43694827','1986-08-17 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1513,002873,2,'VILQUINICHE','HUANCA','MARIA','MARGARITA','VILQUINICHE HUANCA MARIA MARGARITA',1,'40374365','1979-11-14 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1514,002732,2,'YONG','LOPEZ','CARLOS','ARTURO','YONG LOPEZ CARLOS ARTURO',1,'41633917','1983-01-18 00:00:00',1,1,'','',NULL,'2018-09-06 00:00:00',0,0),(
1515,003126,2,'ZAMUDIO','NEGRON','CRISTHIAN','BRAYAN','ZAMUDIO NEGRON CRISTHIAN BRAYAN',1,'75455576','1995-03-14 00:00:00',1,1,'','',NULL,'2020-06-24 00:00:00',0,0),(
1516,002844,2,'ZAVALETA','REYNOSO','KARLA','LUZMILA','ZAVALETA REYNOSO KARLA LUZMILA',1,'08262477','1965-11-05 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1517,002961,2,'ZAVALETA','SALVATIERRA','DAISY','CARMENCITA','ZAVALETA SALVATIERRA DAISY CARMENCITA',1,'44385615','1987-03-08 00:00:00',2,1,'','',NULL,'2019-12-28 00:00:00',0,0),(
1518,003127,2,'ZUNIGA','BERECHE','ERIK','JOEL','ZUNIGA BERECHE ERIK JOEL',1,'45591069','1989-03-11 00:00:00',1,1,'','',NULL,'2020-06-24 00:00:00',0,0);




-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_planilla`
--

CREATE TABLE `p_planilla` (
  `idplanilla` int(10) UNSIGNED NOT NULL,
  `idpersona` int(11) NOT NULL,
  `idgruporiesgo` int(11) NOT NULL,
  `idservicio` int(11) NOT NULL,
  `idarea` int(11) NOT NULL,
  `idpuestotrabajo` int(11) NOT NULL,
  `observacion` varchar(500) NOT NULL,
  `fechainicio` datetime NOT NULL,
  `fechafin` datetime NOT NULL,
  `estado` char(1) NOT NULL DEFAULT '0' COMMENT '0 = activo 1 = inactivo',
  `usuario` varchar(15) NOT NULL,
  `perfil` varchar(15) NOT NULL,
  `equipo` varchar(15) NOT NULL,
  `fecha` datetime NOT NULL,
  `usuariomod` varchar(15) DEFAULT NULL,
  `perfilmod` varchar(15) DEFAULT NULL,
  `equipomod` varchar(15) DEFAULT NULL,
  `fechamod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `p_planilla`
--

-- INSERT INTO `p_planilla` (`idplanilla`, `idpersona`, `idgruporiesgo`, `idservicio`, `idarea`, `idpuestotrabajo`, `observacion`, `fechainicio`, `fechafin`, `estado`, `usuario`, `perfil`, `equipo`, `fecha`, `usuariomod`, `perfilmod`, `equipomod`, `fechamod`) VALUES
-- (9, 12, 1, 1, 1, 36, '', '2022-02-07 00:00:00', '2022-02-07 00:00:00', '0', 'US', 'PR', 'EQ', '2021-08-02 00:00:00', NULL, NULL, NULL, NULL),
-- (10, 13, 2, 1, 97, 31, 'PERSONA MAYOR', '2022-02-07 00:00:00', '2022-02-07 00:00:00', '0', 'US', 'PR', 'EQ', '2021-08-02 00:00:00', NULL, NULL, NULL, NULL),
-- (11, 14, 3, 2, 2, 10, '', '2022-02-07 00:00:00', '2022-02-07 00:00:00', '0', 'US', 'PR', 'EQ', '2021-08-02 00:00:00', NULL, NULL, NULL, NULL);

INSERT INTO `p_planilla` (`idplanilla`, `idpersona`, `idgruporiesgo`, `idservicio`, `idarea`, `idpuestotrabajo`, `observacion`, `fechainicio`, `fechafin`, `estado`, `usuario`, `perfil`, `equipo`, `fecha`, `usuariomod`, `perfilmod`, `equipomod`, `fechamod`) VALUES (
1,1,1,81,81,6,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
2,2,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
3,3,1,106,106,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
4,4,1,62,62,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
5,5,1,23,23,76,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
6,6,1,12,12,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
7,7,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
8,8,1,24,24,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
9,9,1,73,73,28,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
10,10,1,40,40,47,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
11,11,1,24,24,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
12,12,1,12,12,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
13,13,1,15,15,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
14,14,1,51,51,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
15,15,1,19,19,68,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
16,16,1,51,51,30,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
17,17,1,64,64,2,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
18,18,1,47,47,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
19,19,1,27,27,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
20,20,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
21,21,1,6,6,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
22,22,1,4,4,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
23,23,1,9,9,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
24,24,1,108,108,6,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
25,25,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
26,26,1,9,9,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
27,27,1,10,10,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
28,28,1,12,12,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
29,29,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
30,30,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
31,31,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
32,32,1,78,78,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
33,33,1,15,15,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
34,34,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
35,35,1,81,81,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
36,36,1,10,10,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
37,37,1,37,37,55,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
38,38,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
39,39,1,51,51,45,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
40,40,1,90,90,28,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
41,41,1,15,15,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
42,42,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
43,43,1,44,44,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
44,44,1,4,4,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
45,45,1,19,19,76,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
46,46,1,15,15,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
47,47,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
48,48,1,3,3,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
49,49,1,39,39,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
50,50,1,47,47,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
51,51,1,35,35,56,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
52,52,1,51,51,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
53,53,1,9,9,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
54,54,1,4,4,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
55,55,1,83,83,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
56,56,1,102,102,35,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
57,57,1,35,35,30,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
58,58,1,15,15,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
59,59,1,29,29,56,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
60,60,1,9,9,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
61,61,1,29,29,75,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
62,62,1,86,86,6,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
63,63,1,25,25,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
64,64,1,108,108,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
65,65,1,59,59,16,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
66,66,1,82,82,4,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
67,67,1,21,21,76,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
68,68,1,25,25,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
69,69,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
70,70,1,6,6,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
71,71,1,8,8,11,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
72,72,1,51,51,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
73,73,1,90,90,3,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
74,74,1,3,3,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
75,75,1,10,10,11,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
76,76,1,13,13,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
77,77,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
78,78,1,57,57,6,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
79,79,1,36,36,78,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
80,80,1,46,46,48,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
81,81,1,19,19,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
82,82,1,62,62,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
83,83,1,27,27,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
84,84,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
85,85,1,11,11,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
86,86,1,13,13,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
87,87,1,101,101,6,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
88,88,1,23,23,53,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
89,89,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
90,90,1,73,73,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
91,91,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
92,92,1,4,4,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
93,93,1,6,6,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
94,94,1,103,103,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
95,95,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
96,96,1,40,40,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
97,97,1,4,4,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
98,98,1,4,4,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
99,99,1,11,11,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
100,100,1,44,44,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
101,101,1,99,99,30,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
102,102,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
103,103,1,108,108,74,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
104,104,1,108,108,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
105,105,1,5,5,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
106,106,1,9,9,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
107,107,1,4,4,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
108,108,1,73,73,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
109,109,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
110,110,1,107,107,36,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
111,111,1,15,15,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
112,112,1,13,13,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
113,113,1,19,19,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
114,114,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
115,115,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
116,116,1,97,97,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
117,117,1,42,42,24,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
118,118,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
119,119,1,23,23,83,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
120,120,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
121,121,1,62,62,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
122,122,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
123,123,1,3,3,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
124,124,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
125,125,1,10,10,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
126,126,1,36,36,83,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
127,127,1,64,64,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
128,128,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
129,129,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
130,130,1,51,51,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
131,131,1,104,104,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
132,132,1,25,25,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
133,133,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
134,134,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
135,135,1,106,106,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
136,136,1,23,23,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
137,137,1,94,94,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
138,138,1,15,15,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
139,139,1,11,11,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
140,140,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
141,141,1,47,47,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
142,142,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
143,143,1,95,95,25,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
144,144,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
145,145,1,40,40,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
146,146,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
147,147,1,24,24,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
148,148,1,3,3,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
149,149,1,12,12,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
150,150,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
151,151,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
152,152,1,6,6,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
153,153,1,13,13,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
154,154,1,4,4,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
155,155,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
156,156,1,8,8,11,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
157,157,1,13,13,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
158,158,1,4,4,11,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
159,159,1,72,72,17,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
160,160,1,59,59,17,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
161,161,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
162,162,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
163,163,1,51,51,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
164,164,1,51,51,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
165,165,1,5,5,4,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
166,166,1,19,19,76,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
167,167,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
168,168,1,92,92,17,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
169,169,1,37,37,55,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
170,170,1,4,4,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
171,171,1,25,25,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
172,172,1,41,41,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
173,173,1,15,15,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
174,174,1,6,6,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
175,175,1,108,108,42,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
176,176,1,12,12,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
177,177,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
178,178,1,101,101,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
179,179,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
180,180,1,51,51,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
181,181,1,95,95,57,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
182,182,1,101,101,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
183,183,1,52,52,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
184,184,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
185,185,1,12,12,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
186,186,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
187,187,1,64,64,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
188,188,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
189,189,1,47,47,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
190,190,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
191,191,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
192,192,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
193,193,1,49,49,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
194,194,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
195,195,1,13,13,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
196,196,1,36,36,78,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
197,197,1,9,9,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
198,198,1,4,4,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
199,199,1,61,61,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
200,200,1,44,44,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
201,201,1,34,34,75,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
202,202,1,56,56,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
203,203,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
204,204,1,16,16,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
205,205,1,65,65,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
206,206,1,5,5,11,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
207,207,1,95,95,25,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
208,208,1,9,9,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
209,209,1,23,23,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
210,210,1,2,2,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
211,211,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
212,212,1,19,19,68,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
213,213,1,10,10,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
214,214,1,40,40,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
215,215,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
216,216,1,10,10,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
217,217,1,12,12,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
218,218,1,8,8,11,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
219,219,1,9,9,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
220,220,1,95,95,25,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
221,221,1,36,36,48,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
222,222,1,90,90,77,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
223,223,1,12,12,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
224,224,1,16,16,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
225,225,1,29,29,10,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
226,226,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
227,227,1,19,19,76,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
228,228,1,11,11,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
229,229,1,43,43,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
230,230,1,74,74,74,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
231,231,1,9,9,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
232,232,1,43,43,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
233,233,1,43,43,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
234,234,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
235,235,1,90,90,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
236,236,1,4,4,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
237,237,1,23,23,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
238,238,1,13,13,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
239,239,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
240,240,1,36,36,78,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
241,241,1,39,39,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
242,242,1,61,61,57,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
243,243,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
244,244,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
245,245,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
246,246,1,6,6,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
247,247,1,47,47,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
248,248,1,13,13,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
249,249,1,3,3,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
250,250,1,82,82,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
251,251,1,2,2,6,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
252,252,1,90,90,5,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
253,253,1,73,73,40,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
254,254,1,108,108,33,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
255,255,1,29,29,10,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
256,256,1,108,108,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
257,257,1,22,22,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
258,258,1,73,73,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
259,259,1,41,41,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
260,260,1,69,69,33,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
261,261,1,33,33,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
262,262,1,23,23,76,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
263,263,1,13,13,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
264,264,1,89,89,2,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
265,265,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
266,266,1,9,9,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
267,267,1,13,13,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
268,268,1,9,9,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
269,269,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
270,270,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
271,271,1,40,40,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
272,272,1,59,59,30,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
273,273,1,29,29,56,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
274,274,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
275,275,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
276,276,1,11,11,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
277,277,1,34,34,56,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
278,278,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
279,279,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
280,280,1,4,4,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
281,281,1,11,11,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
282,282,1,3,3,57,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
283,283,1,104,104,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
284,284,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
285,285,1,106,106,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
286,286,1,6,6,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
287,287,1,25,25,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
288,288,1,94,94,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
289,289,1,108,108,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
290,290,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
291,291,1,44,44,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
292,292,1,95,95,25,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
293,293,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
294,294,1,84,84,33,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
295,295,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
296,296,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
297,297,1,15,15,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
298,298,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
299,299,1,19,19,76,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
300,300,1,101,101,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
301,301,1,108,108,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
302,302,1,42,42,24,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
303,303,1,39,39,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
304,304,1,95,95,25,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
305,305,1,19,19,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
306,306,1,6,6,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
307,307,1,90,90,17,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
308,308,1,69,69,16,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
309,309,1,9,9,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
310,310,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
311,311,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
312,312,1,10,10,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
313,313,1,51,51,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
314,314,1,1,1,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
315,315,1,37,37,55,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
316,316,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
317,317,1,44,44,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
318,318,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
319,319,1,108,108,33,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
320,320,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
321,321,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
322,322,1,6,6,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
323,323,1,20,20,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
324,324,1,9,9,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
325,325,1,71,71,33,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
326,326,1,44,44,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
327,327,1,13,13,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
328,328,1,25,25,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
329,329,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
330,330,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
331,331,1,13,13,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
332,332,1,95,95,25,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
333,333,1,15,15,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
334,334,1,18,18,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
335,335,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
336,336,1,9,9,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
337,337,1,23,23,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
338,338,1,10,10,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
339,339,1,62,62,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
340,340,1,82,82,6,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
341,341,1,108,108,6,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
342,342,1,23,23,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
343,343,1,25,25,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
344,344,1,10,10,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
345,345,1,13,13,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
346,346,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
347,347,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
348,348,1,8,8,17,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
349,349,1,4,4,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
350,350,1,4,4,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
351,351,1,6,6,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
352,352,1,63,63,6,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
353,353,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
354,354,1,94,94,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
355,355,1,8,8,58,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
356,356,1,3,3,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
357,357,1,98,98,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
358,358,1,4,4,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
359,359,1,15,15,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
360,360,1,13,13,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
361,361,1,10,10,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
362,362,1,106,106,34,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
363,363,1,31,31,10,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
364,364,1,89,89,83,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
365,365,1,72,72,16,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
366,366,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
367,367,1,62,62,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
368,368,1,6,6,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
369,369,1,4,4,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
370,370,1,51,51,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
371,371,1,3,3,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
372,372,1,95,95,25,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
373,373,1,42,42,24,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
374,374,1,9,9,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
375,375,1,6,6,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
376,376,1,64,64,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
377,377,1,29,29,75,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
378,378,1,29,29,75,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
379,379,1,46,46,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
380,380,1,44,44,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
381,381,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
382,382,1,90,90,17,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
383,383,1,38,38,10,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
384,384,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
385,385,1,94,94,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
386,386,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
387,387,1,51,51,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
388,388,1,73,73,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
389,389,1,9,9,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
390,390,1,68,68,6,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
391,391,1,28,28,56,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
392,392,1,43,43,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
393,393,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
394,394,1,10,10,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
395,395,1,13,13,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
396,396,1,62,62,45,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
397,397,1,59,59,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
398,398,1,15,15,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
399,399,1,63,63,6,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
400,400,1,9,9,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
401,401,1,106,106,33,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
402,402,1,44,44,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
403,403,1,34,34,56,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
404,404,1,51,51,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
405,405,1,82,82,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
406,406,1,51,51,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
407,407,1,64,64,6,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
408,408,1,13,13,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
409,409,1,4,4,4,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
410,410,1,24,24,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
411,411,1,21,21,21,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
412,412,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
413,413,1,71,71,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
414,414,1,3,3,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
415,415,1,9,9,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
416,416,1,51,51,45,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
417,417,1,104,104,70,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
418,418,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
419,419,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
420,420,1,5,5,9,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
421,421,1,104,104,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
422,422,1,19,19,76,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
423,423,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
424,424,1,36,36,17,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
425,425,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
426,426,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
427,427,1,73,73,17,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
428,428,1,15,15,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
429,429,1,41,41,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
430,430,1,38,38,10,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
431,431,1,44,44,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
432,432,1,90,90,40,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
433,433,1,82,82,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
434,434,1,15,15,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
435,435,1,12,12,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
436,436,1,9,9,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
437,437,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
438,438,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
439,439,1,64,64,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
440,440,1,51,51,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
441,441,1,80,80,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
442,442,1,73,73,78,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
443,443,1,44,44,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
444,444,1,99,99,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
445,445,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
446,446,1,106,106,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
447,447,1,33,33,30,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
448,448,1,68,68,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
449,449,1,42,42,24,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
450,450,1,8,8,11,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
451,451,1,9,9,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
452,452,1,16,16,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
453,453,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
454,454,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
455,455,1,12,12,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
456,456,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
457,457,1,51,51,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
458,458,1,62,62,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
459,459,1,3,3,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
460,460,1,81,81,6,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
461,461,1,6,6,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
462,462,1,13,13,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
463,463,1,100,100,33,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
464,464,1,4,4,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
465,465,1,51,51,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
466,466,1,61,61,26,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
467,467,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
468,468,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
469,469,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
470,470,1,40,40,45,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
471,471,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
472,472,1,1,1,57,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
473,473,1,11,11,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
474,474,1,33,33,10,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
475,475,1,9,9,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
476,476,1,13,13,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
477,477,1,51,51,16,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
478,478,1,89,89,16,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
479,479,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
480,480,1,106,106,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
481,481,1,4,4,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
482,482,1,99,99,16,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
483,483,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
484,484,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
485,485,1,94,94,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
486,486,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
487,487,1,4,4,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
488,488,1,3,3,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
489,489,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
490,490,1,15,15,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
491,491,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
492,492,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
493,493,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
494,494,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
495,495,1,4,4,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
496,496,1,11,11,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
497,497,1,23,23,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
498,498,1,36,36,78,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
499,499,1,21,21,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
500,500,1,4,4,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
501,501,1,103,103,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
502,502,1,29,29,75,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
503,503,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
504,504,1,89,89,2,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
505,505,1,34,34,75,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
506,506,1,34,34,75,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
507,507,1,4,4,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
508,508,1,22,22,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
509,509,1,10,10,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
510,510,1,8,8,2,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
511,511,1,10,10,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
512,512,1,82,82,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
513,513,1,83,83,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
514,514,1,19,19,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
515,515,1,10,10,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
516,516,1,75,75,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
517,517,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
518,518,1,9,9,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
519,519,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
520,520,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
521,521,1,40,40,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
522,522,1,6,6,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
523,523,1,2,2,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
524,524,1,47,47,55,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
525,525,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
526,526,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
527,527,1,106,106,34,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
528,528,1,13,13,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
529,529,1,6,6,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
530,530,1,46,46,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
531,531,1,18,18,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
532,532,1,23,23,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
533,533,1,23,23,76,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
534,534,1,24,24,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
535,535,1,21,21,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
536,536,1,9,9,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
537,537,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
538,538,1,44,44,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
539,539,1,5,5,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
540,540,1,36,36,78,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
541,541,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
542,542,1,20,20,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
543,543,1,50,50,47,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
544,544,1,51,51,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
545,545,1,84,84,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
546,546,1,46,46,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
547,547,1,51,51,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
548,548,1,39,39,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
549,549,1,104,104,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
550,550,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
551,551,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
552,552,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
553,553,1,29,29,75,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
554,554,1,71,71,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
555,555,1,44,44,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
556,556,1,60,60,16,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
557,557,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
558,558,1,6,6,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
559,559,1,34,34,56,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
560,560,1,15,15,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
561,561,1,47,47,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
562,562,1,19,19,68,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
563,563,1,19,19,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
564,564,1,11,11,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
565,565,1,36,36,78,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
566,566,1,6,6,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
567,567,1,61,61,6,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
568,568,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
569,569,1,44,44,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
570,570,1,24,24,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
571,571,1,43,43,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
572,572,1,34,34,56,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
573,573,1,68,68,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
574,574,1,64,64,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
575,575,1,89,89,2,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
576,576,1,90,90,2,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
577,577,1,19,19,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
578,578,1,92,92,2,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
579,579,1,36,36,78,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
580,580,1,29,29,75,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
581,581,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
582,582,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
583,583,1,13,13,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
584,584,1,70,70,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
585,585,1,44,44,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
586,586,1,28,28,56,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
587,587,1,15,15,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
588,588,1,26,26,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
589,589,1,23,23,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
590,590,1,43,43,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
591,591,1,92,92,52,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
592,592,1,23,23,76,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
593,593,1,29,29,56,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
594,594,1,51,51,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
595,595,1,4,4,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
596,596,1,51,51,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
597,597,1,10,10,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
598,598,1,10,10,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
599,599,1,11,11,11,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
600,600,1,10,10,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
601,601,1,73,73,81,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
602,602,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
603,603,1,51,51,47,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
604,604,1,105,105,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
605,605,1,69,69,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
606,606,1,43,43,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
607,607,1,51,51,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
608,608,1,62,62,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
609,609,1,29,29,75,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
610,610,1,29,29,10,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
611,611,1,63,63,57,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
612,612,1,44,44,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
613,613,1,11,11,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
614,614,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
615,615,1,36,36,2,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
616,616,1,106,106,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
617,617,1,36,36,78,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
618,618,1,9,9,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
619,619,1,13,13,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
620,620,1,36,36,14,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
621,621,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
622,622,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
623,623,1,13,13,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
624,624,1,23,23,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
625,625,1,12,12,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
626,626,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
627,627,1,101,101,40,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
628,628,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
629,629,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
630,630,1,74,74,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
631,631,1,42,42,24,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
632,632,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
633,633,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
634,634,1,90,90,17,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
635,635,1,92,92,2,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
636,636,1,6,6,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
637,637,1,19,19,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
638,638,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
639,639,1,37,37,55,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
640,640,1,36,36,78,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
641,641,1,68,68,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
642,642,1,62,62,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
643,643,1,27,27,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
644,644,1,89,89,2,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
645,645,1,9,9,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
646,646,1,11,11,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
647,647,1,31,31,10,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
648,648,1,51,51,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
649,649,1,23,23,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
650,650,1,108,108,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
651,651,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
652,652,1,4,4,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
653,653,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
654,654,1,76,76,33,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
655,655,1,86,86,7,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
656,656,1,37,37,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
657,657,1,44,44,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
658,658,1,19,19,76,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
659,659,1,15,15,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
660,660,1,23,23,83,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
661,661,1,71,71,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
662,662,1,104,104,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
663,663,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
664,664,1,13,13,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
665,665,1,73,73,81,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
666,666,1,23,23,21,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
667,667,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
668,668,1,44,44,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
669,669,1,67,67,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
670,670,1,6,6,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
671,671,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
672,672,1,51,51,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
673,673,1,6,6,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
674,674,1,44,44,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
675,675,1,23,23,76,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
676,676,1,51,51,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
677,677,1,34,34,75,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
678,678,1,23,23,76,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
679,679,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
680,680,1,6,6,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
681,681,1,42,42,24,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
682,682,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
683,683,1,90,90,2,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
684,684,1,69,69,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
685,685,1,13,13,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
686,686,1,34,34,75,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
687,687,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
688,688,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
689,689,1,73,73,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
690,690,1,51,51,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
691,691,1,10,10,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
692,692,1,11,11,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
693,693,1,47,47,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
694,694,1,43,43,57,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
695,695,1,95,95,25,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
696,696,1,71,71,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
697,697,1,47,47,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
698,698,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
699,699,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
700,700,1,36,36,17,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
701,701,1,43,43,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
702,702,1,6,6,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
703,703,1,11,11,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
704,704,1,99,99,33,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
705,705,1,81,81,6,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
706,706,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
707,707,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
708,708,1,94,94,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
709,709,1,23,23,47,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
710,710,1,4,4,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
711,711,1,3,3,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
712,712,1,15,15,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
713,713,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
714,714,1,81,81,6,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
715,715,1,71,71,16,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
716,716,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
717,717,1,51,51,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
718,718,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
719,719,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
720,720,1,104,104,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
721,721,1,19,19,17,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
722,722,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
723,723,1,6,6,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
724,724,1,46,46,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
725,725,1,44,44,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
726,726,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
727,727,1,106,106,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
728,728,1,108,108,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
729,729,1,24,24,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
730,730,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
731,731,1,90,90,40,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
732,732,1,4,4,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
733,733,1,62,62,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
734,734,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
735,735,1,4,4,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
736,736,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
737,737,1,108,108,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
738,738,1,13,13,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
739,739,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
740,740,1,15,15,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
741,741,1,9,9,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
742,742,1,51,51,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
743,743,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
744,744,1,36,36,2,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
745,745,1,64,64,17,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
746,746,1,36,36,78,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
747,747,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
748,748,1,51,51,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
749,749,1,10,10,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
750,750,1,15,15,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
751,751,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
752,752,1,13,13,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
753,753,1,64,64,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
754,754,1,11,11,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
755,755,1,44,44,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
756,756,1,40,40,47,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
757,757,1,24,24,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
758,758,1,6,6,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
759,759,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
760,760,1,29,29,84,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
761,761,1,82,82,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
762,762,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
763,763,1,34,34,75,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
764,764,1,16,16,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
765,765,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
766,766,1,2,2,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
767,767,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
768,768,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
769,769,1,21,21,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
770,770,1,10,10,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
771,771,1,5,5,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
772,772,1,23,23,76,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
773,773,1,23,23,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
774,774,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
775,775,1,107,107,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
776,776,1,108,108,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
777,777,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
778,778,1,85,85,60,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
779,779,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
780,780,1,51,51,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
781,781,1,29,29,75,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
782,782,1,106,106,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
783,783,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
784,784,1,4,4,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
785,785,1,36,36,78,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
786,786,1,36,36,78,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
787,787,1,21,21,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
788,788,1,4,4,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
789,789,1,50,50,57,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
790,790,1,3,3,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
791,791,1,12,12,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
792,792,1,29,29,75,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
793,793,1,13,13,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
794,794,1,3,3,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
795,795,1,51,51,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
796,796,1,6,6,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
797,797,1,5,5,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
798,798,1,2,2,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
799,799,1,13,13,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
800,800,1,9,9,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
801,801,1,47,47,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
802,802,1,4,4,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
803,803,1,62,62,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
804,804,1,11,11,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
805,805,1,51,51,45,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
806,806,1,46,46,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
807,807,1,90,90,2,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
808,808,1,62,62,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
809,809,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
810,810,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
811,811,1,6,6,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
812,812,1,104,104,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
813,813,1,106,106,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
814,814,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
815,815,1,46,46,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
816,816,1,19,19,76,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
817,817,1,9,9,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
818,818,1,13,13,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
819,819,1,103,103,79,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
820,820,1,12,12,11,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
821,821,1,36,36,78,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
822,822,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
823,823,1,13,13,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
824,824,1,24,24,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
825,825,1,60,60,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
826,826,1,20,20,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
827,827,1,25,25,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
828,828,1,51,51,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
829,829,1,47,47,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
830,830,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
831,831,1,23,23,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
832,832,1,23,23,17,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
833,833,1,51,51,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
834,834,1,31,31,10,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
835,835,1,73,73,79,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
836,836,1,85,85,15,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
837,837,1,90,90,17,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
838,838,1,62,62,83,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
839,839,1,19,19,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
840,840,1,6,6,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
841,841,1,62,62,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
842,842,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
843,843,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
844,844,1,89,89,17,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
845,845,1,57,57,74,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
846,846,1,95,95,25,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
847,847,1,92,92,17,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
848,848,1,29,29,75,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
849,849,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
850,850,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
851,851,1,13,13,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
852,852,1,24,24,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
853,853,1,91,91,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
854,854,1,34,34,75,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
855,855,1,4,4,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
856,856,1,28,28,56,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
857,857,1,51,51,45,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
858,858,1,70,70,57,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
859,859,1,15,15,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
860,860,1,9,9,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
861,861,1,3,3,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
862,862,1,3,3,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
863,863,1,108,108,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
864,864,1,63,63,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
865,865,1,9,9,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
866,866,1,62,62,47,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
867,867,1,51,51,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
868,868,1,51,51,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
869,869,1,13,13,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
870,870,1,90,90,2,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
871,871,1,15,15,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
872,872,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
873,873,1,1,1,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
874,874,1,3,3,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
875,875,1,108,108,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
876,876,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
877,877,1,21,21,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
878,878,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
879,879,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
880,880,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
881,881,1,38,38,57,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
882,882,1,11,11,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
883,883,1,3,3,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
884,884,1,108,108,74,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
885,885,1,9,9,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
886,886,1,6,6,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
887,887,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
888,888,1,9,9,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
889,889,1,29,29,56,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
890,890,1,23,23,68,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
891,891,1,19,19,68,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
892,892,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
893,893,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
894,894,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
895,895,1,25,25,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
896,896,1,69,69,6,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
897,897,1,35,35,56,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
898,898,1,4,4,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
899,899,1,90,90,31,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
900,900,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
901,901,1,94,94,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
902,902,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
903,903,1,106,106,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
904,904,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
905,905,1,8,8,4,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
906,906,1,23,23,17,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
907,907,1,29,29,75,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
908,908,1,21,21,47,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
909,909,1,102,102,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
910,910,1,19,19,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
911,911,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
912,912,1,66,66,6,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
913,913,1,62,62,47,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
914,914,1,34,34,75,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
915,915,1,31,31,10,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
916,916,1,13,13,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
917,917,1,41,41,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
918,918,1,72,72,33,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
919,919,1,44,44,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
920,920,1,13,13,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
921,921,1,90,90,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
922,922,1,47,47,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
923,923,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
924,924,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
925,925,1,36,36,48,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
926,926,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
927,927,1,23,23,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
928,928,1,6,6,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
929,929,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
930,930,1,4,4,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
931,931,1,34,34,56,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
932,932,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
933,933,1,36,36,2,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
934,934,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
935,935,1,4,4,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
936,936,1,72,72,2,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
937,937,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
938,938,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
939,939,1,4,4,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
940,940,1,94,94,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
941,941,1,15,15,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
942,942,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
943,943,1,62,62,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
944,944,1,40,40,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
945,945,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
946,946,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
947,947,1,13,13,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
948,948,1,15,15,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
949,949,1,34,34,56,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
950,950,1,31,31,10,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
951,951,1,21,21,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
952,952,1,6,6,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
953,953,1,15,15,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
954,954,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
955,955,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
956,956,1,23,23,15,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
957,957,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
958,958,1,27,27,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
959,959,1,69,69,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
960,960,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
961,961,1,51,51,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
962,962,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
963,963,1,15,15,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
964,964,1,15,15,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
965,965,1,21,21,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
966,966,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
967,967,1,36,36,48,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
968,968,1,39,39,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
969,969,1,13,13,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
970,970,1,10,10,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
971,971,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
972,972,1,36,36,78,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
973,973,1,40,40,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
974,974,1,5,5,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
975,975,1,29,29,10,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
976,976,1,51,51,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
977,977,1,4,4,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
978,978,1,4,4,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
979,979,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
980,980,1,36,36,78,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
981,981,1,27,27,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
982,982,1,4,4,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
983,983,1,38,38,10,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
984,984,1,35,35,56,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
985,985,1,31,31,10,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
986,986,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
987,987,1,2,2,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
988,988,1,6,6,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
989,989,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
990,990,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
991,991,1,40,40,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
992,992,1,21,21,21,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
993,993,1,21,21,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
994,994,1,106,106,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
995,995,1,46,46,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
996,996,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
997,997,1,9,9,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
998,998,1,24,24,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
999,999,1,42,42,24,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1000,1000,1,94,94,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1001,1001,1,13,13,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1002,1002,1,6,6,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1003,1003,1,71,71,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1004,1004,1,5,5,4,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1005,1005,1,101,101,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1006,1006,1,37,37,55,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1007,1007,1,94,94,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1008,1008,1,104,104,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1009,1009,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1010,1010,1,75,75,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1011,1011,1,103,103,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1012,1012,1,28,28,75,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1013,1013,1,19,19,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1014,1014,1,92,92,77,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1015,1015,1,44,44,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1016,1016,1,13,13,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1017,1017,1,24,24,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1018,1018,1,44,44,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1019,1019,1,46,46,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1020,1020,1,12,12,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1021,1021,1,51,51,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1022,1022,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1023,1023,1,29,29,56,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1024,1024,1,105,105,33,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1025,1025,1,103,103,57,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1026,1026,1,24,24,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1027,1027,1,27,27,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1028,1028,1,19,19,76,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1029,1029,1,36,36,17,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1030,1030,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1031,1031,1,95,95,25,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1032,1032,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1033,1033,1,3,3,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1034,1034,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1035,1035,1,90,90,17,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1036,1036,1,3,3,2,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1037,1037,1,12,12,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1038,1038,1,47,47,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1039,1039,1,71,71,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1040,1040,1,23,23,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1041,1041,1,72,72,17,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1042,1042,1,31,31,10,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1043,1043,1,47,47,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1044,1044,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1045,1045,1,19,19,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1046,1046,1,6,6,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1047,1047,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1048,1048,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1049,1049,1,9,9,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1050,1050,1,16,16,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1051,1051,1,50,50,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1052,1052,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1053,1053,1,23,23,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1054,1054,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1055,1055,1,11,11,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1056,1056,1,9,9,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1057,1057,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1058,1058,1,11,11,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1059,1059,1,44,44,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1060,1060,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1061,1061,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1062,1062,1,23,23,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1063,1063,1,19,19,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1064,1064,1,6,6,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1065,1065,1,16,16,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1066,1066,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1067,1067,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1068,1068,1,44,44,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1069,1069,1,23,23,76,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1070,1070,1,44,44,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1071,1071,1,64,64,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1072,1072,1,9,9,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1073,1073,1,59,59,31,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1074,1074,1,72,72,6,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1075,1075,1,39,39,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1076,1076,1,9,9,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1077,1077,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1078,1078,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1079,1079,1,51,51,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1080,1080,1,15,15,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1081,1081,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1082,1082,1,4,4,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1083,1083,1,44,44,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1084,1084,1,4,4,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1085,1085,1,84,84,35,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1086,1086,1,24,24,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1087,1087,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1088,1088,1,57,57,2,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1089,1089,1,36,36,78,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1090,1090,1,20,20,51,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1091,1091,1,23,23,76,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1092,1092,1,101,101,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1093,1093,1,63,63,23,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1094,1094,1,22,22,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1095,1095,1,15,15,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1096,1096,1,10,10,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1097,1097,1,67,67,26,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1098,1098,1,34,34,75,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1099,1099,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1100,1100,1,19,19,76,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1101,1101,1,36,36,78,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1102,1102,1,50,50,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1103,1103,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1104,1104,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1105,1105,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1106,1106,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1107,1107,1,10,10,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1108,1108,1,39,39,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1109,1109,1,28,28,56,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1110,1110,1,43,43,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1111,1111,1,10,10,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1112,1112,1,58,58,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1113,1113,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1114,1114,1,4,4,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1115,1115,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1116,1116,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1117,1117,1,103,103,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1118,1118,1,47,47,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1119,1119,1,36,36,48,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1120,1120,1,9,9,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1121,1121,1,40,40,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1122,1122,1,1,1,57,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1123,1123,1,9,9,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1124,1124,1,38,38,10,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1125,1125,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1126,1126,1,3,3,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1127,1127,1,21,21,76,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1128,1128,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1129,1129,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1130,1130,1,44,44,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1131,1131,1,21,21,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1132,1132,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1133,1133,1,5,5,17,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1134,1134,1,23,23,6,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1135,1135,1,98,98,1,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1136,1136,1,51,51,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1137,1137,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1138,1138,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1139,1139,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1140,1140,1,13,13,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1141,1141,1,23,23,68,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1142,1142,1,97,97,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1143,1143,1,97,97,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1144,1144,1,80,80,33,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1145,1145,1,19,19,76,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1146,1146,1,9,9,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1147,1147,1,51,51,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1148,1148,1,95,95,25,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1149,1149,1,51,51,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1150,1150,1,21,21,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1151,1151,1,15,15,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1152,1152,1,24,24,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1153,1153,1,46,46,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1154,1154,1,82,82,67,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1155,1155,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1156,1156,1,63,63,2,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1157,1157,1,50,50,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1158,1158,1,106,106,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1159,1159,1,73,73,2,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1160,1160,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1161,1161,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1162,1162,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1163,1163,1,9,9,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1164,1164,1,24,24,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1165,1165,1,64,64,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1166,1166,1,51,51,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1167,1167,1,29,29,75,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1168,1168,1,9,9,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1169,1169,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1170,1170,1,44,44,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1171,1171,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1172,1172,1,20,20,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1173,1173,1,10,10,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1174,1174,1,29,29,56,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1175,1175,1,37,37,55,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1176,1176,1,19,19,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1177,1177,1,4,4,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1178,1178,1,13,13,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1179,1179,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1180,1180,1,39,39,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1181,1181,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1182,1182,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1183,1183,1,44,44,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1184,1184,1,90,90,17,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1185,1185,1,8,8,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1186,1186,1,6,6,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1187,1187,1,25,25,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1188,1188,1,60,60,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1189,1189,1,46,46,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1190,1190,1,2,2,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1191,1191,1,21,21,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1192,1192,1,19,19,82,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1193,1193,1,29,29,75,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1194,1194,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1195,1195,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1196,1196,1,6,6,17,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1197,1197,1,24,24,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1198,1198,1,9,9,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1199,1199,1,10,10,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1200,1200,1,90,90,17,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1201,1201,1,8,8,11,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1202,1202,1,22,22,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1203,1203,1,37,37,55,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1204,1204,1,9,9,57,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1205,1205,1,46,46,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1206,1206,1,31,31,10,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1207,1207,1,3,3,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1208,1208,1,8,8,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1209,1209,1,3,3,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1210,1210,1,81,81,65,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1211,1211,1,13,13,32,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1212,1212,1,94,94,47,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1213,1213,1,51,51,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1214,1214,1,24,24,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1215,1215,1,44,44,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1216,1216,1,94,94,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1217,1217,1,53,53,49,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1218,1218,1,44,44,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1219,1219,1,11,11,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1220,1220,1,34,34,75,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1221,1221,1,44,44,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1222,1222,1,44,44,46,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1223,1223,1,24,24,43,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1224,1224,1,82,82,6,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1225,1225,1,5,5,73,'','2022-02-01  00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01  00:00:00',NULL,NULL,NULL,NULL),(
1226,1226,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1227,1227,1,38,38,84,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1228,1228,1,28,28,75,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1229,1229,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1230,1230,1,102,102,65,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1231,1231,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1232,1232,1,75,75,92,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1233,1233,1,107,107,38,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1234,1234,1,100,100,41,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1235,1235,1,94,94,81,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1236,1236,1,70,70,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1237,1237,1,102,102,65,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1238,1238,1,75,75,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1239,1239,1,41,41,9,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1240,1240,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1241,1241,1,25,25,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1242,1242,1,1,1,28,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1243,1243,1,42,42,24,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1244,1244,1,96,96,65,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1245,1245,1,96,96,65,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1246,1246,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1247,1247,1,100,100,6,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1248,1248,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1249,1249,1,94,94,65,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1250,1250,1,107,107,2,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1251,1251,1,105,105,17,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1252,1252,1,107,107,77,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1253,1253,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1254,1254,1,94,94,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1255,1255,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1256,1256,1,106,106,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1257,1257,1,95,95,8,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1258,1258,1,105,105,1,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1259,1259,1,107,107,77,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1260,1260,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1261,1261,1,102,102,37,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1262,1262,1,1,1,89,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1263,1263,1,105,105,6,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1264,1264,1,105,105,65,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1265,1265,1,102,102,28,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1266,1266,1,102,102,54,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1267,1267,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1268,1268,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1269,1269,1,102,102,70,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1270,1270,1,98,98,1,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1271,1271,1,102,102,65,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1272,1272,1,99,99,6,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1273,1273,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1274,1274,1,28,28,75,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1275,1275,1,94,94,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1276,1276,1,107,107,65,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1277,1277,1,107,107,87,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1278,1278,1,75,75,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1279,1279,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1280,1280,1,70,70,81,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1281,1281,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1282,1282,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1283,1283,1,102,102,16,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1284,1284,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1285,1285,1,36,36,14,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1286,1286,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1287,1287,1,28,28,75,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1288,1288,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1289,1289,1,107,107,66,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1290,1290,1,106,106,56,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1291,1291,1,1,1,89,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1292,1292,1,94,94,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1293,1293,1,106,106,49,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1294,1294,1,94,94,49,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1295,1295,1,107,107,87,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1296,1296,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1297,1297,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1298,1298,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1299,1299,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1300,1300,1,107,107,40,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1301,1301,1,106,106,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1302,1302,1,105,105,33,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1303,1303,1,1,1,87,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1304,1304,1,106,106,65,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1305,1305,1,106,106,28,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1306,1306,1,108,108,29,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1307,1307,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1308,1308,1,70,70,82,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1309,1309,1,39,39,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1310,1310,1,94,94,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1311,1311,1,95,95,8,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1312,1312,1,100,100,6,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1313,1313,1,75,75,57,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1314,1314,1,70,70,12,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1315,1315,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1316,1316,1,70,70,28,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1317,1317,1,1,1,9,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1318,1318,1,75,75,82,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1319,1319,1,97,97,6,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1320,1320,1,75,75,82,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1321,1321,1,33,33,28,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1322,1322,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1323,1323,1,105,105,41,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1324,1324,1,61,61,65,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1325,1325,1,41,41,28,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1326,1326,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1327,1327,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1328,1328,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1329,1329,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1330,1330,1,70,70,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1331,1331,1,75,75,57,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1332,1332,1,105,105,65,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1333,1333,1,3,3,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1334,1334,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1335,1335,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1336,1336,1,39,39,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1337,1337,1,41,41,57,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1338,1338,1,28,28,75,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1339,1339,1,95,95,9,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1340,1340,1,70,70,28,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1341,1341,1,61,61,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1342,1342,1,70,70,57,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1343,1343,1,75,75,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1344,1344,1,75,75,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1345,1345,1,34,34,56,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1346,1346,1,102,102,50,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1347,1347,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1348,1348,1,39,39,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1349,1349,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1350,1350,1,41,41,16,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1351,1351,1,94,94,49,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1352,1352,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1353,1353,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1354,1354,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1355,1355,1,100,100,22,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1356,1356,1,70,70,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1357,1357,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1358,1358,1,1,1,89,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1359,1359,1,106,106,44,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1360,1360,1,38,38,84,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1361,1361,1,102,102,37,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1362,1362,1,94,94,49,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1363,1363,1,99,99,6,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1364,1364,1,70,70,76,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1365,1365,1,105,105,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1366,1366,1,61,61,29,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1367,1367,1,105,105,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1368,1368,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1369,1369,1,75,75,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1370,1370,1,39,39,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1371,1371,1,75,75,82,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1372,1372,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1373,1373,1,70,70,76,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1374,1374,1,95,95,8,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1375,1375,1,28,28,75,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1376,1376,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1377,1377,1,102,102,18,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1378,1378,1,75,75,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1379,1379,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1380,1380,1,97,97,65,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1381,1381,1,94,94,49,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1382,1382,1,34,34,56,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1383,1383,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1384,1384,1,102,102,50,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1385,1385,1,102,102,74,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1386,1386,1,34,34,56,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1387,1387,1,39,39,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1388,1388,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1389,1389,1,100,100,22,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1390,1390,1,94,94,28,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1391,1391,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1392,1392,1,102,102,28,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1393,1393,1,97,97,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1394,1394,1,100,100,9,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1395,1395,1,106,106,65,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1396,1396,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1397,1397,1,102,102,28,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1398,1398,1,94,94,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1399,1399,1,108,108,85,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1400,1400,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1401,1401,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1402,1402,1,96,96,33,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1403,1403,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1404,1404,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1405,1405,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1406,1406,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1407,1407,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1408,1408,1,1,1,89,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1409,1409,1,1,1,89,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1410,1410,1,1,1,28,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1411,1411,1,28,28,75,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1412,1412,1,39,39,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1413,1413,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1414,1414,1,39,39,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1415,1415,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1416,1416,1,99,99,16,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1417,1417,1,106,106,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1418,1418,1,107,107,65,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1419,1419,1,107,107,2,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1420,1420,1,106,106,65,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1421,1421,1,1,1,28,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1422,1422,1,1,1,89,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1423,1423,1,61,61,88,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1424,1424,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1425,1425,1,75,75,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1426,1426,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1427,1427,1,106,106,6,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1428,1428,1,106,106,65,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1429,1429,1,106,106,49,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1430,1430,1,70,70,82,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1431,1431,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1432,1432,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1433,1433,1,70,70,28,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1434,1434,1,102,102,18,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1435,1435,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1436,1436,1,1,1,89,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1437,1437,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1438,1438,1,36,36,78,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1439,1439,1,106,106,49,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1440,1440,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1441,1441,1,102,102,28,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1442,1442,1,3,3,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1443,1443,1,100,100,6,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1444,1444,1,39,39,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1445,1445,1,28,28,75,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1446,1446,1,102,102,28,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1447,1447,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1448,1448,1,25,25,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1449,1449,1,61,61,16,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1450,1450,1,28,28,75,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1451,1451,1,3,3,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1452,1452,1,102,102,28,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1453,1453,1,107,107,91,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1454,1454,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1455,1455,1,75,75,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1456,1456,1,70,70,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1457,1457,1,41,41,57,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1458,1458,1,100,100,33,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1459,1459,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1460,1460,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1461,1461,1,99,99,6,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1462,1462,1,106,106,16,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1463,1463,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1464,1464,1,75,75,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1465,1465,1,105,105,81,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1466,1466,1,75,75,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1467,1467,1,102,102,18,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1468,1468,1,107,107,77,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1469,1469,1,36,36,78,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1470,1470,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1471,1471,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1472,1472,1,36,36,78,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1473,1473,1,107,107,87,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1474,1474,1,39,39,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1475,1475,1,94,94,6,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1476,1476,1,105,105,90,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1477,1477,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1478,1478,1,107,107,87,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1479,1479,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1480,1480,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1481,1481,1,75,75,92,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1482,1482,1,94,94,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1483,1483,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1484,1484,1,100,100,6,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1485,1485,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1486,1486,1,36,36,48,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1487,1487,1,96,96,6,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1488,1488,1,101,101,28,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1489,1489,1,94,94,49,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1490,1490,1,100,100,22,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1491,1491,1,33,33,28,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1492,1492,1,102,102,28,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1493,1493,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1494,1494,1,100,100,22,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1495,1495,1,61,61,70,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1496,1496,1,70,70,82,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1497,1497,1,107,107,77,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1498,1498,1,94,94,57,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1499,1499,1,28,28,75,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1500,1500,1,102,102,16,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1501,1501,1,99,99,6,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1502,1502,1,34,34,56,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1503,1503,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1504,1504,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1505,1505,1,107,107,2,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1506,1506,1,1,1,73,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1507,1507,1,94,94,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1508,1508,1,1,1,89,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1509,1509,1,75,75,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1510,1510,1,75,75,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1511,1511,1,94,94,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1512,1512,1,34,34,56,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1513,1513,1,100,100,22,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1514,1514,1,25,25,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1515,1515,1,1,1,32,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1516,1516,1,101,101,37,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1517,1517,1,106,106,65,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL),(
1518,1518,1,39,39,43,'','2022-02-01 00:00:00','2022-02-28 00:00:00',0,'US','PR','EQ','2022-01-01 00:00:00',NULL,NULL,NULL,NULL);
  


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_profesion`
--

CREATE TABLE `p_profesion` (
  `idprofesion` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `estado` char(1) NOT NULL,
  `usuario` varchar(15) NOT NULL,
  `perfil` varchar(15) NOT NULL,
  `equipo` varchar(15) NOT NULL,
  `fecha` datetime NOT NULL,
  `usuariomod` varchar(15) NOT NULL,
  `perfilmod` varchar(15) DEFAULT NULL,
  `equipomod` varchar(15) DEFAULT NULL,
  `fechamod` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `p_profesion`
--

INSERT INTO `p_profesion` (`idprofesion`, `descripcion`, `estado`, `usuario`, `perfil`, `equipo`, `fecha`, `usuariomod`, `perfilmod`, `equipomod`, `fechamod`) VALUES
(1, 'ABOGADO', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(3, 'ASISTENTE SOCIAL', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(4, 'AUDITOR', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(5, 'BIOLOGO', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(8, 'CONTADOR', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(9, 'ECONOMISTA', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(10, 'ENFERMERA', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(11, 'INGENIERO', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(12, 'INGENIERO AGRONOMO', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(16, 'INGENIERO ELECTRICISTA', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(21, 'INGENIERO SANITARIO', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(22, 'INGENIERO SISTEMAS', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(24, 'MEDICO', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(27, 'MEDICO CIRUGIA GENERAL', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(29, 'MEDICO DERMATOLOGO', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(30, 'MEDICO ECOGRAFISTA', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(31, 'MEDICO ENDOCRINOLOGO', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(32, 'MEDICO GERIATRA', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(33, 'MEDICO GINECOLOGO', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(34, 'MEDICO NEFROLOGO', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(35, 'MEDICO NEUROCIRUGIA', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(36, 'MEDICO NEUROLOGO', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(38, 'MEDICO OFTALMOLOGO', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(39, 'MEDICO ONCOLOGO QUIRURGICO', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(41, 'MEDICO OTORRINO LARINGOLOGO', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(43, 'MEDICO PEDIATRA', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(45, 'MEDICO RADIOLOGO', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(46, 'MEDICO REUMATOLOGO', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(47, 'MEDICO TRAUMATOLOGO', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(48, 'MEDICO VETERINARIO', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(49, 'OBSTETRIZ', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(50, 'PERIODISTA', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(51, 'PSICOLOGO', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(52, 'QUIMICO', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(54, 'NO CONSIGNA', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(55, 'ADMINISTRACION DE EMPRESAS', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(57, 'RELACIONES PUBLICAS', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(60, 'BIBLIOTECOLOGIA', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(61, 'RELACIONES PUBLICAS', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(63, 'ARTISTA PINTOR', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(64, 'FOTOGRAFO', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(65, 'CONTABILIDAD EMPRESARIAL', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(67, 'ADMINISTRACION-SECRETAR.', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(68, 'DOCENTE EN EDUCACION', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(73, 'TRABAJO SOCIAL', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(74, 'ESTADISTICO', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(75, 'CONTABILIDAD', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(76, 'LIC. EN COMPUTACION', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(78, 'TEC.FISIOTERAPIA Y REHABILITACION', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(80, 'TECNOLOGIA SANITARIA', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(81, 'MECANICA AUTOMOTRIZ', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(82, 'TURISMO', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(83, 'ADMINISTRACION PUBLICA.', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(84, 'TECNICO EN LABOR.CLINICO', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(85, 'ENFERMERIA TECNICA', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(86, 'MEDICO CIRUJANO PEDIATRA', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(88, 'TEC.MEDICO-RADIOLOGIA', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(89, 'TECNICO EN COMPUTACION E INFORMATICA', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(91, 'ECONOMIA DE LA SALUD', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(92, 'CIENCIAS DE LA COMUNICACION', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(93, 'EN SALUD', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(94, 'TECNICO EN EDIFICACIONES Y CONST.CIVIL', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(96, 'TEC.EN CONTABILIDAD', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(98, 'CONTABILIDAD Y FINANZAS', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(99, 'TECNICO EN FARMACIA', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(100, 'MEDICINA INTEGRAL Y GESTON EN SALU', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(102, 'MAESTRIA EDUC.DOC.E INVEST.EN EDUC.SUP', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(103, 'LIC. EN EDUCACION PRIMARIA', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(104, 'LICENCIATURA EN GESTION', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(107, 'NEONATOLOGIA', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(108, 'MAESTRIA SALUD PUBLICA', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(109, 'MAESTRIA EN SALUD OCUPACIONAL', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(110, 'LIC. EN ADMINISTRACION', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(111, 'ODONTOLOGO', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(113, 'DOCTORADO EN SALUD PUBLICA', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(114, 'TEC.EN NUTRICION', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(115, 'MAESTRIA ADMINISTRACION MENCION FINANZAS', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(116, 'LIC. EN EDUCACION', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(117, 'DOCTOR EN EDUCACION', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', ''),
(118, 'MAESTRIA ADMINISTR.SERVIC.DE SALUD', 'A', '', '', '', '1900-01-01 00:00:00', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_puestotrabajo`
--

CREATE TABLE `p_puestotrabajo` (
  `idpuesto` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `estado` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `usuario` varchar(15) DEFAULT NULL,
  `perfil` varchar(15) DEFAULT NULL,
  `equipo` varchar(15) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuariomod` varchar(15) DEFAULT NULL,
  `perfilmod` varchar(15) DEFAULT NULL,
  `equipomod` varchar(15) DEFAULT NULL,
  `fechamod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `p_puestotrabajo`
--

INSERT INTO `p_puestotrabajo` (`idpuesto`, `descripcion`, `estado`, `usuario`, `perfil`, `equipo`, `fecha`, `usuariomod`, `perfilmod`, `equipomod`, `fechamod`) VALUES
(1, 'ABOGADO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'ARTESANO I', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'ARTESANO III', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'ASIST. EN SERV. SOCIAL', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'ASIST. SERV. TRANSPORTE', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'ASISTENTE ADMINISTRATIVO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'ASISTENTE DE SEGURIDAD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'ASISTENTE EN ODONTOLOGIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'ASISTENTE PROFESIONAL', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'ASISTENTE SOCIAL', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'AUX. DE ENFERMERIA I', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 'AUX. DE LABORATORIO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'AUX. DE LAVANDERIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'AUX. DE NUTRICION', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'AUX. DE SIST. ADMINISTRATIVOS', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'AUXILIAR ADMINISTRATIVO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'AUXILIAR ASISTENCIAL', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'AUXILIAR EN ARCHIVO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'AUXILIAR EN MECANICA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'AUXILIAR INFORMATICO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'BIOLOGO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'CAJERO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'CAPELLAN I', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'CHOFER', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'CIRUJANO DENTISTA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'CONTADOR', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'CUARTELERO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'DIGITADOR', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 'DIRECTOR EJECUTIVO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 'EDUCADORA PARA LA SALUD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'ELECTRICISTA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 'ENFERMERA/O', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 'ESPECIALISTA ADM.', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'ESPECIALISTA EN SALUD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 'ESTADISTICO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 'INGENIERO CIVIL', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'INGENIERO DE SISTEMAS', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'INGENIERO ELECTRONICO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 'INGENIERO ESTADISTISTA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 'INGENIERO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'JEFE DE OFICINA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'MECANICO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'MEDICO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'MEDICO AUDITOR', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'MEDICO ESPECIALISTA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'MEDICO RESIDENTE 1ER', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'MEDICO SUB ESPECIALIDAD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 'NUTRICIONISTA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 'OBSTETRIZ', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 'OPER. CENTRAL TELEFONICA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 'OPERAD. DE EQUIPO MECANICO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 'OPERAD. DE MAQ. INDUSTRIAL', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 'OPERADOR P.A.D. I', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 'PROGRAMADOR', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 'PSICOLOGO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 'QUIMICO FARMACEUTICO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 'SECRETARIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 'SUP. DE CONSERV. Y S', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 'TEC. CARPINTERO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 'TEC. EN BIBLIOTECA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 'TEC. EN COMUNICACION', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 'TEC. EN EBANISTERIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 'TEC. EN INGENIERIA ', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 'TEC. GASFITERO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 'TEC. ADMINISTRATIVO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 'TEC. ELECTRICISTA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 'TEC. EN SERVICIO SOCIAL', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, 'TEC. ESPECIALIZADO LA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, 'TECNICO DENTAL', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 'TECNICO EN ARCHIVO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, 'TECNICO EN COMPUTACION', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 'TECNICO EN ECONOMIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 'TECNICO EN ENFERMERIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 'TECNICO EN ESTADISTICA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, 'TECNICO EN FARMACIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, 'TECNICO EN LABORATORIO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, 'TECNICO EN MANTENIMIENTO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 'TECNICO EN NUTRICION', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, 'TECNICO EN RED Y PCS', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, 'TECNICO EN SANITARIO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 'TECNICO INFORMATICO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 'TECNOLOGO MEDICO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, 'TRABAJADOR DE SERVIC', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 'TRABAJADORA SOCIAL', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(85, 'ARQUITECTO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, 'ASISTENTE DE COMUNICACIONES', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, 'AUXILIAR EN MANTENIMIENTO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, 'DIRECTOR ADJUNTO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, 'ENFERMERA ESPECIALISTA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, 'PROFESOR/A', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, 'TECNICO/A EN IMPRENTA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, 'TECNICO EN REHABIL. Y FISIOT.', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_rolprogramacion`
--

CREATE TABLE `p_rolprogramacion` (
  `idrol` int(10) UNSIGNED NOT NULL,
  `idplanilla` int(10) UNSIGNED NOT NULL,
  `periodo` int(10) UNSIGNED NOT NULL,
  `mes` int(10) UNSIGNED NOT NULL,
  `dia` int(10) UNSIGNED NOT NULL,
  `idturno` int(10) UNSIGNED NOT NULL,
  `idhora` int(10) UNSIGNED NOT NULL,
  `idarea` int(10) UNSIGNED NOT NULL,
  `idtipomodalidad` int(10) UNSIGNED NOT NULL,
  `horaIngreso` varchar(5) NOT NULL,
  `horaegreso` varchar(5) NOT NULL,
  `fechahoraingreso` datetime DEFAULT NULL,
  `fechahoraegreso` datetime DEFAULT NULL,
  `idusuarioregistra` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `fecharegistro` datetime DEFAULT NULL,
  `idusuarioautoriza` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `fechaautoriza` datetime DEFAULT NULL,
  `idestado` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `idestado1` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `nrohoras` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `p_rolprogramacion`
--

-- INSERT INTO `p_rolprogramacion` (`idrol`, `idplanilla`, `periodo`, `mes`, `dia`, `idturno`, `idhora`, `idarea`, `idtipomodalidad`, `horaIngreso`, `horaegreso`, `fechahoraingreso`, `fechahoraegreso`, `idusuarioregistra`, `fecharegistro`, `idusuarioautoriza`, `fechaautoriza`, `idestado`, `idestado1`, `nrohoras`) VALUES
-- (32, 9, 2022, 2, 1, 6, 2, 97, 3, '08:00', '16:00', '2022-02-01 08:00:00', '2022-02-01 16:00:00', 5, '2022-02-07 14:53:01', 0, NULL, 0, 0, 8),
-- (34, 10, 2022, 2, 1, 7, 1, 1, 1, '07:00', '16:00', '2022-02-01 07:00:00', '2022-02-01 16:00:00', 5, '2022-02-07 14:53:43', 0, NULL, 0, 0, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_servicio`
--

CREATE TABLE `p_servicio` (
  `idservicio` int(11) NOT NULL,
  `idundorganizacional` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `estado` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `usuario` varchar(15) DEFAULT NULL,
  `perfil` varchar(15) DEFAULT NULL,
  `equipo` varchar(15) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuariomod` varchar(15) DEFAULT NULL,
  `perfilmod` varchar(15) DEFAULT NULL,
  `equipomod` varchar(15) DEFAULT NULL,
  `fechamod` datetime DEFAULT NULL,
  `color` varchar(45) NOT NULL,
  `background` varchar(45) NOT NULL,
  `clase` varchar(45) NOT NULL,
  `clase2` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `p_servicio`
--

INSERT INTO `p_servicio` (`idservicio`, `idundorganizacional`, `descripcion`, `estado`, `usuario`, `perfil`, `equipo`, `fecha`, `usuariomod`, `perfilmod`, `equipomod`, `fechamod`, `color`, `background`, `clase`, `clase2`) VALUES
(1, 1, 'DPTO. DE ENFERMERIA (JEFATURA)', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'white', '#62D97D', 'color-1', 'color-1'),
(2, 1, 'ENF. CENTRAL ESTERILIZACION', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(3, 1, 'ENF. CENTRO QUIRURGICO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(4, 1, 'ENF. CIRUGIA PEDIATRICA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(5, 1, 'ENF. CONSULTA EXTERNA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(6, 1, 'ENF. EMERGENCIA Y CUIDADO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(7, 1, 'ENF. GINECO OBSTETRICIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(8, 1, 'ENF. HOSPITALIZACION G.O.', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(9, 1, 'ENF. HOSPITALIZACION M.P.', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(10, 1, 'ENF. NEONATOLOGIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(11, 1, 'ENF. PROGRAMAS', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(12, 1, 'ENF. U.C. CRITICOS MUJER', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(13, 1, 'ENF. UCI NEO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(14, 1, 'ENF. UCI PEDIATRICO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(15, 1, 'ENF. UTIP', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(16, 1, 'ENFERMERIA SUPERVISION', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(17, 1, 'OFICINA DE SEGUROS', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(18, 2, 'SERVICIO DE CENTRO QUIRUR', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(19, 3, 'EQUIPO DE LABORATORIO DE', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(20, 3, 'EQUIPO DE RADIODIAGNOSTIC', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(21, 3, 'SERVICIO DE ANATOMIA PATO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(22, 3, 'SERVICIO DE DIAGNOSTICO P', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(23, 3, 'SERVICIO DE PATOLOGIA CLI', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(24, 4, 'CIRUGIA PEDIATRICA, ORTOP', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(25, 4, 'DPTO. CIRUGIA PEDIATRICA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(26, 4, 'EQUIPO DE OFTALMOLOGIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(27, 4, 'SERVICIO DE CIRUGIA ESPEC', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(28, 5, 'EQ. DE FARMACOLOGIA CLINICA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(29, 5, 'EQ. DE HOSPITALIZACION Y', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(30, 5, 'EQ. DE DISPENSACION Y CTRL', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(31, 5, 'EQUIPO DE EMERGENCIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(32, 5, 'EQUIPO DE HOSPITALIZACION', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(33, 5, 'EQUIPO DE PROMOCION Y CAM', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(34, 5, 'SERV. FARMACIA EMERG.', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(35, 5, 'SERVICIO DE FARMACIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(36, 5, 'SERVICIO DE NUTRICION Y D', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(37, 5, 'SERVICIO DE PSICOLOGIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(38, 5, 'SERVICIO DE TRABAJO SOCIAL', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(39, 6, 'SERVICIO DE CUIDADO CRITI', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(40, 6, 'SERVICIO DE CUIDADOS CRIT', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(41, 6, 'SERVICIO DE EMERGENCIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(42, 6, 'SERVICIO DE TRANSPORTE', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(43, 7, 'MEDICINA FISICA Y REHABIL', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(44, 7, 'PEDIATRIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(45, 7, 'SERVICIO DE LACTANTES', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(46, 7, 'SERVICIO DE NEONATOLOGIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(47, 7, 'SERVICIO DE SUB-ESPECIALI', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(48, 7, 'SERVICIOS DEL NI?O', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(49, 8, 'SERV. GINECOLOGIA ONCOLOGI', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(50, 8, 'SERV. MEDICINA ESPECIALIZA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(51, 8, 'SERVICIO DE GINECOLOGIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(52, 8, 'SERVICIO DE MEDICINA MATE', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(53, 8, 'SERVICIO DE OBSTETRICIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(54, 8, 'UNIDAD DE BRONCOPULMONAR', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(55, 9, 'SERV.ODONTOLOGIA DE LA MUJER', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(56, 10, 'DIRECCION GENERAL (JEFATURA)', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(57, 10, 'EQUIPO DE ARCHIVO CENTRAL', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(58, 10, 'EQUIPO DE ASISTENCIA A LA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(59, 10, 'EQUIPO DE INTERV. DE EMERG', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(60, 10, 'EQUIPO DE TRAMITE DOCUMEN', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(61, 10, 'DIRECCION GENERAL', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(62, 2, 'DPTO. ANESTESIOLOGIA Y CENTRO QUIRURGICO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(63, 13, 'UNIDAD DE RR.PP.', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(64, 14, 'EQ. TESORERIA AREA CAJA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(65, 14, 'EQUIPO DE CONTROL PREVIO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(66, 14, 'EQUIPO DE CUENTA CORRIENT', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(67, 14, 'EQUIPO DE INTEGRACION CON', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(68, 14, 'EQUIPO DE TESORERIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(69, 14, 'EQUIPO LIQUIDACIONES', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(70, 3, 'DPTO. AYUDA AL DIAGNOSTICO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(71, 16, 'EQUIPO DE ADMISION', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(72, 16, 'EQUIPO DE ARCHIVO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(73, 16, 'EQUIPO DE INFORMATICA Y SISTEMAS', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(74, 16, 'EQUIPO ESTADISTICA Y BASE', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(75, 7, 'DPTO. DE PEDIATRIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(76, 18, 'EQUIPO DE ADQUISICIONES', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(77, 18, 'EQUIPO DE ALMACEN', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(78, 18, 'EQUIPO DE CONTROL PATRIMO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(79, 18, 'EQUIPO DE PROGRAMACION', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(80, 19, 'EQUIPO CAPACITACION Y DES', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(81, 19, 'EQUIPO DE ADMINISTRACION', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(82, 19, 'EQUIPO DE BIENESTAR SOCIAL', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(83, 19, 'EQUIPO DE CONTROL DE ASISTENCIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(84, 19, 'EQUIPO DE PROGRAMACION DE PERSONAL', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(85, 19, 'EQUIPO DE REMUNERACIONES', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(86, 19, 'EQUIPO DE SEGURIDAD Y SALUD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(87, 20, 'EQUIPO DE AUDITORIA MEDIC', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(88, 20, 'EQUIPO DE GESTION ADM.DE', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(89, 21, 'EQUIPO DE COSTURA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(90, 21, 'EQUIPO DE GEST. TECNOL. DE', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(91, 21, 'EQUIPO DE IMPRENTA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(92, 21, 'EQUIPO DE LAVANDERIA Y ROPERIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(93, 22, 'EQUIPOS DE PROYECTOS DE INVERSION', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(94, 8, 'DPTO. GINECO OBSTETRICIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(95, 9, 'DPTO. ODONTOESTOMATOLOGIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(96, 18, 'OFICINA DE LOGISTICA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(97, 11, 'OFICINA DE APOYO A LA DOCENCIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(98, 12, 'OFICINA DE ASESORIA JURIDICA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(99, 13, 'OFICINA DE COMUNICACIONES', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(100, 14, 'OFICINA DE ECONOMIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(101, 15, 'OFICINA DE EPIDEMIOLOGIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(102, 16, 'OFICINA DE ESTADISTICA E INFORMATICA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(103, 17, 'OFICINA DE GESTION DE LA CALIDAD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(104, 18, 'OFICINA DE LOGISTICA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(105, 19, 'OFICINA DE PERSONAL', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(106, 20, 'OFICINA DE SEGUROS', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(107, 21, 'OFICINA DE SERVICIOS GENERALES', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(108, 22, 'OFICINA EJECUTIVA DE PLANEAMIENTO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(109, 19, 'SST', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_sexo`
--

CREATE TABLE `p_sexo` (
  `idsexo` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `estado` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `p_sexo`
--

INSERT INTO `p_sexo` (`idsexo`, `descripcion`, `estado`) VALUES
(1, 'Masculino', 'A'),
(2, 'Femenino', 'A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_tipogruporiesgo`
--

CREATE TABLE `p_tipogruporiesgo` (
  `idtipogruporiesgo` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `usuario` varchar(15) NOT NULL,
  `estado` char(1) DEFAULT NULL,
  `perfil` varchar(15) NOT NULL,
  `equipo` varchar(15) NOT NULL,
  `fecha` datetime NOT NULL,
  `usuariomod` varchar(15) DEFAULT NULL,
  `perfilmod` varchar(15) DEFAULT NULL,
  `equipomod` varchar(15) DEFAULT NULL,
  `fechamod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `p_tipogruporiesgo`
--

INSERT INTO `p_tipogruporiesgo` (`idtipogruporiesgo`, `descripcion`, `usuario`, `estado`, `perfil`, `equipo`, `fecha`, `usuariomod`, `perfilmod`, `equipomod`, `fechamod`) VALUES
(1, 'MAYOR A', '', '', '', '', '2021-06-11 00:00:00', NULL, NULL, NULL, NULL),
(2, 'MENOR A', '', '', '', '', '2021-06-11 00:00:00', NULL, NULL, NULL, NULL),
(3, 'l', '', '', '', '', '2021-06-11 00:00:00', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_tipomodalidadtrabajo`
--

CREATE TABLE `p_tipomodalidadtrabajo` (
  `idtipomodalidad` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `estado` int(10) UNSIGNED DEFAULT NULL,
  `usuario` varchar(15) NOT NULL,
  `perfil` varchar(15) NOT NULL,
  `equipo` varchar(15) NOT NULL,
  `fecha` datetime NOT NULL,
  `usuariomod` varchar(15) DEFAULT NULL,
  `perfilmod` varchar(15) DEFAULT NULL,
  `equipomod` varchar(15) DEFAULT NULL,
  `fechamod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `p_tipomodalidadtrabajo`
--

INSERT INTO `p_tipomodalidadtrabajo` (`idtipomodalidad`, `descripcion`, `estado`, `usuario`, `perfil`, `equipo`, `fecha`, `usuariomod`, `perfilmod`, `equipomod`, `fechamod`) VALUES
(1, 'Remoto', 0, '', '', '', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL),
(2, 'Licencia', 0, '', '', '', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL),
(3, 'Presencial', 0, '', '', '', '0000-00-00 00:00:00', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_tipoplaza`
--

CREATE TABLE `p_tipoplaza` (
  `idtipoplaza` int(11) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `p_tipoplaza`
--

INSERT INTO `p_tipoplaza` (`idtipoplaza`, `descripcion`) VALUES
(1, 'Nombrado'),
(2, 'Cas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_turnos`
--

CREATE TABLE `p_turnos` (
  `idturno` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `sigla` varchar(4) NOT NULL,
  `horaInicio` varchar(5) DEFAULT NULL,
  `horafin` varchar(5) DEFAULT NULL,
  `horas` int(10) UNSIGNED NOT NULL,
  `idestado` int(10) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `p_turnos`
--

INSERT INTO `p_turnos` (`idturno`, `nombre`, `sigla`, `horaInicio`, `horafin`, `horas`, `idestado`) VALUES
(1, 'Turno dia (12 Horas)', 'GD', NULL, NULL, 12, 0),
(2, 'Turno noche (12 Horas)', 'GN', NULL, NULL, 12, 0),
(3, 'Guardia 24 Horas', 'G24', NULL, NULL, 24, 0),
(4, 'Medio Dia (6 Horas)', 'MD', NULL, NULL, 6, 0),
(5, 'Medio Tarde (6 Horas)', 'MT', NULL, NULL, 6, 0),
(6, 'Dia (8 horas)', 'D8', NULL, NULL, 8, 0),
(7, 'Dia (8 Horas)', 'D9', NULL, NULL, 9, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_unidadfuncional`
--

CREATE TABLE `p_unidadfuncional` (
  `idundfuncional` int(11) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `estado` int(10) UNSIGNED DEFAULT '0',
  `usuario` varchar(15) DEFAULT NULL,
  `perfil` varchar(15) DEFAULT NULL,
  `equipo` varchar(15) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuariomod` varchar(15) DEFAULT NULL,
  `perfilmod` varchar(15) DEFAULT NULL,
  `equipomod` varchar(15) DEFAULT NULL,
  `fechamod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `p_unidadfuncional`
--

INSERT INTO `p_unidadfuncional` (`idundfuncional`, `descripcion`, `estado`, `usuario`, `perfil`, `equipo`, `fecha`, `usuariomod`, `perfilmod`, `equipomod`, `fechamod`) VALUES
(1, 'EMERGENCIA', 0, 'USUARIO', 'PERFIL', 'EQUIPO', '2021-06-27 00:00:00', NULL, NULL, NULL, NULL),
(2, 'PEDIATRIA', 0, 'USUARIO', 'PERFIL', 'EQUIPO', '2021-06-27 00:00:00', NULL, NULL, NULL, NULL),
(3, 'GINECOLOGIA', 0, 'USUARIO', 'PERFIL', 'EQUIPO', '2021-06-27 00:00:00', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_unidadorganizacional`
--

CREATE TABLE `p_unidadorganizacional` (
  `idundorganizacional` int(11) NOT NULL,
  `tipo` int(10) UNSIGNED NOT NULL COMMENT '1= unidad organica 2= unidad funcional',
  `descripcion` varchar(200) DEFAULT NULL,
  `estado` int(10) UNSIGNED DEFAULT '0',
  `usuario` varchar(15) DEFAULT NULL,
  `perfil` varchar(15) DEFAULT NULL,
  `equipo` varchar(15) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuariomod` varchar(15) DEFAULT NULL,
  `perfilmod` varchar(15) DEFAULT NULL,
  `equipomod` varchar(15) DEFAULT NULL,
  `fechamod` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `p_unidadorganizacional`
--

INSERT INTO `p_unidadorganizacional` (`idundorganizacional`, `tipo`, `descripcion`, `estado`, `usuario`, `perfil`, `equipo`, `fecha`, `usuariomod`, `perfilmod`, `equipomod`, `fechamod`) VALUES
(1, 0, 'DPTO. DE ENFERMERIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 0, 'DPTO. ANESTESIOLOGIA Y CENTRO QUIRURGICO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 0, 'DPTO. AYUDA AL DIAGNOSTICO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 0, 'DPTO. CIRUGIA PEDIATRICA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 'DPTO. DE APOYO AL TRATAMIENTO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 0, 'DPTO. DE EMERGENCIA Y CUIDADOS', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 0, 'DPTO. DE PEDIATRIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 0, 'DPTO. GINECO OBSTETRICIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 0, 'DPTO. ODONTOESTOMATOLOGIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 0, 'DIRECCION GENERAL', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 0, 'OFICINA DE APOYO A LA DOCENCIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 0, 'OFICINA DE ASESORIA JURIDICA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 0, 'OFICINA DE COMUNICACIONES', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 0, 'OFICINA DE ECONOMIA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 0, 'OFICINA DE EPIDEMIOLOGIA Y SALUD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 0, 'OFICINA DE ESTADISTICA E INFORMATICA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 0, 'OFICINA DE GESTION DE LA CALIDAD', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 0, 'OFICINA DE LOGISTICA', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 0, 'OFICINA DE PERSONAL', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 0, 'OFICINA DE SEGUROS', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 0, 'OFICINA DE SERVICIOS GENERALES', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 0, 'OFICINA EJECUTIVA DE PLANEAMIENTO', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 0, 'ORGANO DE CONTROL INSTITUCIONAL', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 0, 'ORGANO PROGRAMA', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `p_usuario`
--

CREATE TABLE `p_usuario` (
  `idusuario` int(11) NOT NULL,
  `dni` varchar(200) NOT NULL,
  `clave` varchar(200) NOT NULL,
  `nombreusuario` varchar(500) NOT NULL,
  `idestado` int(10) UNSIGNED NOT NULL,
  `idperfil` int(10) UNSIGNED NOT NULL,
  `avatar` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `p_usuario`
--

INSERT INTO `p_usuario` (`idusuario`, `dni`, `clave`, `nombreusuario`, `idestado`, `idperfil`, `avatar`) VALUES
(1, '99999999', '99999999', 'ADMINISTRADOR', 1, 1, '../dist/img/User_icon_2.jpg'),
(2, '25413273', '25413273', 'NANCY MONTOYA', 1, 7, '../dist/img/User_icon_2.jpg'),
(3, '25740719', '25740719', 'MILAGROS PRADO', 1, 6, '../dist/img/User_icon_2.jpg'),
(4, '73264397', '73264397', 'CARLOS ASTUPUMA', 1, 1, '../dist/img/User_icon_2.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `p_accesosmenu`
--
ALTER TABLE `p_accesosmenu`
  ADD PRIMARY KEY (`idacceso`),
  ADD KEY `Index_2` (`idperfil`),
  ADD KEY `Index_3` (`idmenu`);

--
-- Indices de la tabla `p_actividad`
--
ALTER TABLE `p_actividad`
  ADD PRIMARY KEY (`idactividad`);

--
-- Indices de la tabla `p_actividades`
--
ALTER TABLE `p_actividades`
  ADD PRIMARY KEY (`idactividades`) USING BTREE;

--
-- Indices de la tabla `p_area`
--
ALTER TABLE `p_area`
  ADD PRIMARY KEY (`idarea`) USING BTREE;

--
-- Indices de la tabla `p_cargo`
--
ALTER TABLE `p_cargo`
  ADD PRIMARY KEY (`idcargo`);

--
-- Indices de la tabla `p_diassemana`
--
ALTER TABLE `p_diassemana`
  ADD PRIMARY KEY (`iddia`);

--
-- Indices de la tabla `p_especialidad`
--
ALTER TABLE `p_especialidad`
  ADD PRIMARY KEY (`idespecialidad`);

--
-- Indices de la tabla `p_estadocivil`
--
ALTER TABLE `p_estadocivil`
  ADD PRIMARY KEY (`idestadocivil`);

--
-- Indices de la tabla `p_gruporiesgo`
--
ALTER TABLE `p_gruporiesgo`
  ADD PRIMARY KEY (`idgruporiesgo`);

--
-- Indices de la tabla `p_horaingreso`
--
ALTER TABLE `p_horaingreso`
  ADD PRIMARY KEY (`idhoraingreso`),
  ADD UNIQUE KEY `Index_U` (`idturno`,`idhora`);

--
-- Indices de la tabla `p_horas`
--
ALTER TABLE `p_horas`
  ADD PRIMARY KEY (`idhora`);

--
-- Indices de la tabla `p_menu`
--
ALTER TABLE `p_menu`
  ADD PRIMARY KEY (`idmenu`);

--
-- Indices de la tabla `p_perfil`
--
ALTER TABLE `p_perfil`
  ADD PRIMARY KEY (`idperfil`);

--
-- Indices de la tabla `p_personal`
--
ALTER TABLE `p_personal`
  ADD PRIMARY KEY (`idpersona`,`idplaza`) USING BTREE;

--
-- Indices de la tabla `p_planilla`
--
ALTER TABLE `p_planilla`
  ADD PRIMARY KEY (`idplanilla`);

--
-- Indices de la tabla `p_profesion`
--
ALTER TABLE `p_profesion`
  ADD PRIMARY KEY (`idprofesion`);

--
-- Indices de la tabla `p_puestotrabajo`
--
ALTER TABLE `p_puestotrabajo`
  ADD PRIMARY KEY (`idpuesto`);

--
-- Indices de la tabla `p_rolprogramacion`
--
ALTER TABLE `p_rolprogramacion`
  ADD PRIMARY KEY (`idrol`),
  ADD UNIQUE KEY `Index_U` (`idplanilla`,`periodo`,`mes`,`dia`);

--
-- Indices de la tabla `p_servicio`
--
ALTER TABLE `p_servicio`
  ADD PRIMARY KEY (`idservicio`);

--
-- Indices de la tabla `p_sexo`
--
ALTER TABLE `p_sexo`
  ADD PRIMARY KEY (`idsexo`);

--
-- Indices de la tabla `p_tipogruporiesgo`
--
ALTER TABLE `p_tipogruporiesgo`
  ADD PRIMARY KEY (`idtipogruporiesgo`);

--
-- Indices de la tabla `p_tipomodalidadtrabajo`
--
ALTER TABLE `p_tipomodalidadtrabajo`
  ADD PRIMARY KEY (`idtipomodalidad`);

--
-- Indices de la tabla `p_tipoplaza`
--
ALTER TABLE `p_tipoplaza`
  ADD PRIMARY KEY (`idtipoplaza`);

--
-- Indices de la tabla `p_turnos`
--
ALTER TABLE `p_turnos`
  ADD PRIMARY KEY (`idturno`);

--
-- Indices de la tabla `p_unidadfuncional`
--
ALTER TABLE `p_unidadfuncional`
  ADD PRIMARY KEY (`idundfuncional`);

--
-- Indices de la tabla `p_unidadorganizacional`
--
ALTER TABLE `p_unidadorganizacional`
  ADD PRIMARY KEY (`idundorganizacional`) USING BTREE;

--
-- Indices de la tabla `p_usuario`
--
ALTER TABLE `p_usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `p_accesosmenu`
--
ALTER TABLE `p_accesosmenu`
  MODIFY `idacceso` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `p_actividad`
--
ALTER TABLE `p_actividad`
  MODIFY `idactividad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `p_actividades`
--
ALTER TABLE `p_actividades`
  MODIFY `idactividades` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `p_area`
--
ALTER TABLE `p_area`
  MODIFY `idarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT de la tabla `p_diassemana`
--
ALTER TABLE `p_diassemana`
  MODIFY `iddia` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `p_gruporiesgo`
--
ALTER TABLE `p_gruporiesgo`
  MODIFY `idgruporiesgo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `p_horaingreso`
--
ALTER TABLE `p_horaingreso`
  MODIFY `idhoraingreso` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `p_horas`
--
ALTER TABLE `p_horas`
  MODIFY `idhora` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `p_menu`
--
ALTER TABLE `p_menu`
  MODIFY `idmenu` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `p_perfil`
--
ALTER TABLE `p_perfil`
  MODIFY `idperfil` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `p_personal`
--
ALTER TABLE `p_personal`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `p_planilla`
--
ALTER TABLE `p_planilla`
  MODIFY `idplanilla` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `p_puestotrabajo`
--
ALTER TABLE `p_puestotrabajo`
  MODIFY `idpuesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `p_rolprogramacion`
--
ALTER TABLE `p_rolprogramacion`
  MODIFY `idrol` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `p_servicio`
--
ALTER TABLE `p_servicio`
  MODIFY `idservicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT de la tabla `p_turnos`
--
ALTER TABLE `p_turnos`
  MODIFY `idturno` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `p_unidadorganizacional`
--
ALTER TABLE `p_unidadorganizacional`
  MODIFY `idundorganizacional` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `p_usuario`
--
ALTER TABLE `p_usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
