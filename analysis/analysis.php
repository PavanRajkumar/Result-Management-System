
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

echo '<html><body>';


$sql = "SELECT COUNT(*) as fail from External_Marks where result='F' and subcode="."$_POST["subcode"]";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
   $row=$result->fetch_assoc();
  echo $row["fail"];
}

echo "<p> </p>";

$sql = "SELECT COUNT(*) as pass from External_Marks where result='P'";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
   $row=$result->fetch_assoc();
  echo $row["pass"];
}


echo '</body></html>';
$conn->close();
?>
