<?php
    include('connection.php');

    $uname= $_POST["name"];
    $pass= $_POST["pass"];
    $email= $_POST["email"];
    $number= $_POST["number"];
    $members= $_POST["members"];
    
    if($uname=="" && $pass=="" &&$email=="" && $number=="" && $members=="")
    {
        echo '0';
    }
    else
    {
        $sql ="Insert into Members (name,pass,email,number,members) values('$uname','$pass','$email','$number','$members')";
        $ex=mysqli_query($con,$sql);
    }
    
?>
