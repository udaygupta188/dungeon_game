
<?php
// $host="localhost";
// $username="u314280334_test";
// $password="Vanags11!";
// $dbname="u314280334_test";


$host="localhost";
$username="root";
$password="";
$dbname="api_fiverr";

$conn=mysqli_connect("$host","$username","$password","$dbname");

if($conn) { 
	echo "Success!";
}
else {
	echo "Databaes couldn't be connected!";
}

?>