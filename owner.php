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

$show = $con->query("SELECT * FROM owners");
$lastid = $show->num_rows;
//Prepare statement
$add = $con->prepare("INSERT INTO owners (idOwner, Name, Birthday, TelNum, Email, Address) VALUES($lastid+1, ?, ?, ?, ?, ?);");
if (isset($_POST['add'])){
    $add->bind_param("sssss", $_POST['Name'], $_POST['Birthday'], $_POST['TelNum'], $_POST['Email'], $_POST['Address'] );
    $add->execute();
}
if (isset($_POST['delete']))
{
    $delete = $con->prepare("DELETE FROM owners WHERE Name = '{$_POST['Name']}';");
    $delete->execute();
}
header("location: medcard.phtml");

$con->close();
?>
