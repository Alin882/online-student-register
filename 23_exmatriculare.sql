USE Universitate

USE Universitate;

USE Universitate;


SELECT TOP 1
    S.Id AS StudentId
INTO #WeakestStudent
FROM
    Student AS S
LEFT JOIN (
    SELECT
        StudentId,
        MaterieId,
        NotaObtinuta,
        ROW_NUMBER() OVER (PARTITION BY StudentId, MaterieId ORDER BY Id DESC) AS Rn
    FROM
        Note
) AS N ON S.Id = N.StudentId AND N.Rn = 1
GROUP BY
    S.Id
ORDER BY
    AVG(N.NotaObtinuta); 


DELETE FROM Note
WHERE StudentId IN (SELECT StudentId FROM #WeakestStudent);


DELETE FROM Student
WHERE Id IN (SELECT StudentId FROM #WeakestStudent);

DROP TABLE #WeakestStudent;
