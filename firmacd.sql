--a
UPDATE ksiegowosc.pracownicy
SET telefon = '(+48)' || telefon

--b
UPDATE ksiegowosc.pracownicy
SET telefon = SUBSTRING(telefon,0,9) || '-' || SUBSTRING (telefon,9,3) || '-' || SUBSTRING (telefon,12,3)

--C
SELECT *
FROM ksiegowosc.pracownicy
WHERE CHARACTER_LENGTH(nazwisko) = (select max(CHARACTER_LENGTH(nazwisko)) from ksiegowosc.pracownicy)

--D

ALTER TABLE ksiegowosc.pensja ALTER COLUMN kwota TYPE VARCHAR(15);
SELECT prac.*, MD5(pen.kwota) as wynagrodzenie_MD5 
FROM ksiegowosc.pracownicy prac
JOIN ksiegowosc.wynagrodzenie wy ON wy.id_pracownika = prac.id_pracownika 
JOIN ksiegowosc.pensja pen ON wy.id_pensjii = pen.id_pensji 

--F

SELECT imie, nazwisko, pe.kwota AS pensja, pr.kwota AS wynagrodzenie
FROM ksiegowosc.wynagrodzenie wy
LEFT JOIN ksiegowosc.pracownicy prac
ON wy.id_pracownika = prac.id_pracownika
LEFT JOIN ksiegowosc.pensja pe
ON wy.id_pensjii = pe.id_pensji
LEFT JOIN ksiegowosc.premia pr
ON wy.id_premii = pr.id_premiiwy


--G

SELECT CONCAT('Pracownik ', prac.imie , ' ', prac.nazwisko,', w dniu ',
godz.data,' otrzymał pensję całkowitą na kwotę ', pe.kwota+pr.kwota,
' zł, gdzie wynagrodzenie zasadnicze wynosiło: ',pe.kwota, ' zł, premia:', pr.kwota,
', nadgodziny: ', (godz.liczba_godzin-160)*15 ,'zł') AS Raport
FROM ksiegowosc.wynagrodzenie wy
JOIN ksiegowosc.pensja pe ON wy.id_pensjii = pe.id_pensji
JOIN ksiegowosc.premia pr ON wy.id_premii = pr.id_premii 
JOIN ksiegowosc.pracownicy prac ON wy.id_pracownika = prac.id_pracownika
JOIN ksiegowosc.godziny godz ON prac.id_pracownika = godz.id_pracownika