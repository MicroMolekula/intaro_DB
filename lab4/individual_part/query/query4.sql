SELECT id, name, age, job_title, email
FROM table4
WHERE id in (1, 10, 20, 100, 35, 41)
ORDER BY email ASC
LIMIT 100;