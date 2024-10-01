-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-10-01 20:09:28 CEST
--   sitio:      SQL Server 2012
--   tipo:      SQL Server 2012



CREATE TABLE ARBITRO 
    (
     numero INTEGER NOT NULL , 
     internacional BIT , 
     futbolista BIT 
    )
GO

ALTER TABLE ARBITRO ADD CONSTRAINT ARBITRO_PK PRIMARY KEY CLUSTERED (numero)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE COLEGIADO 
    (
     numero INTEGER NOT NULL , 
     Nombre VARCHAR (30) , 
     DNI VARCHAR (10) NOT NULL , 
     antiguedad INTEGER , 
     categoria_anterior VARCHAR (20) , 
     COLEGIADO_TYPE VARCHAR (10) NOT NULL 
    )
GO 


ALTER TABLE COLEGIADO 
    ADD CONSTRAINT CH_INH_COLEGIADO 
    CHECK ( COLEGIADO_TYPE IN ('ARBITRO', 'COLEGIADO', 'JUEZ_LINEA') ) 
GO

ALTER TABLE COLEGIADO ADD CONSTRAINT COLEGIADO_PK PRIMARY KEY CLUSTERED (numero)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE EQUIPOS 
    (
     Nombre VARCHAR (40) NOT NULL , 
     n_socios INTEGER , 
     Campo VARCHAR (30) , 
     Ciudad VARCHAR (30) , 
     año_fundacion INTEGER , 
     años_continuados_primera INTEGER , 
     Fundador VARCHAR (40) , 
     medicoL_DNI VARCHAR (15) NOT NULL , 
     entrenador_DNI VARCHAR (15) NOT NULL , 
     preparador_DNI VARCHAR (15) NOT NULL , 
     director_DNI VARCHAR (15) NOT NULL , 
     entrenador_portero_DNI VARCHAR (15) NOT NULL , 
     presidente_DNI VARCHAR (15) NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    EQUIPOS__IDX ON EQUIPOS 
    ( 
     director_DNI 
    ) 
GO 


CREATE UNIQUE NONCLUSTERED INDEX 
    EQUIPOS__IDXv1 ON EQUIPOS 
    ( 
     entrenador_portero_DNI 
    ) 
GO 


CREATE UNIQUE NONCLUSTERED INDEX 
    EQUIPOS__IDXv2 ON EQUIPOS 
    ( 
     preparador_DNI 
    ) 
GO 


CREATE UNIQUE NONCLUSTERED INDEX 
    EQUIPOS__IDXv3 ON EQUIPOS 
    ( 
     entrenador_DNI 
    ) 
GO 


CREATE UNIQUE NONCLUSTERED INDEX 
    EQUIPOS__IDXv4 ON EQUIPOS 
    ( 
     medicoL_DNI 
    ) 
GO 


CREATE UNIQUE NONCLUSTERED INDEX 
    EQUIPOS__IDXv5 ON EQUIPOS 
    ( 
     presidente_DNI 
    ) 
GO

ALTER TABLE EQUIPOS ADD CONSTRAINT EQUIPOS_PK PRIMARY KEY CLUSTERED (Nombre)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE JORNADA 
    (
     numero INTEGER NOT NULL , 
     goles_cabeza INTEGER , 
     goles_propia INTEGER , 
     goles_penalti INTEGER , 
     recaudacion FLOAT (2) 
    )
GO

ALTER TABLE JORNADA ADD CONSTRAINT JORNADA_PK PRIMARY KEY CLUSTERED (numero)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE JUEZ_LINEA 
    (
     numero INTEGER NOT NULL , 
     posibilidad BIT , 
     edad INTEGER 
    )
GO

ALTER TABLE JUEZ_LINEA ADD CONSTRAINT JUEZ_LINEA_PK PRIMARY KEY CLUSTERED (numero)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE JUGADOR 
    (
     DNI VARCHAR (15) NOT NULL , 
     Apodo VARCHAR (15) NOT NULL , 
     puesto VARCHAR (15) , 
     años_fin_contrato INTEGER , 
     cuantia_clausula INTEGER , 
     n_años INTEGER , 
     PARTIDO_JORNADA_numero INTEGER NOT NULL , 
     EQUIPOS_Nombre VARCHAR (40) NOT NULL 
    )
GO

ALTER TABLE JUGADOR ADD CONSTRAINT JUGADOR_PK PRIMARY KEY CLUSTERED (DNI)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO
ALTER TABLE JUGADOR ADD CONSTRAINT JUGADOR_PKv1 UNIQUE NONCLUSTERED (EQUIPOS_Nombre)
GO

CREATE TABLE PARTIDO 
    (
     resultado VARCHAR (10) , 
     fecha DATE , 
     recaudacion FLOAT (2) , 
     n_espectadores INTEGER , 
     JORNADA_numero INTEGER NOT NULL , 
     ARBITRO_principal INTEGER NOT NULL , 
     ARBITRO_numero2 INTEGER NOT NULL , 
     equipo_local VARCHAR (40) NOT NULL , 
     equipo_residente VARCHAR (40) NOT NULL , 
     JUEZ_LINEA_numero INTEGER NOT NULL , 
     JUEZ_LINEA_numero1 INTEGER NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    PARTIDO__IDX ON PARTIDO 
    ( 
     ARBITRO_principal 
    ) 
GO 


CREATE UNIQUE NONCLUSTERED INDEX 
    PARTIDO__IDXv1 ON PARTIDO 
    ( 
     ARBITRO_numero2 
    ) 
GO 


CREATE UNIQUE NONCLUSTERED INDEX 
    PARTIDO__IDXv2 ON PARTIDO 
    ( 
     equipo_local 
    ) 
GO 


CREATE UNIQUE NONCLUSTERED INDEX 
    PARTIDO__IDXv3 ON PARTIDO 
    ( 
     equipo_residente 
    ) 
GO 


CREATE UNIQUE NONCLUSTERED INDEX 
    PARTIDO__IDXv4 ON PARTIDO 
    ( 
     JUEZ_LINEA_numero 
    ) 
GO 


CREATE UNIQUE NONCLUSTERED INDEX 
    PARTIDO__IDXv5 ON PARTIDO 
    ( 
     JUEZ_LINEA_numero1 
    ) 
GO

ALTER TABLE PARTIDO ADD CONSTRAINT PARTIDO_PK PRIMARY KEY CLUSTERED (JORNADA_numero)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE PERSONAL 
    (
     DNI VARCHAR (15) NOT NULL , 
     Nombre VARCHAR (15) , 
     fecha_nacimiento DATE , 
     telefono INTEGER , 
     direccion VARCHAR (40) , 
     sueldo INTEGER , 
     EQUIPOS_consejeros VARCHAR (40) , 
     PERSONAL_TYPE VARCHAR (8) NOT NULL 
    )
GO 


ALTER TABLE PERSONAL 
    ADD CONSTRAINT CH_INH_PERSONAL 
    CHECK ( PERSONAL_TYPE IN ('JUGADOR', 'PERSONAL') ) 
GO

ALTER TABLE PERSONAL ADD CONSTRAINT PERSONAL_PK PRIMARY KEY CLUSTERED (DNI)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE ARBITRO 
    ADD CONSTRAINT ARBITRO_COLEGIADO_FK FOREIGN KEY 
    ( 
     numero
    ) 
    REFERENCES COLEGIADO 
    ( 
     numero 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE EQUIPOS 
    ADD CONSTRAINT EQUIPOS_PERSONAL_FK FOREIGN KEY 
    ( 
     director_DNI
    ) 
    REFERENCES PERSONAL 
    ( 
     DNI 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE EQUIPOS 
    ADD CONSTRAINT EQUIPOS_PERSONAL_FKv2 FOREIGN KEY 
    ( 
     entrenador_portero_DNI
    ) 
    REFERENCES PERSONAL 
    ( 
     DNI 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE EQUIPOS 
    ADD CONSTRAINT EQUIPOS_PERSONAL_FKv3 FOREIGN KEY 
    ( 
     preparador_DNI
    ) 
    REFERENCES PERSONAL 
    ( 
     DNI 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE EQUIPOS 
    ADD CONSTRAINT EQUIPOS_PERSONAL_FKv4 FOREIGN KEY 
    ( 
     entrenador_DNI
    ) 
    REFERENCES PERSONAL 
    ( 
     DNI 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE EQUIPOS 
    ADD CONSTRAINT EQUIPOS_PERSONAL_FKv5 FOREIGN KEY 
    ( 
     medicoL_DNI
    ) 
    REFERENCES PERSONAL 
    ( 
     DNI 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE EQUIPOS 
    ADD CONSTRAINT EQUIPOS_PERSONAL_FKv6 FOREIGN KEY 
    ( 
     presidente_DNI
    ) 
    REFERENCES PERSONAL 
    ( 
     DNI 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE JUEZ_LINEA 
    ADD CONSTRAINT JUEZ_LINEA_COLEGIADO_FK FOREIGN KEY 
    ( 
     numero
    ) 
    REFERENCES COLEGIADO 
    ( 
     numero 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE JUGADOR 
    ADD CONSTRAINT JUGADOR_EQUIPOS_FK FOREIGN KEY 
    ( 
     EQUIPOS_Nombre
    ) 
    REFERENCES EQUIPOS 
    ( 
     Nombre 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE JUGADOR 
    ADD CONSTRAINT JUGADOR_PARTIDO_FK FOREIGN KEY 
    ( 
     PARTIDO_JORNADA_numero
    ) 
    REFERENCES PARTIDO 
    ( 
     JORNADA_numero 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE JUGADOR 
    ADD CONSTRAINT JUGADOR_PERSONAL_FK FOREIGN KEY 
    ( 
     DNI
    ) 
    REFERENCES PERSONAL 
    ( 
     DNI 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE PARTIDO 
    ADD CONSTRAINT PARTIDO_ARBITRO_FK FOREIGN KEY 
    ( 
     ARBITRO_principal
    ) 
    REFERENCES ARBITRO 
    ( 
     numero 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE PARTIDO 
    ADD CONSTRAINT PARTIDO_ARBITRO_FKv2 FOREIGN KEY 
    ( 
     ARBITRO_numero2
    ) 
    REFERENCES ARBITRO 
    ( 
     numero 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE PARTIDO 
    ADD CONSTRAINT PARTIDO_EQUIPOS_FK FOREIGN KEY 
    ( 
     equipo_local
    ) 
    REFERENCES EQUIPOS 
    ( 
     Nombre 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE PARTIDO 
    ADD CONSTRAINT PARTIDO_EQUIPOS_FKv2 FOREIGN KEY 
    ( 
     equipo_residente
    ) 
    REFERENCES EQUIPOS 
    ( 
     Nombre 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE PARTIDO 
    ADD CONSTRAINT PARTIDO_JORNADA_FK FOREIGN KEY 
    ( 
     JORNADA_numero
    ) 
    REFERENCES JORNADA 
    ( 
     numero 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE PARTIDO 
    ADD CONSTRAINT PARTIDO_JUEZ_LINEA_FK FOREIGN KEY 
    ( 
     JUEZ_LINEA_numero
    ) 
    REFERENCES JUEZ_LINEA 
    ( 
     numero 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE PARTIDO 
    ADD CONSTRAINT PARTIDO_JUEZ_LINEA_FKv2 FOREIGN KEY 
    ( 
     JUEZ_LINEA_numero1
    ) 
    REFERENCES JUEZ_LINEA 
    ( 
     numero 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE PERSONAL 
    ADD CONSTRAINT PERSONAL_EQUIPOS_FK FOREIGN KEY 
    ( 
     EQUIPOS_consejeros
    ) 
    REFERENCES EQUIPOS 
    ( 
     Nombre 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                            12
-- ALTER TABLE                             30
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE DATABASE                          0
-- CREATE DEFAULT                           0
-- CREATE INDEX ON VIEW                     0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE ROLE                              0
-- CREATE RULE                              0
-- CREATE SCHEMA                            0
-- CREATE SEQUENCE                          0
-- CREATE PARTITION FUNCTION                0
-- CREATE PARTITION SCHEME                  0
-- 
-- DROP DATABASE                            0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
