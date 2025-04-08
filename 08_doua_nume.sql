USE Universitate;

SELECT
    Id,
    Nume,
    Prenume
FROM
    Student
WHERE
    CHARINDEX(' ', Prenume) > 0 OR CHARINDEX('-', Prenume) > 0;
