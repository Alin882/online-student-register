USE Universitate;

USE Universitate;

SELECT TOP 1
	G.Denumire AS NumeGrupa,
	COUNT(S.Id) AS NumarStudenti
FROM
	Grupa AS G
JOIN
	Student AS S ON S.GrupaId = G.Id
GROUP BY
	G.Denumire
ORDER BY
	NumarStudenti DESC
