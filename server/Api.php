<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Database connection
$conn = new mysqli('localhost', 'root', '', 'Kiosk');
if ($conn->connect_error) {
	echo "$conn->connect_error";
	die("Connection Failed : " . $conn->connect_error);
} else {
	$filter = $_GET['filter'];
	$sql = "SELECT * FROM Products WHERE Cat_ID = $filter;";
	$result = $conn->query($sql);

	$data = array();

	if ($result->num_rows > 0) {
		
		while ($row = $result->fetch_assoc()) {
			array_push($data, $row);
		}
		echo json_encode($data);

	}
	$conn->close();
}