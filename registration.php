<?php
require_once 'dbConn.php';


// Set response header and echo JSON response
header('Content-Type: application/json; charset=UTF-8');

// Retrieve data from the request
$username = $_GET['username'];
$password = $_GET['password'];
$email = $_GET['email'];
$query_birth_time = time();

// Initialize response array
$response = [];

// Check if username and password are provided
if (empty($username)) {
    $response['status'] = false;
    $response['message'] = "Username is required";
} elseif (empty($password)) {
    $response['status'] = false;
    $response['message'] = "Password is required";
} else {
    try {
        // Check if username already exists
        $stmt = $conn->prepare("SELECT * FROM users WHERE username = :username");
        $stmt->bindParam(':username', $username);
        $stmt->execute();
        
        if ($stmt->rowCount() == 0) {
            // Generate random values for user attributes
            $randomid = rand(4, 7);
            $randomid1 = rand(4, 7);
            $randomid2 = rand(4, 7);
            $randomMapNo = 1; // default map_no
            
            // Insert new user into the database
            $stmt = $conn->prepare("INSERT INTO users (username, password, email, created_at, gold, exp, exp_n, level, attack, defence, luck, hp, c_hp, user_location) VALUES (:username, :password, :email, :created_at, '100', '10', '20', '1', :randomid, :randomid1, :randomid2, '15', '15', :randomMapNo)");
            $stmt->bindParam(':username', $username);
            $stmt->bindParam(':password', $password);
            $stmt->bindParam(':email', $email);
            $stmt->bindParam(':created_at', $query_birth_time);
            $stmt->bindParam(':randomid', $randomid);
            $stmt->bindParam(':randomid1', $randomid1);
            $stmt->bindParam(':randomid2', $randomid2);
            $stmt->bindParam(':randomMapNo', $randomMapNo);
            
            if ($stmt->execute()) {
                // Registration successful
                $userId = $conn->lastInsertId();
                $response['status'] = true;
                $response['message'] = "Registration successful";
                $response['userId'] = $userId;
                
                // Insert default entries for the new user in related tables
                $stmt = $conn->prepare("INSERT INTO diaryinventory (userID) VALUES (:userId)");
                $stmt->bindParam(':userId', $userId);
                $stmt->execute();
                
                $stmt = $conn->prepare("INSERT INTO inventory (UserID) VALUES (:userId)");
                $stmt->bindParam(':userId', $userId);
                $stmt->execute();
                
                $stmt = $conn->prepare("INSERT INTO equipment_inventory (userID) VALUES (:userId)");
                $stmt->bindParam(':userId', $userId);
                $stmt->execute();
                
                $stmt = $conn->prepare("INSERT INTO skill_inventory (userID) VALUES (:userId)");
                $stmt->bindParam(':userId', $userId);
                $stmt->execute();
            } else {
                // Registration failed
                $response['status'] = false;
                $response['message'] = "Registration failed";
            }
        } else {
            // Username already exists
            $response['status'] = false;
            $response['message'] = "Username already exists. Please login";
        }
    } catch (PDOException $e) {
        // Database error
        $response['status'] = false;
        $response['message'] = "Database error: " . $e->getMessage();
    }
}


echo json_encode($response);
?>
