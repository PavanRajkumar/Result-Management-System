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
$arr=array("usn","subcode","sem","iat1","iat2","iat3","final_iat");
while($i<8){
	if($_POST[$arr[$i]]!=NULL){
		if($arr[$i]=="subcode")
			$_POST[$arr[$i]]="'".$_POST[$arr[$i]]."'";
		//echo "UPDATE Students SET ".$arr[$i]."=".$_POST[$arr[$i]]." WHERE usn=".$_POST["usnc"]."<br>";	
		$sql = "UPDATE Internal_Marks SET ".$arr[$i]."=".$_POST[$arr[$i]]." WHERE subcode='".$_POST["subcodec"]."' and sem=".$_POST["semc"]." and usn=".$_POST["usnc"];
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
