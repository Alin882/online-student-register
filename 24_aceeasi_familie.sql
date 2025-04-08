USE Universitate

SELECT
    Nume AS Familia,
    STUFF((
        SELECT ', ' + Prenume
        FROM Student S2
        WHERE S1.Nume = S2.Nume
        FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS Fratii
FROM
    Student S1
GROUP BY
    Nume;
