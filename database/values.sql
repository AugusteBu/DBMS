INSERT INTO Kavine(ID, Telefono_nr, Adresas, Pavadinimas, Darbo_laikas)
VALUES(1232, 58652684, 'Saltiniu g. 5', 'Kavos namai', '6.00-22.00'),
		(147, 91112213, 'Birutes g. 103', 'Spotas', NULL);

INSERT INTO Darbuotojas(ID ,Kavines_ID , Vardas, Pavarde, Priemimo_data, Pareigos)
VALUES (111, 1232, 'Agne', 'Zibciene', '2024-01-02', 'Padaveja'),
		 (112, 147, 'Kamile', 'Narsuveciute', '1999-12-12', 'Vadove');
INSERT INTO Daro(Uzsakymo_nr, Darbuotojo_ID, Data)
VALUES(45, 111, CURRENT_DATE),
		(46, 111, '2024-10-31'),
		(47, 112, '2024-10-31'),
		(48, 111, '2023-12-01'),
		(52, 112, '2023-12-23');

INSERT INTO Stalas(Nr)
OVERRIDING SYSTEM VALUE
VALUES (10), (6), (8),(9),(86) 

;
INSERT INTO Klientas
VALUES (78, 'Petras', 'Kazkadenis', 10),
	 	 (998, 'Emilija', 'Masete', 6),
		 (65555, 'Laura', 'Karevicute', 9),
		 (6005, 'Gabija', 'Baneviciene', 33);
INSERT INTO Uzsakymas(Nr, Kaina, Uzsakovas, Preke)
VALUES (45, 32.99, 998, 'Latte'),
		 (46, 5.99, 65555, 'Cappucino'),
		 (47, 89.99, 998, 'Pyragas'),
		 (48, 2.99, 998, 'Vanduo'),
		 (52, 108.56, 6005, 'bandele');

