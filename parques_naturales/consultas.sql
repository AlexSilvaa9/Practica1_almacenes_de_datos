 use parques_naturales
 go

-- Consulta 1: Seleccionar los animales que se pueden encontrar en Sierra Nevada

SELECT e.nombre_cientifico, e.nombre_comun, p.nombre
FROM PARQUE_NATURAL p , PARQUE_ESPECIE pe, ESPECIE_ANIMAL e
WHERE e.nombre_cientifico=pe.ESPECIE_ANIMAL_nombre_cientifico and pe.PARQUE_NATURAL_nombre=p.nombre and p.nombre='Sierra Nevada';

-- Consulta 2: Seleccionar el nombre de los consejeros de Doñana

SELECT p.nombre, c.nombre
FROM PARQUE_NATURAL p, PERSONA c
WHERE c.PARQUE_NATURAL_nombre=p.nombre and p.nombre='Doñana';

-- Consulta 3: Seleccionar el nombre del presidente de Doñana

SELECT p.nombre, c.nombre
FROM PARQUE_NATURAL p, PERSONA c
WHERE c.dni=p.PERSONA_dni and p.nombre='Doñana';

-- Consulta 4: Seleccionar el nombre de los municipios que abarca doñana junto al numero de municipios que abarca

SELECT m.nombre, p.nombre, p.numero_municipios_que_abarca
FROM PARQUE_NATURAL p, MUNICIPIO m
WHERE p.nombre=m.PARQUE_NATURAL_nombre and p.nombre='Doñana';

-- Consulta 5: Seleccionar el nombre de los presidentes de paruqes en los que se encuentra algun tipo de oso

SELECT e.nombre_comun, presi.nombre, p.nombre
FROM PERSONA presi, ESPECIE_ANIMAL e, PARQUE_NATURAL p, PARQUE_ESPECIE pe
WHERE presi.dni=p.PERSONA_dni and p.nombre=pe.PARQUE_NATURAL_nombre and pe.ESPECIE_ANIMAL_nombre_cientifico=e.nombre_cientifico and e.nombre_comun LIKE 'Oso%';