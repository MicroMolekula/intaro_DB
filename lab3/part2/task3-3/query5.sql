WITH order_diff AS(
    SELECT
        order_c.manager_id,
        CASE
            WHEN lead(order_c.status_id) OVER (PARTITION BY order_c.manager_id ORDER BY order_c.created_at) != 0
            THEN lead(order_c.created_at) OVER (PARTITION BY order_c.manager_id ORDER BY order_c.created_at) - order_c.created_at
            ELSE NULL
        END diff
    FROM
        order_c
)
SELECT
    order_c.manager_id  " ID менеджера",
    (((100/count(order_c.id)::decimal(10, 2)) * count(DISTINCT CASE WHEN order_c.status_id=1 THEN order_c.id END))::decimal(10, 2) 
        - (100/(SELECT count(*) FROM order_c)::decimal(10,2)*(SELECT count(CASE WHEN o.status_id = 1 THEN o.id END) FROM order_c o))::decimal(10,2))
    + (EXTRACT(EPOCH FROM (avg(order_diff.diff) - (SELECT avg(diff) FROM order_diff)))::decimal(10,2)/3600)::decimal(10,2)
    - (((100/(SELECT count(order_c.id) FROM order_c)::decimal(10, 2)) * count(DISTINCT CASE WHEN order_c.status_id=3 THEN order_c.id END))::decimal(10, 2)
        - ((100/(SELECT count(*) FROM order_c)::decimal(10,2)*(SELECT count(CASE WHEN o.status_id = 3 THEN o.id END) FROM order_c o))::decimal(10,2))) "Рейтинг менеджера"
FROM
    order_c
    JOIN
    order_diff
    ON order_c.manager_id = order_diff.manager_id
GROUP BY 
    order_c.manager_id