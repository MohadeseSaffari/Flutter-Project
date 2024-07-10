<?php
include '../connection.php';

$sql = "SELECT * FROM classes";
$result = $conn->query($sql);

$classes = array();
while($row = $result->fetch_assoc()) {
    $classes[] = $row;
}

echo json_encode($classes);
$conn->close();
