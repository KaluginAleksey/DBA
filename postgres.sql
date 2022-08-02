CREATE TABLE "shop"
(
    "id"          SERIAL PRIMARY KEY,
    "num"         CHAR(10)      NOT NULL UNIQUE CHECK ( "num"  SIMILAR TO '\A[A-z0-9_]{5,10}\Z' ),
    "name"        VARCHAR(150)  NOT NULL,
    "price"       DECIMAL(8, 2) NOT NULL CHECK ( "price" > 0 ),
    "old_price"   DECIMAL(8, 2) DEFAULT NULL,
    "img"         VARCHAR(200) CHECK ( "img" SIMILAR TO '%.jpg|%.jpeg|%.png\Z'),
    "date"        DATE,
    "qt"          BIGINT CHECK ( "qt" >= 0 ),
    "id_category" BIGINT CHECK ( "id_category" > 0 AND "id_category" < 4),
    "id_brand"    BIGINT
);

CREATE TABLE "category"
(
    "id"  SERIAL PRIMARY KEY,
    "cat" VARCHAR(100)
);

CREATE TABLE "brand"
(
    "id"   SERIAL PRIMARY KEY,
    "name" VARCHAR(100)
);

INSERT INTO "category"
("cat")
VALUES ('Еда'),
       ('Посуда'),
       ('Обувь');

INSERT INTO "brand"
("name")
VALUES ('Nestle'),
       ('Данон'),
       ('Красный Октябрь'),
       ('Tefal'),
       ('ВСМПО'),
       ('Reebok'),
       ('Adidas');

ALTER TABLE "shop"
    ADD FOREIGN KEY
        ("id_category")
        REFERENCES "category" ("id")
        ON DELETE RESTRICT
        ON UPDATE CASCADE;

ALTER TABLE "shop"
    ADD FOREIGN KEY
        ("id_brand")
        REFERENCES "brand" ("id")
        ON DELETE RESTRICT
        ON UPDATE CASCADE;

-- Перепроектируйте таблицу товаров, используя поле categories bigint[]

ALTER TABLE "shop"
    ADD "categories" BIGINT[];

-- Выбирающий все товары из заданной категории

SELECT * FROM shop
WHERE 3=ANY(shop.categories);

-- Выбирающий все категории и количество товаров в каждой из них

SELECT cat AS categories, count(*) AS number_of_goods
FROM shop
         INNER JOIN category on category.id = ANY(shop.categories)
GROUP BY category.id;

-- Добавляющий определенный товар в определенную категорию (вам придется найти нужную функцию для работы с массивами)
--
