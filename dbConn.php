
<?php
$host = "localhost";
$username = "root";
$password = "";
$dbname = "api_fiverr";

try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // echo "Success!";
} catch(PDOException $e) {
    echo "Database couldn't be connected: " . $e->getMessage();
}
?>
̀