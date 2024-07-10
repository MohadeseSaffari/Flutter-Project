<?php
include "../connection.php";

$user_id = $_GET['user_id'];

$sql = "SELECT user_id, user_name, user_email FROM students_table WHERE user_id = '$user_id'";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo json_encode($row);
  }
} else {
  echo json_encode(array());
}
$conn->close();
?>
