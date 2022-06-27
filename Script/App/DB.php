<?php

namespace App;


class DB
{
    protected \PDO $dbh;

    public function __construct($base)
    {
        $config = include __DIR__ . '/../Data/config.php';
        $this->dbh = new \PDO($config['db'][$base]['dsn'], $config['db'][$base]['user'], $config['db'][$base]['password']);
    }


    public function execute(string $sql, array $data = []): bool
    {
        $sth = $this->dbh->prepare($sql);
        return $sth ->execute($data);

    }

}