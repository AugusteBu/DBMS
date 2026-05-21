CREATE FUNCTION dirbanciu_darbuotoju_limitas()
RETURNS TRIGGER AS 
$$
BEGIN
IF(SELECT COUNT(*)
FROM Darbuotojas) >= 6
THEN 
	RAISE EXCEPTION 'Per didelis darbuotojo skaicius kavineje';
	END IF;
	RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER dirbanciu_darbuotoju_limitas
BEFORE INSERT ON Darbuotojas
FOR EACH ROW
EXECUTE FUNCTION dirbanciu_darbuotoju_limitas();

CREATE OR REPLACE FUNCTION Darbuotoju_uzsakymu_gaminimo_limitas()
RETURNS TRIGGER AS
$$
BEGIN

IF (SELECT COUNT(*) 
FROM Daro
WHERE Darbuotojo_ID = NEW.Darbuotojo_ID
AND DATE(Data) = CURRENT_DATE) >= 10
THEN 
RAISE EXCEPTION 'Pasiektas darbuotoju uzsakymo gaminimo limitas';
END IF;
RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER Darbuotoju_uzsakymu_gaminimo_limitas
BEFORE INSERT ON daro
FOR EACH ROW
EXECUTE FUNCTION Darbuotoju_uzsakymu_gaminimo_limitas();

