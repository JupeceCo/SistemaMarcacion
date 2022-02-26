<?php

    require_once '../database/database.php';

    class TestDAO {

        public function __construct(){
            $this->db = new ConexionBD();
        }

        public function all($table) {
            try {
                $query = "SELECT * FROM ${table}";
                $this->db->query($query);
                $this->db->execute();
                return $this->db->resultSet();
            } catch (Exception $e) {
                throw $e;
            }
        }
    }