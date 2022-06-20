CREATE TABLE `shop`
(
        `id` SERIAL,
        `name` VARCHAR(100) NOT NULL ,
        `code` VARCHAR(50) NOT NULL ,
        `img` VARCHAR(150),
        `price` DECIMAL(6,2) UNSIGNED,
        `date` DATE,
        `qt` BIGINT UNSIGNED

);

