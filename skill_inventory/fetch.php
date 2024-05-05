<?php
require_once "../dbConn.php";

try {
    // Prepare and execute the SQL query
    $sql = $conn->prepare("SELECT 
    u.username,
    s1.name AS skill1_name, si.Skill1Level AS skill1_level,
    s2.name AS skill2_name, si.Skill2Level AS skill2_level,
    s3.name AS skill3_name, si.Skill3Level AS skill3_level,
    s4.name AS skill4_name, si.Skill4Level AS skill4_level,
    s5.name AS skill5_name, si.Skill5Level AS skill5_level,
    s6.name AS skill6_name, si.Skill6Level AS skill6_level
FROM 
    skill_inventory AS si
INNER JOIN 
    users AS u ON u.id = si.userID
LEFT JOIN 
    skills AS s1 ON s1.id = si.Skill1ID
LEFT JOIN 
    skills AS s2 ON s2.id = si.Skill2ID
LEFT JOIN 
    skills AS s3 ON s3.id = si.Skill3ID
LEFT JOIN 
    skills AS s4 ON s4.id = si.Skill4ID
LEFT JOIN 
    skills AS s5 ON s5.id = si.Skill5ID
LEFT JOIN 
    skills AS s6 ON s6.id = si.Skill6ID;
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
