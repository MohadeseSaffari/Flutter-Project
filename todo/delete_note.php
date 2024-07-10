<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: DELETE");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

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

$data = json_decode(file_get_contents("php://input"));

if (isset($data->id)) {
    $id = $data->id;
    $query = "DELETE FROM notes WHERE id = ?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $id);

    if ($stmt->execute()) {
        http_response_code(200);
        echo json_encode(["message" => "Note deleted successfully."]);
    } else {
        http_response_code(500);
        echo json_encode(["message" => "Unable to delete note."]);
    }

    $stmt->close();
} else {
    http_response_code(400);
    echo json_encode(["message" => "Incomplete data."]);
}

$conn->close();
?>
