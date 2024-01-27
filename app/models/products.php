<?php
class Products {
    private $conn;

    public function __construct() {
        global $db_config;
        $this->conn = Connection::getInstance($db_config);
    }

}