USE Universitate;

SELECT
    O.Id AS OrasId,
    O.Denumire AS OrasDenumire
FROM
    Orase AS O
LEFT JOIN
    Student AS S ON O.Id = S.OrasResedintaId
WHERE
    S.Id IS NULL;
