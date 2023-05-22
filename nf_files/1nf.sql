\c topmodelsql

-- \d command to show full table which will tell you the primary key

DROP TABLE IF EXISTS all_models_1nf;
CREATE TABLE all_models_1nf AS SELECT 
model_id, 
model_name,
area,
price_per_event,
category,
agent,
STRING_TO_TABLE(brand, ', ') AS brand,
trait,
rating,
event_date,
revenue
FROM models;

ALTER TABLE all_models_1nf
ADD PRIMARY KEY (model_id, brand);

SELECT * FROM all_models_1nf;

\d all_models_1nf