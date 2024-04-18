SELECT
    new_value "Статус заказа",
    avg(T.date_difference) "Среднее время статуса"
FROM
(
    SELECT
        order_id,
        created_at,
        new_value,
        lead(created_at) OVER (PARTITION BY order_id ORDER BY created_at) - created_at date_difference
    FROM
        order_history
    WHERE
        field_name = 'status_id'
) T
GROUP BY
    new_value
HAVING
    avg(T.date_difference) IS NOT NULL;