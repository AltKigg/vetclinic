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

$show = $con->query("SELECT * FROM medicines");
$lastid = $show->num_rows;
//Prepare statement
$add = $con->prepare("INSERT INTO medicines (idmedicines, Code, Name ) VALUES($lastid+1, ?, ?);");
if (isset($_POST['add'])){
    $add->bind_param("ss", $_POST['Code'], $_POST['Name']);
    $add->execute();
}
if (isset($_POST['delete']))
{
    $delete = $con->prepare("DELETE FROM medicines WHERE Code = '{$_POST['Code']}';");
    $delete->execute();
}
header("location: medicines.phtml");

$con->close();
?>
