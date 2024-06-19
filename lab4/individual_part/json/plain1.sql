EXPLAIN ANALYZE 
SELECT json FROM table_json
WHERE json @> '{"name": "Name1000"}';