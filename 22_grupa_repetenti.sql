USE Universitate


IF NOT EXISTS (SELECT 1 FROM Grupa WHERE Denumire = 'E')
    INSERT INTO Grupa (Denumire) VALUES ('E');


UPDATE Student
SET GrupaId = (SELECT Id FROM Grupa WHERE Denumire = 'E')
WHERE Id IN (
    SELECT
        StudentId
    FROM (
        SELECT
            S.Id AS StudentId,
            N.MaterieId,
            N.NotaObtinuta,
            ROW_NUMBER() OVER (PARTITION BY S.Id, N.MaterieId ORDER BY N.Id DESC) AS RowNum
        FROM
            Student AS S
        JOIN
            Note AS N ON S.Id = N.StudentId
    ) AS RankedNotes
    WHERE
        NotaObtinuta < 5 AND RowNum = 1
);
