<?php

    include('connection.php');
    
    $id = $_REQUEST["id"];
    
    $sql = "delete from Members where id='$id' ";
    
    $r = mysqli_query($con,$sql);
    
    if($r)
    {
        echo "0";
    }
    else
    {
        echo "delete";
    }
?>