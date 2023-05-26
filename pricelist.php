<?php
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

$email  = $_POST['email'];
$pswd = $_POST['pswd'];

//подключение к БД
$host="localhost";
$port=3360;
$socket="";
$user="root";
$password="";
$dbname="vetclinic";
$con = new mysqli($host, $user, $password, $dbname, $port, $socket)
    or die ('Could not connect to the database server' . mysqli_connect_error());

$show = $con->query("SELECT * FROM services");
$lastid = $show->num_rows;
//Prepare statement
$add = $con->prepare("INSERT INTO services (idservices, Name, Description, Cost ) VALUES($lastid+1, ?, ?, ?);");

if (isset($_POST['add'])){
    $add->bind_param("sss", $_POST['Name'], $_POST['Description'], $_POST['Cost']);
    $add->execute();
}

header("location: pricelist.phtml");

$con->close();
?>
