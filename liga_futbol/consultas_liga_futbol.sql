USE liga_futbol
GO

-- Salario medio de los entrenadores de los equipos
SELECT AVG(p.sueldo) as salario_medio_entrenadores
FROM EQUIPOS e, PERSONAL p 
WHERE e.entrenador_DNI = p.dni;

--Nombre, antiguedad y tipo de los colegiados con mas de 6 años de antiguedad
  SELECT Nombre,antiguedad, COLEGIADO_TYPE
  FROM COLEGIADO
  WHERE antiguedad>6
  ORDER BY antiguedad;

--Muestra el nombre de los arbitros que han participado en al menos dos partidos y que son internacionales
SELECT distinct( c.Nombre)
FROM COLEGIADO c
JOIN ARBITRO a ON c.numero = a.numero
JOIN PARTIDO p ON p.ARBITRO_principal = c.numero OR p.ARBITRO_numero2 = c.numero
WHERE a.internacional = 1
GROUP BY c.Nombre
HAVING COUNT(c.numero) >= 2;

--Muestra los goles totales de cada jornadas
SELECT numero, SUM(goles_cabeza + goles_propia + goles_penalti) as total_goles
FROM JORNADA
GROUP BY numero;

--Recaudacion media por espectador en cada partido
SELECT equipo_local, equipo_residente, recaudacion/n_espectadores as recaudacion_media
FROM PARTIDO;


