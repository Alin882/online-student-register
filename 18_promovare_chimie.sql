USE Universitate;

SELECT
    S.Id AS StudentId,
    S.Nume AS NumeStudent,
    S.Prenume AS PrenumeStudent,
    M.Nume AS Materie,
    N.NotaObtinuta,
    N.Id AS ExamId
FROM
    Student AS S
JOIN
    Note AS N ON S.Id = N.StudentId
JOIN
    Materie AS M ON N.MaterieId = M.Id
WHERE
    M.Nume = 'Chimie'
    AND S.Id IN (
        SELECT
            StudentId
        FROM
            Note
        WHERE
            MaterieId = (SELECT Id FROM Materie WHERE Nume = 'Chimie')
        GROUP BY
            StudentId
        HAVING
            COUNT(DISTINCT Id) > 1
    )
ORDER BY
    S.Id, N.MaterieId, N.Id;
