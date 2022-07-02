CREATE TABLE "shop"
(
    "id"          SERIAL PRIMARY KEY,
    "num"         CHAR(10)      NOT NULL UNIQUE,
    "name"        VARCHAR(150)  NOT NULL,
    "price"       DECIMAL(8, 2) NOT NULL,
    "old_price"   DECIMAL(8, 2) DEFAULT NULL,
    "img"         VARCHAR(200),
    "date"        DATE,
    "qt"          BIGINT,
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

-- Выборка всех товаров с указанием их категории и бренда

SELECT *,
       (SELECT cat FROM category WHERE category.id = shop.id_category) AS category,
       (SELECT name FROM brand WHERE brand.id = shop.id_brand)         AS brand
FROM shop;

-- Выборка всех товаров, бренд которых начинается на букву "А"

SELECT * FROM shop
INNER JOIN brand AS b ON shop.id_brand = b.id
WHERE b.name LIKE ('A%');