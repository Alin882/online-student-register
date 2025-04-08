USE Universitate;

WITH ExamCounts AS (
    SELECT
        StudentId,
        MaterieId,
        COUNT(Id) AS ExamCount
    FROM
        Note
    GROUP BY
        StudentId,
        MaterieId
)

SELECT TOP 1
    S.Id AS StudentId,
    S.Nume AS NumeStudent,
    S.Prenume AS PrenumeStudent,
    M.Nume AS Materie,
    EC.ExamCount
FROM
    ExamCounts AS EC
JOIN
    Student AS S ON EC.StudentId = S.Id
JOIN
    Materie AS M ON EC.MaterieId = M.Id
ORDER BY
    EC.ExamCount DESC;
