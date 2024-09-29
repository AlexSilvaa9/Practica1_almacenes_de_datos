-- Insertar especies animales
INSERT INTO ESPECIE_ANIMAL (nombre_cientifico, nombre_comun, esperanza_vida) VALUES
('Ursus arctos', 'Oso pardo', 25),
('Canis lupus', 'Lobo', 15),
('Ailuropoda melanoleuca', 'Oso panda', 20),
('Panthera leo', 'León', 14),
('Elephas maximus', 'Elefante asiático', 60),
('Giraffa camelopardalis', 'Jirafa', 25),
('Balaenoptera musculus', 'Ballena azul', 80),
('Puma concolor', 'Puma', 12),
('Carcharodon carcharias', 'Tiburón blanco', 30),
('Lycaon pictus', 'Perro salvaje africano', 10),
('Lynx pardinus', 'Lynx ibérico', 13),
('Acinonyx jubatus', 'Guepardo', 12),
('Aquila chrysaetos', 'Águila real', 30),
('Haliaeetus leucocephalus', 'Águila calva', 20),
('Dendrocopos major', 'Pico picapinos', 10);

-- Insertar personas (presidentes) - un presidente por parque natural
INSERT INTO PERSONA (dni, nombre, direccion, fecha_nacimiento) VALUES
('12345678A', 'Juan Pérez', 'Calle Falsa 123', '1980-01-01'),  -- Sierra Nevada
('23456789B', 'María García', 'Avenida Real 456', '1990-05-15'),  -- Doñana
('34567890C', 'Luis Torres', 'Calle Larga 789', '1985-02-20'),  -- Cabo de Gata
('45678901D', 'Ana Martínez', 'Plaza Central 321', '1992-08-22');  -- Picos de Europa

-- Insertar parques naturales
INSERT INTO PARQUE_NATURAL (nombre, telefono, direccion_administrativa, direccion_web, correo_electronico, fecha_de_declaracion, numero_municipios_que_abarca, PERSONA_dni) VALUES
('Sierra Nevada', 123456789, 'Granada', 'www.sierranevada.com', 'contacto@sierranevada.com', '1989-06-01', 0, '12345678A'),
('Doñana', 987654321, 'Huelva', 'www.donana.com', 'contacto@donana.com', '1994-07-15', 0, '23456789B'),
('Cabo de Gata', 123123123, 'Almería', 'www.cabodegata.com', 'info@cabodegata.com', '1997-05-12', 0, '34567890C'),
('Picos de Europa', 321321321, 'Asturias', 'www.picosdeeuropa.com', 'contacto@picos.com', '1999-10-05', 0, '45678901D');

-- Insertar consejeros
INSERT INTO PERSONA (dni, nombre, direccion, fecha_nacimiento, PARQUE_NATURAL_nombre) VALUES

('89012345H', 'Elena Ruiz', 'Avenida del Parque 654', '1983-08-12', 'Doñana'),
('90123456I', 'Fernando García', 'Calle del Río 765', '1990-01-25', 'Doñana'),
('12345678J', 'Fernando Pérez', 'Calle Vista 123', '1982-05-05', 'Cabo de Gata'),
('23456789K', 'Valeria Torres', 'Avenida Costa 234', '1988-09-17', 'Cabo de Gata'),
('34567890L', 'Diego Castillo', 'Calle Playa 345', '1993-12-20', 'Cabo de Gata'),
('45678901M', 'Rosa Medina', 'Plaza de la Paz 456', '1995-04-08', 'Cabo de Gata'),
('56789012N', 'Hugo Jiménez', 'Calle del Sol 567', '1990-11-01', 'Cabo de Gata'),
('67890123O', 'Carmen Romero', 'Avenida Montaña 678', '1994-03-13', 'Picos de Europa'),
('78901234P', 'Salvador Gómez', 'Calle Viento 789', '1981-02-25', 'Picos de Europa'),
('89012345Q', 'Marina González', 'Calle Nieve 890', '1986-07-05', 'Picos de Europa'),
('90123456R', 'Luis Méndez', 'Avenida Río 901', '1978-01-15', 'Picos de Europa'),
('01234567S', 'Natalia Ortiz', 'Calle Bosque 012', '1990-10-19', 'Picos de Europa');
go
-- Actualizar el numero de municipios del parque al insertar un municipio al que pertenece
CREATE TRIGGER actualizar_numero_municipios_insert
ON MUNICIPIO
AFTER INSERT
AS
BEGIN
    -- Sumar 1 a cada parque natural por cada municipio insertado
    UPDATE PN
    SET PN.numero_municipios_que_abarca = PN.numero_municipios_que_abarca + (
        SELECT COUNT(*)
        FROM inserted I
        WHERE I.PARQUE_NATURAL_nombre = PN.nombre
    )
    FROM PARQUE_NATURAL PN
    WHERE EXISTS (
        SELECT 1 FROM inserted I WHERE I.PARQUE_NATURAL_nombre = PN.nombre
    );
END;
GO


CREATE TRIGGER actualizar_numero_municipios_delete
ON MUNICIPIO
AFTER DELETE
AS
BEGIN
    -- Restar 1 a cada parque natural por cada municipio eliminado
    UPDATE PN
    SET PN.numero_municipios_que_abarca = PN.numero_municipios_que_abarca - (
        SELECT COUNT(*)
        FROM deleted D
        WHERE D.PARQUE_NATURAL_nombre = PN.nombre
    )
    FROM PARQUE_NATURAL PN
    WHERE EXISTS (
        SELECT 1 FROM deleted D WHERE D.PARQUE_NATURAL_nombre = PN.nombre
    );
END;
GO

-- Insertar municipios
INSERT INTO MUNICIPIO (nombre, direccion_web, foto_escudo, partido_gobernante, gasto_agua_por_habitante, PARQUE_NATURAL_nombre) VALUES
('Granada', 'www.granada.es', NULL, 'PSOE', 50.25, 'Sierra Nevada'),
('Almonte', 'www.almonte.es', NULL, 'PP', 60.50, 'Doñana'),
('Almería', 'www.almeria.es', NULL, 'C’s', 55.00, 'Cabo de Gata'),
('Cangas de Onís', 'www.cangasdeonis.es', NULL, 'PSOE', 45.75, 'Picos de Europa'),
('Baza', 'www.baza.es', NULL, 'PP', 58.25, 'Sierra Nevada'),
('Huelva', 'www.huelva.es', NULL, 'PSOE', 57.00, 'Doñana'),
('Oviedo', 'www.oviedo.es', NULL, 'PSOE', 62.00, 'Picos de Europa'),
('San José', 'www.sanjose.es', NULL, 'PP', 61.50, 'Cabo de Gata'),
('La Zubia', 'www.lazubia.es', NULL, 'PSOE', 54.00, 'Sierra Nevada'),
('Moguer', 'www.moguer.es', NULL, 'PP', 59.00, 'Doñana');

-- Insertar especies en parques
INSERT INTO PARQUE_ESPECIE (extension, poblacion_estimada, is_superpoblado, PARQUE_NATURAL_nombre, ESPECIE_ANIMAL_nombre_cientifico) VALUES
(10000, 200, 0, 'Sierra Nevada', 'Ursus arctos'),
(15000, 150, 0, 'Doñana', 'Canis lupus'),
(12000, 50, 1, 'Doñana', 'Ailuropoda melanoleuca'),
(13000, 300, 0, 'Cabo de Gata', 'Giraffa camelopardalis'),
(14000, 250, 0, 'Picos de Europa', 'Panthera leo'),
(8000, 100, 0, 'Cabo de Gata', 'Elephas maximus'),
(9000, 60, 0, 'Sierra Nevada', 'Balaenoptera musculus'),
(11000, 80, 1, 'Doñana', 'Puma concolor'),
(10000, 500, 0, 'Picos de Europa', 'Lynx pardinus'),
(9000, 75, 0, 'Cabo de Gata', 'Acinonyx jubatus'),
(15000, 120, 0, 'Sierra Nevada', 'Aquila chrysaetos'),
(16000, 200, 0, 'Picos de Europa', 'Haliaeetus leucocephalus'),
(17000, 90, 0, 'Doñana', 'Dendrocopos major');
