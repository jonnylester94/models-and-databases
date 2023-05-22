\c topmodelsql

DROP TABLE IF EXISTS facts;

-- changing data type of event_date from text to date so it can reference the primary key in dates table

CREATE TABLE facts (
    id SERIAL PRIMARY KEY,
    event_date DATE REFERENCES dim_dates(date_value),
    revenue FLOAT,
    category_id INT REFERENCES dim_categories(category_id),
    agent_id INT REFERENCES dim_agents(agent_id),
    brand_id INT REFERENCES dim_brands(brand_id),
    area_id INT REFERENCES dim_areas(area_id),
    model_id INT REFERENCES dim_models(model_id)   
);


INSERT INTO facts(
    event_date, revenue, category_id, agent_id, brand_id, area_id, model_id
    )
SELECT 
CAST (all_models_1nf.event_date AS DATE),
all_models_1nf.revenue,
dim_categories.category_id,
dim_agents.agent_id,
dim_brands.brand_id,
dim_areas.area_id,
dim_models.model_id
FROM all_models_1nf
INNER JOIN dim_categories ON all_models_1nf.category = dim_categories.category
INNER JOIN dim_agents ON all_models_1nf.agent = dim_agents.agent
INNER JOIN dim_brands ON all_models_1nf.brand = dim_brands.brand
INNER JOIN dim_areas ON all_models_1nf.area = dim_areas.area
INNER JOIN dim_models ON all_models_1nf.model_id = dim_models.model_id;

SELECT * FROM facts;


