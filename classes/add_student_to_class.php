<?php
include '../connection.php';

$student_id = $_POST['student_id'];
$class_id = $_POST['class_id'];

$sql = "INSERT INTO student_classes (student_id, class_id) VALUES ('$student_id', '$class_id')";

if ($conn->query($sql) === TRUE) {
    echo "Student added to class successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();