CREATE TABLE `shop`
(
    `id`          SERIAL PRIMARY KEY,
    `num`         CHAR(10)               NOT NULL UNIQUE,
    `name`        VARCHAR(150)           NOT NULL,
    `price`       DECIMAL(8, 2) UNSIGNED NOT NULL,
    `old_price`   DECIMAL(8, 2) DEFAULT NULL,
    `img`         VARCHAR(200),
    `date`        DATE,
    `qt`          BIGINT UNSIGNED,
    `id_category` BIGINT UNSIGNED,
    `id_brand`    BIGINT UNSIGNED
);

CREATE TABLE `category`
(
    `id`  SERIAL PRIMARY KEY,
    `cat` VARCHAR(100)
);

CREATE TABLE `brand`
(
    `id`   SERIAL PRIMARY KEY,
    `name` VARCHAR(100)
);

INSERT INTO `category`
    (`cat`)
VALUES ('Еда'),
       ('Посуда'),
       ('Обувь');

INSERT INTO `brand`
    (`name`)
VALUES ('Nestle'),
       ('Данон'),
       ('Красный Октябрь'),
       ('Tefal'),
       ('ВСМПО'),
       ('Reebok'),
       ('Adidas');

ALTER TABLE `shop`
    ADD FOREIGN KEY
        (`id_category`)
        REFERENCES `category` (`id`)
        ON DELETE RESTRICT
        ON UPDATE CASCADE;

ALTER TABLE `shop`
    ADD FOREIGN KEY
        (`id_brand`)
        REFERENCES `brand` (`id`)
        ON DELETE RESTRICT
        ON UPDATE CASCADE;

-- Выборка всех товаров с указанием их категории и бренда

SELECT *,
       (SELECT cat FROM category WHERE category.id = shop.id_category) AS category,
       (SELECT name FROM brand WHERE brand.id = shop.id_brand)         AS brand
FROM shop;

-- Выборка всех товаров, бренд которых начинается на букву "А"

SELECT *
FROM shop
         INNER JOIN brand AS b ON shop.id_brand = b.id
WHERE b.name LIKE ('A%');

-- Выведут список категорий и число товаров в каждой (используйте подзапросы и функцию COUNT(), использовать группировку нельзя)

SELECT cat,
       (SELECT COUNT(*)
        FROM shop
        WHERE id_category = category.id) AS ammount
FROM category;

-- Выберут для каждой категории список брендов товаров, входящих в нее

SELECT DISTINCT cat, b.name
FROM shop
         LEFT JOIN category с on shop.id_category = с.id
         LEFT JOIN brand b on shop.id_brand = b.id
ORDER BY cat;
