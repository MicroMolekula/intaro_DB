SELECT 
    -- (100/(SELECT count(*) FROM order_c)::decimal(10,2)*(SELECT count(CASE WHEN o.status_id = 1 THEN o.id END) FROM order_c o))
    (SELECT avg(pr) FROM (SELECT ((100/count(order_c.id)::decimal(10, 2)) * count(DISTINCT CASE WHEN order_c.status_id=1 THEN order_c.id END))::decimal(10, 2) pr FROM order_c GROUP BY order_c.manager_id))