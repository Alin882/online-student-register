USE Universitate;

SELECT
	 M.Nume AS Materie
FROM 
	Materie AS M
LEFT JOIN
	Note AS N ON N.MaterieId = M.Id
WHERE 
	N.Id IS NULL;