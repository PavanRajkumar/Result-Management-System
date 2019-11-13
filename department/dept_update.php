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
$i=0;
$arr=array("name","hod","dno");
while($i<4){
	if($_POST[$arr[$i]]!=NULL){
		if($arr[$i]=="name"||$arr[$i]=="hod")
			$_POST[$arr[$i]]="'".$_POST[$arr[$i]]."'";
		//echo "UPDATE Departments SET ".$arr[$i]."=".$_POST[$arr[$i]]." WHERE dno='".$_POST["dnoc"]."'"."<br>";	
		$sql = "UPDATE Departments SET ".$arr[$i]."=".$_POST[$arr[$i]]." WHERE dno='".$_POST["dnoc"]."'";
		if ($conn->query($sql) === FALSE) {
    			echo $conn->error."<br>";
			break;
		}
		else
			echo $arr[$i]." is updated successfully.<br>";
	}
	$i=$i+1;
}	


$conn->close();
?>
