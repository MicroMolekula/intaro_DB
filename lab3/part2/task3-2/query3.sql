EXPLAIN --ANALYZE
SELECT
    CV.customer_id "ID клиента",
    CVP.page "> Среднего визита клиента"
FROM
    customer_visit_page CVP
        INNER JOIN
    (
        SELECT
            id,
            customer_id,
            avg(visit_length) OVER (PARTITION BY customer_id ORDER BY customer_id)
        FROM
            customer_visit
    ) CV ON CVP.visit_id = CV.id
WHERE
    CVP.time_on_page > CV.avg