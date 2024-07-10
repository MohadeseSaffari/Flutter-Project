<?php
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

// Read the input
$input = file_get_contents("php://input");
$data = json_decode($input, true);

if (isset($data['username'])) {
    $usernameToCheck = $data['username'];

    // Prepare and execute the query
    $stmt = $conn->prepare("SELECT COUNT(*) as count FROM students_table WHERE user_name = ?");
    $stmt->bind_param("s", $usernameToCheck);
    $stmt->execute();
    $stmt->bind_result($count);
    $stmt->fetch();
    $stmt->close();

    // Check if the username is taken
    $isTaken = $count > 0;

    // Respond with JSON
    header('Content-Type: application/json');
    echo json_encode(array('taken' => $isTaken));
} else {
    // Respond with an error if 'username' is not provided
    header('Content-Type: application/json');
    echo json_encode(array('error' => 'Username parameter is missing'));
}

// Close the connection
$conn->close();
?>
