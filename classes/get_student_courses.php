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

$student_id = $_GET['student_id'];

$sql = "SELECT courses.id, students_table.user_name AS student_name, courses.title AS course_title, teachers.name AS teacher_name, course_times.start_time
        FROM student_courses
        JOIN students_table ON student_courses.student_id = students_table.user_id
        JOIN courses ON student_courses.course_id = courses.id
        JOIN teachers ON courses.teacher_id = teachers.id
        JOIN course_times ON courses.id = course_times.course_id
        WHERE students_table.user_id = ?";

$stmt = $conn->prepare($sql);

if (!$stmt) {
    die("Prepare failed: (" . $conn->errno . ") " . $conn->error);
}

if (!$stmt->bind_param("i", $student_id)) {
    die("Binding parameters failed: (" . $stmt->errno . ") " . $stmt->error);
}

if (!$stmt->execute()) {
    die("Execute failed: (" . $stmt->errno . ") " . $stmt->error);
}

$result = $stmt->get_result();

$courses = array();

while ($row = $result->fetch_assoc()) {
    $courses[] = $row;
}

echo json_encode($courses);

$stmt->close();
$conn->close();
?>
