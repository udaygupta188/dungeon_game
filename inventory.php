<?php
require('connect.php');

// Check if username and password are provided
if(isset($_GET['username']) && isset($_GET['password'])) {
    $username = $_GET['username'];
    $password = $_GET['password'];

    try {
        // SQL query to select inventory information for the specified user
        $sql = "SELECT 
                    u.username,
                    i1.ItemName AS item1_name,
                    i2.ItemName AS item2_name,
                    i3.ItemName AS item3_name,
                    i4.ItemName AS item4_name,
                    i5.ItemName AS item5_name,
                    i6.ItemName AS item6_name,
                    i7.ItemName AS item7_name,
                    i8.ItemName AS item8_name,
                    i9.ItemName AS item9_name,
                    i10.ItemName AS item10_name
                FROM 
                    inventory AS i
                INNER JOIN 
                    users AS u ON u.id = i.UserID
                LEFT JOIN 
                    items AS i1 ON i1.ItemID = i.Item1
                LEFT JOIN 
                    items AS i2 ON i2.ItemID = i.Item2
                LEFT JOIN 
                    items AS i3 ON i3.ItemID = i.Item3
                LEFT JOIN 
                    items AS i4 ON i4.ItemID = i.Item4
                LEFT JOIN 
                    items AS i5 ON i5.ItemID = i.Item5
                LEFT JOIN 
                    items AS i6 ON i6.ItemID = i.Item6
                LEFT JOIN 
                    items AS i7 ON i7.ItemID = i.Item7
                LEFT JOIN 
                    items AS i8 ON i8.ItemID = i.Item8
                LEFT JOIN 
                    items AS i9 ON i9.ItemID = i.Item9
                LEFT JOIN 
                    items AS i10 ON i10.ItemID = i.Item10
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
