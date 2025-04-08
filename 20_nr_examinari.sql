USE Universitate

SELECT
    S.Id AS StudentId,
    S.Nume AS NumeStudent,
	S.Prenume AS PrenumeStudent,
    M.Nume AS Materie,
    COUNT(N.Id) AS NumarExamene
FROM
    Student AS S
JOIN
    Note AS N ON S.Id = N.StudentId
JOIN
    Materie AS M ON N.MaterieId = M.Id
GROUP BY
    S.Id, S.Nume, M.Nume,S.Prenume
ORDER BY
    S.Id, M.Nume;
