<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>example-aggregate-functions-and-grouping-count-function- php MySQL examples | w3resource</title>
<meta name="description" content="example-aggregate-functions-and-grouping-count-function- php MySQL examples | w3resource">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
</head>
<body>
<div class="container">
<div class="row">
<div class="col-md-12">
<h2>Counting how many authors are there in the authors table:</h2>
<table class='table table-bordered'>
<tr>
<th>Number of authors</th>
</tr>
<?php
$hostname="localhost";
$username="pavan";
$password="password";
$db = "DBMS_PROJECT";
$dbh = new PDO("MySQL:host=$hostname;dbname=$db", $username, $password);
foreach($dbh->query('SELECT COUNT(*) FROM External_Marks where result="P"') as $row) {
echo "<tr>";
echo "<td>" . $row['COUNT(*)'] . "</td>";
echo "</tr>";
}
?>
</table>
</div>
</div>
</div>
</body>
</html>
