-- Croatian Local Administration DML 

SELECT * FROM admin_units_and_incumbents;

-- Municipalities Count 

SELECT county_id, county, 
COUNT (administrative_unit_type) AS municipality_count
FROM admin_units_and_incumbents 
WHERE administrative_unit_type = 'Municipality'
GROUP BY county_id, county,
administrative_unit_type
ORDER BY county_id;

-- Municipalities Query

SELECT county_id, county, 
administrative_unit_type, 
administrative_unit_name
FROM admin_units_and_incumbents 
WHERE administrative_unit_type = 'Municipality'
GROUP BY county_id, county,
administrative_unit_type,
administrative_unit_name
ORDER BY county_id;


-- Cities Count

SELECT county_id, county, 
COUNT (administrative_unit_type) AS city_count
FROM admin_units_and_incumbents 
WHERE administrative_unit_type = 'City'
GROUP BY county_id, county,
administrative_unit_type
ORDER BY county_id;

-- Cities Query

SELECT county_id, county, 
administrative_unit_type, 
administrative_unit_name as cities_names
FROM admin_units_and_incumbents 
WHERE administrative_unit_type = 'City'
GROUP BY county_id, county,
administrative_unit_type,
administrative_unit_name
ORDER BY county_id;

-- Administrative Units and Incumbents

SELECT county_id,county,administrative_unit_type, administrative_unit_name, 
name_of_county_muncipality_or_city_mayor17,
name_of_deputy_mayor17,
name_of_second_deputy_mayor17,
name_of_minority_deputy_mayor17,
name_of_president_of_representitative_body17
FROM admin_units_and_incumbents
ORDER BY county_id;

-- Administrative Units and Incumbents Count

-- Mayors Count

SELECT DISTINCT(county),
COUNT(name_of_county_muncipality_or_city_mayor17)
AS mayors_count,
FROM admin_units_and_incumbents
GROUP BY county 
ORDER BY county;

-- Deputy Mayors Count

SELECT DISTINCT(county),
COUNT(name_of_deputy_mayor17)
AS deputy_mayor_count
FROM admin_units_and_incumbents
GROUP BY county 
ORDER BY county;

-- Second Deputy Mayors Count

SELECT DISTINCT(county),
COUNT(name_of_second_deputy_mayor17)
AS second_deputy_mayor_count
FROM admin_units_and_incumbents
WHERE name_of_second_deputy_mayor17 != ''
GROUP BY county 
ORDER BY county;

-- Minority Deputy Mayors Count

SELECT DISTINCT(county),
COUNT(name_of_minority_deputy_mayor17)
AS name_of_minority_deputy_mayor17
FROM admin_units_and_incumbents
WHERE name_of_minority_deputy_mayor17 != ''
GROUP BY county 
ORDER BY county;

-- Locating the Minority Deputy Mayors

SELECT county, administrative_unit_type, administrative_unit_name, 
name_of_minority_deputy_mayor17
FROM admin_units_and_incumbents
WHERE name_of_minority_deputy_mayor17 != ''
ORDER BY county;

-- Presidents of Representative Body Count

SELECT DISTINCT(county),
COUNT(name_of_president_of_representitative_body17)	
AS name_of_president_of_representitative_body17
FROM admin_units_and_incumbents
GROUP BY county 
ORDER BY county;

-- Local Administrative Data by The Region

-- Eastern Croatia (Slavonia)

SELECT * FROM admin_units_and_incumbents
WHERE county_id IN ('10','11','12','14','16')
ORDER BY county_id;

-- Central Croatia

SELECT * FROM admin_units_and_incumbents
WHERE county_id in ('1','2','3','4','5','6','7','20','21')
ORDER BY county_id;

-- Western Croatia (Istria and Hills Croatia)

SELECT * FROM admin_units_and_incumbents
WHERE county_id IN ('8','9','18')
ORDER BY county_id;

-- Southern Croatia (Dalmatia)

SELECT * FROM admin_units_and_incumbents
WHERE county_id IN ('13','15','17','19')
ORDER BY county_id;

-- Administrative Units with Changed Incumbents

-- Same Mayors (No change)

SELECT a17.county,TRIM(INITCAP(a17.administrative_unit_name)) 
AS administrative_unit_name,
a17.administrative_unit_type,
TRIM(INITCAP(a17.name_of_county_muncipality_or_city_mayor17))
AS name_of_county_muncipality_or_city_mayor17, 
TRIM(INITCAP(a21.name_of_county_muncipality_or_city_mayor21)) 
AS name_of_county_muncipality_or_city_mayor21
FROM administrationdata2017 a17
JOIN administrationdata2021 a21 USING (admin_unit_id)
WHERE name_of_county_muncipality_or_city_mayor17 
= name_of_county_muncipality_or_city_mayor21;

-- Different Mayors (Change)


SELECT a17.county,TRIM(INITCAP(a17.administrative_unit_name)) 
AS administrative_unit_name,
a17.administrative_unit_type,
TRIM(INITCAP(a17.name_of_county_muncipality_or_city_mayor17))
AS name_of_county_muncipality_or_city_mayor17, 
TRIM(INITCAP(a21.name_of_county_muncipality_or_city_mayor21)) 
AS name_of_county_muncipality_or_city_mayor21
FROM administrationdata2017 a17
JOIN administrationdata2021 a21 USING (admin_unit_id)
WHERE name_of_county_muncipality_or_city_mayor17 
= name_of_county_muncipality_or_city_mayor21;

-- Same Presidents of Representitative Body (No Change)

SELECT a17.county,TRIM(INITCAP(a17.administrative_unit_name)) 
AS administrative_unit_name,
a17.administrative_unit_type,
TRIM(INITCAP(a17.name_of_president_of_representitative_body17))
AS name_of_president_of_representitative_body17, 
TRIM(INITCAP(a21.name_of_president_of_representitative_body21)) 
AS name_of_president_of_representitative_body21
FROM administrationdata2017 a17
JOIN administrationdata2021 a21 USING (admin_unit_id)
WHERE name_of_president_of_representitative_body17 
= name_of_president_of_representitative_body21;

-- Different Presidents of Representitative Body (Change)

SELECT a17.county,TRIM(INITCAP(a17.administrative_unit_name)) 
AS administrative_unit_name,
a17.administrative_unit_type,
TRIM(INITCAP(a17.name_of_president_of_representitative_body17))
AS name_of_president_of_representitative_body17, 
TRIM(INITCAP(a21.name_of_president_of_representitative_body21)) 
AS name_of_president_of_representitative_body21
FROM administrationdata2017 a17
JOIN administrationdata2021 a21 USING (admin_unit_id)
WHERE name_of_president_of_representitative_body17 
!= name_of_president_of_representitative_body21;


