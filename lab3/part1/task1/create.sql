CREATE TABLE task1 (
    id UUID PRIMARY KEY NOT NULL,
    name VARCHAR(64) NOT NULL,
    surname VARCHAR(64) NOT NULL
);

INSERT INTO task1
    (id, name, surname)
VALUES
    (gen_random_uuid(), 'Иван', 'Красиков'),
    (gen_random_uuid(), 'Петр', 'Иванов'),
    (gen_random_uuid(), 'Даниил', 'Морозов'),
    (gen_random_uuid(), 'Алексей', 'Петров'),
    (gen_random_uuid(), 'Дмитрий', 'Ненахов');