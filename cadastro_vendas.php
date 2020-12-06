<?php

//o arquivo jsons contem o json a ser inserido
$dirJson = 'dadosvendas.json';
          
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
    $sql = "DELETE FROM estoque WHERE coditem = $obj->coditem and codloja= $obj->cod_loja and descricao =$obj->descricaoprod";
    if (mysqli_query($conn, $sql)) {

          $sql = "INSERT INTO vendas (codvenda, codloja, coditem, codcliente, datavenda, dataentrega, frete, descricaoprod) VALUES (
            $obj->codvenda, $obj->cod_loja,$obj->coditem, $obj->codcliente,'$obj->datavenda','$obj->dataentrega',$obj->frete, $obj->descricaoprod)";
        if (mysqli_query($conn, $sql)) {
              echo "Venda criada com sucesso";
        } else {
              echo "Error: " . $sql . "<br>" . mysqli_error($conn);
        }

    } else {
          echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }

    
    //fim insercao
    mysqli_close($conn); //fechamento da conexao
}

?>