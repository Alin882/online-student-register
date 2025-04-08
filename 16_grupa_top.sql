USE Universitate;

SELECT TOP 1
    G.Id AS GrupaId,
    G.Denumire AS GrupaDenumire,
    AVG(CAST(N.NotaObtinuta AS DECIMAL(10, 2))) AS MedieGeneralaGrupa
FROM
    Grupa AS G
LEFT JOIN (
    SELECT
        S.GrupaId,
        N.NotaObtinuta,
        ROW_NUMBER() OVER (PARTITION BY S.GrupaId, N.MaterieId ORDER BY N.Id DESC) AS Rn
    FROM
        Student AS S
    LEFT JOIN
        Note AS N ON S.Id = N.StudentId
) AS N ON G.Id = N.GrupaId AND N.Rn = 1
GROUP BY
    G.Id, G.Denumire
ORDER BY
	MedieGeneralaGrupa DESC