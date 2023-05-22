\c topmodelsql

DROP TABLE IF EXISTS dim_models;

CREATE TABLE dim_models(
    model_id INT PRIMARY KEY,
    model_name VARCHAR,
    price_per_event FLOAT,
    rating INT,
    trait VARCHAR
);

INSERT INTO dim_models
(model_id, model_name, price_per_event, rating, trait)
SELECT
model_id,
model_name,
price_per_event,
rating,
trait
FROM models;

SELECT * FROM dim_models;

\d dim_models