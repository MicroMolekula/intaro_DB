EXPLAIN ANALYZE
SELECT id, name, age, job_title, email
FROM table4
WHERE age < 28
ORDER BY age ASC;