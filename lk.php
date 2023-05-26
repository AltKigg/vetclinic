<?php
session_start();
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

$show = $con->query("SELECT * FROM doctors");
$lastid = $show->num_rows;

if (isset($_POST['tel'])){
    $edit= $con->prepare("UPDATE doctors SET TelNum = ? WHERE doctors.iddoctors = '{$_SESSION['id']}';");
    $edit->bind_param("s", $_POST['TelNum']);
    $edit->execute();
}

if (isset($_POST['email'])){
    $edit= $con->prepare("UPDATE doctors SET Email = ? WHERE doctors.iddoctors = '{$_SESSION['id']}';");
    $edit->bind_param("s", $_POST['Email']);
    $edit->execute();
}

if (isset($_POST['address'])){
    $edit= $con->prepare("UPDATE doctors SET Address = ? WHERE doctors.iddoctors = '{$_SESSION['id']}';");
    $edit->bind_param("s", $_POST['Address']);
    $edit->execute();
}


if (isset($_POST['pass']))
{
    if(($_POST['new1']==$_POST['new2'])&&($_POST['old']==$_SESSION['pass']))
    {
        $_SESSION['pass'] = $_POST['new1'] ;
        $edit= $con->prepare("UPDATE doctors SET Password = ? WHERE doctors.iddoctors = '{$_SESSION['id']}';");
        $edit->bind_param("s", $_POST['new1']);
        $edit->execute();
    }
}
header("location: lk.phtml");

$con->close();
?>
