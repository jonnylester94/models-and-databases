\c topmodelsql

DROP TABLE IF EXISTS brands;

CREATE TABLE brands AS SELECT 
model_id,
brand
FROM all_models_1nf;

SELECT * FROM brands;

DROP TABLE IF EXISTS all_models_2nf;

CREATE TABLE all_models_2nf AS SELECT
DISTINCT model_id,
model_name,
area,
price_per_event,
category,
agent,
trait,
rating,
event_date,
revenue
FROM all_models_1nf
ORDER BY model_id;

SELECT * FROM all_models_2nf;

