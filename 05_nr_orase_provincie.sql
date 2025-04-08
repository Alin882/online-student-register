USE Universitate;

SELECT
    COUNT(*) AS TotalNumarOrase
FROM
    Orase
WHERE
	Orase.Denumire != 'Bucure?ti';
