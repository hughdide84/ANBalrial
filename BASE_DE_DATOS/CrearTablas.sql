CREATE TABLE IF NOT EXISTS `entidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla balrial.logapp
CREATE TABLE IF NOT EXISTS `logapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `codigo` varchar(20) NOT NULL,
  `subcodigo` varchar(20) NOT NULL,
  `texto` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `logapp_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla balrial.planificacion
CREATE TABLE IF NOT EXISTS `planificacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProyUbicaciones` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `horaInicio` time NOT NULL,
  `horaFin` time NOT NULL,
  `recursos` int(11) DEFAULT NULL,
  `asignados` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idProyUbicaciones` (`idProyUbicaciones`),
  CONSTRAINT `planificacion_ibfk_1` FOREIGN KEY (`idProyUbicaciones`) REFERENCES `proyubicaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla balrial.planusuarios
CREATE TABLE IF NOT EXISTS `planusuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idPlanificacion` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idPlanificacion` (`idPlanificacion`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `planusuarios_ibfk_1` FOREIGN KEY (`idPlanificacion`) REFERENCES `planificacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `planusuarios_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla balrial.proyectos
CREATE TABLE IF NOT EXISTS `proyectos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `fechaInicio` date NOT NULL,
  `fechaFin` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla balrial.proyfechas
CREATE TABLE IF NOT EXISTS `proyfechas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProyecto` int(11) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idProyecto` (`idProyecto`),
  CONSTRAINT `proyfechas_ibfk_1` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla balrial.proyturnos
CREATE TABLE IF NOT EXISTS `proyturnos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProyecto` int(11) NOT NULL,
  `horaInicio` time NOT NULL,
  `horaFin` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idProyecto` (`idProyecto`),
  CONSTRAINT `proyturnos_ibfk_1` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla balrial.proyubicaciones
CREATE TABLE IF NOT EXISTS `proyubicaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProyecto` int(11) NOT NULL,
  `idUbicacion` int(11) NOT NULL,
  `idCordinador` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idProyecto` (`idProyecto`),
  KEY `idUbicacion` (`idUbicacion`),
  KEY `idCordinador` (`idCordinador`),
  CONSTRAINT `proyubicaciones_ibfk_1` FOREIGN KEY (`idProyecto`) REFERENCES `proyectos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `proyubicaciones_ibfk_2` FOREIGN KEY (`idUbicacion`) REFERENCES `ubicaciones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `proyubicaciones_ibfk_3` FOREIGN KEY (`idCordinador`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla balrial.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla balrial.ubicaciones
CREATE TABLE IF NOT EXISTS `ubicaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idEntidad` int(11) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `cp` int(11) NOT NULL,
  `poblacion` varchar(50) NOT NULL,
  `zona` varchar(50) DEFAULT NULL,
  `longitud` decimal(11,8) DEFAULT NULL,
  `latitud` decimal(11,8) DEFAULT NULL,
  `volumen` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idEntidad` (`idEntidad`),
  CONSTRAINT `ubicaciones_ibfk_1` FOREIGN KEY (`idEntidad`) REFERENCES `entidades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla balrial.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(15) NOT NULL,
  `password` varchar(30) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(80) DEFAULT NULL,
  `cp` int(11) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `telegramId` int(11) DEFAULT NULL,
  `dias` varchar(7) DEFAULT NULL,
  `horaInicio` time DEFAULT NULL,
  `horaFin` time DEFAULT NULL,
  `disponibilidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla balrial.usuroles
CREATE TABLE IF NOT EXISTS `usuroles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL,
  `idRol` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idUsuario` (`idUsuario`),
  KEY `idRol` (`idRol`),
  CONSTRAINT `usuroles_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuroles_ibfk_2` FOREIGN KEY (`idRol`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

