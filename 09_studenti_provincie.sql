SELECT
    S.Id,
    S.Nume,
    S.Prenume,
    O.Denumire AS OrasResedinta
FROM
    Student AS S
JOIN
    Orase AS O ON S.OrasResedintaId = O.Id
WHERE
    O.Denumire != 'Bucure?ti';
