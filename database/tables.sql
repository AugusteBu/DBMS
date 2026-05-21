CREATE TABLE Stalas(
Nr Integer PRIMARY KEY GENERATED ALWAYS AS 
IDENTITY (START WITH 1 INCREMENT BY 1)
);
CREATE TABLE klientas(
ID INT PRIMARY KEY,
Vardas VARCHAR(30) NOT NULL,
Pavarde VARCHAR(30) NOT NULL,
Stalo_nr SMALLINT REFERENCES Stalas(Nr) ON DELETE CASCADE ON UPDATE RESTRICT 
);
--isitrynus eilute is stalas, klientas stalo_nr irgi isitrins,  jei atnaujina stalas nr tuomet neleistu atnaujinti
CREATE TABLE Uzsakymas(
Nr INT PRIMARY KEY,
Kaina NUMERIC(5,2) CHECK(Kaina > 2.00 and Kaina < 9999.87),
Uzsakovas INT REFERENCES Klientas(ID) CHECK(Uzsakovas > 0),
Preke VARCHAR(20)
);
CREATE TABLE Daro(
Uzsakymo_nr INT NOT NULL,
Darbuotojo_ID INT NOT NULL,
Data DATE DEFAULT CURRENT_DATE CHECK(Data <= CURRENT_DATE),
CONSTRAINT Uzsakymo_darbuotojo_pkey PRIMARY KEY(Uzsakymo_nr, Darbuotojo_ID)
);

CREATE TABLE Kavine(
ID INT PRIMARY KEY,
Telefono_nr INT NOT NULL UNIQUE,
Adresas VARCHAR(50) NOT NULL UNIQUE ,
Pavadinimas VARCHAR(30) NOT NULL UNIQUE,
Darbo_laikas VARCHAR(20) DEFAULT '09:00 - 17:00'
);

CREATE TABLE darbuotojas(
ID INT PRIMARY KEY,
Kavines_ID INT REFERENCES Kavine(ID),
Vardas VARCHAR(30) NOT NULL,
Pavarde VARCHAR(30) NOT NULL,
Priemimo_data DATE DEFAULT CURRENT_DATE,
Pareigos VARCHAR(20) NOT NULL
);


CREATE UNIQUE INDEX Telefono_nr_index ON Kavine(Telefono_nr);
CREATE INDEX Priemimo_data_index ON Darbuotojas(Priemimo_data);

CREATE VIEW Darbingumas AS
SELECT 
	d.ID AS "Darbuotojo ID",
	COUNT(u.Nr) AS "Uzsakymu skaicius",
	SUM(u.Kaina) AS "Isviso parduota",
	ROUND(AVG(u.kaina),2) AS "Vidutiniskai parduota"
	
FROM
	darbuotojas AS d 
JOIN 
	Daro as dar	ON d.ID = dar.Darbuotojo_ID
JOIN 
	uzsakymas AS u ON dar.Uzsakymo_nr = u.nr
GROUP BY d.ID;
	
CREATE VIEW Kliento_islaidos AS
SELECT
	k.Vardas,
	k.Pavarde,
	COUNT(u.Nr) AS "Uzsakymu sk.",
	SUM(u.Kaina) AS "Sumoketa"
FROM
	klientas as k
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
	darbuotojas AS d ON d.ID = dar.Darbuotojo_ID
JOIN 
	Uzsakymas AS u ON u.nr = dar.uzsakymo_nr
WHERE Kaina > 50;

CREATE MATERIALIZED VIEW seating AS
SELECT s.nr,
		k.vardas,
 		k.pavarde
FROM Stalas AS s
JOIN
	klientas AS k ON k.Stalo_nr = s.nr
WHERE s.nr IS NOT NULL;

REFRESH MATERIALIZED VIEW seating;
