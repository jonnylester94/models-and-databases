# Database Design

This project is designed to demonstrate my understanding of SQL, data normalisation, and OLAP warehouse design. 

## OLTP Database and Normalisation
The models_data.sql file contains made-up data about some models. Running this file (psql -f models_data.sql) will create the database locally. 

I have written some SQL to normalise this data (nf_files directory) into first, second, and third normal form without mutating the original database. I have outputted the result of each normalisation to a text file using the command: psql -f file_name.sql > file_name.txt.

## Remodelled OLAP Warehouse

The existing OLTP database would be ill-adapted to effective analytics. To make the data easier to analyse, I have redesigned the database into a fact & dimensions based warehouse using the star schema design theory. The SQL files in the olap_warehouse_star_schema dir show how I have split the tables up. I have also attached a screenshot of an entity-relationship diagram (ERD, generated from this website https://dbdiagram.io/home) to provide a visual representation of the warehouse structure. 


I have included some example SQL queries in the queries.sql file to show how the redesigned warehouse can be queried. 



