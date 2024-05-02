WITH diff_date AS (
    SELECT 
        ord.customer_id id, 
        lead(ord.created_at) OVER (PARTITION BY ord.customer_id ORDER BY ord.created_at) - ord.created_at diff
    FROM 
        order_c AS ord
)
SELECT 
    diff_date.id "ID клиента", 
    avg(diff_date.diff) "Среднее время между заказами"
FROM 
    diff_date
WHERE
	diff_date.diff IS NOT NULL
GROUP BY
	diff_date.id
