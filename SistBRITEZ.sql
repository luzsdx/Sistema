/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 10.1.38-MariaDB : Database - proyectosistema
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`proyectosistema` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `proyectosistema`;

/*Table structure for table `agenda` */

DROP TABLE IF EXISTS `agenda`;

CREATE TABLE `agenda` (
  `id_agenda` int(11) NOT NULL AUTO_INCREMENT,
  `id_profesional` int(11) DEFAULT NULL,
  `fechainicio` date DEFAULT NULL,
  `fechafin` date DEFAULT NULL,
  PRIMARY KEY (`id_agenda`),
  KEY `id_profesional` (`id_profesional`),
  CONSTRAINT `agenda_ibfk_1` FOREIGN KEY (`id_profesional`) REFERENCES `profesionales` (`id_profesional`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `agenda` */

insert  into `agenda`(`id_agenda`,`id_profesional`,`fechainicio`,`fechafin`) values (1,2,'2019-07-16','2019-07-27'),(2,4,'2019-06-01','2019-06-20');

/*Table structure for table `alergias_hcg` */

DROP TABLE IF EXISTS `alergias_hcg`;

CREATE TABLE `alergias_hcg` (
  `id_alergias` int(11) NOT NULL AUTO_INCREMENT,
  `alergia` varchar(50) DEFAULT NULL,
  `observacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_alergias`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `alergias_hcg` */

/*Table structure for table `antecedflia` */

DROP TABLE IF EXISTS `antecedflia`;

CREATE TABLE `antecedflia` (
  `id_antecedflia` int(11) NOT NULL AUTO_INCREMENT,
  `padreconvida` tinyint(1) DEFAULT NULL,
  `enfermedadpadre` varchar(50) DEFAULT NULL,
  `madreconvida` tinyint(1) DEFAULT NULL,
  `enfermedadmadre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_antecedflia`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `antecedflia` */

insert  into `antecedflia`(`id_antecedflia`,`padreconvida`,`enfermedadpadre`,`madreconvida`,`enfermedadmadre`) values (1,0,NULL,0,NULL),(2,0,NULL,0,NULL);

/*Table structure for table `caras` */

DROP TABLE IF EXISTS `caras`;

CREATE TABLE `caras` (
  `id_cara` int(11) NOT NULL AUTO_INCREMENT,
  `cara1` varchar(11) DEFAULT NULL,
  `cara2` varchar(11) DEFAULT NULL,
  `cara3` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id_cara`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `caras` */

/*Table structure for table `cargo` */

DROP TABLE IF EXISTS `cargo`;

CREATE TABLE `cargo` (
  `id_cargo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `cargo` */

insert  into `cargo`(`id_cargo`,`descripcion`) values (1,'Asistente'),(2,'Recepcionista'),(3,'Sin especificar');

/*Table structure for table `ciudades` */

DROP TABLE IF EXISTS `ciudades`;

CREATE TABLE `ciudades` (
  `id_ciudad` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) DEFAULT NULL,
  `id_provincia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_ciudad`),
  KEY `id_provincia` (`id_provincia`),
  CONSTRAINT `ciudades_ibfk_1` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `ciudades` */

insert  into `ciudades`(`id_ciudad`,`descripcion`,`id_provincia`) values (1,'Formosa',1),(3,'Corrientes',2),(4,'Resistencia',3),(6,'Lomitas',1);

/*Table structure for table `detallefactura` */

DROP TABLE IF EXISTS `detallefactura`;

CREATE TABLE `detallefactura` (
  `id_detallefactura` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `cantidad` decimal(2,0) DEFAULT NULL,
  `id_protesis` int(11) DEFAULT NULL,
  `id_tratamiento` int(11) DEFAULT NULL,
  `id_factura` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_detallefactura`),
  KEY `id_factura` (`id_factura`),
  CONSTRAINT `detallefactura_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detallefactura` */

/*Table structure for table `dias` */

DROP TABLE IF EXISTS `dias`;

CREATE TABLE `dias` (
  `id_dias` int(11) NOT NULL AUTO_INCREMENT,
  `lunes` tinyint(1) DEFAULT NULL,
  `martes` tinyint(1) DEFAULT NULL,
  `miercoles` tinyint(1) DEFAULT NULL,
  `jueves` tinyint(1) DEFAULT NULL,
  `viernes` tinyint(1) DEFAULT NULL,
  `id_agenda` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_dias`),
  KEY `id_agenda` (`id_agenda`),
  CONSTRAINT `dias_ibfk_1` FOREIGN KEY (`id_agenda`) REFERENCES `agenda` (`id_agenda`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `dias` */

insert  into `dias`(`id_dias`,`lunes`,`martes`,`miercoles`,`jueves`,`viernes`,`id_agenda`) values (1,1,1,1,1,1,1);

/*Table structure for table `dientes` */

DROP TABLE IF EXISTS `dientes`;

CREATE TABLE `dientes` (
  `id_diente` int(11) NOT NULL AUTO_INCREMENT,
  `descripción` varchar(15) DEFAULT NULL,
  `color` varchar(4) DEFAULT NULL,
  `cantidad` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id_diente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dientes` */

/*Table structure for table `documentos` */

DROP TABLE IF EXISTS `documentos`;

CREATE TABLE `documentos` (
  `id_documento` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_documento`),
  KEY `id_paciente` (`id_paciente`),
  CONSTRAINT `documentos_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `documentos` */

/*Table structure for table `domicilios` */

DROP TABLE IF EXISTS `domicilios`;

CREATE TABLE `domicilios` (
  `id_domicilio` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) DEFAULT NULL,
  `observacion` varchar(100) DEFAULT NULL,
  `barrio` varchar(50) DEFAULT NULL,
  `calle` varchar(70) DEFAULT NULL,
  `altura` int(11) DEFAULT NULL,
  `piso` int(11) DEFAULT NULL,
  `torre` int(11) DEFAULT NULL,
  `manzana` int(11) DEFAULT NULL,
  `sector_parcela` int(11) DEFAULT NULL,
  `id_ciudad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_domicilio`),
  KEY `id_persona` (`id_persona`),
  KEY `id_ciudad` (`id_ciudad`),
  CONSTRAINT `domicilios_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`),
  CONSTRAINT `domicilios_ibfk_2` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

/*Data for the table `domicilios` */

insert  into `domicilios`(`id_domicilio`,`id_persona`,`observacion`,`barrio`,`calle`,`altura`,`piso`,`torre`,`manzana`,`sector_parcela`,`id_ciudad`) values (0,NULL,'lejos','San Martin','Padre Patiño',0,0,0,0,0,NULL),(2,NULL,'lejos','San Martin','Padre Patiño',0,0,0,0,0,NULL),(3,7,'cerca','San Miguel','Por ahi',33,3,12,5,3,NULL),(8,NULL,'Centro','San Martin','Padre Patiño 512',1,1,1,1,1,NULL),(22,NULL,'Centro','San Martin','Padre Patiño 512',1,1,1,1,1,NULL),(25,NULL,'Centro','San Martin','Padre Patiño 512',1,1,1,1,1,NULL),(26,NULL,'Centro','San Martin','Padre PatiÃ±o 512',1,1,1,1,1,NULL),(27,27,'Centro','San Martin','Padre PatiÃ±o 512',1,1,1,1,1,NULL),(31,15,'cerca del centro','san miguel','sjskj',1,1,1,1,1,NULL),(42,30,'Centro','San Martin','Padre Patiño 512',1,1,1,1,1,1),(43,30,'Centro','San Martin','Padre Patiño 512',1,1,1,1,1,1),(44,30,'Centro','San Martin','Padre PatiÃ±o 512',1,1,1,1,1,1),(45,30,'Centro','San Martin','Padre PatiÃ±o 512',1,1,1,1,1,1),(46,30,'Centro','San Martin','Padre PatiÃ±o 512',1,1,1,1,1,1),(47,30,'Lejos','San Martin','PatiÃ±o 512',2,2,3,4,5,3),(56,6,'Centro','San Martin','PatiÃ±o',512,0,0,0,0,1),(57,29,'Lejos','cambacua','',0,0,0,0,0,3),(58,43,'Centro','San Martin','Padre PatiÃ±o 512',2,2,3,1,1,1),(61,29,'Lejos','','',0,0,0,0,0,1);

/*Table structure for table `embarazo` */

DROP TABLE IF EXISTS `embarazo`;

CREATE TABLE `embarazo` (
  `id_embarazo` int(11) NOT NULL AUTO_INCREMENT,
  `meses` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id_embarazo`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `embarazo` */

insert  into `embarazo`(`id_embarazo`,`meses`) values (1,'1'),(2,'2'),(3,'3'),(4,'4'),(5,'5'),(6,'6'),(7,'7'),(8,'8'),(9,'9');

/*Table structure for table `empleados` */

DROP TABLE IF EXISTS `empleados`;

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) DEFAULT NULL,
  `id_cargo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `id_persona` (`id_persona`),
  KEY `id_cargo` (`id_cargo`),
  CONSTRAINT `empleados_ibfk_2` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`),
  CONSTRAINT `empleados_ibfk_3` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `empleados` */

insert  into `empleados`(`id_empleado`,`id_persona`,`id_cargo`) values (1,6,1),(2,27,2),(3,43,2),(4,54,1),(5,55,1),(6,66,1);

/*Table structure for table `enferm_medicinas_hcg` */

DROP TABLE IF EXISTS `enferm_medicinas_hcg`;

CREATE TABLE `enferm_medicinas_hcg` (
  `id_sufre_enferm` int(11) NOT NULL AUTO_INCREMENT,
  `sufre_enfermedad` tinyint(1) DEFAULT NULL,
  `que_enfermedad` varchar(100) DEFAULT NULL,
  `trat_medico` tinyint(1) DEFAULT NULL,
  `cual_trat_medico` varchar(100) DEFAULT NULL,
  `medic_habitual` varchar(500) DEFAULT NULL,
  `medic_5_años` varchar(500) DEFAULT NULL,
  `realiza_deporte` tinyint(1) DEFAULT NULL,
  `malestar_deporte` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_sufre_enferm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `enferm_medicinas_hcg` */

/*Table structure for table `especialidad` */

DROP TABLE IF EXISTS `especialidad`;

CREATE TABLE `especialidad` (
  `id_especialidad` int(10) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_especialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `especialidad` */

insert  into `especialidad`(`id_especialidad`,`descripcion`) values (1,'Odontopediatría'),(2,'Odontología cosmética'),(4,'Implantología oral'),(5,'Cariología');

/*Table structure for table `exam_aux` */

DROP TABLE IF EXISTS `exam_aux`;

CREATE TABLE `exam_aux` (
  `id_exam_aux` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` longblob,
  `id_persona` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_exam_aux`),
  KEY `id_persona` (`id_persona`),
  CONSTRAINT `exam_aux_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `exam_aux` */

/*Table structure for table `factura` */

DROP TABLE IF EXISTS `factura`;

CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `numero` varchar(15) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `saldo` decimal(5,0) DEFAULT NULL,
  `id_formapago` int(11) DEFAULT NULL,
  `id_tratamiento` int(11) DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `id_formapago` (`id_formapago`),
  KEY `id_tratamiento` (`id_tratamiento`),
  KEY `id_paciente` (`id_paciente`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_formapago`) REFERENCES `formapago` (`id_formapago`),
  CONSTRAINT `factura_ibfk_3` FOREIGN KEY (`id_tratamiento`) REFERENCES `tratamientos` (`id_tratamiento`),
  CONSTRAINT `factura_ibfk_4` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `factura` */

/*Table structure for table `formapago` */

DROP TABLE IF EXISTS `formapago`;

CREATE TABLE `formapago` (
  `id_formapago` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_formapago`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `formapago` */

/*Table structure for table `genero` */

DROP TABLE IF EXISTS `genero`;

CREATE TABLE `genero` (
  `id_genero` int(11) NOT NULL AUTO_INCREMENT,
  `genero` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `genero` */

insert  into `genero`(`id_genero`,`genero`) values (1,'Hombre'),(2,'Mujer');

/*Table structure for table `hcg` */

DROP TABLE IF EXISTS `hcg`;

CREATE TABLE `hcg` (
  `id_HCG` int(11) NOT NULL AUTO_INCREMENT,
  `id_paciente` int(11) DEFAULT NULL,
  `id_enferm_medicinas_HCG` int(11) DEFAULT NULL,
  `id_alergias_HCG` int(11) DEFAULT NULL,
  `id_problemas_HCG` int(11) DEFAULT NULL,
  `id_problemas2_HCG` int(11) DEFAULT NULL,
  `id_antecedflia` int(11) DEFAULT NULL,
  `id_embarazo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_HCG`),
  KEY `id_paciente` (`id_paciente`),
  KEY `id_enferm_medicinas_HCG` (`id_enferm_medicinas_HCG`),
  KEY `id_alergias_HCG` (`id_alergias_HCG`),
  KEY `id_problemas_HCG` (`id_problemas_HCG`),
  KEY `id_problemas2_HCG` (`id_problemas2_HCG`),
  KEY `id_antecedflia` (`id_antecedflia`),
  CONSTRAINT `hcg_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`),
  CONSTRAINT `hcg_ibfk_2` FOREIGN KEY (`id_enferm_medicinas_HCG`) REFERENCES `enferm_medicinas_hcg` (`id_sufre_enferm`),
  CONSTRAINT `hcg_ibfk_3` FOREIGN KEY (`id_alergias_HCG`) REFERENCES `alergias_hcg` (`id_alergias`),
  CONSTRAINT `hcg_ibfk_4` FOREIGN KEY (`id_problemas_HCG`) REFERENCES `problemas_hcg` (`id_problemas`),
  CONSTRAINT `hcg_ibfk_5` FOREIGN KEY (`id_problemas2_HCG`) REFERENCES `problemas2_hcg` (`id_problemas2`),
  CONSTRAINT `hcg_ibfk_6` FOREIGN KEY (`id_antecedflia`) REFERENCES `antecedflia` (`id_antecedflia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hcg` */

/*Table structure for table `hco` */

DROP TABLE IF EXISTS `hco`;

CREATE TABLE `hco` (
  `id_hco` int(11) NOT NULL AUTO_INCREMENT,
  `id_motivo_consulta_HCO` int(11) DEFAULT NULL,
  `id_problemas_HCO` int(11) DEFAULT NULL,
  `id_problemas_2_HCO` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_hco`),
  KEY `id_motivo_consulta_HCO` (`id_motivo_consulta_HCO`),
  KEY `id_problemas_HCO` (`id_problemas_HCO`),
  KEY `id_problemas_2_HCO` (`id_problemas_2_HCO`),
  CONSTRAINT `hco_ibfk_1` FOREIGN KEY (`id_motivo_consulta_HCO`) REFERENCES `motivo_consulta_hco` (`id_motivo_consulta`),
  CONSTRAINT `hco_ibfk_2` FOREIGN KEY (`id_problemas_HCO`) REFERENCES `problemas_hco` (`id_problemas_HCO`),
  CONSTRAINT `hco_ibfk_3` FOREIGN KEY (`id_problemas_2_HCO`) REFERENCES `problemas_2_hco` (`id_problemas_2_HCO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `hco` */

/*Table structure for table `horarios` */

DROP TABLE IF EXISTS `horarios`;

CREATE TABLE `horarios` (
  `id_horario` int(11) NOT NULL AUTO_INCREMENT,
  `hora_inicio` time DEFAULT NULL,
  `hora_fin` time DEFAULT NULL,
  `id_agenda` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_horario`),
  KEY `id_agenda` (`id_agenda`),
  CONSTRAINT `horarios_ibfk_1` FOREIGN KEY (`id_agenda`) REFERENCES `agenda` (`id_agenda`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `horarios` */

insert  into `horarios`(`id_horario`,`hora_inicio`,`hora_fin`,`id_agenda`) values (1,'07:30:00','08:00:00',1),(2,'08:00:00','08:30:00',NULL),(3,'08:30:00','09:00:00',NULL),(4,'09:00:00','09:30:00',NULL),(5,'09:30:00','10:00:00',NULL),(6,'10:00:00','10:30:00',NULL),(7,'10:30:00','11:00:00',NULL),(8,'11:00:00','11:30:00',NULL),(9,'11:30:00','12:00:00',NULL),(10,'15:30:00','16:00:00',NULL),(11,'16:00:00','16:30:00',NULL),(12,'16:30:00','17:00:00',NULL),(13,'17:00:00','17:30:00',NULL),(14,'17:30:00','18:00:00',NULL),(15,'18:00:00','18:30:00',NULL),(16,'18:30:00','19:00:00',NULL),(17,'19:00:00','19:30:00',NULL),(18,'19:30:00','20:00:00',NULL),(19,'20:00:00','20:30:00',NULL),(20,'20:30:00','21:00:00',NULL),(21,'21:00:00','21:30:00',NULL);

/*Table structure for table `medicamentos` */

DROP TABLE IF EXISTS `medicamentos`;

CREATE TABLE `medicamentos` (
  `id_medicamento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(35) DEFAULT NULL,
  `peso` varchar(4) DEFAULT NULL,
  `tipo` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_medicamento`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `medicamentos` */

insert  into `medicamentos`(`id_medicamento`,`nombre`,`peso`,`tipo`) values (1,'clonazepam','10mg','en gotas');

/*Table structure for table `modulos` */

DROP TABLE IF EXISTS `modulos`;

CREATE TABLE `modulos` (
  `id_modulo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(20) DEFAULT NULL,
  `directorio` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_modulo`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `modulos` */

insert  into `modulos`(`id_modulo`,`descripcion`,`directorio`) values (2,'Turnos','turnos'),(3,'Tratamientos','tratamientos'),(4,'Reportes','reportes'),(5,'Pacientes','pacientes'),(7,'Empleados','empleados'),(8,'asistentes','asistentes'),(9,'Profesionales','profesionales'),(10,'contactos','contactos'),(11,'Pagos','pagos');

/*Table structure for table `motivo_consulta_hco` */

DROP TABLE IF EXISTS `motivo_consulta_hco`;

CREATE TABLE `motivo_consulta_hco` (
  `id_motivo_consulta` int(11) NOT NULL AUTO_INCREMENT,
  `motivo` varchar(500) DEFAULT NULL,
  `consulto_profesional` tinyint(1) DEFAULT NULL,
  `tomo_medic` tinyint(1) DEFAULT NULL,
  `nombre_medic` varchar(100) DEFAULT NULL,
  `desde_cuando_medic` varchar(100) DEFAULT NULL,
  `obtuvo_resultados` tinyint(1) DEFAULT NULL,
  `tuvo_dolor` varchar(20) DEFAULT NULL,
  `dolor_donde` varchar(100) DEFAULT NULL,
  `dolor_hacia_donde` varchar(100) DEFAULT NULL,
  `puede_carmarlo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_motivo_consulta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `motivo_consulta_hco` */

/*Table structure for table `obrasocial` */

DROP TABLE IF EXISTS `obrasocial`;

CREATE TABLE `obrasocial` (
  `id_obrasocial` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(25) DEFAULT NULL,
  `nrocarnet` varchar(25) DEFAULT NULL,
  `nroafiliado` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_obrasocial`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `obrasocial` */

insert  into `obrasocial`(`id_obrasocial`,`descripcion`,`nrocarnet`,`nroafiliado`) values (1,'osde',NULL,NULL),(2,'swiss medical',NULL,NULL),(3,'iasep',NULL,NULL);

/*Table structure for table `ocupacion` */

DROP TABLE IF EXISTS `ocupacion`;

CREATE TABLE `ocupacion` (
  `id_ocupacion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_ocupacion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `ocupacion` */

insert  into `ocupacion`(`id_ocupacion`,`descripcion`) values (1,'analista'),(2,'desarrollador'),(3,'obrero'),(4,'ingeniero'),(5,'arquitecto'),(6,'profesor'),(7,'sin especificar');

/*Table structure for table `pac_estado` */

DROP TABLE IF EXISTS `pac_estado`;

CREATE TABLE `pac_estado` (
  `id_pac_estado` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_pac_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `pac_estado` */

insert  into `pac_estado`(`id_pac_estado`,`estado`) values (1,'Activo'),(2,'Inactivo');

/*Table structure for table `pacientes` */

DROP TABLE IF EXISTS `pacientes`;

CREATE TABLE `pacientes` (
  `id_paciente` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) DEFAULT NULL,
  `fechaingreso` date DEFAULT NULL,
  `id_obrasocial` int(11) DEFAULT NULL,
  `id_pac_estado` int(11) DEFAULT NULL,
  `id_genero` int(11) DEFAULT NULL,
  `ocupacion` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_paciente`),
  KEY `id_paciente` (`id_paciente`),
  KEY `id_persona` (`id_persona`),
  KEY `id_obrasocial` (`id_obrasocial`),
  KEY `id_pac_estado` (`id_pac_estado`),
  KEY `id_genero` (`id_genero`),
  CONSTRAINT `pacientes_ibfk_3` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`),
  CONSTRAINT `pacientes_ibfk_5` FOREIGN KEY (`id_obrasocial`) REFERENCES `obrasocial` (`id_obrasocial`),
  CONSTRAINT `pacientes_ibfk_7` FOREIGN KEY (`id_pac_estado`) REFERENCES `pac_estado` (`id_pac_estado`),
  CONSTRAINT `pacientes_ibfk_8` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

/*Data for the table `pacientes` */

insert  into `pacientes`(`id_paciente`,`id_persona`,`fechaingreso`,`id_obrasocial`,`id_pac_estado`,`id_genero`,`ocupacion`) values (1,3,'2019-05-07',2,2,NULL,NULL),(3,5,'2019-04-24',2,NULL,NULL,NULL),(4,6,'2019-06-18',2,NULL,NULL,NULL),(15,19,'0000-00-00',3,NULL,NULL,NULL),(16,19,'0000-00-00',3,NULL,NULL,NULL),(18,21,'0000-00-00',1,NULL,NULL,NULL),(19,21,'0000-00-00',1,NULL,NULL,NULL),(29,28,'2019-05-29',1,NULL,NULL,NULL),(30,28,'2019-05-29',1,NULL,NULL,NULL),(31,29,'2019-06-19',3,NULL,NULL,NULL),(32,30,'2019-06-18',1,NULL,NULL,NULL),(33,31,'0000-00-00',3,NULL,NULL,NULL),(34,57,'2019-06-13',3,NULL,NULL,NULL),(35,7,NULL,NULL,NULL,NULL,NULL),(36,65,'2019-08-12',1,NULL,NULL,NULL),(37,67,'0000-00-00',1,NULL,NULL,NULL),(38,68,'0000-00-00',1,NULL,NULL,NULL),(39,69,'0000-00-00',1,NULL,NULL,NULL),(40,70,'0000-00-00',1,NULL,NULL,NULL),(41,71,'0000-00-00',1,NULL,NULL,NULL),(42,72,'0000-00-00',1,NULL,NULL,NULL),(43,73,'0000-00-00',1,NULL,NULL,NULL),(44,74,'0000-00-00',1,NULL,NULL,NULL),(45,75,'0000-00-00',1,NULL,NULL,NULL),(46,76,'0000-00-00',1,NULL,NULL,NULL),(47,77,'0000-00-00',1,NULL,NULL,NULL),(48,78,'0000-00-00',1,NULL,NULL,NULL),(49,79,'0000-00-00',1,NULL,NULL,NULL),(50,80,'0000-00-00',1,NULL,NULL,NULL),(51,81,'0000-00-00',1,NULL,NULL,NULL),(52,82,'0000-00-00',1,NULL,NULL,NULL),(53,83,'0000-00-00',1,NULL,NULL,NULL),(54,84,'0000-00-00',1,NULL,NULL,NULL),(55,85,'0000-00-00',1,NULL,NULL,NULL),(56,86,'0000-00-00',1,NULL,NULL,NULL),(57,28,'2020-04-14',3,1,NULL,NULL),(58,7,'2020-03-30',3,1,NULL,NULL),(59,7,NULL,3,1,NULL,NULL),(60,125,'2020-04-01',2,1,NULL,NULL),(61,156,'2020-05-02',1,1,NULL,NULL),(62,157,'2020-05-02',3,1,NULL,NULL),(63,158,'2020-05-02',3,1,NULL,NULL),(64,159,'2020-05-02',2,1,NULL,NULL);

/*Table structure for table `perfiles` */

DROP TABLE IF EXISTS `perfiles`;

CREATE TABLE `perfiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `perfiles` */

insert  into `perfiles`(`id`,`descripcion`) values (2,'secundario'),(3,'Administrador');

/*Table structure for table `perfilesxmodulos` */

DROP TABLE IF EXISTS `perfilesxmodulos`;

CREATE TABLE `perfilesxmodulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_perfil` int(11) DEFAULT NULL,
  `id_modulo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_perfil` (`id_perfil`),
  KEY `id_modulo` (`id_modulo`),
  CONSTRAINT `perfilesxmodulos_ibfk_3` FOREIGN KEY (`id_perfil`) REFERENCES `perfiles` (`id`),
  CONSTRAINT `perfilesxmodulos_ibfk_4` FOREIGN KEY (`id_modulo`) REFERENCES `modulos` (`id_modulo`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Data for the table `perfilesxmodulos` */

insert  into `perfilesxmodulos`(`id`,`id_perfil`,`id_modulo`) values (5,2,2),(17,3,2),(18,3,3),(19,3,4),(20,3,5),(21,3,7),(23,3,11);

/*Table structure for table `persona_contacto` */

DROP TABLE IF EXISTS `persona_contacto`;

CREATE TABLE `persona_contacto` (
  `id_persona_contacto` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) DEFAULT NULL,
  `id_tipocontacto` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `valor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_persona_contacto`),
  KEY `id_tipocontacto` (`id_tipocontacto`),
  KEY `persona_contacto_ibfk_1` (`id_persona`),
  CONSTRAINT `persona_contacto_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`),
  CONSTRAINT `persona_contacto_ibfk_2` FOREIGN KEY (`id_tipocontacto`) REFERENCES `tipocontacto` (`id_tipocontacto`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

/*Data for the table `persona_contacto` */

insert  into `persona_contacto`(`id_persona_contacto`,`id_persona`,`id_tipocontacto`,`estado`,`valor`) values (2,3,1,1,'1'),(5,28,2,1,'1'),(6,7,2,1,'1'),(7,5,2,1,'1'),(24,6,1,0,'1'),(25,31,2,0,'luzsdx@gmail.com'),(26,31,2,1,'luzsdx@gmail.com'),(27,55,4,1,'3717890768'),(28,3,2,1,'belen@hotmail.com'),(29,21,3,1,'876543-hfd'),(30,21,3,1,'876543-hfd'),(31,21,3,1,'876543-hfd'),(32,21,3,1,'876543-hfd'),(33,43,1,1,'33333'),(34,43,2,1,'luzsdx@gmail.com'),(35,30,3,1,'hygt7gu'),(36,6,3,0,'luzsdx@gmail.com'),(37,6,3,0,'hygt7gu'),(38,6,2,0,'luzsdx@gmail.com'),(39,31,2,1,'hygt7gu'),(40,29,2,1,'luzsdx@gmail.com');

/*Table structure for table `personas` */

DROP TABLE IF EXISTS `personas`;

CREATE TABLE `personas` (
  `id_persona` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  `apellido` varchar(20) DEFAULT NULL,
  `DNI` varchar(10) DEFAULT NULL,
  `fechanacimiento` date DEFAULT NULL,
  PRIMARY KEY (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=latin1;

/*Data for the table `personas` */

insert  into `personas`(`id_persona`,`nombre`,`apellido`,`DNI`,`fechanacimiento`) values (3,'Luz Britez',NULL,'41250927','1998-09-11'),(5,'Juan','Gomez','41250999','1999-05-05'),(6,'Belen','Cardozo','42300999','1999-02-01'),(7,'Agostina','Rodriguez','31890765','1990-01-01'),(8,'Ruth','Avalos','','0000-00-00'),(9,'Ruth','Avalos','','0000-00-00'),(10,'Ruth','Avalos','','0000-00-00'),(11,'Ruth','Avalos','','0000-00-00'),(12,'Ruth','Avalos','','0000-00-00'),(13,'Ruth','Avalos','','0000-00-00'),(14,'Ruth','Avalos','','0000-00-00'),(15,'Ruth','Avalos','','0000-00-00'),(16,'Ruth','Avalos','','0000-00-00'),(17,'Ruth','Avalos','','0000-00-00'),(18,'Ruth','Avalos','','0000-00-00'),(19,'Ruth','Avalos','','0000-00-00'),(20,'Ruth','Avalos','','0000-00-00'),(21,'Ruth','Avalos','','0000-00-00'),(22,'Ruth','Avalos','','0000-00-00'),(23,'Ruth','Avalos','','0000-00-00'),(24,'','','','0000-00-00'),(25,'Ruth','Avalos','','0000-00-00'),(26,'Ruth','Avalos','','0000-00-00'),(27,'Ruth','Avalos','12435632','0000-00-00'),(28,'fulano','gimenez','1234567','2019-06-11'),(29,'Flor','Marin','51230450','2019-06-18'),(30,'Ricardo','Chave','13456','2019-06-12'),(31,'Pili','Cardozo','415679345','0000-00-00'),(32,'Ximena','Martinez','41560999','2019-06-18'),(33,'Guadalupe','Azuaga','41560900','2000-06-18'),(34,'Lisandro','gimenez','51230450','2019-06-12'),(35,'Lucia','Cardo','','0000-00-00'),(36,'Florencia','Villalba','12345678','0003-03-11'),(37,'Lisa','Simpson','3456789','1988-09-11'),(38,'Lisa','Simpson','3456789','1988-09-11'),(39,'Lisa','Simpson','3456789','1988-09-11'),(40,'Lisa','Simpson','3456789','1988-09-11'),(41,'Lisa','Simpson','3456789','1988-09-11'),(42,'Homero','Simpson','67899765','2019-06-20'),(43,'Marge','Simpson','67890098','1989-09-10'),(44,'','luzsdx@gmail.co','','0000-00-00'),(45,'','luzsdx@gmail.co','','0000-00-00'),(46,'','37045596','','0000-00-00'),(47,'','2345678','','0000-00-00'),(48,'','2345678','','0000-00-00'),(49,'','','','0000-00-00'),(50,'','','','0000-00-00'),(51,'','','','0000-00-00'),(52,'','','','0000-00-00'),(53,'','','','0000-00-00'),(54,'Bart','Simpson','123455333','0000-00-00'),(55,'Ned','Flanders','45789123','0000-00-00'),(56,'Milhouse','House','12345678','1970-05-11'),(57,'Milhouse','House','12345678','1970-05-11'),(58,'Lisandro','gimenez','12345678','2019-07-08'),(59,'Luz','Britez','1234545','2019-08-06'),(60,'Lisandro','Simpson','12345678','2019-08-05'),(61,'Lisandro','Simpson','12345678','2019-08-05'),(62,'Lisandro','Simpson','12345678','2019-08-05'),(63,'Lisandro','Simpson','12345678','2019-08-05'),(64,'Lisandro','Simpson','12345678','2019-08-05'),(65,'Lisandro','Simpson','12345678','2019-08-05'),(66,'Ruth','Rodriguez','123455','2019-08-12'),(67,'','Rodriguez','','0000-00-00'),(68,'Luz','','','0000-00-00'),(69,'lu','','','0000-00-00'),(70,'ll','','','0000-00-00'),(71,'','','','0000-00-00'),(72,'ll','','','0000-00-00'),(73,'l','','','0000-00-00'),(74,'','','','0000-00-00'),(75,'','','','0000-00-00'),(76,'d','','','0000-00-00'),(77,'','','','0000-00-00'),(78,'','','','0000-00-00'),(79,'','','','0000-00-00'),(80,'','','','0000-00-00'),(81,'','','','0000-00-00'),(82,'','','','0000-00-00'),(83,'','','','0000-00-00'),(84,'','','','0000-00-00'),(85,'','','','0000-00-00'),(86,'','','','0000-00-00'),(87,'','',NULL,'0000-00-00'),(88,'','',NULL,'0000-00-00'),(89,'','',NULL,'0000-00-00'),(90,'','',NULL,'0000-00-00'),(91,'','',NULL,'0000-00-00'),(92,'','',NULL,'0000-00-00'),(93,'','',NULL,'0000-00-00'),(94,'asd','',NULL,'0000-00-00'),(95,'jjkkj','',NULL,'0000-00-00'),(96,'','',NULL,'0000-00-00'),(97,'','',NULL,'0000-00-00'),(98,'','',NULL,'0000-00-00'),(99,'','',NULL,'0000-00-00'),(100,'','',NULL,'0000-00-00'),(101,'','',NULL,'0000-00-00'),(102,'sadsa','sadsa',NULL,'0000-00-00'),(103,'','',NULL,'0000-00-00'),(104,'','',NULL,'0000-00-00'),(105,'belen','bre','1234553321','2020-04-05'),(106,'belen','bre','1234553321','2020-04-05'),(107,'belen','bre','1234553321','2020-04-05'),(108,'Ruth','avalos',NULL,'2020-04-14'),(109,'Ruth','avalos',NULL,'2020-04-14'),(110,'Ruth','avalos',NULL,'2020-04-14'),(111,'Ruth','avalos',NULL,'2020-04-14'),(112,'Ruth','avalos',NULL,'2020-04-14'),(113,'Ruth','avalos',NULL,'2020-04-14'),(114,'Ruth','avalos',NULL,'2020-04-14'),(115,'Ruth','avalos',NULL,'2020-04-14'),(116,'Ruth','avalos',NULL,'2020-04-14'),(117,'Ruth','avalos',NULL,'2020-04-14'),(118,'Ruth','avalos',NULL,'2020-04-14'),(119,'Ruth','avalos',NULL,'2020-04-14'),(120,'Ruth','avalos',NULL,'2020-04-14'),(121,'Ruth','avalos',NULL,'2020-04-14'),(122,'Ruth','avalos',NULL,'2020-04-14'),(123,'Ruth','avalos',NULL,'2020-04-14'),(124,'Ruth','avalos',NULL,'2020-04-14'),(125,'carina','cardozo',NULL,'2020-03-29'),(126,'lisa','avalos',NULL,'2020-03-30'),(127,'lisa','avalos',NULL,'2020-03-30'),(128,'lisa','avalos',NULL,'2020-03-30'),(129,'lisa','avalos',NULL,'2020-03-30'),(130,'lisa','avalos',NULL,'2020-03-30'),(131,'lisa','avalos',NULL,'2020-03-30'),(132,'lisa','avalos',NULL,'2020-03-30'),(133,'lisa','avalos',NULL,'2020-03-30'),(134,'lisa','avalos',NULL,'2020-03-30'),(135,'lisa','avalos',NULL,'2020-03-30'),(136,'lisa','avalos',NULL,'2020-03-30'),(137,'lisa','avalos',NULL,'2020-03-30'),(138,'lisa','avalos',NULL,'2020-03-30'),(139,'lisa','avalos',NULL,'2020-03-30'),(140,'lisa','avalos',NULL,'2020-03-30'),(141,'lisa','avalos',NULL,'2020-03-30'),(142,'lisa','avalos',NULL,'2020-03-30'),(143,'lisa','avalos',NULL,'2020-03-30'),(144,'lisa','avalos',NULL,'2020-03-30'),(145,'lisa','avalos',NULL,'2020-03-30'),(146,'lisa','avalos',NULL,'2020-03-30'),(147,'lisa','avalos',NULL,'2020-03-30'),(148,'lisa','avalos',NULL,'2020-03-30'),(149,'lisa','avalos',NULL,'2020-03-30'),(150,'lisa','avalos',NULL,'2020-03-30'),(151,'lisa','avalos',NULL,'2020-03-30'),(152,'lisa','avalos',NULL,'2020-03-30'),(153,'lisa','avalos',NULL,'2020-03-30'),(154,'Ruth','avalos',NULL,'2020-03-30'),(155,'Carina','Cardozo','41234000','2020-04-04'),(156,'Rosio','Cardozo','33456789','2020-04-01'),(157,'Harry','Styles','37111222','2020-05-02'),(158,'Louis','Tomlinson','34789987','2020-04-04'),(159,'Niall','Horan','55765890','2020-05-01');

/*Table structure for table `precio` */

DROP TABLE IF EXISTS `precio`;

CREATE TABLE `precio` (
  `id_precio` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `valor` varchar(5) DEFAULT NULL,
  `id_tratamiento` int(11) DEFAULT NULL,
  `id_protesis` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_precio`),
  KEY `id_tratamiento` (`id_tratamiento`),
  KEY `id_protesis` (`id_protesis`),
  CONSTRAINT `precio_ibfk_1` FOREIGN KEY (`id_tratamiento`) REFERENCES `tratamientos` (`id_tratamiento`),
  CONSTRAINT `precio_ibfk_2` FOREIGN KEY (`id_protesis`) REFERENCES `protesis` (`id_protesis`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `precio` */

insert  into `precio`(`id_precio`,`fecha`,`valor`,`id_tratamiento`,`id_protesis`) values (1,'2018-12-11','2000',1,NULL),(2,'2019-08-05','5000',2,NULL),(3,NULL,NULL,NULL,NULL);

/*Table structure for table `problemas2_hcg` */

DROP TABLE IF EXISTS `problemas2_hcg`;

CREATE TABLE `problemas2_hcg` (
  `id_problemas2` int(11) NOT NULL AUTO_INCREMENT,
  `prob_hepatico` tinyint(1) DEFAULT NULL,
  `cual_prob_hepatico` varchar(100) DEFAULT NULL,
  `convulsiones` tinyint(1) DEFAULT NULL,
  `epileptico` tinyint(1) DEFAULT NULL,
  `epilep_medicacion` varchar(500) DEFAULT NULL,
  `sifilis_gonorrea` tinyint(1) DEFAULT NULL,
  `enf_infecto_contagiosa` tinyint(1) DEFAULT NULL,
  `transfusiones` tinyint(1) DEFAULT NULL,
  `operado` tinyint(1) DEFAULT NULL,
  `operado_deque` varchar(100) DEFAULT NULL,
  `operado_cuando` varchar(100) DEFAULT NULL,
  `prob_respiratorio` tinyint(1) DEFAULT NULL,
  `fuma` tinyint(1) DEFAULT NULL,
  `enf_recomend_medico` tinyint(1) DEFAULT NULL,
  `recomend_cual` varchar(500) DEFAULT NULL,
  `trat_homeopatico` tinyint(1) DEFAULT NULL,
  `medico_clinico` varchar(100) DEFAULT NULL,
  `hosp_derivacion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_problemas2`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `problemas2_hcg` */

/*Table structure for table `problemas_2_hco` */

DROP TABLE IF EXISTS `problemas_2_hco`;

CREATE TABLE `problemas_2_hco` (
  `id_problemas_2_HCO` int(11) NOT NULL AUTO_INCREMENT,
  `pus_boca` tinyint(1) DEFAULT NULL,
  `pus_donde` varchar(100) DEFAULT NULL,
  `movilidad_dientes` tinyint(1) DEFAULT NULL,
  `cara_hinchada` tinyint(1) DEFAULT NULL,
  `hinchazon_solucion` varchar(500) DEFAULT NULL,
  `momentos_azucar_diario` varchar(100) DEFAULT NULL,
  `indice_placa` varchar(100) DEFAULT NULL,
  `estado_higiene_bucal` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_problemas_2_HCO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `problemas_2_hco` */

/*Table structure for table `problemas_hcg` */

DROP TABLE IF EXISTS `problemas_hcg`;

CREATE TABLE `problemas_hcg` (
  `id_problemas` int(11) NOT NULL AUTO_INCREMENT,
  `cicatriza_muela` varchar(100) DEFAULT NULL,
  `sangra_mucho` varchar(100) DEFAULT NULL,
  `colageno_hiperlaxitud` tinyint(1) DEFAULT NULL,
  `ant_fiebre_reumatica` tinyint(1) DEFAULT NULL,
  `fiebre_medicacion` varchar(500) DEFAULT NULL,
  `diabetico` tinyint(1) DEFAULT NULL,
  `diab_controlado` varchar(500) DEFAULT NULL,
  `con_que_controla` varchar(500) DEFAULT NULL,
  `prob_cardiaco` tinyint(1) DEFAULT NULL,
  `cardiaco_cual` varchar(100) DEFAULT NULL,
  `aspirina_anticoagulante` tinyint(1) DEFAULT NULL,
  `aspirina_frecuencia` varchar(100) DEFAULT NULL,
  `presion_alta` tinyint(1) DEFAULT NULL,
  `chagas` tinyint(1) DEFAULT NULL,
  `trat_chagas` varchar(500) DEFAULT NULL,
  `prob_renales` tinyint(1) DEFAULT NULL,
  `ulcera` tinyint(1) DEFAULT NULL,
  `ulcera_tipo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_problemas`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `problemas_hcg` */

/*Table structure for table `problemas_hco` */

DROP TABLE IF EXISTS `problemas_hco`;

CREATE TABLE `problemas_hco` (
  `id_problemas_HCO` int(11) NOT NULL AUTO_INCREMENT,
  `golpe_dientes` tinyint(1) DEFAULT NULL,
  `golpe_cuando` varchar(100) DEFAULT NULL,
  `golpe_como` varchar(100) DEFAULT NULL,
  `fractura_diente` tinyint(1) DEFAULT NULL,
  `fractura_cual` varchar(3) DEFAULT NULL,
  `fractura_trat` varchar(500) DEFAULT NULL,
  `dificultad_hablar` varchar(100) DEFAULT NULL,
  `dificul_masticar` varchar(100) DEFAULT NULL,
  `dificul_abrirboca` varchar(100) DEFAULT NULL,
  `dificul_tragar` varchar(100) DEFAULT NULL,
  `anormal_labios` varchar(100) DEFAULT NULL,
  `anormal_paladar` varchar(100) DEFAULT NULL,
  `anormal_pisoboca` varchar(100) DEFAULT NULL,
  `anormal_carrillos` varchar(100) DEFAULT NULL,
  `anormal_trigono` varchar(100) DEFAULT NULL,
  `anormal_retromolar` varchar(100) DEFAULT NULL,
  `tipo_lesiones` tinyint(1) DEFAULT NULL,
  `sangran_encias` tinyint(1) DEFAULT NULL,
  `sangra_encia_cuando` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_problemas_HCO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `problemas_hco` */

/*Table structure for table `profesion` */

DROP TABLE IF EXISTS `profesion`;

CREATE TABLE `profesion` (
  `id_profesion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_profesion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `profesion` */

insert  into `profesion`(`id_profesion`,`descripcion`) values (1,'dentista'),(2,'Sin especificar');

/*Table structure for table `profesionales` */

DROP TABLE IF EXISTS `profesionales`;

CREATE TABLE `profesionales` (
  `id_profesional` int(11) NOT NULL AUTO_INCREMENT,
  `id_persona` int(11) DEFAULT NULL,
  `matricula` varchar(100) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `id_profesion` int(11) DEFAULT NULL,
  `id_especialidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_profesional`),
  KEY `id_persona` (`id_persona`),
  KEY `id_profesion` (`id_profesion`),
  KEY `id_especialidad` (`id_especialidad`),
  CONSTRAINT `profesionales_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`),
  CONSTRAINT `profesionales_ibfk_2` FOREIGN KEY (`id_profesion`) REFERENCES `profesion` (`id_profesion`),
  CONSTRAINT `profesionales_ibfk_3` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id_especialidad`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `profesionales` */

insert  into `profesionales`(`id_profesional`,`id_persona`,`matricula`,`estado`,`id_profesion`,`id_especialidad`) values (1,6,'123456789',1,1,2),(2,32,'',NULL,NULL,NULL),(3,33,'',NULL,NULL,NULL),(4,41,'124567',NULL,NULL,NULL),(5,42,'56432',NULL,NULL,NULL),(6,58,'6754wq2',NULL,1,1),(7,154,'65789',NULL,NULL,2);

/*Table structure for table `protesis` */

DROP TABLE IF EXISTS `protesis`;

CREATE TABLE `protesis` (
  `id_protesis` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_protesis`),
  KEY `id_paciente` (`id_paciente`),
  CONSTRAINT `protesis_ibfk_2` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `protesis` */

/*Table structure for table `provincia` */

DROP TABLE IF EXISTS `provincia`;

CREATE TABLE `provincia` (
  `id_provincia` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `provincia` */

insert  into `provincia`(`id_provincia`,`descripcion`) values (1,'Formosa'),(2,'Corrientes'),(3,'Chaco'),(6,'Jujuy');

/*Table structure for table `recetas` */

DROP TABLE IF EXISTS `recetas`;

CREATE TABLE `recetas` (
  `id_receta` int(11) NOT NULL AUTO_INCREMENT,
  `id_profesional` int(11) DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `indicaciones` varchar(100) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_medicamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_receta`),
  KEY `id_profesional` (`id_profesional`),
  KEY `id_paciente` (`id_paciente`),
  KEY `id_medicamento` (`id_medicamento`),
  CONSTRAINT `recetas_ibfk_1` FOREIGN KEY (`id_profesional`) REFERENCES `profesionales` (`id_profesional`),
  CONSTRAINT `recetas_ibfk_2` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`),
  CONSTRAINT `recetas_ibfk_3` FOREIGN KEY (`id_medicamento`) REFERENCES `medicamentos` (`id_medicamento`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `recetas` */

insert  into `recetas`(`id_receta`,`id_profesional`,`id_paciente`,`indicaciones`,`fecha`,`id_medicamento`) values (1,4,15,'cada 3 dias','2019-08-15',1);

/*Table structure for table `sobreturno` */

DROP TABLE IF EXISTS `sobreturno`;

CREATE TABLE `sobreturno` (
  `id_sobreturno` int(11) NOT NULL AUTO_INCREMENT,
  `hora` varchar(2) DEFAULT NULL,
  `minuto` varchar(2) DEFAULT NULL,
  `id_agenda` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_sobreturno`),
  KEY `id_agenda` (`id_agenda`),
  CONSTRAINT `sobreturno_ibfk_1` FOREIGN KEY (`id_agenda`) REFERENCES `agenda` (`id_agenda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sobreturno` */

/*Table structure for table `tipocontacto` */

DROP TABLE IF EXISTS `tipocontacto`;

CREATE TABLE `tipocontacto` (
  `id_tipocontacto` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_tipocontacto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `tipocontacto` */

insert  into `tipocontacto`(`id_tipocontacto`,`descripcion`) values (1,'Celular'),(2,'Nro fijo'),(3,'E-mail'),(4,'Fax');

/*Table structure for table `tipotrat` */

DROP TABLE IF EXISTS `tipotrat`;

CREATE TABLE `tipotrat` (
  `id_tipotrat` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_tipotrat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipotrat` */

/*Table structure for table `tratamiento` */

DROP TABLE IF EXISTS `tratamiento`;

CREATE TABLE `tratamiento` (
  `id_tratamiento` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_diente` int(11) DEFAULT NULL,
  `id_cara` int(11) DEFAULT NULL,
  `id_tipotrat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_tratamiento`),
  KEY `id_paciente` (`id_paciente`),
  KEY `id_diente` (`id_diente`),
  KEY `id_cara` (`id_cara`),
  KEY `id_tipotrat` (`id_tipotrat`),
  CONSTRAINT `tratamiento_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`),
  CONSTRAINT `tratamiento_ibfk_2` FOREIGN KEY (`id_diente`) REFERENCES `dientes` (`id_diente`),
  CONSTRAINT `tratamiento_ibfk_3` FOREIGN KEY (`id_cara`) REFERENCES `caras` (`id_cara`),
  CONSTRAINT `tratamiento_ibfk_4` FOREIGN KEY (`id_tipotrat`) REFERENCES `tipotrat` (`id_tipotrat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tratamiento` */

/*Table structure for table `tratamientos` */

DROP TABLE IF EXISTS `tratamientos`;

CREATE TABLE `tratamientos` (
  `id_tratamiento` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `plan` varchar(50) DEFAULT NULL,
  `id_protesis` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_tratamiento`),
  KEY `id_protesis` (`id_protesis`),
  CONSTRAINT `tratamientos_ibfk_2` FOREIGN KEY (`id_protesis`) REFERENCES `protesis` (`id_protesis`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `tratamientos` */

insert  into `tratamientos`(`id_tratamiento`,`descripcion`,`plan`,`id_protesis`) values (1,'extraccion','djsfdsf',NULL),(2,'amagalma','ufjdjd',NULL);

/*Table structure for table `turno_estado` */

DROP TABLE IF EXISTS `turno_estado`;

CREATE TABLE `turno_estado` (
  `id_turno_estado` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_turno_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `turno_estado` */

/*Table structure for table `turnos` */

DROP TABLE IF EXISTS `turnos`;

CREATE TABLE `turnos` (
  `id_turno` int(11) NOT NULL AUTO_INCREMENT,
  `id_profesional` int(11) DEFAULT NULL,
  `id_obrasocial` int(11) DEFAULT NULL,
  `id_especialidad` int(11) DEFAULT NULL,
  `id_paciente` int(11) DEFAULT NULL,
  `id_turno_estado` int(11) DEFAULT NULL,
  `motivo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_turno`),
  KEY `id_obrasocial` (`id_obrasocial`),
  KEY `id_especialidad` (`id_especialidad`),
  KEY `id_paciente` (`id_paciente`),
  KEY `id_profesional` (`id_profesional`),
  KEY `id_turno_estado` (`id_turno_estado`),
  CONSTRAINT `turnos_ibfk_3` FOREIGN KEY (`id_obrasocial`) REFERENCES `obrasocial` (`id_obrasocial`),
  CONSTRAINT `turnos_ibfk_4` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id_especialidad`),
  CONSTRAINT `turnos_ibfk_5` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`),
  CONSTRAINT `turnos_ibfk_6` FOREIGN KEY (`id_profesional`) REFERENCES `profesionales` (`id_profesional`),
  CONSTRAINT `turnos_ibfk_7` FOREIGN KEY (`id_turno_estado`) REFERENCES `turno_estado` (`id_turno_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `turnos` */

insert  into `turnos`(`id_turno`,`id_profesional`,`id_obrasocial`,`id_especialidad`,`id_paciente`,`id_turno_estado`,`motivo`) values (1,1,3,2,30,NULL,NULL);

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  `fecha_ult_login` date DEFAULT NULL,
  `id_perfil` int(11) DEFAULT NULL,
  `id_persona` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_perfil` (`id_perfil`),
  KEY `id_persona` (`id_persona`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_perfil`) REFERENCES `perfiles` (`id`),
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id_persona`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id_usuario`,`username`,`password`,`fecha_ult_login`,`id_perfil`,`id_persona`) values (3,'lbritez','lbritez','2019-05-10',2,3),(4,'JuanG','JuanG','2019-05-10',3,5),(21,'ruth88','bueno',NULL,3,154);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
