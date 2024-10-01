-- Generado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   en:        2024-10-01 20:09:28 CEST
--   sitio:      SQL Server 2012
--   tipo:      SQL Server 2012

USE liga_futbol
GO
USE liga_futbol
GO

-- Inserción de colegiados (incluyendo jueces de línea)
INSERT INTO COLEGIADO (numero, Nombre, DNI, antiguedad, categoria_anterior, COLEGIADO_TYPE) 
VALUES 
    (1, 'Antonio Mateu', '12345678A', 10, 'Segunda División', 'ARBITRO'),
    (2, 'Carlos del Cerro', '23456789B', 12, 'Segunda División B', 'ARBITRO'),
    (3, 'José Luis Munuera', '34567890C', 8, 'Segunda División', 'ARBITRO'),
    (4, 'Alejandro Hernández', '45678901D', 9, 'Segunda División', 'ARBITRO'),
    (5, 'Jesús Gil Manzano', '56789012E', 11, 'Segunda División', 'ARBITRO'),
    (6, 'Luis Martínez', '67890123F', 7, 'Segunda División', 'JUEZ_LINEA'),  
    (7, 'Javier López', '78901234G', 6, 'Segunda División', 'JUEZ_LINEA'),  
    (8, 'Fernando Díaz', '89012345H', 5, 'Segunda División', 'JUEZ_LINEA');  

-- Inserción de árbitros
INSERT INTO ARBITRO (numero, internacional, futbolista) 
VALUES 
    (1, 1, 0),
    (2, 0, 0),
    (3, 1, 0),
    (4, 0, 1),
    (5, 1, 0);

-- Inserción de personal
INSERT INTO PERSONAL (DNI, Nombre, fecha_nacimiento, telefono, direccion, sueldo, EQUIPOS_consejeros, PERSONAL_TYPE) 
VALUES 
    -- Real Madrid
    ('DNI001', 'Dr. García', '1970-05-15', 600123456, 'Calle de la Salud 10, Madrid', 120000, null, 'PERSONAL'),
    ('DNI002', 'Ancelotti', '1959-06-10', 600987654, 'Calle de los Entrenadores 5, Madrid', 5000000, null, 'PERSONAL'),
    ('DNI003', 'Jiménez', '1978-03-25', 600654321, 'Calle de los Preparadores 15, Madrid', 150000, null, 'PERSONAL'),
    ('DNI004', 'Florentino', '1947-03-08', 600111222, 'Calle de los Directores 1, Madrid', 2000000, null, 'PERSONAL'),
    ('DNI005', 'Juan García', '1965-09-09', 600333444, 'Calle de los Porteros 3, Madrid', 80000, null, 'PERSONAL'),
    ('DNI006', 'Sergio Ramos', '1986-03-30', 600555666, 'Calle de los Presidentes 2, Madrid', 1000000, null, 'PERSONAL'),

    -- FC Barcelona
    ('DNI007', 'Dr. López', '1965-08-09', 600876543, 'Calle Médica 22, Barcelona', 110000, null, 'PERSONAL'),
    ('DNI008', 'Xavi', '1980-01-25', 600543210, 'Calle de los Entrenadores 3, Barcelona', 4000000, null, 'PERSONAL'),
    ('DNI009', 'Pep Guardiola', '1971-01-18', 600777888, 'Calle de los Preparadores 2, Barcelona', 3000000, null, 'PERSONAL'),
    ('DNI010', 'Nombre Director', '1980-01-01', 600000000, 'Calle del Director', 250000, null, 'PERSONAL'),  
    ('DNI011', 'Víctor Valdés', '1982-01-14', 600999000, 'Calle de los Entrenadores 4, Barcelona', 200000, null, 'PERSONAL'),
    ('DNI012', 'Joan Laporta', '1962-06-29', 600111999, 'Calle de los Presidentes 6, Barcelona', 1500000, null, 'PERSONAL'),

    -- Atletico Madrid
    ('DNI013', 'José Fernández', '1970-07-01', 600112233, 'Calle de la Salud 14, Madrid', 120000, null, 'PERSONAL'),
    ('DNI014', 'Diego Simeone', '1970-04-28', 600122334, 'Calle de los Entrenadores 7, Madrid', 5000000, null, 'PERSONAL'),
    ('DNI015', 'Raúl Jiménez', '1980-09-09', 600123456, 'Calle de los Preparadores 17, Madrid', 150000, null, 'PERSONAL'),
    ('DNI016', 'Miguel Gil', '1975-08-10', 600234567, 'Calle de los Directores 10, Madrid', 180000, null, 'PERSONAL'),
    ('DNI017', 'Juan Portero', '1978-05-12', 600345678, 'Calle de los Porteros 9, Madrid', 90000, null, 'PERSONAL'),
    ('DNI018', 'Enrique Cerezo', '1948-02-27', 600456789, 'Calle de los Presidentes 7, Madrid', 1500000, null, 'PERSONAL'),

    -- Sevilla FC
    ('DNI019', 'Francisco', '1969-06-15', 600987123, 'Calle Médica 24, Sevilla', 120000, null, 'PERSONAL'),
    ('DNI020', 'Lopetegui', '1966-08-28', 600543987, 'Calle de los Entrenadores 19, Sevilla', 4000000, null, 'PERSONAL'),
    ('DNI021', 'Pedro Romero', '1973-11-11', 600987654, 'Calle de los Preparadores 20, Sevilla', 150000, null, 'PERSONAL'),
    ('DNI022', 'Pepe Castro', '1958-05-05', 600234789, 'Calle de los Directores 12, Sevilla', 180000, null, 'PERSONAL'),
    ('DNI023', 'Cristiano Pérez', '1985-01-01', 600123789, 'Calle de los Médicos 5, Sevilla', 95000, null, 'PERSONAL'),
    ('DNI024', 'Juan Antonio', '1980-11-01', 600456123, 'Calle de los Entrenadores 18, Sevilla', 3200000, null, 'PERSONAL'),
    
    -- Jugadores
    ('DNI1001', 'Karim Benzema', '1987-12-19', '600000001', 'Calle del Gol 1, Madrid', 1500000, NULL, 'JUGADOR'),
    ('DNI1002', 'Luka Modric', '1985-09-09', '600000002', 'Calle del Centro 2, Madrid', 1200000, NULL, 'JUGADOR'),
    ('DNI1003', 'ter Stegen', '1992-04-30', '600000003', 'Calle del Portero 3, Barcelona', 1800000, NULL, 'JUGADOR'),
    ('DNI1004', 'Pedri', '2002-11-25', '600000004', 'Calle de los Jóvenes 4, Barcelona', 1000000, NULL, 'JUGADOR'),
    ('DNI1005', 'Koke', '1992-01-08', '600000005', 'Calle del Centrocampista 5, Madrid', 1400000, NULL, 'JUGADOR'),
    ('DNI1006', 'Keylor Navas', '1986-12-15', '600000006', 'Calle del Defensa 6, Sevilla', 1600000, NULL, 'JUGADOR');

-- Inserción de equipos
INSERT INTO EQUIPOS (Nombre, n_socios, Campo, Ciudad, año_fundacion, años_continuados_primera, Fundador, medicoL_DNI, entrenador_DNI, preparador_DNI, director_DNI, entrenador_portero_DNI, presidente_DNI) 
VALUES 
    ('Real Madrid', 85000, 'Santiago Bernabéu', 'Madrid', 1902, 92, 'Julián Palacios', 'DNI001', 'DNI002', 'DNI003', 'DNI004', 'DNI005', 'DNI006'),
    ('FC Barcelona', 78000, 'Camp Nou', 'Barcelona', 1899, 91, 'Joan Gamper', 'DNI007', 'DNI008', 'DNI009', 'DNI010', 'DNI011', 'DNI012'),
    ('Atletico Madrid', 68000, 'Metropolitano', 'Madrid', 1903, 90, 'Enrique Allende', 'DNI013', 'DNI014', 'DNI015', 'DNI016', 'DNI017', 'DNI018'),
    ('Sevilla FC', 42000, 'Ramón Sánchez Pizjuán', 'Sevilla', 1905, 78, 'Jose Luis Gallegos', 'DNI019', 'DNI020', 'DNI021', 'DNI022', 'DNI023', 'DNI024');

-- Inserción de jornadas
INSERT INTO JORNADA (numero, goles_cabeza, goles_propia, goles_penalti, recaudacion) 
VALUES 
    (1, 5, 0, 2, 1000000.00),
    (2, 3, 1, 1, 1200000.00),
    (3, 6, 0, 3, 1100000.00),
    (4, 4, 1, 1, 900000.00),
    (5, 2, 0, 0, 950000.00);

-- Inserción de jueces de línea
INSERT INTO JUEZ_LINEA (numero, posibilidad, edad) 
VALUES 
    (1, 1, 35),
    (2, 0, 42),
    (3, 1, 39),
    (4, 0, 36),
    (5, 1, 41);

-- Inserción de partidos
INSERT INTO PARTIDO (resultado, fecha, recaudacion, n_espectadores, JORNADA_numero, ARBITRO_principal, ARBITRO_numero2, equipo_local, equipo_residente, JUEZ_LINEA_numero, JUEZ_LINEA_numero1) 
VALUES 
    ('2-1', '2024-08-14', 1300000.00, 78000, 1, 1, 2, 'Real Madrid', 'Atletico Madrid', 1, 2),
    ('0-0', '2024-08-21', 1400000.00, 90000, 2, 3, 4, 'FC Barcelona', 'Sevilla FC', 3, 4),
    ('1-1', '2024-08-28', 1200000.00, 72000, 3, 5, 1, 'Atletico Madrid', 'Real Madrid', 5, 1),
    ('3-2', '2024-09-04', 1100000.00, 60000, 4, 2, 3, 'Sevilla FC', 'FC Barcelona', 2, 3);

ALTER TABLE JUGADOR
DROP CONSTRAINT JUGADOR_PKv1;

-- Inserción de jugadores
INSERT INTO JUGADOR (DNI, Apodo, puesto, años_fin_contrato, cuantia_clausula, n_años, PARTIDO_JORNADA_numero, EQUIPOS_Nombre) 
VALUES 
    ('DNI1001', 'Benzema', 'Delantero', 2025, 100000000, 5, 1, 'Real Madrid'),
    ('DNI1002', 'Modric', 'Centrocampista', 2024, 50000000, 8, 1, 'Real Madrid'),
    ('DNI1003', 'Ter Stegen', 'Portero', 2026, 80000000, 5, 2, 'FC Barcelona'),
    ('DNI1004', 'Pedri', 'Centrocampista', 2026, 150000000, 6, 2, 'FC Barcelona'),
    ('DNI1005', 'Koke', 'Centrocampista', 2025, 60000000, 4, 3, 'Atletico Madrid'),
    ('DNI1006', 'Navas', 'Defensa', 2024, 30000000, 3, 4, 'Sevilla FC');
