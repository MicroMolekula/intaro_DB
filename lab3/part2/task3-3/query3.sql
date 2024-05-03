WITH count_visit_table AS (
    SELECT
        customer_visit.utm_source utm_source,
        count(customer_visit.id) visit_count
    FROM
        customer_visit
    GROUP BY
        customer_visit.utm_source
), count_order_table AS (
    SELECT
        order_c.utm_source,
        count(order_c.id) count_order,
        (
            SELECT 
                count(*) 
            FROM 
                order_c o 
            WHERE 
                o.is_paid = true AND o.utm_source = order_c.utm_source
        ) AS count_is_paid,
        (
            SELECT 
                count(*) 
            FROM 
                order_c o 
            WHERE 
                o.status_id = 1 AND o.utm_source = order_c.utm_source
        ) AS count_status_id
    FROM
        order_c
    GROUP BY
        order_c.utm_source
)
SELECT
    count_order_table.utm_source "Источник трафика",
    count_visit_table.visit_count "Количество визитов",
    count_order_table.count_order "Количество созданных заказов",
    count_order_table.count_is_paid "Количество оплаченных заказов",
    count_order_table.count_status_id "Количество выполненных заказов"
FROM
    count_order_table
    JOIN
    count_visit_table
    ON count_order_table.utm_source = count_visit_table.utm_source;
