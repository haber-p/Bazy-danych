CREATE TABLE pacjenci(
	IDPacjenta varchar(6) unique NOT NULL PRIMARY KEY,
	Imie varchar(20),
	Nazwisko varchar(30)
);


INSERT INTO pacjenci VALUES ('P100', 'Anna', 'Jeleń'), ('P105', 'Jarosław ', 'Nicpoń'), ('P108', 'Joanna', 'Nosek'), 
('P120', 'Jan', 'Kałuża'), ('P130', 'Jerzy', 'Lis'),('P123', 'Olga', 'Nowacka');


CREATE TABLE zabiegi (
	IDZabiegu varchar(4) unique NOT NULL PRIMARY KEY,
	NazwaZebiegu varchar(30)
);

INSERT INTO zabiegi VALUES ('Z496', 'Lakowanie'), ('Z500', 'Borowanie'), ('Z503', 'Usuwanie kamienia');


CREATE TABLE pracownicy(
	IDPracownika varchar(5) unique NOT NULL PRIMARY KEY,
	Imie varchar(20),
	Nazwisko varchar(30)
);

INSERT INTO pracownicy VALUES ('S1011', 'Maria', 'Nowak'), ('S1024', 'Jan', 'Kowalski'), ('S1045', 'Anna', 'Jabłońska'), 
('S1034', 'Marek', 'Potocki');


CREATE TABLE wizyty(
	IDPracownika varchar(5) NOT NULL REFERENCES pracownicy(IDPracownika),
	IDPacjenta varchar(6) NOT NULL REFERENCES pacjenci(IDPacjenta),
	IDZabiegu varchar(4) NOT NULL REFERENCES zabiegi(IDZabiegu), 
	DataWizyty date,
	GodzinaWizyty time,
	CONSTRAINT pk_wizyty PRIMARY KEY (IdPracownika, IdPacjenta, IdZabiegu)
)


INSERT INTO wizyty VALUES ('S1011', 'P100', 'Z500', '02-06-2020','10:00' );
('S1011', 'P105', 'Z496', '12-03-2020','13:00' ),
('S1011', 'P108', 'Z500', '14-03-2020','10:00' ),
('S1024', 'P108', 'Z503', '16-03-2020','17:00' ),
('S1045', 'P120', 'Z500', '18-03-2020','09:00' ),
('S1034', 'P130', 'Z496', '20-03-2020','08:00' ),
('S1034', 'P123', 'Z503', '22-03-2020','15:00' );
