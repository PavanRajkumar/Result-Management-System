
/*
**************************************
STORE THE VARIABLES
var pass = "<?php echo $pass ?>";
var fail = "<?php echo $fail ?>";
**************************************

*/


<!DOCTYPE html>
<html lang="en-US">
<body>

<h1>Result Analysis</h1>

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
  ['PASS', 8],
  ['FAIL', 10],
//********************************************************

]);

  // Optional; add a title and set the width and height of the chart
  var options = {'title':'Pass/Fail percentage', 'width':550, 'height':400};

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
  chart.draw(data, options);
}
</script>

</body>
</html>


