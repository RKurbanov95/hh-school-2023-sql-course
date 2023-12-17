INSERT INTO area (name)
VALUES ('Москва'),
       ('Санкт-Петербург'),
       ('Нижний-Новгород'),
       ('Казань'),
       ('Тверь'),
       ('Ростов-на-Дону'),
       ('Екатеринбург'),
       ('Южно-Сахалинск'),
       ('Воронеж'),
       ('Краснодар'),
       ('Новосибирск'),
       ('Челябинск'),
       ('Волгоград'),
       ('Саратов'),
       ('Иркутск');

INSERT INTO specialization (name)
VALUES ('Автомобильный бизнес'),
	   ('Административный персонал'),
	   ('Безопасность'),
       ('Государственные организации'),
       ('Добыча сырья'),
       ('ЖКХ'),
       ('Информационные технологии'),
       ('Искусство, культура'),
       ('Лесная промышленность, деревообработка'),
       ('Медицина, фармацевтика, аптеки'),
       ('Образовательные учреждения'),
       ('Общественная деятельность, партии, благотворительность, НКО'),
       ('Перевозки, логистика, склад, ВЭД'),
       ('Продукты питания'),
       ('Промышленное оборудование, техника, станки и комплектующие'),
       ('Розничная торговля'),
       ('СМИ, маркетинг, реклама, BTL, PR, дизайн, продюсирование'),
       ('Сельское хозяйство'),
       ('Строительство, недвижимость, эксплуатация, проектирование'),
       ('Телекоммуникации, связь'),
       ('Тяжелое машиностроение'),
       ('Управление многопрофильными активами'),
       ('Услуги для бизнеса'),
       ('Услуги для населения'),
       ('Финансовый сектор'),
       ('Химическое производство, удобрения'),
       ('Энергетика'),
	   ('Другое');

INSERT INTO company(id, name, description)
VALUES (generate_series(1,100),
	md5(random()::text),
	md5(random()::text));

WITH test_data as (
    SELECT
        GENERATE_SERIES(1, 10000)           AS id,
        MD5(RANDOM()::TEXT)                 AS title,
		MD5(RANDOM()::TEXT)                 AS description,
		FLOOR(RANDOM() * 15) + 1            AS area_id,
		FLOOR(RANDOM() * 28) + 1            AS specialization_id,
        FLOOR(RANDOM() * 100) + 1          AS company_id,
        ROUND((RANDOM() * 100000)::int,-2)  AS compensation_from)
INSERT INTO vacancy (title,
					 description,
					 area_id,
					 specialization_id,
                     company_id,
                     compensation_from,
					 compensation_to,
					 publication_date)
SELECT
    title,
    description,
	area_id,
	specialization_id,
	company_id,
    compensation_from,
    compensation_from + ROUND((RANDOM() * 10000)::int, -2),
    CURRENT_TIMESTAMP - RANDOM() * 720 * INTERVAL '1 day'
FROM test_data;

WITH test_data as (
    SELECT
        GENERATE_SERIES(1, 100000)           AS id,
        MD5(RANDOM()::TEXT)                 AS second_name,
		MD5(RANDOM()::TEXT)                 AS first_name,
		MD5(RANDOM()::TEXT)                 AS middle_name,
		FLOOR(RANDOM() * 15) + 1            AS area_id)
INSERT INTO worker (second_name,
					 first_name,
					 middle_name,
					 area_id,
					 birthdate)
SELECT
    second_name,
    first_name,
	middle_name,
	area_id,
    '1992-12-13'::date - RANDOM() * 720 * INTERVAL '1 day'
FROM test_data;

WITH test_data as (
    SELECT
        GENERATE_SERIES(1, 100000)           AS id,
        MD5(RANDOM()::TEXT)                 AS title,
		FLOOR(RANDOM() * 100000) + 1        AS worker_id,
		FLOOR(RANDOM() * 28) + 1            AS specialization_id,
        ROUND((RANDOM() * 100000)::int,-2)  AS compensation_expectation)
INSERT INTO resume (title,
					 worker_id,
					 specialization_id,
                     compensation_expectation,
					 publication_date)
SELECT
    title,
    worker_id,
	specialization_id,
	compensation_expectation,
    CURRENT_TIMESTAMP - RANDOM() * 720 * INTERVAL '1 day'
from test_data;

WITH test_data AS (
    SELECT
        GENERATE_SERIES(1, 10000) AS id,
        (((random() * 100000) ::int) % 10000) + 1 AS resume_id,
        (((random() * 1000000) ::int) % 100000) + 1 AS vacancy_id
)
INSERT INTO response(resume_id,
                     vacancy_id,
                     responce_date)
SELECT
    test_data.resume_id,
    test_data.vacancy_id,
    vacancy.publication_date + FLOOR(RANDOM() * 30) * INTERVAL '1 day'
FROM test_data
INNER JOIN vacancy ON test_data.vacancy_id = vacancy.id;