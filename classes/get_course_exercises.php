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
    die("Connection failed: " . $conn->connect_error);
}

$course_id = $_GET['course_id'];

// Prepare the SQL query
$sql = "SELECT exercises.id, exercises.title, exercises.description, exercises.deadline
        FROM exercises
        INNER JOIN course_exercises ON exercises.id = course_exercises.exercise_id
        WHERE course_exercises.course_id = ?";

// Prepare the statement
$stmt = $conn->prepare($sql);

if (!$stmt) {
    die("Prepare failed: (" . $conn->errno . ") " . $conn->error);
}

// Bind the parameters
if (!$stmt->bind_param("i", $course_id)) {
    die("Binding parameters failed: (" . $stmt->errno . ") " . $stmt->error);
}

// Execute the statement
if (!$stmt->execute()) {
    die("Execute failed: (" . $stmt->errno . ") " . $stmt->error);
}

// Get the result
$result = $stmt->get_result();

$exercises = array();

// Fetch the results into an array
while ($row = $result->fetch_assoc()) {
    $exercises[] = $row;
}

// Output the results as JSON
echo json_encode($exercises);

// Close the statement and connection
$stmt->close();
$conn->close();
?>
