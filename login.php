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

  /*$SELECT = "SELECT Email, Password FROM doctors WHERE Email = ? AND Password = ?";
//Prepare statement
     $stmt = $con->prepare($SELECT);
     $stmt->bind_param("ss", $email, $pswd);
     $stmt->execute();
     $stmt->bind_result($email, $pswd);
     $stmt->store_result();
     $rnum = $stmt->num_rows;

     //checking username
      if ($rnum==0)
	   {
      $error .= '<p class="error">The password is not valid.</p>';

     } else {
        $show = $con->query("SELECT * FROM doctors WHERE (Email = '$email') AND (Password = '$pswd');");
        $all = $show->fetch_all(MYSQLI_ASSOC);
        foreach($all as $row) $_SESSION["userid"] = $row['iddoctors'];

        header("location: lk.phtml");
     }*/

if($email!="" and $pswd!="")
{
    $sql="SELECT * FROM doctors WHERE Email='$email' and Password='$pswd'";
    $result=$con->query($sql);

    $count=$result->num_rows;

    if($count==1)
    {
        $_SESSION['email'] = $email;
            echo "<h2>". $_SESSION["email"] . "</h2>";
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