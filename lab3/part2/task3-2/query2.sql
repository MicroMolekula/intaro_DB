SELECT
    R.customer_id "ID клиента",
    avg(T.count) "Среднее количество страниц"
FROM
    customer_visit R
        INNER JOIN
    (
        SELECT
            visit_id,
            count(*)
        FROM
            customer_visit_page
        GROUP BY
            visit_id
    ) T ON R.id = T.visit_id
GROUP BY
    R.customer_id
ORDER BY
    R.customer_id