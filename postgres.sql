CREATE TABLE "shop"
(
    "id"          SERIAL PRIMARY KEY,
    "num"         CHAR(10)      NOT NULL UNIQUE,
    "name"        VARCHAR(150)  NOT NULL,
    "price"       DECIMAL(8, 2) NOT NULL,
    "old_price"   DECIMAL(8, 2) DEFAULT NULL,
    "img"         VARCHAR(200),
    "date"        DATE,
    "qt"          BIGINT NULL ,
    "id_category" BIGINT,
    "id_brand"    BIGINT
);

CREATE TABLE "category"
(
    "id"   SERIAL PRIMARY KEY,
    "cat" VARCHAR(100)
);

CREATE TABLE "brand"
(
    "id" SERIAL PRIMARY KEY ,
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

-- Запрос, который выберет категории и среднюю цену товаров в каждой категории, при условии,
-- что эта средняя цена менее 1000 рублей (выбираем "бюджетные" категории товаров)

SELECT cat, AVG(price)
FROM shop
         INNER JOIN category c ON shop.id_category = c.id
GROUP BY cat
HAVING AVG(price) < 1000;