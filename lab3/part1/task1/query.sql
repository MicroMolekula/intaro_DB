SELECT
    row_number() OVER (ORDER BY task1.surname) row_number,
    task1.id,
    task1.name,
    task1.surname
FROM task1;