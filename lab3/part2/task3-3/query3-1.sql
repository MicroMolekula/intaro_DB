SELECT
    customer_visit.utm_source "Источник трафика",
    count(DISTINCT customer_visit.id) "Количество визитов",
    count(DISTINCT order_c.id) "Количество созданных заказов",
    count(DISTINCT CASE WHEN order_c.is_paid THEN order_c.id END) "Количество оплаченных заказов",
    count(DISTINCT CASE WHEN order_c.status_id = 1 THEN order_c.id END) "Количество выполненных заказов"
FROM
    customer_visit
    JOIN
    order_c
    ON customer_visit.utm_source = order_c.utm_source
GROUP BY
    customer_visit.utm_source;
