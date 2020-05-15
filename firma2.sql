CREATE SCHEMA ksiegowosc;

CREATE TABLE ksiegowosc.pracownicy (
	id_pracownika int NOT NULL UNIQUE PRIMARY KEY,
	imie varchar(20),
	nazwisko varchar(30),
	adres varchar(100),
	telefon varchar(13)
);

CREATE TABLE ksiegowosc.godziny (
	id_godziny int NOT NULL UNIQUE PRIMARY KEY, 
	data date,
	liczba_godzin int,
	id_pracownika int REFERENCES ksiegowosc.pracownicy(id_pracownika)
);

CREATE TABLE ksiegowosc.pensja (
	id_pensji int NOT NULL UNIQUE PRIMARY KEY,
	stanowisko varchar(30),
	kwota real
);

CREATE TABLE ksiegowosc.premia (
	id_premii int NOT NULL UNIQUE PRIMARY KEY,
	rodzaj varchar(20),
	kwota real
);

CREATE TABLE ksiegowosc.wynagrodzenie (
	id_wynagrodzenia int NOT NULL UNIQUE PRIMARY KEY,
	data date,
	id_pracownika int  REFERENCES  ksiegowosc.pracownicy(id_pracownika),
	id_godziny int  REFERENCES ksiegowosc.godziny(id_godziny),
	id_pensjii int  REFERENCES ksiegowosc.pensja(id_pensji),
	id_premii int  REFERENCES ksiegowosc.premia(id_premii)
);

COMMENT ON TABLE ksiegowosc.pracownicy IS 'Dane wszystkich pracowników';
COMMENT ON TABLE ksiegowosc.godziny IS 'Mieisięczny czas pracy';
COMMENT ON TABLE ksiegowosc.pensja IS 'Wysokość wynagrodzeń';
COMMENT ON TABLE ksiegowosc.premia IS 'Możliwe przyznawane premie';
COMMENT ON TABLE ksiegowosc.wynagrodzenie IS 'Wynagrodzenie za dany miesiąc dla każdego pracownika';

INSERT INTO ksiegowosc.pracownicy VALUES (1, 'Jan', 'Kowalski', 'Ogrodowa 10 Kraków', '69554774');
INSERT INTO ksiegowosc.pracownicy VALUES (2, 'Janina', 'Kowal', 'Ogrodnicza 10 Kraków', '695322574');
INSERT INTO ksiegowosc.pracownicy VALUES (3, 'Elżbieta', 'Kuna', 'Ładna 4/5 Kraków', '78254774');
INSERT INTO ksiegowosc.pracownicy VALUES (4, 'Zuzanna', 'Król ', 'Przyjaciół 125 Kraków', '695322574');
INSERT INTO ksiegowosc.pracownicy VALUES (5, 'Jakub', 'Mazur', 'Słowackiego 44  Kraków', '78254774');
INSERT INTO ksiegowosc.pracownicy VALUES (6, 'Aleksander', ' Wiśniewski', 'Liryczna 20  Kraków', '695322574');
INSERT INTO ksiegowosc.pracownicy VALUES (7, 'Elżbieta', 'Dudek ', 'Tęczowa 11/4 Kraków', '78254774');
INSERT INTO ksiegowosc.pracownicy VALUES (8, 'Hanna', 'Kowalczyk', 'Prosta 11/13 Kraków', '695322574');
INSERT INTO ksiegowosc.pracownicy VALUES (9, 'Wojciech', 'Piotrowski', 'Kolejowa 5/8 Kraków', '78254774');
INSERT INTO ksiegowosc.pracownicy VALUES (10, 'Oliwia', 'Bąk', 'Nadrzeczna 10 Kraków', '695322574');

INSERT INTO ksiegowosc.godziny  VALUES (1,'2020-03-25', 188, 1);
INSERT INTO ksiegowosc.godziny  VALUES (2,'2020-03-25', 160, 2);
INSERT INTO ksiegowosc.godziny  VALUES(3,'2020-03-25', 171, 3);
INSERT INTO ksiegowosc.godziny  VALUES(4,'2020-03-25', 160, 4);
INSERT INTO ksiegowosc.godziny  VALUES(5,'2020-03-25', 162, 5);
INSERT INTO ksiegowosc.godziny  VALUES(6,'2020-03-26', 160, 6);
INSERT INTO ksiegowosc.godziny  VALUES(7,'2020-03-26', 165, 7);
INSERT INTO ksiegowosc.godziny  VALUES(8,'2020-03-26', 160, 8);
INSERT INTO ksiegowosc.godziny  VALUES(9,'2020-03-26', 172, 9);
INSERT INTO ksiegowosc.godziny  VALUES(10,'2020-03-26', 120, 10);


INSERT INTO ksiegowosc.pensja VALUES (1, 'księgowa', 3500 );
INSERT INTO ksiegowosc.pensja VALUES (2, 'asystent działu księgowości', 2800);
INSERT INTO ksiegowosc.pensja VALUES (3, 'główny księgowy', 6000);
INSERT INTO ksiegowosc.pensja VALUES (4, 'doradca podatkowy', 4000);
INSERT INTO ksiegowosc.pensja VALUES (5, 'fakturzystka', 3500);
INSERT INTO ksiegowosc.pensja VALUES (6, 'ochroniarz', 2500);
INSERT INTO ksiegowosc.pensja VALUES (7, 'kierownik inwestycji finans.', 3800);
INSERT INTO ksiegowosc.pensja VALUES (8, 'konserwator pow. płaskich', 2500);
INSERT INTO ksiegowosc.pensja VALUES (9, 'kierownik ds. finansowych', 3600);
INSERT INTO ksiegowosc.pensja VALUES (10, 'administrator sieci', 4500);


INSERT INTO ksiegowosc.premia VALUES (1,'kwartalna',800);
INSERT INTO ksiegowosc.premia VALUES (2,'retencyjna',1000);
INSERT INTO ksiegowosc.premia VALUES (3,'rekrutacyjna', 1500);
INSERT INTO ksiegowosc.premia VALUES (4,'motywacyjna indywid.',700);
INSERT INTO ksiegowosc.premia VALUES (5,'motywacyjna zepoł.',500);
INSERT INTO ksiegowosc.premia VALUES (6,'miesięczna',200);
INSERT INTO ksiegowosc.premia VALUES (7,'roczna',1000);
INSERT INTO ksiegowosc.premia VALUES (8,'motywacyjna', 500);
INSERT INTO ksiegowosc.premia VALUES (9,'uznaniowa',500);
INSERT INTO ksiegowosc.premia VALUES (10,'inna', 500);

INSERT INTO ksiegowosc.wynagrodzenie VALUES (1, '2020-04-07',1,1,1);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (2,'2020-04-07',2,2,2,4);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (3,'2020-04-07',3,3,3,1);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (4,'2020-04-07',4,4,4);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (5,'2020-04-07',5,5,5);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (6,'2020-04-07',6,6,6);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (7,'2020-04-07',7,7,7,5);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (8,'2020-04-07',8,8,8);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (9,'2020-04-07',9,9,9,7);
INSERT INTO ksiegowosc.wynagrodzenie VALUES (10,'2020-04-07',10,10,10);


--a
SELECT id_pracownika, nazwisko FROM ksiegowosc.pracownicy;
--b
SELECT id_pracownika FROM ksiegowosc.wynagrodzenie w
JOIN ksiegowosc.pensja pe ON w.id_pensjii = pe.id_pensji
WHERE kwota >1000;
--c
SELECT id_pracownika FROM ksiegowosc.wynagrodzenie w
JOIN ksiegowosc.pensja pe 
ON w.id_pensjii = pe.id_pensji
WHERE kwota > 1000 AND id_premii IS NULL;
--d
SELECT * FROM ksiegowosc.pracownicy 
WHERE imie like 'J%';
--e
SELECT * FROM ksiegowosc.pracownicy 
WHERE nazwisko like '%n%' AND imie LIKE '%a';
--f
SELECT imie, nazwisko, liczba_godzin -160 AS nadgodziny 
FROM ksiegowosc.pracownicy prac 
JOIN ksiegowosc.godziny godz 
ON prac.id_pracownika = godz.id_pracownika;
--g
SELECT imie, nazwisko
FROM ksiegowosc.wynagrodzenie w 
JOIN ksiegowosc.pensja pen 
ON w.id_pensjii = pen.id_pensji
JOIN ksiegowosc.pracownicy prac 
ON w.id_pracownika = prac.id_pracownika
WHERE kwota BETWEEN 1500 AND 3000;
--h
SELECT imie, nazwisko
FROM ksiegowosc.wynagrodzenie w 
JOIN ksiegowosc.godziny godz 
ON w.id_godziny = godz.id_godziny
JOIN ksiegowosc.pracownicy prac 
ON w.id_pracownika = prac.id_pracownika
WHERE (liczba_godzin - 160) > 0 AND id_premii IS NULL;
--i
SELECT imie, nazwisko
FROM ksiegowosc.wynagrodzenie w 
JOIN ksiegowosc.pensja pen 
ON w.id_pensjii = pen.id_pensji
JOIN ksiegowosc.pracownicy prac 
ON w.id_pracownika = prac.id_pracownika
ORDER BY kwota;
--j
SELECT imie, nazwisko
FROM ksiegowosc.wynagrodzenie w 
JOIN ksiegowosc.pensja pen 
ON w.id_pensjii = pen.id_pensji
JOIN ksiegowosc.pracownicy prac 
ON w.id_pracownika = prac.id_pracownika
JOIN ksiegowosc.premia prem 
ON w.id_premii = prem.id_premii
ORDER BY (pen.kwota+prem.kwota)DESC;
--k
SELECT COUNT(stanowisko), stanowisko
FROM ksiegowosc.wynagrodzenie w
JOIN ksiegowosc.pensja pen 
ON w.id_pensjii = pen.id_pensji
GROUP BY stanowisko;
--l
SELECT stanowisko, AVG(kwota) AS srednia, MAX(kwota) AS max, MIN(kwota) AS min
FROM ksiegowosc.wynagrodzenie w
JOIN ksiegowosc.pensja pen 
ON w.id_pensjii = pen.id_pensji
WHERE stanowisko = 'główny księgowy'
GROUP BY stanowisko;

--m
SELECT SUM(kwota)
FROM ksiegowosc.wynagrodzenie w
JOIN ksiegowosc.pensja pen 
ON w.id_pensjii = pen.id_pensji;
--n
SELECT stanowisko, SUM(kwota)
FROM ksiegowosc.wynagrodzenie w
JOIN ksiegowosc.pensja pen 
ON w.id_pensjii = pen.id_pensji
GROUP BY stanowisko;
--o
SELECT stanowisko, count(id_premii)
FROM ksiegowosc.wynagrodzenie w
JOIN ksiegowosc.pensja pen 
ON w.id_pensjii = pen.id_pensji
GROUP BY stanowisko;
--p
DELETE FROM ksiegowosc.wynagrodzenie 
USING ksiegowosc.pensja 
WHERE pensja.kwota <1200 AND wynagrodzenie.id_pensji = pensja.id_pensji;






