<?php
header('Content-Type: application/json');

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "myapp";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die(json_encode(['error' => 'Connection failed: ' . $conn->connect_error]));
}

$data = json_decode(file_get_contents('php://input'), true);
$note_id = $data['id'];
$title = $data['title'];
$content = $data['content'];
$modified_time = $data['modified_time'];

$sql = "UPDATE notes SET title = ?, content = ?, modified_time = ? WHERE id = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sssi", $title, $content, $modified_time, $note_id);

if ($stmt->execute()) {
    echo json_encode([
        'id' => $note_id,
        'title' => $title,
        'content' => $content,
        'modified_time' => $modified_time,
    ]);
} else {
    echo json_encode(['error' => 'Failed to update note']);
}

$stmt->close();
$conn->close();
?>