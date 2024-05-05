<?php
require('connect.php');

header('Content-Type: application/json; charset=UTF-8');

$username = $_GET['username'];
$password = $_GET['password'];
$email= $_GET['email'];
$query_birth_time = time();


$response = array();
if(empty($username))
{
    $response['status'] = false;
    $response['message'] = "Username is required";
}
else if(empty($email)){
    $response['status'] = false;
    $response['message'] = "Email is required";
}
else if(empty($password))
{
    $response['status'] = false;
    $response['message'] = "Pass is required";
}
else{
	
$alreadyExistVal = mysqli_query($conn, "SELECT * FROM users WHERE users.username='$username'");
	if(mysqli_num_rows($alreadyExistVal) == 0)
	{
	    
        // SQL query to select a random map_no
        $sql = "SELECT map_no FROM `map` ORDER BY RAND() LIMIT 1";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            // Fetch the random map_no from the result
            $row = $result->fetch_assoc();
            $randomMapNo = $row["map_no"];

            // echo "Randomly selected map_no: $randomMapNo";
        } else {
            $randomMapNo = 1;
        }

        $randomid = (rand(4, 7));
        $randomid1 = (rand(4, 7));
        $randomid2 = (rand(4, 7));
	
	$insertQry = "INSERT INTO `users`(`username`, `password`,`email`,`created_at`,`gold`,`exp`,`exp_n`,`level`,`attack`,`defence`,`luck`,`hp`,`c_hp`,`user_location`) VALUES ('$username','$password','$email','$query_birth_time','100','10','20','1','$randomid','$randomid1','$randomid2','15','15', '$randomMapNo')";
	
	$qry = mysqli_query($conn, $insertQry);
	
	if($qry)
	{
		$userId = mysqli_insert_id($conn);
		$response['status'] = true;
		$response['message'] = "Register sucessfully";
		$response['username'] = $username;
		    // Get the ID of the newly registered user
            $newUserID = mysqli_insert_id($conn);

            // Insert a row for the new user in the diaryinventory table
            $insert_diaryinventory = "INSERT INTO `diaryinventory` (userID, diary_1, diary_2, diary_3, diary_4, diary_5, diary_6, diary_7, diary_8, diary_9, diary_10) VALUES ('$newUserID', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0')";
            $diaryinventory_result = mysqli_query($conn, $insert_diaryinventory);

            // Insert a row for the new user in the inventory table
            $insert_inventory = "INSERT INTO `inventory` (UserID, Item1, Item2, Item3, Item4, Item5, Item6, Item7, Item8, Item9, Item10) VALUES ('$newUserID', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)";
            $inventory_result = mysqli_query($conn, $insert_inventory);

            // Insert a row for the new user in the equipment_inventory table
            $insert_equipment_inventory = "INSERT INTO `equipment_inventory` (`userID`, `Head`, `Body`, `Foot`, `weapon`) VALUES ('$newUserID', NULL, NULL, NULL, NULL)";
            $equipment_inventory_result = mysqli_query($conn, $insert_equipment_inventory);
            
            // Insert a row for the new user in the skill_inventory table
           $insert_skill_inventory = "INSERT INTO `skill_inventory` (`userID`, `Skill1ID`, `Skill1Level`, `Skill2ID`, `Skill2Level`, `Skill3ID`, `Skill3Level`, `Skill4ID`, `Skill4Level`, `Skill5ID`, `Skill5Level`, `Skill6ID`, `Skill6Level`) VALUES ('$newUserID', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)";
           $skill_inventory_result = mysqli_query($conn, $insert_skill_inventory);
	}
	else{
		$response['status'] = false;
		$response['message'] = "Register failed";	
	}
	}
	else{
		$response['status'] = false;
		$response['message'] = "Username exist. Please login";	
		
	}	
	
}

echo json_encode($response);

?>