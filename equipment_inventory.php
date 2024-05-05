<?php
require('connect.php');

// Check if username and password are provided
if(isset($_GET['username']) && isset($_GET['password'])) {
    $username = $_GET['username'];
    $password = $_GET['password'];

    try {
        // SQL query to select equipment information for the specified user
        $sql = "SELECT 
                    ei.userId,
                    u.username,
                    e1.name AS head_name,
                    e2.name AS body_name,
                    e3.name AS foot_name,
                    e4.name AS weapon_name
                FROM 
                    equipment_inventory AS ei
                INNER JOIN 
                    users AS u ON u.id = ei.userID
                LEFT JOIN 
                    equipment AS e1 ON e1.id = ei.Head
                LEFT JOIN 
                    equipment AS e2 ON e2.id = ei.Body
                LEFT JOIN 
                    equipment AS e3 ON e3.id = ei.Foot
                LEFT JOIN 
                    equipment AS e4 ON e4.id = ei.weapon
                WHERE 
                    u.username = '$username' AND u.password = '$password'";

        $result = mysqli_query($conn, $sql);

        if (mysqli_num_rows($result) > 0) {
            // Fetch all rows from the query result
            $data = array();
            while($row = mysqli_fetch_assoc($result)) {
                $data[] = $row;
            }
            
            // Set HTTP response status code to 200 (OK)
            http_response_code(200);
            
            // Set response header to specify JSON content type
            header('Content-Type: application/json');
            
            // Output the JSON-encoded result
            echo json_encode($data);
        } else {
            // Set HTTP response status code to 404 (Not Found)
            http_response_code(404);
            echo json_encode(array("error" => "No records found for the specified username and password"));
        }
    } catch (Exception $e) {
        // Set HTTP response status code to 500 (Internal Server Error)
        http_response_code(500);
        
        // Output error message
        echo json_encode(array("error" => "Database query failed: " . $e->getMessage()));
    }
} else {
    // Username and password not provided
    http_response_code(400);
    echo json_encode(array("error" => "Username and password are required"));
}

// Close connection
mysqli_close($conn);
?>
