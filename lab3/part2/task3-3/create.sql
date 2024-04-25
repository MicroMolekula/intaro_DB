/* 
status_id
0 - Не выполнен
1 - Выполнен
*/


CREATE TABLE customer (
    id SERIAL PRIMARY KEY NOT NULL,
    created_at TIMESTAMP NOT NULL,
    first_name VARCHAR(64) NOT NULL,
    last_name VARCHAR(64) NOT NULL,
    phone CHAR(10) NOT NULL,
    email VARCHAR(64) NOT NULL
);

CREATE TABLE order_c (
    id SERIAL PRIMARY KEY NOT NULL,
    created_at TIMESTAMP NOT NULL,
    customer_id INTEGER NOT NULL,
    manager_id INTEGER NOT NULL,
    status_id INTEGER NOT NULL,
    is_paid BOOLEAN NOT NULL,
    total_sum INTEGER NOT NULL,
    utm_source VARCHAR(255) NOT NULL
);

INSERT INTO customer 
    (created_at, first_name, last_name, phone, email)
VALUES
    ('2023-12-13 13:00:00', 'Иван', ' Красиков', '9508081138', 'ivan@gmail.com'),
    ('2023-11-15 11:50:00', 'Дмитрий', ' Ненахов', '904441115', 'dima@gmail.com'),
    ('2024-01-05 15:30:00', 'Михаил', 'Андропов', '9043331233', 'misha@gmail.com');

INSERT INTO order_c
    (created_at, customer_id, manager_id, status_id, is_paid, total_sum, utm_source)
VALUES
    ('2024-04-17 13:01:00', 1, 1, 1, true, 500, 'Google adds'),
    ('2024-04-16 11:03:00', 2, 3, 0, false, 300, 'VK adds'),
    ('2024-04-18 12:01:50', 3, 2, 1, false, 200, 'Yandex adds'),
    ('2024-04-18 09:04:00', 1, 2, 0, false, 450, 'VK adds'),
    ('2024-04-17 18:05:00', 2, 3, 0, true, 240, 'Google adds'),
    ('2024-04-18 20:06:00', 3, 1, 1, true, 330, 'Google adds');