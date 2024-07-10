<?php
include "../connection.php";

// Get the raw POST data
$rawData = file_get_contents("php://input");
$data = json_decode($rawData, true);

// Check if the necessary keys are set in the decoded data
if (isset($data['username']) && isset($data['password'])) {
    $userName = $data['username'];
    $userPassword = md5($data['password']);

    // Prepare and execute the SQL query
    $sqlQuery = "INSERT INTO students_table (user_name, user_password) VALUES ('$userName', '$userPassword')";
    $resultOfQuery = $connectNow->query($sqlQuery);

    if ($resultOfQuery) {
        echo json_encode(array("success" => true));
    } else {
        echo json_encode(array("success" => false, "error" => $connectNow->error));
    }
} else {
    echo json_encode(array("success" => false, "message" => "Invalid input"));
}
?>
