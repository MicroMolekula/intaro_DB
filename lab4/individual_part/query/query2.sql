SELECT id, name, age, job_title, email
FROM table4
WHERE job_title = 'Job10' OR job_title = 'Job15' OR job_title = 'Job25'
ORDER BY id DESC;