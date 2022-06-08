# DBA
## 1. Первое знакомство с СУБД.
1. Создайте в **MySQL**, **Postgres** и **SQLite** одинаковые базы данных:
   1. Изучите понятие типа `SERIAL` в разных базах данных. Подсказка - в **SQLite** такого типа нет, но есть модификатор типа `AUTOINCREMENT`.
   2. Таблица *books*, содержащая, как минимум, информацию о заглавии книги, годе выхода, авторе и цене. И конечно же, серийный номер записи в таблице (см. выше п. 1.1). Дополнительные поля - по желанию. 
   3. Таблица *publishers*, содержащая информацию об издательствах. Поля - на ваш вкус, за исключением серийного номера.
2. Наполните таблицы произвольными данными.
3. Создайте запросы, выбирающие:
   1. Все книги определенного автора
   2. Все книги ценой не более 500 рублей
   3. Заглавия книг (и год издания) определенного автора, отсортированные по году их издания
   4. Имена авторов книг, вышедших в 1990-е годы


1. **MySQL**
SERIAL is an alias for BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE.
2. **Postgres**
   The data types smallserial, serial and bigserial are not true types, but merely a notational convenience for creating unique identifier columns (similar to the AUTO_INCREMENT property supported by some other databases). 