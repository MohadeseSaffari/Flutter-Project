<?php
include "../connection.php"; // Include your database connection script

// Retrieve input data from POST request
$user_id = $_POST['user_id'];
$old_password = md5($_POST['old_password']); // Hash the old password
$new_password = md5($_POST['new_password']); // Hash the new password

// Check if the user ID and passwords are provided
if (empty($user_id) || empty($old_password) || empty($new_password)) {
    echo json_encode(array("success" => false, "message" => "Missing required fields."));
    exit();
}

// Check if the user exists and old password is correct
$sqlCheckUser = "SELECT * FROM students_table WHERE user_id = ? AND user_password = ?";
$stmt = $connectNow->prepare($sqlCheckUser);
$stmt->bind_param("ss", $user_id, $old_password);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    // Update the password
    $sqlUpdatePassword = "UPDATE students_table SET user_password = ? WHERE user_id = ?";
    $stmt = $connectNow->prepare($sqlUpdatePassword);
    $stmt->bind_param("ss", $new_password, $user_id);

    if ($stmt->execute()) {
        echo json_encode(array("success" => true, "message" => "Password changed successfully."));
    } else {
        echo json_encode(array("success" => false, "message" => "Failed to update password."));
    }
} else {
    echo json_encode(array("success" => false, "message" => "Old password is incorrect or user does not exist."));
}

// Close the database connection
$stmt->close();
$connectNow->close();
?>
