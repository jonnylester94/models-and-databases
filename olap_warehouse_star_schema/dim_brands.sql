\c topmodelsql

DROP TABLE IF EXISTS dim_brands;

CREATE TABLE dim_brands(
    brand_id SERIAL PRIMARY KEY,
    brand TEXT
);

INSERT INTO dim_brands(brand)
SELECT DISTINCT STRING_TO_TABLE(brand, ', ') AS brand FROM models;

SELECT * from dim_brands
ORDER BY brand;