<?php
header('Content-Type: application/json');
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

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
$title = $data['title'];
$content = $data['content'];
$modified_time = $data['modified_time'];
$student_id = $data['student_id'];  // Ensure this is passed in the request

// Start transaction
$conn->begin_transaction();

try {
    // Insert the new note
    $sql = "INSERT INTO notes (title, content, modified_time) VALUES (?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sss", $title, $content, $modified_time);

    if (!$stmt->execute()) {
        throw new Exception("Failed to create note");
    }

    $note_id = $stmt->insert_id;
    $stmt->close();

    // Link the note to the student
    $sql = "INSERT INTO student_notes (student_id, note_id) VALUES (?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ii", $student_id, $note_id);

    if (!$stmt->execute()) {
        throw new Exception("Failed to link note to student");
    }

    $stmt->close();

    // Commit transaction
    $conn->commit();

    // Return the newly created note
    echo json_encode([
        'id' => $note_id,
        'title' => $title,
        'content' => $content,
        'modified_time' => $modified_time,
    ]);

} catch (Exception $e) {
    // Rollback transaction
    $conn->rollback();

    echo json_encode(['error' => $e->getMessage()]);
}

$conn->close();
?>
