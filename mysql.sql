CREATE TABLE `history_changes_goods`
(
    `id`        SERIAL PRIMARY KEY,
    `goods_id`  BIGINT UNSIGNED NOT NULL,
    `event`     ENUM ('create', 'price', 'delete'),
    `old_price` DECIMAL(8, 2) UNSIGNED   DEFAULT NULL,
    `new_price` DECIMAL(8, 2) UNSIGNED   DEFAULT NULL,
    `timestamp` TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO `history_changes_goods`
    (`goods_id`, `event`)
VALUES (24, 'create'),
       (25, 'create'),
       (26, 'create'),
       (27, 'delete'),
       (1, 'delete'),
       (2, 'delete');

INSERT INTO `history_changes_goods`
    (`goods_id`, `event`, `old_price`, `new_price`)
VALUES (24, 'price', 2800, 3000),
       (24, 'price', 3000, 2950),
       (25, 'price', 300, 500),
       (25, 'price', 500, 900),
       (25, 'price', 900, 850),
       (28, 'price', 10000, 12000),
       (29, 'price', 6300, 6000);


-- Новые товары

CREATE VIEW new_goods AS
SELECT shop.id, shop.num, shop.name, shop.price, shop.old_price, shop.img, shop.date, shop.qt
FROM shop
         INNER JOIN history_changes_goods hcg on shop.id = hcg.goods_id
WHERE event = 'create' AND  DATEDIFF(CURRENT_TIMESTAMP, timestamp) <=3;

SELECT * FROM new_goods;

-- Товары, цена которых изменялась не менее 3 раз

CREATE VIEW more_3_changes AS
SELECT s.*, COUNT(goods_id) AS count_event
FROM history_changes_goods AS hcg
         INNER JOIN shop s on hcg.goods_id = s.id
WHERE event = 'price'
GROUP BY goods_id
HAVING count_event >= 3;

SELECT * FROM more_3_changes;
