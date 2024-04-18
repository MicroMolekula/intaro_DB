/*
0 - Пополнение баланса 1000
1 - Покупка товара
2 - Возврат средств за товар
3 - Покупка абонемента -300
4 - Возврат абонемента 300
*/

CREATE TABLE task3 (
    id SERIAL PRIMARY KEY NOT NULL,
    type VARCHAR(64) NOT NULL,
    total DECIMAL(10, 2) NOT NULL
);

INSERT INTO task3
    (type, total)
VALUES
    (0, 1000.00),
    (1, - 50.00),
    (1, -100.00),
    (1, -200.00),
    (2, 50.00),
    (3, -300.00),
    (2, 200.00),
    (2, 100.00),
    (4, 300.00);
