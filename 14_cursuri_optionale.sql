USE Universitate

SELECT
	S.Nume AS NumeStudent,
	S.Id AS StudentId,
	COUNT(N.Id) AS NumarExamene
FROM 
	Student AS S
LEFT JOIN
	Note AS N ON S.Id = N.StudentId
GROUP BY
	S.Id, S.Nume
HAVING
	COUNT(N.Id) > 3