<?php
include "../connection.php";

$userName = $_POST['user_name'];
// $userEmail = $_POST['student_email'];
$userPassword = md5($_POST['user_password']);

$sqlQuery = "INSERT INTO students_table SET user_name = '$userName', 
-- student_email = '$userEmail',
user_password = '$userPassword'";

$resultOfQuery = $connectNow->query($sqlQuery);

if ($resultOfQuery) {
    echo json_encode(array("success"=>true));
}
else
{
    echo json_encode(array("success"=>false));
}
