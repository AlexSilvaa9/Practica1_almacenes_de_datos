-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-09-30 18:33:04 CEST
--   sitio:      SQL Server 2012
--   tipo:      SQL Server 2012



CREATE TABLE ARBITRO 
    (
     numero INTEGER NOT NULL , 
     internacional BIT , 
     futbolista BIT , 
     ARBITRO_TYPE VARCHAR (7) NOT NULL 
    )
GO 


ALTER TABLE ARBITRO 
    ADD CONSTRAINT CH_INH_ARBITRO 
    CHECK ( ARBITRO_TYPE IN ('ARBITRO') ) 
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
     categoria_anterior VARCHAR (20) 
    )
GO

ALTER TABLE COLEGIADO ADD CONSTRAINT COLEGIADO_PK PRIMARY KEY CLUSTERED (numero)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE "equipo-partido" 
    (
     EQUIPOS_Nombre VARCHAR (40) NOT NULL , 
     PARTIDO_numero INTEGER NOT NULL 
    )
GO

ALTER TABLE "equipo-partido" ADD CONSTRAINT "equipo-partido_PK" PRIMARY KEY CLUSTERED (EQUIPOS_Nombre, PARTIDO_numero)
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
     Fundador VARCHAR (40) 
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
     edad INTEGER , 
     PARTIDO_JORNADA_numero INTEGER , 
     JUEZ_LINEA_TYPE VARCHAR (10) NOT NULL 
    )
GO 


ALTER TABLE JUEZ_LINEA 
    ADD CONSTRAINT CH_INH_JUEZ_LINEA 
    CHECK ( JUEZ_LINEA_TYPE IN ('JUEZ_LINEA') ) 
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
     JUGADOR_TYPE VARCHAR (7) NOT NULL 
    )
GO 


ALTER TABLE JUGADOR 
    ADD CONSTRAINT CH_INH_JUGADOR 
    CHECK ( JUGADOR_TYPE IN ('JUGADOR') ) 
GO

ALTER TABLE JUGADOR ADD CONSTRAINT JUGADOR_PK PRIMARY KEY CLUSTERED (DNI)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE PARTIDO 
    (
     resultado VARCHAR (10) , 
     fecha DATE , 
     recaudacion FLOAT (2) , 
     n_espectadores INTEGER , 
     JORNADA_numero INTEGER NOT NULL , 
     ARBITRO_numero INTEGER NOT NULL , 
     ARBITRO_numero2 INTEGER NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    PARTIDO__IDX ON PARTIDO 
    ( 
     ARBITRO_numero 
    ) 
GO 


CREATE UNIQUE NONCLUSTERED INDEX 
    PARTIDO__IDXv1 ON PARTIDO 
    ( 
     ARBITRO_numero2 
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
     EQUIPOS_Nombre3 VARCHAR (40) NOT NULL , 
     EQUIPOS_Nombre5 VARCHAR (40) NOT NULL , 
     EQUIPOS_Nombre6 VARCHAR (40) NOT NULL , 
     EQUIPOS_Nombre2 VARCHAR (40) NOT NULL , 
     EQUIPOS_Nombre4 VARCHAR (40) NOT NULL , 
     EQUIPOS_Nombre7 VARCHAR (40) NOT NULL , 
     EQUIPOS_Nombre VARCHAR (40) NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    PERSONAL__IDX ON PERSONAL 
    ( 
     EQUIPOS_Nombre2 
    ) 
GO 


CREATE UNIQUE NONCLUSTERED INDEX 
    PERSONAL__IDXv1 ON PERSONAL 
    ( 
     EQUIPOS_Nombre3 
    ) 
GO 


CREATE UNIQUE NONCLUSTERED INDEX 
    PERSONAL__IDXv2 ON PERSONAL 
    ( 
     EQUIPOS_Nombre4 
    ) 
GO 


CREATE UNIQUE NONCLUSTERED INDEX 
    PERSONAL__IDXv3 ON PERSONAL 
    ( 
     EQUIPOS_Nombre5 
    ) 
GO 


CREATE UNIQUE NONCLUSTERED INDEX 
    PERSONAL__IDXv4 ON PERSONAL 
    ( 
     EQUIPOS_Nombre6 
    ) 
GO 


CREATE UNIQUE NONCLUSTERED INDEX 
    PERSONAL__IDXv5 ON PERSONAL 
    ( 
     EQUIPOS_Nombre7 
    ) 
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

ALTER TABLE "equipo-partido" 
    ADD CONSTRAINT "equipo-partido_EQUIPOS_FK" FOREIGN KEY 
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

ALTER TABLE "equipo-partido" 
    ADD CONSTRAINT "equipo-partido_PARTIDO_FK" FOREIGN KEY 
    ( 
     PARTIDO_numero
    ) 
    REFERENCES PARTIDO 
    ( 
     JORNADA_numero 
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

ALTER TABLE JUEZ_LINEA 
    ADD CONSTRAINT JUEZ_LINEA_PARTIDO_FK FOREIGN KEY 
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
     ARBITRO_numero
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

ALTER TABLE PERSONAL 
    ADD CONSTRAINT PERSONAL_EQUIPOS_FK FOREIGN KEY 
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

ALTER TABLE PERSONAL 
    ADD CONSTRAINT PERSONAL_EQUIPOS_FKv2 FOREIGN KEY 
    ( 
     EQUIPOS_Nombre2
    ) 
    REFERENCES EQUIPOS 
    ( 
     Nombre 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE PERSONAL 
    ADD CONSTRAINT PERSONAL_EQUIPOS_FKv3 FOREIGN KEY 
    ( 
     EQUIPOS_Nombre3
    ) 
    REFERENCES EQUIPOS 
    ( 
     Nombre 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE PERSONAL 
    ADD CONSTRAINT PERSONAL_EQUIPOS_FKv4 FOREIGN KEY 
    ( 
     EQUIPOS_Nombre4
    ) 
    REFERENCES EQUIPOS 
    ( 
     Nombre 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE PERSONAL 
    ADD CONSTRAINT PERSONAL_EQUIPOS_FKv5 FOREIGN KEY 
    ( 
     EQUIPOS_Nombre5
    ) 
    REFERENCES EQUIPOS 
    ( 
     Nombre 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE PERSONAL 
    ADD CONSTRAINT PERSONAL_EQUIPOS_FKv6 FOREIGN KEY 
    ( 
     EQUIPOS_Nombre6
    ) 
    REFERENCES EQUIPOS 
    ( 
     Nombre 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE PERSONAL 
    ADD CONSTRAINT PERSONAL_EQUIPOS_FKv7 FOREIGN KEY 
    ( 
     EQUIPOS_Nombre7
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
-- CREATE TABLE                             9
-- CREATE INDEX                             8
-- ALTER TABLE                             29
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
