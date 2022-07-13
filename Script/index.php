<?php

use App\DB;

require_once __DIR__ . '/App/DB.php';

function randomDate($start, $end) {
    $min = strtotime($start);
    $max = strtotime($end);

    $val = rand($min, $max);

    return date('Y-m-d', $val);
}

$dbMysql = new DB('mysql');

$i = 0;

while ($i < 1000) {

    $data = [
        ':num' => rand(1000000000, 9999999999),
        ':name' => 'товар' . $i,
        ':price' => rand(10, 2000),
        ':old_price' => rand(10, 2000),
        ':img' => '/img/pic' . $i . '.jpg',
        ':date' => randomDate('2014-10-01', '2022-06-27'),
        ':qt' => rand(0, 3000),
        ':id_category' => rand(1, 3),
        ':id_brand' => rand(1, 7)
    ];

    $dbMysql->execute("INSERT INTO shop
    (num, name, price, old_price, img, date, qt, id_category, id_brand)
VALUES (:num, :name, :price, :old_price, :img, :date, :qt, :id_category, :id_brand)"
    , $data);

    $i++;
}