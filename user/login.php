<?php
include "../connection.php";

$userName = $_POST['user_name'];
$userPassword = md5($_POST['user_password']);

$sqlQuery = "SELECT * FROM students_table WHERE user_name = '$userName' AND user_password = '$userPassword'";

$resultOfQuery = $connectNow->query($sqlQuery);

if ($resultOfQuery->num_rows > 0) { 
    $userRecord = array();
    while ($rowFound = $resultOfQuery->fetch_assoc()) {
        $userRecord[] = $rowFound;
    }
    echo json_encode(array("success"=>true,"userdata"=>$userRecord[0])); 
}
else
{
    echo json_encode(array("success"=>false));
}
