\c topmodelsql

\echo '\n1. This agent has the lowest rated models:'

WITH agents_and_models_rating AS (SELECT 
DISTINCT dim_models.model_id, 
facts.agent_id, 
dim_agents.agent, 
dim_models.rating
FROM facts
JOIN dim_agents ON facts.agent_id = dim_agents.agent_id
JOIN dim_models ON facts.model_id = dim_models.model_id)

SELECT 
ROUND(AVG(agents_and_models_rating.rating),1) AS avg, agents_and_models_rating.agent
FROM agents_and_models_rating
GROUP BY agents_and_models_rating.agent
ORDER BY avg LIMIT 1;

\echo '\n2. This is the model that has worked the most events:'

WITH models_money AS (SELECT DISTINCT dim_models.model_name, facts.revenue, dim_models.price_per_event
FROM facts
JOIN dim_models ON facts.model_id = dim_models.model_id)

SELECT ROUND(models_money.revenue / models_money.price_per_event) AS result, models_money.model_name
FROM models_money
ORDER BY result DESC LIMIT 1;
