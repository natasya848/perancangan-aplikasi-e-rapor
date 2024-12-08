<?php
class ModelJadwal {
    private $conn;

    public function __construct($db) {
        $this->conn = $db;
    }

    public function getJadwalByBlokAndRombel($id_blok, $id_rombel) {
        $query = "SELECT * FROM jadwal WHERE id_blok = ? AND id_rombel = ?";
        $stmt = $this->conn->prepare($query);
        $stmt->bind_param("ii", $id_blok, $id_rombel);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }
}
?>
