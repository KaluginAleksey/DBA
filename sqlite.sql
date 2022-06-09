CREATE TABLE `books`
(
    `id` INTEGER PRIMARY KEY AUTOINCREMENT,
    `title` TEXT,
    `year` INTEGER,
    `author` TEXT,
    `price` REAL
);

CREATE TABLE `publishers`
(
    `id` INTEGER PRIMARY KEY AUTOINCREMENT,
    `name` TEXT,
    `web` TEXT,
    `address` TEXT,
    `phone` TEXT
);


INSERT INTO `books`
(`title`, `year`, `author`, `price`)
VALUES ('Обитаемый остров', 1969, 'Аркадий и Борис Стругацкие', 184),
       ('Автостопом по галактике', 1979, 'Адамс Дуглас', 941),
       ('Я, робот', 1950, 'Айзек Азимов', 490),
       ('Марсианские хроники', 1950, 'Рэй Бредбери', 106),
       ('11/22/63', 2011, 'Стивен Кинг', 434),
       ('Крещение огнём', 1996, 'Анджей Сапковский', 483),
       ('Битва королей', 1998, 'Джордж Мартин', 607),
       ('Час Презрения', 1995, 'Анджей Сапковский', 1032),
       ('Трудно быть богом', 1963, 'Аркадий и Борис Стругацкие', 284),
       ('Понедельник начинается в субботу', 1965, 'Аркадий и Борис Стругацкие', 261);

INSERT INTO `publishers`
(`name`, `web`, `address`, `phone`)
VALUES ('АСТ', 'www.ast.ru', '129085, г. Москва, Звездный бул., д. 21', 4952321625),
       ('Мещерякова', 'www.idmkniga.ru', '107078, г. Москва, Новая Басманная ул., д. 23, стр. 2, оф. 213', 84952653208),
       ('Махаон', 'www.machaon.net', '119991, г. Москва, 5-й Донской проезд, д. 15, стр. 4', 84959337601),
       ('Дрофа', 'www.drofa.ru', '127018, г. Москва, Сущевский вал ул., д. 49', 84957950550),
       ('Эксмо-Пресс', 'www.eksmo.ru', '127299, г. Москва, Клары Цеткин ул., д. 18/5', 84954116886);


-- Все книги определенного автора
SELECT *
FROM `books`
WHERE `author` = 'Аркадий и Борис Стругацкие';

-- Все книги ценой не более 500 рублей
SELECT *
FROM `books`
WHERE `price` < 500;

-- Заглавия книг (и год издания) определенного автора, отсортированные по году их издания
SELECT `title`, `year`
FROM `books`
WHERE `author` = 'Анджей Сапковский'
ORDER BY `year`;

-- Имена авторов книг, вышедших в 1990-е годы
SELECT DISTINCT `author`
FROM `books`
WHERE `year` BETWEEN 1990 AND 1999;