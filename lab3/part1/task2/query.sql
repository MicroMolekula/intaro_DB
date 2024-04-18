SELECT
    row_number() OVER (PARTITION BY task2.discipline ORDER BY task2.discipline) row_number,
    task2.discipline,
    task2.id,
    task2.name,
    task2.surname
FROM task2;
