<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// $firstName = $_POST['firstName'];
// $lastName = $_POST['lastName'];
// $gender = $_POST['gender'];
// $email = $_POST['email'];
// $password = $_POST['password'];
// $number = $_POST['number'];



// Database connection
$conn = new mysqli('localhost', 'root', '', 'Kiosk');
if ($conn->connect_error) {
	echo "$conn->connect_error";
	die("Connection Failed : " . $conn->connect_error);
} else {
	echo "Connected";
	echo "<br>";
	$sql = "SELECT * FROM Product_Buckets
 UNION
 SELECT * FROM Product_Burgers
 UNION
 SELECT * FROM Product_Drinken";
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
		// output data of each row
		while ($row = $result->fetch_assoc()) {
			echo $row["ID"] . " " . $row["Name"] . " " . $row["Cat_ID"] . " " . $row["Image"] . " " . $row["Price"] . " " . $row["Product_ID"] . " " . $row["Info"] . " " . "<br>";
		}
	} else {
		echo "0 results";
	}
	$conn->close();
	// $stmt = $conn->prepare("insert into registration(firstName, lastName, gender, email, password, number) values(?, ?, ?, ?, ?, ?)");
	// $stmt->bind_param("sssssi", $firstName, $lastName, $gender, $email, $password, $number);
	// $execval = $stmt->execute();
	// echo $execval;
	// echo "Registration successfully...";
	// $stmt->close();
	// $conn->close();
}
