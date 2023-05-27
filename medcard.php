<?php
session_start();
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

$show = $con->query("SELECT * FROM medcard");
$lastid = $show->num_rows;
//Prepare statement

if (isset($_POST['add']))
{
    $stmt = $con->query("SELECT idOwner FROM owners WHERE Name = '{$_POST['oname']}';");
    $all = $stmt->fetch_all(MYSQLI_ASSOC);
    foreach($all as $row)
    {$oid = $row["idOwner"];}
    $tid = 1;

    if ($oid){
    $add = $con->prepare("INSERT INTO medcard (idmedcard, petname, gender, breed, Commentary, birthday, diagnosis, symptoms, owners_idOwner, treatment_idtreatment) VALUES ($lastid+1, ?, ?, ?, ?, ?, ?, ?, $oid, $tid);");
    $add->bind_param("sssssss", $_POST['pname'], $_POST['sex'], $_POST['breed'], $_POST['comm'], $_POST['birthday'], $_POST['diagnosis'], $_POST['symptoms']);
    $add->execute();
    }
}

if (isset($_POST['delete']))
{
    $delete = $con->prepare("DELETE FROM medcard WHERE idmedcard = '{$_POST['id']}';");
    $delete->execute();
}



if (isset($_POST['diagnosiss'])){

    $edit= $con->prepare("UPDATE medcard SET diagnosis = ? WHERE (owners_idOwner = '{$_SESSION['oid']}') AND (idmedcard='{$_POST['pid']}');");
    $edit->bind_param("s", $_POST['diagnosis']);
    $edit->execute();
}

if (isset($_POST['symptomss'])){

    $edit= $con->prepare("UPDATE medcard SET symptoms = ? WHERE (owners_idOwner = '{$_SESSION['oid']}') AND (idmedcard='{$_POST['pid']}');");
    $edit->bind_param("s", $_POST['symptoms']);
    $edit->execute();
}

if (isset($_POST['commss'])){

    $edit= $con->prepare("UPDATE medcard SET Commentary = ? WHERE (owners_idOwner = '{$_SESSION['oid']}') AND (idmedcard='{$_POST['pid']}');");
    $edit->bind_param("s", $_POST['comms']);
    $edit->execute();
}

header("location: medcard.phtml");

$con->close();
?>
