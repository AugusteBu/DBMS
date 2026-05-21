CREATE VIEW Darbingumas AS
SELECT 
	d.ID AS "Darbuotojo ID",
	COUNT(u.Nr) AS "Uzsakymu skaicius",
	SUM(u.Kaina) AS "Isviso parduota",
	ROUND(AVG(u.kaina),2) AS "Vidutiniskai parduota"
	
FROM
	Darbuotojas AS d 
JOIN 
	Daro as dar	ON d.ID = dar.Darbuotojo_ID
JOIN 
	Uzsakymas AS u ON dar.Uzsakymo_nr = u.nr
GROUP BY d.ID;
	
CREATE VIEW Kliento_islaidos AS
SELECT
	k.Vardas,
	k.Pavarde,
	COUNT(u.Nr) AS "Uzsakymu sk.",
	SUM(u.Kaina) AS "Sumoketa"
FROM
	Klientas as k
JOIN
	Uzsakymas as u ON k.ID = u.Uzsakovas
GROUP BY k.Vardas,
			k.Pavarde;

CREATE VIEW Brangus_uzsakymas AS
SELECT
	u.nr,
	d.Pavarde,
	dar.Data,
	u.Kaina
FROM
	Daro AS dar 
JOIN 
	Darbuotojas AS d ON d.ID = dar.Darbuotojo_ID
JOIN 
	Uzsakymas AS u ON u.nr = dar.uzsakymo_nr
WHERE Kaina > 50;

UPDATE Kliento_islaidos
SET u.Kaina = u.Kaina - 30
WHERE u.Kaina > 100;