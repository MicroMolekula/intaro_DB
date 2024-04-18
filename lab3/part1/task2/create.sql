CREATE TABLE task2 (
    id UUID PRIMARY KEY NOT NULL,
    name VARCHAR(64) NOT NULL,
    surname VARCHAR(64) NOT NULL,
    discipline VARCHAR(64) NOT NULL
);

INSERT INTO task2
(id, name, surname, discipline)
VALUES
    (gen_random_uuid(), 'Иван', 'Красиков', 'Шахматы'),
    (gen_random_uuid(), 'Петр', 'Иванов', 'Настольный тенис'),
    (gen_random_uuid(), 'Даниил', 'Морозов', 'Футбол'),
    (gen_random_uuid(), 'Алексей', 'Петров', 'Футбол'),
    (gen_random_uuid(), 'Дмитрий', 'Ненахов', 'Шахматы'),
    (gen_random_uuid(), 'Александр', 'Карпов', 'Настольный тенис'),
    (gen_random_uuid(), 'Денис', 'Денисов', 'Настольный тенис'),
    (gen_random_uuid(), 'Иван', 'Григорьев', 'Шахматы'),
    (gen_random_uuid(), 'Илья', 'Козлов', 'Футбол');