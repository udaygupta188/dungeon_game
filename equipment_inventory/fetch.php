<?php
require_once "../dbConn.php";

try {
    // Prepare and execute the SQL query
    $sql = $conn->prepare("SELECT 
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
    equipment AS e4 ON e4.id = ei.weapon;
");
    $sql->execute();
    
    // Fetch all rows from the query result
    $result = $sql->fetchAll(PDO::FETCH_ASSOC);
    
    // Set HTTP response status code to 200 (OK)
    http_response_code(200);
    
    // Set response header to specify JSON content type
    header('Content-Type: application/json');
    
    // Output the JSON-encoded result
    echo json_encode($result);
} catch (PDOException $e) {
    // Set HTTP response status code to 500 (Internal Server Error)
    http_response_code(500);
    
    // Output error message
    echo json_encode(array("error" => "Database query failed: " . $e->getMessage()));
}
?>
