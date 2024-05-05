<?php
require_once "../dbConn.php";

try {
    // Prepare and execute the SQL query
    $sql = $conn->prepare("SELECT 
        d.userID,
        u.username,
        d1.text AS diary_1_name,
        d2.text AS diary_2_name,
        d3.text AS diary_3_name,
        d4.text AS diary_4_name,
        d5.text AS diary_5_name,
        d6.text AS diary_6_name,
        d7.text AS diary_7_name,
        d8.text AS diary_8_name,
        d9.text AS diary_9_name,
        d10.text AS diary_10_name
    FROM 
        diaryinventory AS d
    INNER JOIN 
        users AS u ON u.id = d.userID
    LEFT JOIN 
        diary AS d1 ON d1.id = d.diary_1
    LEFT JOIN 
        diary AS d2 ON d2.id = d.diary_2
    LEFT JOIN 
        diary AS d3 ON d3.id = d.diary_3
    LEFT JOIN 
        diary AS d4 ON d4.id = d.diary_4
    LEFT JOIN 
        diary AS d5 ON d5.id = d.diary_5
    LEFT JOIN 
        diary AS d6 ON d6.id = d.diary_6
    LEFT JOIN 
        diary AS d7 ON d7.id = d.diary_7
    LEFT JOIN 
        diary AS d8 ON d8.id = d.diary_8
    LEFT JOIN 
        diary AS d9 ON d9.id = d.diary_9
    LEFT JOIN 
        diary AS d10 ON d10.id = d.diary_10;
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
