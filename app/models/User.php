<?php
class User {
    private $__conn;

    function __construct(){
        global $db_config;
        $this->__conn = Connection::getInstance($db_config);
    }

    public function getCourse () {
        $sql = "SELECT * FROM Course";
        $result = $this->__conn->query($sql);
    
        if ($result) {
            $data = array();
            while ($row = $result->fetch_assoc()) {
                $data[] = $row;
            }
            return $data;
        }
        return false;
    }
    
}
