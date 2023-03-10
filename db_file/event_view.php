<?php

    include('connection.php');
    
    $sql ="select * from Events";
    
    $r= mysqli_query($con,$sql); // QUERY RUNNER  
    $response=array(); // ARRAY CREATE
    
    while($row = mysqli_fetch_array($r))
    {
        $value["id"]=$row["id"]; 
        $value["e_title"]=$row["e_title"];
        $value["e_date"]=$row["e_date"];
        $value["e_detail"]=$row["e_detail"];
      
        array_push($response,$value);
    }
    
    echo json_encode($response);
    mysqli_close($con);

?>