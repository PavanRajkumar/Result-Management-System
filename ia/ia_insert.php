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

$sql = "INSERT INTO Internal_Marks(usn,sem,subcode,iat1,iat2,iat3) values(".$_POST["usn"].",".$_POST["sem"].",'".$_POST["subcode"]."',".$_POST["ia1"].",".$_POST["ia2"].",".$_POST["ia3"].")";


				

if ($conn->query($sql) === TRUE) {
    $conn->query("CALL update_final(".$_POST["usn"].",".$_POST["sem"].",'".$_POST["subcode"]."')");
	if ($conn->query("CALL update_final(".$_POST["usn"].",".$_POST["sem"].",'".$_POST["subcode"]."')") === TRUE)
		echo "New record created successfully";
	else
		echo $conn->error;
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}
$conn->close();
?>

