CREATE TABLE `shop`
(
    `id`        SERIAL,
    `num`       CHAR(10)               NOT NULL UNIQUE,
    `name`      VARCHAR(150)           NOT NULL,
    `price`     DECIMAL(8, 2) UNSIGNED NOT NULL,
    `old_price` DECIMAL(8, 2) DEFAULT NULL,
    `img`       VARCHAR(200),
    `date`      DATE,
    `qt`        BIGINT UNSIGNED,
    PRIMARY KEY (`id`)
);


-- Выбирают 10 самых новых товаров
-- 1 row retrieved starting from 1 in 143 ms (execution: 61 ms, fetching: 82 ms)
-- после добавления индекса
-- 1 row retrieved starting from 1 in 86 ms (execution: 17 ms, fetching: 69 ms)
EXPLAIN
SELECT *
FROM `shop`
ORDER BY `date`
        DESC
LIMIT 10;

-- Выбирают 10 самых дешевых товаров
-- 1 row retrieved starting from 1 in 116 ms (execution: 35 ms, fetching: 81 ms)
-- после добавления индекса
-- 1 row retrieved starting from 1 in 86 ms (execution: 16 ms, fetching: 70 ms)
EXPLAIN
SELECT *
FROM `shop`
ORDER BY `price`
LIMIT 10;

-- Выбирают 10 товаров, цена на которых была максимально снижена (в абсолютном или относительном смысле)
-- 1 row retrieved starting from 1 in 82 ms (execution: 25 ms, fetching: 57 ms)
-- после добавления индекса
-- 1 row retrieved starting from 1 in 73 ms (execution: 22 ms, fetching: 51 ms)
EXPLAIN SELECT *
FROM `shop`
WHERE `old_price` IS NOT NULL
ORDER BY (`price` - `old_price`)
LIMIT 10;

-- Выбирают те товары, чей артикул начинается с символов "TEST" (такие товары должны быть в таблице!), используя оператор LIKE
-- 4 rows retrieved starting from 1 in 61 ms (execution: 18 ms, fetching: 43 ms)
-- после добавления индекса
-- 1 row retrieved starting from 1 in 74 ms (execution: 20 ms, fetching: 54 ms)
-- отображается добавленный индекс в поле possible_keys. Using index condition
EXPLAIN SELECT *
FROM `shop`
WHERE `num` LIKE 'TEST%';

CREATE INDEX `num_idx` ON `shop` (`num`);