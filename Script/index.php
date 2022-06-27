<?php

use App\DB;

require_once __DIR__ . '/App/DB.php';

function randomDate($start, $end) {
    $min = strtotime($start);
    $max = strtotime($end);

    $val = rand($min, $max);

    return date('Y-m-d', $val);
}

$db = new DB();

$i = 0;

while ($i < 1000) {

    $data = [
        ':num' => rand(1000000000, 9999999999),
        ':name' => 'товар' . $i,
        ':price' => rand(1000, 99999),
        ':old_price' => rand(1000, 99999),
        ':img' => '/img/pic' . $i . '.jpg',
        ':date' => randomDate('2014-10-01', '2022-06-27'),
        ':qt' => rand(0, 3000),
    ];

    $db->execute("INSERT INTO shop
    (num, name, price, old_price, img, date, qt)
VALUES (:num, :name, :price, :old_price, :img, :date, :qt)"
    , $data);

    $i++;
}