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
$arr=array("usn","subcode","sem","iat1","iat2","iat3");
$temp=$_POST["subcode"];
while($i<7){
	if($_POST[$arr[$i]]!=NULL){
		if($arr[$i]=="subcode")
			$_POST[$arr[$i]]="'".$_POST[$arr[$i]]."'";
		//echo "UPDATE Students SET ".$arr[$i]."=".$_POST[$arr[$i]]." WHERE usn=".$_POST["usnc"]."<br>";	
		$sql = "UPDATE Internal_Marks SET ".$arr[$i]."=".$_POST[$arr[$i]]." WHERE subcode='".$_POST["subcodec"]."' and sem=".$_POST["semc"]." and usn=".$_POST["usnc"];
		if($arr[$i]=="subcode"||$arr[$i]=="usn"||$arr[$i]=="sem"){
			$_POST["subcodec"]=$temp;
			$_POST["semc"]=$_POST["sem"];
			$_POST["usnc"]=$_POST["usn"];
		}
		if ($conn->query($sql) === FALSE) {
    			echo $conn->error."<br>";
			break;
		}
		else
			echo $arr[$i]." is updated successfully.<br>";
	}
	$conn->query("CALL update_final(".$_POST["usn"].",".$_POST["sem"].",'".$_POST["subcode"]."')");
	$i=$i+1;
}	


$conn->close();
?>
