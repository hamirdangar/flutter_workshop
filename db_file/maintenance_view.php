<?php

    include('connection.php');
    
    $sql ="select * from Maintenance";
    
    $r= mysqli_query($con,$sql); // QUERY RUNNER  
    $response=array(); // ARRAY CREATE
    
    while($row = mysqli_fetch_array($r))
    {
        $value["id"]=$row["id"]; 
        $value["m_name"]=$row["m_name"];
        $value["price"]=$row["price"];
      
        array_push($response,$value);
    }
    
    echo json_encode($response);
    mysqli_close($con);

?>