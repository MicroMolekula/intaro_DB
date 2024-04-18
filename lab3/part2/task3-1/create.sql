CREATE TABLE order_history (
    id SERIAL PRIMARY KEY NOT NULL,
    order_id INTEGER NOT NULL,
    created_at DATE NOT NULL DEFAULT current_timestamp,
    field_name VARCHAR(64) NOT NULL,
    old_value VARCHAR(64) NOT NULL,
    new_value VARCHAR(64) NOT NULL
);

INSERT INTO order_history
    (order_id, created_at, field_name, old_value, new_value)
VALUES
    (1, '2024-04-01', 'status_id', '0', '1'),
    (1, '2024-04-05', 'status_id', '1', '2'),
    (2, '2024-04-03', 'status_id', '0', '1'),
    (2, '2024-04-06', 'status_id', '1', '3'),
    (3, '2024-04-04', 'status_id', '2', '3'),
    (3, '2024-04-06', 'status_id', '3', '1'),
    (2, '2024-03-27', 'status_id', '2', '0'),
    (1, '2024-03-29', 'status_id', '3', '0'),
    (1, '2024-04-07', 'status_id', '2', '1'),
    (2, '2024-03-23', 'status_id', '1', '2');


