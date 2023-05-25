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

  $SELECT = "SELECT Email, Password From doctors Where Email = ? AND Password = ?";

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
        $_SESSION["userid"] = $row['id'];
        $_SESSION["user"] = $row;

        // Redirect the user to welcome page
        header("location: lk.html");
     }
$stmt->close();
$con->close();
?>
