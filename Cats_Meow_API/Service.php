<?php
// Defines content type as JSON
header('Content-Type: application/json');

// Define action for php request
$action = isset($_GET['action']) ? $_GET['action'] : '';

// Action for order status request
if ($action == "getbystatus") {
    $status = isset($_GET['status']) ? $_GET['status'] : '';
    $from_date = isset($_GET['from_date']) ? $_GET['from_date'] : '';
    $to_date = isset($_GET['to_date']) ? $_GET['to_date'] : '';
    if ($status == '' or $from_date == '' or $to_date == '') { // Makes sure all perameters have an entry
        die("Query Failed");
    }
}

// Action for Customer name
if ($action == "getbyname") {
    $first_name = isset($_GET['first_name']) ? $_GET['first_name'] : '';
    $last_name = isset($_GET['last_name']) ? $_GET['last_name'] : '';
    if ($first_name == '' && $last_name == '') { // Makes sure at least one name is requested
        die("Query Failed");
    }
}

// Connect to the cats meow pet store database
$db_servername = "localhost";
$db_username = "phpApp";
$db_password = "pwd123";
$db_name = "cats_meow_pet_store";

$db_conn = new mysqli($db_servername, $db_username, $db_password, $db_name);
if ($db_conn->connect_error) {
    // If connection fails
    die("Connection failed: " . $db_conn->connect_error);
}

// Order Status:
// Makes query request through the Order_Status_and_Date view
if ($action == "getbystatus") {
    $sql = "SELECT * FROM Order_Status_and_Date WHERE Status = \"" . $status . "\" AND Date BETWEEN \"" . $from_date . "\" AND \"" . $to_date . "\";";

    // Return result
    $db_result = $db_conn->query($sql);
}

// Customer Name:
// Makes query request through the Customer_Names view
if ($action == "getbyname") {
    if ($first_name == '') {
        // Case where last name is requested
        $sql = "SELECT * FROM Customer_Names WHERE LastName = \"" . $last_name . "\";";

        // Return result
        $db_result = $db_conn->query($sql);
    } else {
        if ($last_name == '') {
            // Case where first name is requested
            $sql = "SELECT * FROM Customer_Names WHERE FirstName = \"" . $first_name . "\";";

            // Return result
            $db_result = $db_conn->query($sql);
        } else {
            // Case where both first and last name are requested
            $sql = "SELECT * FROM Customer_Names WHERE LastName = \"" . $last_name . "\" AND FirstName = \"" . $first_name . "\";";

            // Return result
            $db_result = $db_conn->query($sql);
        }
    }
}

// Creates JSON of values requested
$arr = array();
while($row = $db_result->fetch_assoc()){	$arr[] = $row;}
$db_result->free();

// Prints JSON data to screen
echo '{"data":'.json_encode($arr) . '}';

// Close connection
$db_conn->close();
?>
