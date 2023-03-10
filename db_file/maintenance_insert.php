<?php
    include('connection.php');

    $m_name= $_POST["m_name"];
    $price= $_POST["price"];

    
    if($m_name=="" && $price=="")
    {
        echo '0';
    }
    else
    {
        $sql ="Insert into Maintenance (m_name,price) values('$m_name','$price')";
        $ex=mysqli_query($con,$sql);
    }
    
?>
