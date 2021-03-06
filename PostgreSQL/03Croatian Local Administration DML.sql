--DML

-- Eastern Croatia (Slavonia)

-- Number of incumbents

select * from incumbent_function_count
where county_id in ('10','11','12','14','16')
order by county_id;

select * from incumbents_data
where county_id in ('10','11','12','14','16')
order by county_id;

-- Administrative Units

select count(administrative_unit_type) 
as "total_count_of_administrative_unit_type" 
from administrative_units
where county_id in ('10','11','12','14','16');

select * from administrative_unit_type_count 
where county_id in ('10','11','12','14','16');

select * from incumbents_data
where county_id in ('10','11','12','14','16')
order by county_id;

-- Minority deputy mayors

select * from minorities_view
where county_id in ('10','11','12','14','16')
order by county_id;

select * from minorities_count
where county_id in ('10','11','12','14','16')
order by county_id;

-- Northern (Central) Croatia 

-- Number of incumbents

select * from incumbent_function_count
where county_id in ('1','2','3','4','5','6','7','20','21')
order by county_id;

select * from incumbents_data
where county_id in ('1','2','3','4','5','6','7','20','21')
order by county_id;

-- Administrative Units

select count(administrative_unit_type) 
as "total_count_of_administrative_unit_type" 
from administrative_units
where county_id in ('1','2','3','4','5','6','7','20','21');

select * from administrative_unit_type_count 
where county_id in ('1','2','3','4','5','6','7','20','21');

select * from incumbents_data
where county_id in ('1','2','3','4','5','6','7','20','21')
order by county_id;

-- Minority deputy mayors

select * from minorities_view
where county_id in ('1','2','3','4','5','6','7','20','21')
order by county_id;

select * from minorities_count
where county_id in ('1','2','3','4','5','6','7','20','21')
order by county_id;

-- Western Croatia (Istria and Hills Croatia)

-- Number of incumbents

select * from incumbent_function_count
where county_id in ('8','9','18')
order by county_id;

select * from incumbents_data
where county_id in ('8','9','18')
order by county_id;

-- Administrative Units

select count(administrative_unit_type) 
as "total_count_of_administrative_unit_type" 
from administrative_units
where county_id in ('8','9','18');

select * from administrative_unit_type_count 
where county_id in ('8','9','18');

select * from incumbents_data
where county_id in ('8','9','18')
order by county_id;

-- Minority deputy mayors

select * from minorities_view
where county_id in ('8','9','18')
order by county_id;

select * from minorities_count
where county_id in ('8','9','18')
order by county_id;

-- Southern Croatia (Dalmatia)

-- Number of incumbents

select * from incumbent_function_count
where county_id in ('13','15','17','19')
order by county_id;

select * from incumbents_data
where county_id in ('13','15','17','19')
order by county_id;

-- Administrative Units

select count(administrative_unit_type) 
as "total_count_of_administrative_unit_type" 
from administrative_units
where county_id in ('13','15','17','19');

select * from administrative_unit_type_count 
where county_id in ('13','15','17','19');

select * from incumbents_data
where county_id in ('13','15','17','19')
order by county_id;

-- Minority deputy mayors

select * from minorities_view
where county_id in ('13','15','17','19')
order by county_id;

select * from minorities_count
where county_id in ('13','15','17','19')
order by county_id;

-- Testing the functions

-- People Table

select add_value_in_people_table(2657,'ZELJKO MALNAR');

-- Counties Table

select add_value_in_counties_table (22,'REPUBLIKA PESCENICA');

-- Administrative Units Table
select add_value_in_administrative_units_table (577,'COUNTY','REPUBLIKA PESCENICA',22,'STARA PESCENICA 10',
'01 668 994','01 668 994','nocnamora@z1.hr','www.nocnamora.hr');

-- Administrative Unit Incumbents Table
select add_value_in_administrative_unit_incumbents_table(2657,576,2017,'MAYOR',1);

-- Minority Table

select add_value_in_minorities_table (10,'GERMAN');

