

CREATE SCHEMA dostawy;


CREATE TABLE dostawy.dostawcy(
	dostawca varchar(50) NOT NULL PRIMARY KEY,
	ulica varchar(20),
	nr_budynku varchar(10),
	miasto varchar (30),
	kod_pocztowy varchar(6)
);


CREATE TABLE dostawy.zamowienia(
	nazwa_produktu varchar(50) UNIQUE NOT NULL PRIMARY KEY,
	dostawca1 varchar(50) REFERENCES dostawy.dostawcy(dostawca),
	dostawca2 varchar(50) REFERENCES dostawy.dostawcy(dostawca),
	cena_netto varchar(10),
	cena_brutto varchar(10)
);


INSERT INTO dostawy.dostawcy VALUES ('Makarony Polskie', 'Turystyczna', '44', 'Kraków', '31-435'),
('Polskie przetwory', 'Wojska Polskiego', '44a', 'Kraków', '31-342'),
('Przetwory pomidorowe', 'Rolnicza', '22/4', 'Tarnów','30-243'),
('Lubelski Makaron', 'Piłsudskiego', '332a', 'Lublin','04-242'),
('Małopolskie smaki', 'Mickiewicza', '223/77', 'Nowy Targ','35-434');

INSERT INTO dostawy.zamowienia VALUES ('Makaron nitki', 'Makarony Polskie', 'Lubelski Makaron', '130 zł', '150 zł'),
('Keczup pikantny', 'Polskie przetwory', 'Przetwory pomidorowe', '200 zł' , '220 zł'),
('Sos pomidorowy', 'Polskie przetwory', 'Małopolskie smaki', '89 zł' , '110 zł');