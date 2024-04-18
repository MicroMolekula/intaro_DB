ALTER TABLE task3
ADD COLUMN percent_total DECIMAL(10, 2);

UPDATE task3 t
SET percent_total = abs((100/(SELECT sum(total) FROM task3 n)) * total)::decimal(10,2)
WHERE true;

SELECT
    t.id,
    t.type,
    t.total,
    t.percent_total,
    sum(t.total) OVER(ORDER BY t.id) over_total
FROM task3 t;