
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

echo '<html><head><h1>Result Analysis</h1></head><body>';


$sql = "SELECT COUNT(*) as fail from External_Marks where result='F' and subcode='".$_POST["subcode"]."'";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
   $row=$result->fetch_assoc();
  $fail=$row["fail"];
	echo "Number of students failed:$fail<br>";
}

echo "<p> </p>";

$sql = "SELECT COUNT(*) as pass from External_Marks where result='P' and subcode='".$_POST["subcode"]."'";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
   $row=$result->fetch_assoc();
  $pass=$row["pass"];
	echo "Number of students passed:$pass<br>";
}

$conn->close();
?>

<div id="piechart"></div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

//******************************************************
// Draw the chart and set the chart variable values HERE instead of 8 and 10 !!
function drawChart() {
  var data = google.visualization.arrayToDataTable([
  ['Pass/Fail', 'Number_of_students'],
  ['PASS', parseInt('<?php echo $pass; ?>')],
  ['FAIL', parseInt('<?php echo $fail; ?>')],
//********************************************************

]);
  // Optional; add a title and set the width and height of the chart
  var options = {'title':'Pass/Fail percentage', 'width':550, 'height':400};

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
  chart.draw(data, options);
}
</script>
</body></html>
