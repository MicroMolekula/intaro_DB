WITH order_customer_visit AS (
    SELECT
        order_c.customer_id customer_id,
        order_c.id order_id,
        customer_visit.id visit_id
    FROM
        order_c
        JOIN
        customer_visit
        ON order_c.customer_id = customer_visit.customer_id
)
SELECT
    order_customer_visit.customer_id "ID клиента",
    count(DISTINCT order_customer_visit.visit_id) "Количество визитов",
    count(DISTINCT order_customer_visit.order_id) "Количество заказов"
FROM
    order_customer_visit
GROUP BY
    order_customer_visit.customer_id;