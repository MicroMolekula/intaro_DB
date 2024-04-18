SELECT
    customer_id "ID клиента",
    max(created_at) "Дата последнего визита"
FROM
    customer_visit
GROUP BY
    customer_id
ORDER BY
    customer_id