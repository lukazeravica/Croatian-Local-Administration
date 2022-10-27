-- Creating Table administrationdata2017 

CREATE TABLE administrationdata2017 
(
    county  varchar(300),
    administrative_unit_type    varchar(300),
    administrative_unit_name    varchar(300),
    hq_address  varchar(300),
    phone_number    varchar(300),
    fax varchar(300),
    e_mail  varchar(300),
    web_site    varchar(300),
    name_of_county_muncipality_or_city_mayor    varchar(300),
    name_of_deputy_mayor    varchar(300),
    name_of_second_deputy_mayor varchar(300),
    name_of_minority_deputy_mayor   varchar(300),
    name_of_president_of_representitative_body   varchar(300),
    admin_unit_id int references administrative_units (admin_unit_id)
);

-- Adding and Renaming the Columns 

ALTER TABLE Administrationdata2017 ADD COLUMN admin_unit_id SERIAL PRIMARY KEY;

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

-- Creating Table administrationdata2021 

CREATE TABLE administrationdata2021 
(
    county  varchar(300),
    administrative_unit_type    varchar(300),
    administrative_unit_name    varchar(300),
    hq_address  varchar(300),
    phone_number    varchar(300),
    fax varchar(300),
    e_mail  varchar(300),
    web_site    varchar(300),
    name_of_county_muncipality_or_city_mayor    varchar(300),
    name_of_president_of_representitative_body   varchar(300),
    admin_unit_id int references administrative_units (admin_unit_id)
);

-- Adding and Renaming the Columns 

ALTER TABLE Administrationdata2021 
RENAME COLUMN name_of_county_muncipality_or_city_mayor 
TO name_of_county_muncipality_or_city_mayor21;

ALTER TABLE Administrationdata2021 
RENAME COLUMN name_of_president_of_representitative_body 
TO name_of_president_of_representitative_body21;

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

ALTER TABLE administrative_units ADD COLUMN admin_id SERIAL PRIMARY KEY;

-- Adding the county_id Column

ALTER TABLE administrative_units
ADD COLUMN county_id text;

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

-- Creating person_id Sequence 

CREATE SEQUENCE person_id_seq
START WITH 1;

-- Creating Table administrative_unit_incumbents

CREATE TABLE administrative_unit_incumbents
(id int NOT NULL DEFAULT nextval('id_seq'),
persons_name TEXT,
admin_unit_id INT,
function_id INT,
year INT
);

-- Populating the table 

-- With Mayors

INSERT INTO administrative_unit_incumbents(persons_name,admin_unit_id)
(SELECT TRIM(INITCAP(name_of_county_muncipality_or_city_mayor17)) 
as persons_name,admin_id
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
as persons_name,admin_id
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
admin_id
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
admin_id
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
admin_id
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
admin_id
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
SELECT TRIM(INITCAP(name_of_president_of_representitative_body21)) as persons_name, admin_id
FROM administrationdata2021

-- Filling the new columns

UPDATE administrative_unit_incumbents
SET
year = '2021',
function_id='5'
WHERE year IS NULL
AND function_id IS NULL;

-- Deleting the Duplicates

DELETE FROM administrative_unit_incumbents
WHERE person_id IN
(SELECT id
FROM 
(SELECT id,
ROW_NUMBER() OVER( PARTITION BY persons_name
ORDER BY  id ) AS row_no
FROM administrative_unit_incumbents ) t
WHERE t.row_no > 1 );

-- Deleting id Column

ALTER TABLE administrative_unit_incumbents
DROP COLUMN id;

-- Making a foreign key

-- For admin_unit_id

ALTER TABLE administrative_unit_incumbents
ADD CONSTRAINT fk_admin_unit_id
FOREIGN KEY(admin_unit_id) 
REFERENCES administrative_units(admin_unit_id);

-- For person_id

ALTER TABLE administrative_unit_incumbents
ADD CONSTRAINT fk_person_id
FOREIGN KEY(person_id) 
REFERENCES people(person_id);

-- Creating people Table

CREATE TABLE people as
(SELECT persons_name,person_id
FROM administrative_unit_incumbents);

-- Making person_id a Primary Key

ALTER TABLE people ADD PRIMARY KEY (person_id);

-- Creating the Functions for Adding New Values into Tables

-- Counties Function

create or replace function add_value_in_counties_table (county varchar,county_id int)
returns setof counties as $$
begin
-- inserting new values
insert into counties (county,county_id)
values (county,county_id);
-- select all
return query select * from counties;
end;
$$ language plpgsql;


-- Administrative Units Table 

create or replace function add_value_in_administrative_units_table (
administrative_unit_type  text,
administrative_unit_name  text,
hq_address  text,
phone_number text,
fax text,
e_mail  text,
web_site text,
county text,
administrative_unit_id int,
county_id   int)
returns setof administrative_units as $$
begin
-- insert new county
insert into administrative_units (administrative_unit_type,
administrative_unit_name,
hq_address,
phone_number,
fax,
e_mail,
web_site,
county,
administrative_unit_id,
county_id)
values (administrative_unit_type,
administrative_unit_name,
hq_address,
phone_number,
fax,
e_mail,
web_site,
county,
administrative_unit_id,
county_id);
-- select all administrative_units
return query select * from administrative_units;
end;
$$ language plpgsql;


-- People Function

create or replace function add_value_in_people_table (person_id int, persons_name text)
returns setof people as $$
begin
-- inserting new values
insert into people (person_id, persons_name)
values (person_id, persons_name);
-- select all 
return query select * from people;
end;
$$ language plpgsql;

-- Administrative Units Incumbents Function

create or replace function add_value_in_administrative_unit_incumbents_table 
(admin_unit_id int,  function_id int, year int, person_id int)
returns setof administrative_unit_incumbents as $$
begin
-- inserting new values
insert into administrative_unit_incumbents (admin_unit_id, function_id, year, person_id)
values (admin_unit_id, function_id, year, person_id);
-- select all 
return query select * from administrative_unit_incumbents;
end;
$$ language plpgsql;

-- Creating Views

CREATE VIEW admin_units_and_incumbents 
AS 
(SELECT c.county_id, 
c.county,
au.admin_unit_id,
a17.administrative_unit_type,
TRIM(INITCAP(a17.administrative_unit_name)) AS administrative_unit_name,
TRIM(INITCAP(a17.name_of_county_muncipality_or_city_mayor17)) 
AS name_of_county_muncipality_or_city_mayor17,
TRIM(INITCAP(a17.name_of_deputy_mayor17))
AS name_of_deputy_mayor17,
TRIM(INITCAP(a17.name_of_second_deputy_mayor17))
AS name_of_second_deputy_mayor17,
TRIM(INITCAP(a17.name_of_minority_deputy_mayor17))
AS name_of_minority_deputy_mayor17,
TRIM(INITCAP(a17.name_of_president_of_representitative_body17))
AS name_of_president_of_representitative_body17
FROM administrationdata2017 a17
JOIN administrative_units au USING (admin_unit_id)
JOIN counties c USING (county_id));





