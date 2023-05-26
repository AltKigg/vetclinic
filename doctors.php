<?php
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

$email  = $_POST['email'];
$pswd = $_POST['pswd'];

//подключение к БД
$host="localhost";
$port=3306;
$socket="";
$user="root";
$password="Fikys598JKL";
$dbname="vetclinic";
$con = new mysqli($host, $user, $password, $dbname, $port, $socket)
    or die ('Could not connect to the database server' . mysqli_connect_error());

$show = $con->query("SELECT * FROM doctors");
$lastid = $show->num_rows;
//Prepare statement
$add = $con->prepare("INSERT INTO doctors (iddoctors, Name, Birthday, TelNum, Email, Address, Specialization, Degree, DateOfHire) VALUES($lastid+1, ?, ?, ?, ?, ?, ?, ?, ?);");
if (isset($_POST['add'])){
    $add->bind_param("ssssssss", $_POST['Name'], $_POST['Birthday'], $_POST['TelNum'], $_POST['Email'], $_POST['Address'], $_POST['Specialization'], $_POST['Degree'], $_POST['DateOfHire'] );
    $add->execute();
}

header("location: doctors.phtml");

$con->close();
?>
