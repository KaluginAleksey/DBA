CREATE TABLE "shop"
(
    "id" SERIAL,
    "num" CHAR(10) NOT NULL UNIQUE ,
    "name" VARCHAR(150) NOT NULL ,
    "price" DECIMAL(8, 2) NOT NULL ,
    "old_price" DECIMAL(8, 2) DEFAULT NULL,
    "img" VARCHAR(200),
    "date" DATE,
    "qt" BIGINT,
    PRIMARY KEY ("id")
);

-- Выбирают 10 самых новых товаров
-- execution: 19 ms, fetching: 67 ms Sort Key: date DESC
-- после добавления индекса "date_idx"
-- execution: 7 ms, fetching: 46 ms Index Scan Backward using date_idx on shop
EXPLAIN
SELECT *
FROM "shop"
    ORDER BY "date"
    DESC
    LIMIT 10;

-- Выбирают 10 самых дешевых товаров
-- execution: 19 ms, fetching: 79 ms Sort Key: price
-- после добавления индекса
--
EXPLAIN
SELECT *
FROM "shop"
    ORDER BY "price"
    LIMIT 10;

-- Выбирают 10 товаров, цена на которых была максимально снижена (в абсолютном или относительном смысле)
-- execution: 15 ms, fetching: 71 ms
-- после добавления индекса
--
EXPLAIN SELECT *
        FROM "shop"
    WHERE "old_price" IS NOT NULL
    ORDER BY ("price" - "old_price")
    LIMIT 10;

-- Выбирают те товары, чей артикул начинается с символов "TEST" (такие товары должны быть в таблице!), используя оператор LIKE
-- execution: 12 ms, fetching: 49 ms
-- после добавления индекса
-- execution: 9 ms, fetching: 42 ms
EXPLAIN SELECT *
        FROM "shop"
    WHERE "num" LIKE 'TEST%';

CREATE INDEX "num_idx" ON "shop" ("num");
CREATE INDEX "date_idx" ON "shop" ("date");