SELECT
    t.id,
    t.type,
    t.total,
    abs(100/sum(t.total) OVER old_over_total * t.total)::decimal(10,2) total_percent,
    sum(t.total) OVER(ORDER BY t.id) over_total
FROM task3 t
WINDOW old_over_total AS (
    ORDER BY id
    ROWS UNBOUNDED PRECEDING
    EXCLUDE CURRENT ROW
);