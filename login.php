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

if($email!="" and $pswd!="")
{
    $sql="SELECT * FROM doctors WHERE Email='$email' and Password='$pswd'";
    $result=$con->query($sql);

    $count=$result->num_rows;

    if($count==1)
    {
      foreach($result as $row) {
         $_SESSION['id'] = $row["iddoctors"];
         $_SESSION['isAdmin'] = $row["isAdmin"];
      }
        $_SESSION['email'] = $email;
        $_SESSION['pass'] = $pswd;
        header("location:lk.phtml");
    }
    else {
        echo "Ошибка входа";
    }
}else {
    echo "Пожалуйста введите почту и пароль";
}
$con->close();
?>