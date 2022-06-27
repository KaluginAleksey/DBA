<?php

namespace App;


class DB
{
    protected \PDO $dbh;

    public function __construct()
    {
        $config = include __DIR__ . '/../Data/config.php';
        $this->dbh = new \PDO($config['db']['dsn'], $config['db']['user'], $config['db']['password']);
    }


    public function execute(string $sql, array $data = []): bool
    {
        $sth = $this->dbh->prepare($sql);
        return $sth ->execute($data);

    }

}