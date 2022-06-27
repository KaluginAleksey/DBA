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