INSERT INTO table_json (json)
SELECT 
    ('{"name":"Name' || tmp.id || '","age":' || (random() * 50 + 20)::integer || 
    CASE 
        WHEN random() < 0.5 THEN ',"error":"Error"' 
        ELSE '' 
    END || '}')::jsonb
FROM (SELECT generate_series(1, 10000) as id) as tmp