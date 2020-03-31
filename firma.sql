	
CREATE TABLE pracownicy (
	id_pracownika int UNIQUE PRIMARY KEY NOT NULL,
	imie VARCHAR(50),
	nazwisko VARCHAR(50),
	adres VARCHAR (100),
	telefon VARCHAR (15)
	);

CREATE TABLE godziny (
	id_godziny serial UNIQUE PRIMARY KEY NOT NULL,
	data date,
	liczba_godzin int,
	id_pracownika int NOT NULL
);

CREATE TABLE pensje (
	id_pensji int UNIQUE PRIMARY KEY NOT NULL,
	stanowisko varchar(50),
	kwota money,
	id_premii int
);


CREATE TABLE premie (
	id_premii int UNIQUE PRIMARY KEY NOT NULL, 
	rodzaj varchar(30),
	kwota money
);

ALTER TABLE godziny
ADD FOREIGN KEY (id_pracownika)
REFERENCES pracownicy(id_pracownika);

ALTER TABLE pensje
ADD FOREIGN KEY (id_premii)
REFERENCES premie(id_premii);

ALTER TABLE pensje
ADD FOREIGN KEY (id_pensji)
REFERENCES pracownicy(id_pracownika);


INSERT INTO pracownicy VALUES (1, 'Jan', 'Kowalski', 'Ogrodowa 10 Kraków', '69554774');
INSERT INTO pracownicy VALUES (2, 'Janina', 'Kowal', 'Ogrodnicza 10 Kraków', '695322574');
INSERT INTO pracownicy VALUES (3, 'Elżbieta', 'Kuna', 'Ładna 4/5 Kraków', '78254774');
INSERT INTO pracownicy VALUES (4, 'Zuzanna', 'Król ', 'Przyjaciół 125 Kraków', '695322574');
INSERT INTO pracownicy VALUES (5, 'Jakub', 'Mazur', 'Słowackiego 44  Kraków', '78254774');
INSERT INTO pracownicy VALUES (6, 'Aleksander', ' Wiśniewski', 'Liryczna 20  Kraków', '695322574');
INSERT INTO pracownicy VALUES (7, 'Elżbieta', 'Dudek ', 'Tęczowa 11/4 Kraków', '78254774');
INSERT INTO pracownicy VALUES (8, 'Hanna', 'Kowalczyk', 'Prosta 11/13 Kraków', '695322574');
INSERT INTO pracownicy VALUES (9, 'Wojciech', 'Piotrowski', 'Kolejowa 5/8 Kraków', '78254774');
INSERT INTO pracownicy VALUES (10, 'Oliwia', 'Bąk', 'Nadrzeczna 10 Kraków', '695322574');

INSERT INTO premie VALUES (1,'kwartalna',800);
INSERT INTO premie VALUES (2,'retencyjna',1000);
INSERT INTO premie VALUES (3,'rekrutacyjna', 1500);
INSERT INTO premie VALUES (4,'motywacyjna indywidualna', 700);
INSERT INTO premie VALUES (5,'motywacyjna zespołowa',500);
INSERT INTO premie VALUES (6,'miesięczna',200);
INSERT INTO premie VALUES (7,'roczna',1000);
INSERT INTO premie VALUES (8,'motywacyjna', 500);
INSERT INTO premie VALUES (9,'uznaniowa',500);
INSERT INTO premie VALUES (10,'inna', 500);

INSERT INTO pensje VALUES (1, 'księgowa', 3500 ,3 );
INSERT INTO pensje VALUES (2, 'asystent', 2800 ,4 );
INSERT INTO pensje VALUES (3, 'prezes zarządu', 8000);
INSERT INTO pensje VALUES (4, 'sekretarka', 3000,3 );
INSERT INTO pensje VALUES (5, 'członek zarządu', 6500 );
INSERT INTO pensje VALUES (6, 'ochroniarz', 2500 );
INSERT INTO pensje VALUES (7, 'magazynier', 2800,4 );
INSERT INTO pensje VALUES (8, 'konserwator powierzchni płaskich', 2500,1 );
INSERT INTO pensje VALUES (9, 'główny księgowy', 4500, 2 );
INSERT INTO pensje VALUES (10, 'administrator sieci', 5000 ,1 );

INSERT INTO godziny (data, liczba_godzin, id_pracownika) VALUES ('2020-03-25', 8, 1);
INSERT INTO godziny (data, liczba_godzin, id_pracownika) VALUES ('2020-03-25', 8, 2);
INSERT INTO godziny (data, liczba_godzin, id_pracownika) VALUES('2020-03-25', 4, 3);
INSERT INTO godziny (data, liczba_godzin, id_pracownika) VALUES('2020-03-25', 11, 4);
INSERT INTO godziny (data, liczba_godzin, id_pracownika) VALUES('2020-03-25', 8, 5);
INSERT INTO godziny (data, liczba_godzin, id_pracownika) VALUES('2020-03-26', 8, 1);
INSERT INTO godziny (data, liczba_godzin, id_pracownika) VALUES('2020-03-26', 8, 2);
INSERT INTO godziny (data, liczba_godzin, id_pracownika) VALUES('2020-03-26', 4, 3);
INSERT INTO godziny (data, liczba_godzin, id_pracownika) VALUES('2020-03-26', 8, 4);
INSERT INTO godziny (data, liczba_godzin, id_pracownika) VALUES('2020-03-26', 7, 5);
