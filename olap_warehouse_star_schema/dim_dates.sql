\c topmodelsql

DROP TABLE IF EXISTS dim_dates;

CREATE TABLE dim_dates AS 
SELECT 
    ts_seq AS date_value,
    EXTRACT(DAY FROM ts_seq) AS day_of_month,
    TO_CHAR(ts_seq, 'Day') AS day_name,
    EXTRACT(ISODOW FROM ts_seq) AS day_of_week,
    EXTRACT(MONTH FROM ts_seq) AS month_number,
    TO_CHAR(ts_seq, 'Month') AS month_name,
    EXTRACT(YEAR FROM ts_seq) AS year,
    EXTRACT(QUARTER FROM ts_seq) AS quarter,
    'FY' || EXTRACT(YEAR FROM ts_seq - interval '3 month')::VARCHAR AS financial_year

FROM 
(SELECT '2022-01-01'::DATE + sequence.day AS ts_seq
    FROM GENERATE_SERIES(0, 2000) AS sequence(day)) dq;

ALTER TABLE dim_dates
ADD PRIMARY KEY (date_value);

SELECT * FROM dim_dates;

\d dim_dates;