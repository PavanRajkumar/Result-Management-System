<?php
$servername = "localhost";
$username = "pavan";
$password = "password";
$dbname = "DBMS_PROJECT";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$sql = "DELETE from External_Marks WHERE usn=".$_POST["usn"]." and sem=".$_POST["sem"]." and subcode='".$_POST["subcode"]."'";
if ($conn->query($sql) === FALSE) 
	echo $conn->error."<br>";
else
	echo "sucessfully deleted record";
$conn->close();
?>
