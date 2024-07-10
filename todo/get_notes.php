<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "myapp";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die(json_encode(['error' => 'Connection failed: ' . $conn->connect_error]));
}

$student_id = $_GET['student_id'];

// Ensure the `student_id` is properly used in a join query
$sql = "
    SELECT 
        notes.id, 
        notes.title, 
        notes.content, 
        notes.modified_time 
    FROM 
        notes
    JOIN 
        student_notes ON notes.id = student_notes.note_id
    WHERE 
        student_notes.student_id = ?
";

$stmt = $conn->prepare($sql);

if (!$stmt) {
    die(json_encode(['error' => 'Prepare failed: (' . $conn->errno . ') ' . $conn->error]));
}

if (!$stmt->bind_param("i", $student_id)) {
    die(json_encode(['error' => 'Binding parameters failed: (' . $stmt->errno . ') ' . $stmt->error]));
}

if (!$stmt->execute()) {
    die(json_encode(['error' => 'Execute failed: (' . $stmt->errno . ') ' . $stmt->error]));
}

$result = $stmt->get_result();

$todos = array();

while ($row = $result->fetch_assoc()) {
    $todos[] = $row;
}

echo json_encode($todos);

$stmt->close();
$conn->close();
?>
