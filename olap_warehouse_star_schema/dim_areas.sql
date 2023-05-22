\c topmodelsql

DROP TABLE IF EXISTS dim_areas;

CREATE TABLE dim_areas(
    area_id SERIAL PRIMARY KEY,
    area VARCHAR NOT NULL
);

INSERT INTO dim_areas
(area)
SELECT DISTINCT area FROM models;

SELECT * from dim_areas;