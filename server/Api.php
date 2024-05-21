<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

function getCategories($conn)
{
	$sql = "SELECT * FROM categories";
	$result = $conn->query($sql);

	$data = array();

	if ($result->num_rows > 0) {

		while ($row = $result->fetch_assoc()) {
			array_push($data, $row);
		}
		print json_encode($data);
	}
	$conn->close();
}

function getMealImages($conn)
{
	$product_id = $_GET['product_id'];

	if (!is_numeric($product_id)) {
		print("Invalid product id");
		die();
	}

	$sql = "SELECT Image, Name, MealPrice, Price, MealImage, MealID FROM Products where ID = $product_id;";
	$result = $conn->query($sql);

	$data = array();

	if ($result->num_rows > 0) {

		while ($row = $result->fetch_assoc()) {
			array_push($data, $row);
		}
		print json_encode($data);
	}
	$conn->close();
}

function getProducts($conn)
{
	$categorie = $_GET['categorie'];

	if (!is_numeric($categorie)) {
		print("Invalid categorie id");
		die();
	}
	$sql = "SELECT * FROM Products where Cat_ID = $categorie;";
	$result = $conn->query($sql);

	$data = array();

	if ($result->num_rows > 0) {

		while ($row = $result->fetch_assoc()) {
			array_push($data, $row);
		}
		print json_encode($data);
	}
	$conn->close();
}

// Database connection
$conn = new mysqli('localhost', 'root', '', 'Kiosk');
if ($conn->connect_error) {
	echo "$conn->connect_error";
	die("Connection Failed : " . $conn->connect_error);
} else {

	if (!isset($_GET['action'])) {
		print("No action provided");
		die();
	}
	$action = $_GET['action'];

	$allowedActions = array('getCategories', 'getProducts', 'getMealImages');

	if (!in_array($action, $allowedActions)) {
		print("Invalid action");
		die();
	} else {
		$action($conn);
	}
}
