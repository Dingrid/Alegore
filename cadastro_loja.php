<?php

//o arquivo jsons contem o json a ser inserido
$dirJson = 'dadosloja.json';
          
        //checka se o arquivo existe       
        if(!file_exists($dirJson)){
            echo "Arquivo não existe, crie o arquivo, ou verifique o endereço!";
            break;                      
        }
          
//abre o arquivo   
$json_str = file_get_contents($dirJson);             
              
cadastrar($json_str);
function cadastrar($json_str){
    //recebe o json
    
    
    //decodifica o json
    $obj = json_decode($json_str);
    
    //conexao
    $servername = "localhost";
    $database = "hack";
    $username = "root";
    $password = "";
    
    $conn = mysqli_connect($servername, $username, $password, $database);

    if (!$conn) {
          die("Connection failed: " . mysqli_connect_error());
    }
     
    echo "Connected successfully";
     
    //fim da conexao
    //insercao
    $sql = "INSERT INTO loja (codloja, razao, nome, natureza, porte, mei, endereco) VALUES (
        $obj->cod_loja, '$obj->razao','$obj->nome','$obj->natureza','$obj->porte',$obj->mei, '$obj->endereco')";
    if (mysqli_query($conn, $sql)) {
          echo "New record created successfully";
    } else {
          echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
    //fim insercao
    mysqli_close($conn); //fechamento da conexao
}

?>