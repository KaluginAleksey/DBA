CREATE TABLE "shop"
(
    "id"          SERIAL,
    "name"        VARCHAR(150) NOT NULL,
    "code"        CHAR(10)     NOT NULL,
    "img"         VARCHAR(150),
    "price"       NUMERIC(8, 2) CHECK ( price > 0 ),
    "date"        DATE,
    "qt"          BIGINT CHECK ( qt >= 0 ),
    "description" TEXT
);

INSERT INTO "shop"
    ("name", "code", "img", "price", "date", "qt", "description")
VALUES ('Горный велосипед Giant Talon 29 4 (2022)', 74397, '/upload/models/velo/55222/big.jpg', 66990, '2022-05-25', 5,
        'Giant Talon 29 4 (2022) – крепкая и легкая модель, созданная подарить вам наслаждение от покорения скоростей
на различных типах дорог!'),
       ('Горный велосипед Aspect Nickel 29 (2022)', 70748, '/upload/models/velo/53278/big.jpg', 41490, '2022-04-10', 3,
        'Aspect Nickel 29 (2022) – элегантная модель, обладающая накатистыми колесами, удобной рамой и продуманным дизайном. '),
       ('Горный велосипед Merida Big.Nine 60-3x (2022)', 72896, '/upload/models/velo/55561/big.jpg', 72124,
        '2022-06-01', 52,
        'Горный велосипед Merida Big.Nine 60-3x (2022) предназначен для скоростной езды по городу и бездорожью.'),
       ('Женский велосипед Format 7712 27.5 (2022)', 74018, '/upload/models/velo/56549/big.jpg', 63300, '2022-03-05',
        23,
        'Format 7712 27.5 (2022) относится к спортивным моделям для фитнеса и спорта.'),
       ('Горный велосипед Format 1415 29 (2021)', 66065, '/upload/models/velo/51213/big.jpg', 42500, '2021-10-12', 3,
        'Горный велосипед Format 1415 29 (2021) предназначен преимущественно для городских прогулок и ежедневного фитнеса. ');

/*
Вставка отрицательной цены
[23514] ERROR: new row for relation "shop" violates check constraint "shop_price_check"
 */

INSERT INTO "shop"
    ("name", "code", "img", "price", "date", "qt", "description")
VALUES ('Горный велосипед Format 1414 29 (2021)', 66063, '/upload/models/velo/51215/big.jpg', -45990, '2021-05-22', 10,
        'Горный велосипед Format 1414 29 (2021) – лёгкий и надежный компаньон для поездок по пересеченной местности.');

/*
 Количество на складе менее нуля
 [23514] ERROR: new row for relation "shop" violates check constraint "shop_qt_check"
 */

INSERT INTO "shop"
    ("name", "code", "img", "price", "date", "qt", "description")
VALUES ('Горный велосипед Format 1414 29 (2021)', 66063, '/upload/models/velo/51215/big.jpg', 45990, '2021-05-22', -10,
        'Горный велосипед Format 1414 29 (2021) – лёгкий и надежный компаньон для поездок по пересеченной местности.');

/*
 Пустой артикул
[23502] ERROR: null value in column "code" of relation "shop" violates not-null constraint
 */

INSERT INTO "shop"
    ("name", "code", "img", "price", "date", "qt", "description")
VALUES ('Горный велосипед Format 1414 29 (2021)', NULL, '/upload/models/velo/51215/big.jpg', 45990, '2021-05-22', 10,
        'Горный велосипед Format 1414 29 (2021) – лёгкий и надежный компаньон для поездок по пересеченной местности.');