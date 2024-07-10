<?php
$serverHost = "localhost";
$user = "root";
$password = "";
$database = "myapp";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$title = $_POST['title'];
$content = $_POST['content'];
$student_id = $_POST['student_id'];

$sql = "INSERT INTO notes (title, content) VALUES (?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $title, $content);
$stmt->execute();
$note_id = $stmt->insert_id;

$sql = "INSERT INTO student_notes (student_id, note_id) VALUES (?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ii", $student_id, $note_id);
$stmt->execute();

$stmt->close();
$conn->close();

echo json_encode(array('success' => true, 'id' => $note_id));
?>
