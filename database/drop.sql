DROP TABLE IF EXISTS Klientas, Uzsakymas, Stalas, Daro, Darbuotojas, Kavine CASCADE;
DROP VIEW IF EXISTS Darbingumas, Kliento_islaidos, Brangus_islaidos CASCADE;
DROP INDEX IF EXISTS Telefono_nr_index, Priemimo_data_index CASCADE;

DROP MATERIALIZED VIEW IF EXISTS seating CASCADE;
DROP FUNCTION IF EXISTS dirbanciu_darbuotoju_limitas,Darbuotoju_uzsakymu_gaminimo_limitas CASCADE;
DROP TRIGGER IF EXISTS paskutinis_uzsakymas ON Uzsakymas;
DROP TRIGGER IF EXISTS kainos_limitas ON Uzsakymas;