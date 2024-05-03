CREATE TABLE customer_visit (
    id SERIAL PRIMARY KEY NOT NULL,
    customer_id INTEGER NOT NULL,
    created_at TIMESTAMP NOT NULL,
    visit_length INTEGER NOT NULL,
    landing_page VARCHAR(255) NOT NULL,
    exit_page VARCHAR(255) NOT NULL,
    utm_source VARCHAR(255) NOT NULL
);

CREATE TABLE customer_visit_page (
    id SERIAL PRIMARY KEY NOT NULL,
    visit_id INTEGER NOT NULL,
    page VARCHAR(255) NOT NULL,
    time_on_page INTEGER NOT NULL,
    FOREIGN KEY (visit_id) REFERENCES customer_visit (id)
);

INSERT INTO customer_visit
    (customer_id, created_at, visit_length, landing_page, exit_page, utm_source)
VALUES
    (1, '2024-04-17 13:00:00', 200, 'site.com/welcome', 'site.com/main', 'Google adds'),
    (2, '2024-04-16 11:00:00', 500, 'site.com/news', 'site.com/profile', 'VK adds'),
    (3, '2024-04-18 12:00:00', 180, 'site.com/main', 'site.com/news', 'Yandex adds'),
    (1, '2024-04-18 09:00:00', 260, 'site.com/profile', 'site.com/news', 'VK adds'),
    (2, '2024-04-17 18:00:00', 660, 'site.com/welcome', 'site.com/profile', 'Google adds'),
    (3, '2024-04-18 20:00:00', 860, 'site.com/news', 'site.com/main', 'Google adds'),
    (1, '2024-04-19 12:50:00', 200, 'site.com/welcome', 'site.com/main', 'Google adds'),
    (2, '2024-04-20 11:20:00', 500, 'site.com/news', 'site.com/main', 'Google adds'),
    (3, '2024-04-21 16:00:00', 180, 'site.com/main', 'site.com/main', 'Google adds');


INSERT INTO customer_visit_page
    (visit_id, page, time_on_page)
VALUES
    (1, 'site.com/welcome', 60),
    (1, 'site.com/main', 140),
    (2, 'site.com/news', 280),
    (2, 'site.com/main', 120),
    (2, 'site.com/profile', 100),
    (3, 'site.com/main', 90),
    (3, 'site.com/news', 90),
    (4, 'site.com/profile', 60),
    (4, 'site.com/main', 60),
    (4, 'site.com/news', 140),
    (5, 'site.com/welcome', 60),
    (5, 'site.com/news', 500),
    (5, 'site.com/profile', 100),
    (6, 'site.com/profile', 800),
    (6, 'site.com/main', 60),
    (7, 'site.com/welcome', 60),
    (7, 'site.com/main', 140),
    (8, 'site.com/news', 280),
    (8, 'site.com/main', 120),
    (8, 'site.com/profile', 100),
    (9, 'site.com/main', 90),
    (9, 'site.com/news', 90);

