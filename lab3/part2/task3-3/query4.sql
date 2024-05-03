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
    order_c.manager_id "ID менеджера",
    avg(order_diff.diff) "Среднее время выполнения заказов",
    ((100/(SELECT count(order_c.id) FROM order_c)::decimal(10, 2)) * count(DISTINCT CASE WHEN order_c.status_id=3 THEN order_c.id END))::decimal(10, 2) "Доля отмененных заказов",
    sum(DISTINCT CASE WHEN order_c.status_id=1 THEN order_c.total_sum END) "Сумма выполненных заказов",
    avg(DISTINCT CASE WHEN order_c.status_id=1 THEN order_c.total_sum END)::decimal(10,2) "Средняя стоимость выполненного заказа"
FROM
    order_c
    JOIN
    order_diff
    ON order_c.manager_id = order_diff.manager_id
GROUP BY
    order_c.manager_id
ORDER BY
    order_c.manager_id