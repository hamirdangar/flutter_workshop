<?php
    
    include('connection.php');
    
    $name=$_REQUEST["name"];
    $pass=$_REQUEST["pass"];
    
    $sql="select * from Members where name='$name' and pass ='$pass'";
    
    
    $ex=mysqli_query($con,$sql);
    
    $no=mysqli_num_rows($ex);
    
    
    if($no>0)
    {
       $fet=mysqli_fetch_object($ex);
       echo json_encode(['code'=>200]);
    }
    else
    {
        echo "0";
    }
?>