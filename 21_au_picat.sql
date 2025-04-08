USE Universitate;

WITH RankedNotes AS (
    SELECT
        S.Id AS StudentId,
        S.Nume AS NumeStudent,
		S.Prenume As PrenumeStudent,
        N.MaterieId,
        N.NotaObtinuta,
        ROW_NUMBER() OVER (PARTITION BY S.Id, N.MaterieId ORDER BY N.Id DESC) AS RowNum
    FROM
        Student AS S
    JOIN
        Note AS N ON S.Id = N.StudentId
)
SELECT
    DISTINCT StudentId,
    NumeStudent,
	PrenumeStudent
FROM
    RankedNotes
WHERE
    NotaObtinuta < 5 AND RowNum = 1;
