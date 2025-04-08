USE Universitate;

SELECT
    S.Id AS StudentId,
    S.Nume AS NumeStudent,
    AVG(CAST(N.NotaObtinuta AS DECIMAL(10, 2))) AS MedieGenerala
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
    S.Id, S.Nume
ORDER BY
	MedieGenerala DESC