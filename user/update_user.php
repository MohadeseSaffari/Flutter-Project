<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "myapp";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

$user_id = $_POST['user_id'];
$user_name = $_POST['user_name'];
// $user_email = $_POST['user_email'];

$sql = "UPDATE students_table SET user_name = '$user_name' WHERE user_id = '$user_id'";

if ($conn->query($sql) === TRUE) {
  echo "Record updated successfully";
} else {
  echo "Error updating record: " . $conn->error;
}

$conn->close();
?>
