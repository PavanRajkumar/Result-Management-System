<!DOCTYPE html><head><meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

*  {
	-moz-box-sizing: border-box;
	-o-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}
#myInput {
  background-image: url('/css/searchicon.png');
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}
body {
	color: #333;
	font-size: 1em;
}
a:link,
a:visited,
a:hover,
a:active {
	color: #000;
	text-decoration: none;
}
.container {
  margin: 50px auto;
  padding: 0 50px;
  max-width: 960px;
}
table { 
	background: #FFF;
	border-collapse: collapse;
	width: 100%;  
}
td,
th { 
	padding: 4px; 
	border: 1px solid #CCC;
	overflow: hidden;
	text-align: left;
	vertical-align: middle;
}
th { 
	background-color: #DDD; 
	font-weight: 400;
}
th a,
td a { 
	display: block;
	width: 100%;
}
th a.sort-by { 
	padding-right: 18px;
	position: relative;
}
a.sort-by:before,
a.sort-by:after {
	border: 4px solid transparent;
	content: "";
	display: block;
	height: 0;
	right: 5px;
	top: 50%;
	position: absolute;
	width: 0;
}
a.sort-by:before {
	border-bottom-color: #666;
	margin-top: -9px;
}
a.sort-by:after {
	border-top-color: #666;
	margin-top: 1px;
}

</style>

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

echo '<head><body><input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search subject name.." title="Type in a subject name"></head><table id="mytable"><tr class="header">';
$sql = "CALL disp_subs()";
$result = $conn->query($sql);
if ($result->num_rows > 0) {
    // output data of each row
   // $fieldinfo=mysqli_fetch_fields($result);
	$val=array();
	$i=0;
    while($fieldinfo=mysqli_fetch_field($result)){	
           	$val[]=$fieldinfo->name;
		echo "<th style=\"width:20%;\" onclick=\"sortTable($i)\"><a href=\"#\" class=\"sort-by\">".$fieldinfo->name.'</th>' ;
		$i=$i+1; 
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
else
     echo "no data";
?>
<script>
function myFunction() {
  // Declare variables
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("mytable");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who dont match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}
function sortTable(n) {
  var table, rows, switching, i, x, y, shouldSwitch, dir, switchcount = 0;
  table = document.getElementById("mytable");
  switching = true;
  // Set the sorting direction to ascending:
  dir = "asc";
  /* Make a loop that will continue until
  no switching has been done: */
  while (switching) {
    // Start by saying: no switching is done:
    switching = false;
    rows = table.rows;
    /* Loop through all table rows (except the
    first, which contains table headers): */
    for (i = 1; i < (rows.length - 1); i++) {
      // Start by saying there should be no switching:
      shouldSwitch = false;
      /* Get the two elements you want to compare,
      one from current row and one from the next: */
      x = rows[i].getElementsByTagName("TD")[n];
      y = rows[i + 1].getElementsByTagName("TD")[n];
      /* Check if the two rows should switch place,
      based on the direction, asc or desc: */
      if (dir == "asc") {
        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
          // If so, mark as a switch and break the loop:
          shouldSwitch = true;
          break;
        }
      } else if (dir == "desc") {
        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
          // If so, mark as a switch and break the loop:
          shouldSwitch = true;
          break;
        }
      }
    }
    if (shouldSwitch) {
      /* If a switch has been marked, make the switch
      and mark that a switch has been done: */
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
      // Each time a switch is done, increase this count by 1:
      switchcount ++;
    } else {
      /* If no switching has been done AND the direction is "asc",
      set the direction to "desc" and run the while loop again. */
      if (switchcount == 0 && dir == "asc") {
        dir = "desc";
        switching = true;
      }
    }
  }
}
</script></body></html>
<?php
$conn->close();
?>

