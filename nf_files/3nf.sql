\c topmodelsql

DROP TABLE IF EXISTS areas;
CREATE TABLE areas AS SELECT 
model_id,
area
FROM all_models_2nf;

SELECT * FROM areas;

DROP TABLE IF EXISTS agents_and_categories;
CREATE TABLE agents_and_categories AS 
SELECT 
DISTINCT agent,
category
FROM 
all_models_2nf;
SELECT * FROM agents_and_categories;

DROP TABLE IF EXISTS all_models_3nf;
CREATE TABLE all_models_3nf AS SELECT
model_id,
model_name,
price_per_event,
trait,
rating,
event_date,
revenue
FROM all_models_2nf;

SELECT * FROM all_models_3nf;