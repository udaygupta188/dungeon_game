<?php
require "connect.php";

$user_name = $_GET['username'];
$user_pass = $_GET['password'];
$mysql_qry = "select * from users where username = '$user_name' and password = '$user_pass';";
$result = mysqli_query($conn ,$mysql_qry);
if(mysqli_num_rows($result) > 0) {
    
        // User authenticated
    $row = mysqli_fetch_assoc($result);
    $level = $row['level'];
    $exp = $row['exp'];
    $gold = $row['gold'];
    $attack = $row['attack'];
    $defence = $row['defence'];
    $luck = $row['luck'];
    $hp = $row['hp'];
    $c_hp = $row['c_hp'];
	    // Get response
	$response['status']=true;
	$response['message']="Login success";
	$response['username'] = "$user_name";
	$response['level'] = $level;
	$response['exp'] = $exp;
	$response['gold'] = $gold;
	$response['attack'] = $attack;
	$response['defence'] = $defence;
	$response['luck'] = $luck;
	$response['hp'] = $hp;
	$response['c_hp'] = $c_hp;
}
else {
	$response['status']=false;
	$response['message']="User not found";
}

header('Content-Type: application/json; charset=UTF-8');
echo json_encode($response);
?>
