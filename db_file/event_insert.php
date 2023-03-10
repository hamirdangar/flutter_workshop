<?php
    include('connection.php');

    $e_title= $_POST["e_title"];
    $e_date= $_POST["e_date"];
    $e_detail= $_POST["e_detail"];

    
    if($e_title=="" && $e_date=="" && $e_detail=="")
    {
        echo '0';
    }
    else
    {
        $sql ="Insert into Events (e_title,e_date,e_detail) values('$e_title','$e_date','$e_detail')";
        $ex=mysqli_query($con,$sql);
    }
    
?>
