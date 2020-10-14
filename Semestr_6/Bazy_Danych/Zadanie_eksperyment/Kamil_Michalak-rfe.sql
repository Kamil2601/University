-- 91, GIST, range_ops, -|-         -- Kamil Michalak, 299089

-- GIST - Generalized Search Tree
-- Zbalansowane drzewo, wykorzystywane do danych, których porównywanie za pomocą operatorów >, == nie ma sensu (np. obrazy, figury, przedziały). Dostarcza więcej operatorów niż B-drzewo. GIST jest bardziej szablonem niż konkretną strukturą, implementacja zależy od rodzaju danych.

-- GIST range_ops dostarcza operatorów działających na przedziałach.

-- Operator -|- sprawdza czy dwa przedziały  sąsiadują ze sobą
-- Przykład:
-- numrange(1.0,2.0) -|- numrange(2.0,3.0) = true
-- numrange(1.0,2.0) -|- numrange(1.8,3.0) = false
-- numrange(1.0,2.0) -|- numrange(1.2,1.8) = false


-- Eksperyment
-- Tworzę tabelę z losowymi przedziałami i sprawdzam czas wyszukiwania dla zapytań z operatorem -|-.
-- Następnie dodaje indeks i ponownie sprawdzam czas.

-- Funkcje pomocniczne

CREATE OR REPLACE FUNCTION random_between(low INT ,high INT) 
   RETURNS INT AS
$$
BEGIN
   RETURN floor(random()* (high-low + 1) + low);
END;
$$ language 'plpgsql' STRICT;


CREATE OR REPLACE FUNCTION random_range(low INT ,high INT) 
   RETURNS numrange AS
$$
DECLARE
i INT := random_between(low, high);
j INT := random_between(low, high);
BEGIN
    IF i < j THEN
        RETURN numrange(i,j);
    ELSE
        RETURN numrange(j,i);
    END IF;
END;
$$ language 'plpgsql' STRICT;


Stworzenie tabeli i wstawienie losowych przedziałów
CREATE TABLE test(
    range numrange
);

DO $$
BEGIN 
  FOR counter IN 1..1000000 LOOP
    INSERT INTO test(range) VALUES (random_range(0,1000000));
  END LOOP;
END; $$;


DO $$
DECLARE
r numrange;
BEGIN    
  FOR counter IN 1..100 LOOP
    r := random_range(0,1000000);
    PERFORM * FROM test WHERE range -|- r;
  END LOOP;
END; $$;

-- Średni czas: 661 ms na zapytanie

CREATE INDEX gist_test ON test USING GIST (range);

-- Średni czas po utworzeniu indeksu: 177 ms na zapytanie