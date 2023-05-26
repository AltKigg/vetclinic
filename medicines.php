<?php
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

//подключение к БД
$host="localhost";
$port=3360;
$socket="";
$user="root";
$password="";
$dbname="vetclinic";
$con = new mysqli($host, $user, $password, $dbname, $port, $socket)
    or die ('Could not connect to the database server' . mysqli_connect_error());

$result = $this->con->query("SELECT * FROM medicines");

$resultArray = array();

// fetch product data one by one
while ($item = mysqli_fetch_array($result, MYSQLI_ASSOC)){
    $resultArray[] = $item;
}

if (isset($item_id)){
    $result = $this->con->query("SELECT * FROM medicines WHERE item_id={$item_id}");
    $resultArray = array();
    // fetch product data one by one
    while ($item = mysqli_fetch_array($result, MYSQLI_ASSOC)){
        $resultArray[] = $item;
    }
}
?>