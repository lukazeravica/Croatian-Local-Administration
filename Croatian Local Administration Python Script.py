# Croatian Local Administration Python Script

import pandas as pd
import psycopg2
from psycopg2.extras import execute_values
import ssl

# Importing Excel Datasets (2017 & 2021)

df17 = pd.read_excel(
    r"C:\path\to\file.xlsx")

print(df17)

df21 = pd.read_excel(
    r"C:\path\to\file.xlsx")

print(df21)

# Connecting PostgreSQL to Python

# Establishing connection
pgconn = psycopg2.connect(
    database="Croatian Local Administration",
    user='postgres',
    password='*****',
    host='localhost',
    port=1111
)
# Creating a cursor object using the cursor() method

pgcursor = pgconn.cursor()

# Creating the df17 table

pgcursor.execute(''' CREATE TABLE administrationdata2017 
(
    county  TEXT,
    administrative_unit_type    TEXT,
    administrative_unit_name    TEXT,
    hq_address  TEXT,
    phone_number    TEXT,
    fax TEXT,
    e_mail  TEXT,
    web_site    TEXT,
    name_of_county_muncipality_or_city_mayor    TEXT,
    name_of_deputy_mayor    TEXT,
    name_of_second_deputy_mayor TEXT,
    name_of_minority_deputy_mayor   TEXT,
    name_of_president_of_representitative_body   TEXT
);  
                            ''')

pgconn.commit()

# Inserting the data df17

execute_values(pgcursor,
               'INSERT INTO administrationdata2017 (county,administrative_unit_type,administrative_unit_name,hq_address,phone_number,fax,e_mail,web_site,name_of_county_muncipality_or_city_mayor,name_of_deputy_mayor,name_of_second_deputy_mayor,name_of_minority_deputy_mayor,name_of_president_of_representitative_body) VALUES %s',
               df17.values)

pgconn.commit()

#  Adding the primary key (admin_unit_id) to df17 table

pgcursor.execute(''' ALTER TABLE administrationdata2017 ADD COLUMN admin_unit_id SERIAL PRIMARY KEY;  
                            ''')
pgconn.commit()

# Creating the df21 table

pgcursor.execute(''' CREATE TABLE administrationdata2021 
(
    county  TEXT,
    administrative_unit_type    TEXT,
    administrative_unit_name    TEXT,
    hq_address  TEXT,
    phone_number    TEXT,
    fax TEXT,
    e_mail  TEXT,
    web_site    TEXT,
    name_of_county_muncipality_or_city_mayor    TEXT,
    name_of_president_of_representitative_body   TEXT,
    admin_unit_id SERIAL,
    CONSTRAINT fk_administrationdata2021 FOREIGN KEY (admin_unit_id) references administrationdata2017 (admin_unit_id)
);  
                            ''')

pgconn.commit()

# Inserting the data df21

execute_values(pgcursor,
               'INSERT INTO administrationdata2021 (county,administrative_unit_type,administrative_unit_name,hq_address,phone_number,fax,e_mail,web_site,name_of_county_muncipality_or_city_mayor,name_of_president_of_representitative_body) VALUES %s',
               df21.values)

pgconn.commit()

# Scraping the eu_countries Table from Wikipedia

table1 = pd.read_html('https://en.wikipedia.org/wiki/Member_state_of_the_European_Union')

print(len(table1))

eu_df = pd.DataFrame(table1[1])

print(eu_df.info())

print(eu_df)

# Dropping the unnecessary columns

new_eu_df = eu_df.drop(['ISO','Population[2]', 'Official languages'], axis=1)

print(new_eu_df.info())

# Renaming the column

eu_final_df = new_eu_df.rename(
    columns={'Country': 'country', 'Accession': 'accession',  'Area (km2)': 'area_km2',
             'Largest city': 'largest_city', 'GDP(US$ M)': 'gdp', 'GDP (PPP)per cap.[3][4]': 'gdp_ppp',
             'Currency': 'currency', 'Gini[5]': 'gini', 'HDI[6]': 'hdi', 'MEPs': 'mep'
             })

print(eu_final_df)

# Creating county_area Table

pgcursor.execute(''' CREATE TABLE eu_countries 
(
country TEXT, 
accession TEXT, 
area_km2 TEXT, 
largest_city TEXT, 
gdp TEXT, 
gdp_ppp TEXT, 
currency TEXT, 
gini TEXT, 
hdi TEXT, 
mep TEXT

);  
                            ''')

pgconn.commit()

# Inserting the eu_final_df Values

execute_values(pgcursor,'INSERT INTO eu_countries (country, accession, area_km2, largest_city, gdp, gdp_ppp, currency, gini, hdi, mep) VALUES %s', eu_final_df.values)

pgconn.commit()

# Scraping the county_area table from Wikipedia

table2 = pd.read_html('https://en.wikipedia.org/wiki/Counties_of_Croatia')

print(len(table2))

cro_df = pd.DataFrame(table2[5])

print(cro_df.info())

# Dropping the Unnecessary Columns

new_cro_df = cro_df.drop(['Geographic coordinates', 'Arms', 'GDP per capita (2019)[54]', 'Population (2021)[53]'],axis=1)

print(new_cro_df.info())

# Renaming the Column

croatian_counties_area_df = new_cro_df.rename(columns={'County': 'county', 'Seat': 'seat', 'Area (2006)[52]': 'area_2006'}).replace('City of Zagreb[c]','City of Zagreb')

print(croatian_counties_area_df)

# Creating county_area Table

pgcursor.execute(''' CREATE TABLE county_area 
(
    county  TEXT,
    seat    TEXT,
    area_2006    TEXT

);  
                            ''')

pgconn.commit()

# Inserting the croatian_counties_area_df Values

execute_values(pgcursor, 'INSERT INTO county_area (county,seat,area_2006) VALUES %s', croatian_counties_area_df.values)

pgconn.commit()

# Closing Cursor

pgcursor.close()

# Closing Connection

pgconn.close()


