<?php
require_once "../dbConn.php";

try {
    // Prepare and execute the SQL query
    $sql = $conn->prepare("SELECT * FROM inventory");
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
