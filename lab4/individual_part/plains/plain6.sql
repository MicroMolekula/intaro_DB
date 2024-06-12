EXPLAIN ANALYZE
SELECT id, name, age, job_title, email
FROM table4
WHERE age > 60
ORDER BY job_title ASC
LIMIT 100;