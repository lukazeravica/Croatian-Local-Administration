-- Croatian Local Administration DDL

SELECT * FROM administrationdata2017;
SELECT * FROM administrationdata2021;


-- Adding and Renaming the Columns 

ALTER TABLE Administrationdata2017 
RENAME COLUMN name_of_county_muncipality_or_city_mayor 
TO name_of_county_muncipality_or_city_mayor17;

ALTER TABLE Administrationdata2017 
RENAME COLUMN name_of_deputy_mayor 
TO name_of_deputy_mayor17;

ALTER TABLE Administrationdata2017 
RENAME COLUMN name_of_second_deputy_mayor 
TO name_of_second_deputy_mayor17;

ALTER TABLE Administrationdata2017 
RENAME COLUMN name_of_minority_deputy_mayor 
TO name_of_minority_deputy_mayor17;

ALTER TABLE Administrationdata2017 
RENAME COLUMN name_of_president_of_representitative_body 
TO name_of_president_of_representitative_body17;

select * from Administrationdata2017;

-- Updating (number and english translations) the data 

UPDATE administrationdata2017 SET county = CASE
WHEN county = 'I ZAGREBACKA' THEN '01. Zagreb'
WHEN county = 'II KRAPINSKO-ZAGORSKA' THEN '02. Krapina-Zagorje'
WHEN county = 'III SISACKO-MOSLAVACKA' THEN '03. Sisak-Moslavina'
WHEN county = 'IV KARLOVACKA' THEN '04. Karlovac'
WHEN county = 'V VARAZDINSKA' THEN '05. Varazdin'
WHEN county = 'VI. KOPRIVNICKO-KRIZEVACKA ' THEN '06. Koprivnica-Krizevci'
WHEN county = 'VII. BJELOVARSKO-BILOGORSKA' THEN '07. Bjelovar-Bilogora'
WHEN county = 'VIII. PRIMORSKO-GORANSKA ' THEN '08. Primorje-Gorski kotar'
WHEN county = 'IX. LICKO-SENJSKA' THEN '09. Lika-Senj'
WHEN county = 'X. VIROVITICKO-PODRAVSKA ' THEN '10. Virovitica-Podravina'
WHEN county = 'XI. POZESKO-SLAVONSKA' THEN '11. Pozega-Slavonia'
WHEN county = 'XII. BRODSKO-POSAVSKA' THEN '12. Slavonski Brod-Posavina'
WHEN county = 'XIII. ZADARSKA ' THEN '13. Zadar'
WHEN county = 'XIV. OSJECKO-BARANJSKA' THEN '14. Osijek-Baranja'
WHEN county = 'XV. SIBENSKO-KNINSKA ' THEN '15. Sibenik-Knin'
WHEN county = 'XVI. VUKOVARSKO-SRIJEMSKA ' THEN '16. Vukovar-Sirmium'
WHEN county = 'XVII. SPLITSKO-DALMATINSKA' THEN '17. Split-Dalmatia'
WHEN county = 'XVIII. ISTARSKA ZUPANIJA' THEN '18. Istria'
WHEN county = 'XIX. DUBROVACKO-NERETVANSKA' THEN '19. Dubrovnik-Neretva'
WHEN county = 'XX. MEDJIMURSKA ' THEN '20. Medjimurje'
WHEN county = 'XXI. GRAD ZAGREB' THEN '21. City of Zagreb'
END
WHERE county IN ('I ZAGREBACKA',
'II KRAPINSKO-ZAGORSKA',
'III SISACKO-MOSLAVACKA',
'IV KARLOVACKA',
'V VARAZDINSKA',
'VI. KOPRIVNICKO-KRIZEVACKA ',
'VII. BJELOVARSKO-BILOGORSKA',
'VIII. PRIMORSKO-GORANSKA ',
'IX. LICKO-SENJSKA',
'X. VIROVITICKO-PODRAVSKA ',
'XI. POZESKO-SLAVONSKA',
'XII. BRODSKO-POSAVSKA',
'XIII. ZADARSKA ',
'XIV. OSJECKO-BARANJSKA',
'XV. SIBENSKO-KNINSKA ',
'XVI. VUKOVARSKO-SRIJEMSKA ',
'XVII. SPLITSKO-DALMATINSKA',
'XVIII. ISTARSKA ZUPANIJA',
'XIX. DUBROVACKO-NERETVANSKA',
'XX. MEDJIMURSKA ',
'XXI. GRAD ZAGREB'
);

-- Renaming/Translating (in English) Administrative Unit Types

UPDATE administrationdata2017 SET administrative_unit_type = CASE
WHEN administrative_unit_type = 'ZUPANIJA' THEN 'County'
WHEN administrative_unit_type = 'OPCINA' THEN 'Municipality'
WHEN administrative_unit_type = 'GRAD' THEN 'City'
END
WHERE administrative_unit_type IN ('ZUPANIJA',
'OPCINA',
'GRAD');

-- Adding and Renaming the Columns 

ALTER TABLE Administrationdata2021 
RENAME COLUMN name_of_county_muncipality_or_city_mayor 
TO name_of_county_muncipality_or_city_mayor21;

ALTER TABLE Administrationdata2021 
RENAME COLUMN name_of_president_of_representitative_body 
TO name_of_president_of_representitative_body21;

-- Cleaning the NaN values

-- Second Deputy

UPDATE administrationdata2017 SET name_of_second_deputy_mayor17= 'None'
WHERE name_of_second_deputy_mayor17= 'NaN';

-- Minority Deputy Mayor

UPDATE administrationdata2017 SET name_of_minority_deputy_mayor17= 'None'
WHERE name_of_minority_deputy_mayor17= 'NaN';

-- Fax Column

UPDATE administrationdata2017 SET fax= ''
WHERE fax= 'NaN';

-- Counties Table

CREATE TABLE counties AS 
(SELECT distinct(county) FROM administrationdata2017
order by county asc);

ALTER TABLE counties ADD COLUMN county_id SERIAL PRIMARY KEY;

SELECT * FROM counties;

-- Administrative Units table

CREATE TABLE administrative_units AS
(SELECT TRIM(INITCAP(administrative_unit_type)) AS administrative_unit_type,
TRIM(INITCAP(administrative_unit_name)) AS administrative_unit_name,
TRIM(INITCAP(hq_address)) AS hq_address,
TRIM(phone_number) AS phone_number,
TRIM(fax) AS fax,
TRIM(e_mail) AS e_mail,
TRIM(web_site) AS web_site,
TRIM(county) AS county
FROM Administrationdata2017);

-- Seting the Primary Key of admini_unit_id

ALTER TABLE administrative_units ADD COLUMN admin_unit_id SERIAL PRIMARY KEY;

-- Adding the county_id Column

ALTER TABLE administrative_units
ADD COLUMN county_id text;

SELECT * FROM administrative_units;

-- Inserting the Values in Accordance to county Column

UPDATE administrative_units SET county_id  = CASE
WHEN county = '01. Zagreb' THEN '1'
WHEN county = '02. Krapina-Zagorje' THEN '2'
WHEN county = '03. Sisak-Moslavina' THEN '3'
WHEN county = '04. Karlovac' THEN '4'
WHEN county = '05. Varazdin' THEN '5'
WHEN county = '06. Koprivnica-Krizevci' THEN '6'
WHEN county = '07. Bjelovar-Bilogora' THEN '7'
WHEN county = '08. Primorje-Gorski kotar' THEN '8'
WHEN county = '09. Lika-Senj' THEN '9'
WHEN county = '10. Virovitica-Podravina' THEN '10'
WHEN county = '11. Pozega-Slavonia' THEN '11'
WHEN county = '12. Slavonski Brod-Posavina' THEN '12'
WHEN county = '13. Zadar' THEN '13'
WHEN county = '14. Osijek-Baranja' THEN '14'
WHEN county = '15. Sibenik-Knin' THEN '15'
WHEN county = '16. Vukovar-Sirmium' THEN '16'
WHEN county = '17. Split-Dalmatia' THEN '17'
WHEN county = '18. Istria' THEN '18'
WHEN county = '19. Dubrovnik-Neretva' THEN '19'
WHEN county = '20. Medjimurje' THEN '20'
WHEN county = '21. City of Zagreb' THEN '21'
END
WHERE county IN ('01. Zagreb',
'02. Krapina-Zagorje',
'03. Sisak-Moslavina',
'04. Karlovac',
'05. Varazdin',
'06. Koprivnica-Krizevci',
'07. Bjelovar-Bilogora',
'08. Primorje-Gorski kotar',
'09. Lika-Senj',
'10. Virovitica-Podravina',
'11. Pozega-Slavonia',
'12. Slavonski Brod-Posavina',
'13. Zadar',
'14. Osijek-Baranja',
'15. Sibenik-Knin',
'16. Vukovar-Sirmium',
'17. Split-Dalmatia',
'18. Istria',
'19. Dubrovnik-Neretva',
'20. Medjimurje',
'21. City of Zagreb'
);

-- Chaning the Columns's Data Type (From text to interger)

ALTER TABLE administrative_units 
ALTER COLUMN county_id TYPE INT
USING county_id::integer;

-- Making the Foreign Key of county_id

ALTER TABLE administrative_units
ADD CONSTRAINT fk_county_id_id
FOREIGN KEY(county_id) 
REFERENCES counties (county_id);

-- Creating id Sequence 

CREATE SEQUENCE id_seq
START WITH 1;

-- Creating Table administrative_unit_incumbents

CREATE TABLE administrative_unit_incumbents
(id serial,
persons_name TEXT,
admin_unit_id INT,
function_id INT,
year INT
);

-- Populating the table 

-- With Mayors

INSERT INTO administrative_unit_incumbents(persons_name,admin_unit_id)
(SELECT TRIM(INITCAP(name_of_county_muncipality_or_city_mayor17)) 
as persons_name,admin_unit_id
FROM administrationdata2017);

-- Adding and filling the new columns

UPDATE administrative_unit_incumbents
SET
year = '2017',
function_id='1'
WHERE year IS NULL
AND function_id IS NULL;

-- Populating from another table (administrationdata2021)

INSERT INTO administrative_unit_incumbents(persons_name,admin_unit_id)
(SELECT TRIM(INITCAP(name_of_county_muncipality_or_city_mayor21)) 
as persons_name,admin_unit_id
FROM administrationdata2021);

-- Filling the new columns

UPDATE administrative_unit_incumbents
SET
year = '2021',
function_id='1'
WHERE year IS NULL
AND function_id IS NULL;

-- With Deputy mayor

INSERT INTO administrative_unit_incumbents(persons_name,admin_unit_id)
(SELECT TRIM(INITCAP(name_of_deputy_mayor17)) 
as persons_name,
admin_unit_id
FROM administrationdata2017);

-- Adding and filling the new columns

UPDATE administrative_unit_incumbents
SET
year = '2017',
function_id='2'
WHERE year IS NULL
AND function_id IS NULL;


-- With Second Deputy Mayor
 
INSERT INTO administrative_unit_incumbents(persons_name,admin_unit_id)
(SELECT TRIM(INITCAP(name_of_second_deputy_mayor17)) 
as persons_name,
admin_unit_id
FROM administrationdata2017
WHERE name_of_second_deputy_mayor17 != '');

-- Adding and filling the new columns

UPDATE administrative_unit_incumbents
SET
year = '2017',
function_id='3'
WHERE year IS NULL
AND function_id IS NULL;

-- With Minority Deputy Mayor

INSERT INTO administrative_unit_incumbents(persons_name,admin_unit_id)
(SELECT TRIM(INITCAP(SPLIT_PART(name_of_minority_deputy_mayor17,',',1))) 
as persons_name,
admin_unit_id
FROM Administrationdata2017
-- Removing empty values
WHERE name_of_minority_deputy_mayor17 != '');

-- Adding and filling the new columns

UPDATE administrative_unit_incumbents
SET
year = '2017',
function_id='4'
WHERE year IS NULL
AND function_id IS NULL;

-- With Presidents of Representitative Body

INSERT INTO administrative_unit_incumbents(persons_name,admin_unit_id)
(SELECT TRIM(INITCAP(name_of_president_of_representitative_body17)) 
as persons_name,
admin_unit_id
FROM Administrationdata2017);

-- Adding and filling the new columns

UPDATE administrative_unit_incumbents
SET
year = '2017',
function_id='5'
WHERE year IS NULL
AND function_id IS NULL;

-- Populating from another table (administrationdata2021)

INSERT INTO administrative_unit_incumbents(persons_name,admin_unit_id)
SELECT TRIM(INITCAP(name_of_president_of_representitative_body21)) 
as persons_name, admin_unit_id
FROM administrationdata2021;

-- Filling the new columns

UPDATE administrative_unit_incumbents
SET
year = '2021',
function_id='5'
WHERE year IS NULL
AND function_id IS NULL;

-- Deleting the Duplicates

DELETE FROM administrative_unit_incumbents
WHERE id IN
(SELECT id
FROM 
(SELECT id,
ROW_NUMBER() OVER( PARTITION BY persons_name
ORDER BY  id ) AS row_no
FROM administrative_unit_incumbents ) t
WHERE t.row_no > 1 );

SELECT * FROM administrative_unit_incumbents;

-- Deleting id Column

ALTER TABLE administrative_unit_incumbents
DROP COLUMN id;

-- Creating person_id Sequence 

CREATE SEQUENCE person_id_seq
START WITH 1;

-- Adding person_id Column

ALTER TABLE administrative_unit_incumbents 
ADD COLUMN person_id serial;

-- Making a foreign key

-- For admin_unit_id

ALTER TABLE administrative_unit_incumbents
ADD CONSTRAINT fk_admin_unit_id
FOREIGN KEY(admin_unit_id) 
REFERENCES administrative_units(admin_unit_id);

-- Creating people Table

CREATE TABLE people as
(SELECT persons_name,person_id
FROM administrative_unit_incumbents);

-- Making person_id a Primary Key

ALTER TABLE people 
ADD CONSTRAINT pk_person_id
PRIMARY KEY (person_id);

-- Making persons_name unique column to avoid duplicates

CREATE UNIQUE INDEX CONCURRENTLY people_persons_name 
ON people (persons_name);

-- For person_id

ALTER TABLE administrative_unit_incumbents
ADD CONSTRAINT fk_person_id
FOREIGN KEY(person_id) 
REFERENCES people(person_id);

-- eu_countiries Table

-- Adding eu_country_id Column

ALTER TABLE eu_countries 
ADD COLUMN eu_country_id serial;

-- Making eu_country_id a Primary Key
ALTER TABLE eu_countries
ADD PRIMARY KEY (eu_country_id);

-- Updating Values

UPDATE eu_countries
SET accession = '18 April 1951'
WHERE accession = 'Founder';

-- county_area Table

-- Adding county_id Column into county_area

ALTER TABLE county_area
ADD COLUMN county_id TEXT;

SELECT * FROM county_area;

-- Updating county_id Column Values

UPDATE county_area SET county_id  = CASE
WHEN county = 'Bjelovar-Bilogora' THEN '7'
WHEN county = 'Brod-Posavina' THEN '12'
WHEN county = 'Dubrovnik-Neretva' THEN '19'
WHEN county = 'Istria' THEN '18'
WHEN county = 'Karlovac' THEN '4'
WHEN county = 'Koprivnica-Križevci' THEN '6'
WHEN county = 'Krapina-Zagorje' THEN '2'
WHEN county = 'Lika-Senj' THEN '9'
WHEN county = 'Međimurje' THEN '20'
WHEN county = 'Osijek-Baranja' THEN '14'
WHEN county = 'Požega-Slavonia' THEN '11'
WHEN county = 'Primorje-Gorski Kotar' THEN '8'
WHEN county = 'Sisak-Moslavina' THEN '3'
WHEN county = 'Split-Dalmatia' THEN '17'
WHEN county = 'Šibenik-Knin' THEN '15'
WHEN county = 'Varaždin' THEN '5'
WHEN county = 'Virovitica-Podravina' THEN '10'
WHEN county = 'Vukovar-Syrmia' THEN '16'
WHEN county = 'Zadar' THEN '13'
WHEN county = 'Zagreb' THEN '1'
WHEN county = 'City of Zagreb' THEN '21'
END
WHERE county IN ('Bjelovar-Bilogora',
'Brod-Posavina',
'Dubrovnik-Neretva',
'Istria',
'Karlovac',
'Koprivnica-Križevci',
'Krapina-Zagorje',
'Lika-Senj',
'Međimurje',
'Osijek-Baranja',
'Požega-Slavonia',
'Primorje-Gorski Kotar',
'Sisak-Moslavina',
'Split-Dalmatia',
'Šibenik-Knin',
'Varaždin',
'Virovitica-Podravina',
'Vukovar-Syrmia',
'Zadar',
'Zagreb',
'City of Zagreb'
);

-- Chaning the Columns's Data Type (From text to interger)

ALTER TABLE county_area 
ALTER COLUMN county_id TYPE INT
USING county_id::integer;

-- Making county_id a Foreign Key

ALTER TABLE county_area  
ADD CONSTRAINT fk_county_id 
FOREIGN KEY (county_id) 
REFERENCES counties (county_id);
