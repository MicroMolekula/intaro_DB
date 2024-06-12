INSERT INTO table4 (id, name, age, job_title, email)
SELECT
    tmp.id,
    'Name' || tmp.id,
    (random() * 50 + 20)::integer,
    'Job' || (random() * 80)::integer,
    'email' || tmp.id || '@mail.com'
FROM (SELECT generate_series(1, 10000) as id) as tmp
LEFT JOIN table4 ON table4.id = tmp.id
WHERE table4.id IS NULL;