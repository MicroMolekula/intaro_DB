SELECT id, json 
FROM table_json
WHERE json ->> 'error' IS NOT NULL;