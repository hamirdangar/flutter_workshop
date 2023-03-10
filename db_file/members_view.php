<?php

    include('connection.php');
    
    $sql ="select * from Members";
    
    $r= mysqli_query($con,$sql); // QUERY RUNNER  
    $response=array(); // ARRAY CREATE
    
    while($row = mysqli_fetch_array($r))
    {
        $value["id"]=$row["id"]; 
        $value["name"]=$row["name"];
        $value["pass"]=$row["pass"];
        $value["email"]=$row["email"];
        $value["number"]=$row["number"];
        $value["members"]=$row["members"];
        
        array_push($response,$value);
    }
    
    echo json_encode($response);
    mysqli_close($con);

?>