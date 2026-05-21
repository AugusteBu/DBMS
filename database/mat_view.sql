CREATE MATERIALIZED VIEW Seating AS
SELECT s.nr,
		k.vardas,
 		k.pavarde
FROM Stalas AS s
JOIN
	Klientas AS k ON k.Stalo_nr = s.nr
WHERE s.nr NOT NULL;

REFRESH MATERIALIZED VIEW Seating;