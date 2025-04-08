USE Universitate;

SELECT
    COUNT(DISTINCT MaterieId) AS NumarMateriiSustinute
FROM
    Note;
