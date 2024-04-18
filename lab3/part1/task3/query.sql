/*
0 - Пополнение баланса 1000
1 - Покупка товара
2 - Возврат средств за товар
3 - Покупка абонемента -300
4 - Возврат абонемента 300
*/

SELECT
    t.id,
    t.type,
    t.total,
    sum(t.total) OVER(ORDER BY t.id) over_total
FROM task3 t;