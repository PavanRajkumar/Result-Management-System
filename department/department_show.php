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

echo '<html><head><style>table, th, td {border: 1px solid black;}</style></head><body>';

echo '<br><br>Departments Table:<br><table><tr>';
$sql = "CALL disp_dept()";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    // output data of each row
   // $fieldinfo=mysqli_fetch_fields($result);
        $val=array();
    while($fieldinfo=mysqli_fetch_field($result)){      
                $val[]=$fieldinfo->name;
                echo '<th>'.$fieldinfo->name.'</th>' ; 
        }
    echo '</tr>';
        while($row = $result->fetch_assoc()) {
                echo '<tr> ';
                foreach ($val as $valu){
                        echo '<td>'.$row[$valu].'</td>';
                }
                echo '</tr>';
    }
  echo '</table>';
}

echo '</body></html>';
$conn->close();
?>

