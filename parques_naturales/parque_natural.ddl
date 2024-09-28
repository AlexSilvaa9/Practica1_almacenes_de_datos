-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-09-28 18:59:24 CEST
--   sitio:      SQL Server 2012
--   tipo:      SQL Server 2012



CREATE TABLE ESPECIE_ANIMAL 
    (
     nombre_cientifico VARCHAR (30) NOT NULL , 
     nombre_comun VARCHAR (30) , 
     esperanza_vida NUMERIC (28) 
    )
GO

ALTER TABLE ESPECIE_ANIMAL ADD CONSTRAINT ESPECIE_ANIMAL_PK PRIMARY KEY CLUSTERED (nombre_cientifico)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE MUNICIPIO 
    (
     nombre VARCHAR (30) NOT NULL , 
     direccion_web VARCHAR (30) , 
     foto_escudo IMAGE , 
     partido_gobernante VARCHAR (30) , 
     gasto_agua_por_habitante NUMERIC (28) , 
     PARQUE_NATURAL_nombre VARCHAR (30) NOT NULL 
    )
GO

ALTER TABLE MUNICIPIO ADD CONSTRAINT MUNICIPIO_PK PRIMARY KEY CLUSTERED (nombre)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE PARQUE_ESPECIE 
    (
     extension NUMERIC (28) , 
     poblacion_estimada NUMERIC (28) , 
     is_superpoblado BIT , 
     PARQUE_NATURAL_nombre VARCHAR (30) NOT NULL , 
     ESPECIE_ANIMAL_nombre_cientifico VARCHAR (30) NOT NULL 
    )
GO

ALTER TABLE PARQUE_ESPECIE ADD CONSTRAINT PARQUE_ESPECIE_PK PRIMARY KEY CLUSTERED (PARQUE_NATURAL_nombre, ESPECIE_ANIMAL_nombre_cientifico)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE PARQUE_NATURAL 
    (
     nombre VARCHAR (30) NOT NULL , 
     telefono NUMERIC (28) , 
     direccion_administrativa VARCHAR (30) , 
     direccion_web VARCHAR (25) , 
     correo_electronico VARCHAR (25) , 
     fecha_de_declaracion DATE , 
     numero_municipios_que_abarca NUMERIC (28) , 
     PERSONA_dni VARCHAR (16) NOT NULL 
    )
GO 

    


CREATE UNIQUE NONCLUSTERED INDEX 
    PARQUE_NATURAL__IDX ON PARQUE_NATURAL 
    ( 
     PERSONA_dni 
    ) 
GO

ALTER TABLE PARQUE_NATURAL ADD CONSTRAINT PARQUE_NATURAL_PK PRIMARY KEY CLUSTERED (nombre)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

CREATE TABLE PERSONA 
    (
     dni VARCHAR (16) NOT NULL , 
     nombre VARCHAR (30) , 
     direccion VARCHAR (30) , 
     fecha_nacimiento DATE , 
     PARQUE_NATURAL_nombre VARCHAR (30) 
    )
GO

ALTER TABLE PERSONA ADD CONSTRAINT PERSONA_PK PRIMARY KEY CLUSTERED (dni)
     WITH (
     ALLOW_PAGE_LOCKS = ON , 
     ALLOW_ROW_LOCKS = ON )
GO

ALTER TABLE MUNICIPIO 
    ADD CONSTRAINT MUNICIPIO_PARQUE_NATURAL_FK FOREIGN KEY 
    ( 
     PARQUE_NATURAL_nombre
    ) 
    REFERENCES PARQUE_NATURAL 
    ( 
     nombre 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE PARQUE_ESPECIE 
    ADD CONSTRAINT PARQUE_ESPECIE_ESPECIE_ANIMAL_FK FOREIGN KEY 
    ( 
     ESPECIE_ANIMAL_nombre_cientifico
    ) 
    REFERENCES ESPECIE_ANIMAL 
    ( 
     nombre_cientifico 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE PARQUE_ESPECIE 
    ADD CONSTRAINT PARQUE_ESPECIE_PARQUE_NATURAL_FK FOREIGN KEY 
    ( 
     PARQUE_NATURAL_nombre
    ) 
    REFERENCES PARQUE_NATURAL 
    ( 
     nombre 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE PARQUE_NATURAL 
    ADD CONSTRAINT PARQUE_NATURAL_PERSONA_FK FOREIGN KEY 
    ( 
     PERSONA_dni
    ) 
    REFERENCES PERSONA 
    ( 
     dni 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO

ALTER TABLE PERSONA 
    ADD CONSTRAINT PERSONA_PARQUE_NATURAL_FK FOREIGN KEY 
    ( 
     PARQUE_NATURAL_nombre
    ) 
    REFERENCES PARQUE_NATURAL 
    ( 
     nombre 
    ) 
    ON DELETE NO ACTION 
    ON UPDATE NO ACTION 
GO



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             1
-- ALTER TABLE                             10
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
