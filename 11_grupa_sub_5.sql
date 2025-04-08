USE Universitate;

SELECT
	G.Denumire AS NumeGrupa,
	COUNT(S.Id) AS NumarStudenti
FROM
	Grupa AS G
LEFT JOIN
	Student AS S ON S.GrupaId = G.Id
GROUP BY
	G.Denumire
HAVING 
	COUNT(*) < 5
