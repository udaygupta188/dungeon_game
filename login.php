<?php
require_once "dbConn.php";
// Set response header and echo JSON response
header('Content-Type: application/json; charset=UTF-8');

// Check if username and password are provided
if (!isset($_GET['username']) || !isset($_GET['password'])) {
    $response['status'] = false;
    $response['message'] = "Username and password are required.";
    echo json_encode($response);
    exit;
}

// Retrieve username and password from the request
$user_name = $_GET['username'];
$user_pass = $_GET['password'];

try {
    // Prepare SQL query using PDO
    $sql = $conn->prepare("SELECT * FROM users WHERE username = :username AND password = :password");
    
    // Bind parameters
    $sql->bindParam(':username', $user_name);
    $sql->bindParam(':password', $user_pass);
    
    // Execute query
    $sql->execute();
    
    // Check if any rows are returned
    if ($sql->rowCount() > 0) {
        // Fetch user data
        $row = $sql->fetch(PDO::FETCH_ASSOC);
        
        // Extract user attributes
        $level = $row['level'];
        $exp = $row['exp'];
        $gold = $row['gold'];
        $attack = $row['attack'];
        $defence = $row['defence'];
        $luck = $row['luck'];
        $hp = $row['hp'];
        $c_hp = $row['c_hp'];
        
        // Prepare response
        $response['status'] = true;
        $response['message'] = "Login success";
        $response['username'] = $user_name;
        $response['level'] = $level;
        $response['exp'] = $exp;
        $response['gold'] = $gold;
        $response['attack'] = $attack;
        $response['defence'] = $defence;
        $response['luck'] = $luck;
        $response['hp'] = $hp;
        $response['c_hp'] = $c_hp;
    } else {
        // User not found
        $response['status'] = false;
        $response['message'] = "User not found";
    }
} catch (PDOException $e) {
    // Database error
    $response['status'] = false;
    $response['message'] = "Database error: " . $e->getMessage();
}


echo json_encode($response);
?>
