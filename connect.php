<?php
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