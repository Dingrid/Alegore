<html>
  <head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Alegore</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
      <a class="nav-item nav-link active" href="\produtos_ven.php">Produtos mais vendidos <span class="sr-only"></span></a>
      <a class="nav-item nav-link" href="#">Estoque por item</a>
      <a class="nav-item nav-link" href="compras_loja.php">Compras em lojas</a>
    </div>
  </div>
</nav>

    

    <?php  
    //conexão bd
    $servername = "localhost";
    $database = "hack";
    $username = "root";
    $password = "";
    
    $conn = mysqli_connect($servername, $username, $password, $database);

    if (!$conn) {
          die("Connection failed: " . mysqli_connect_error());
    }
   
    ?>


    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Item', 'Quantidade'],

        <?php
            $c=1;
            $pb="SELECT * FROM item";
            $busca= mysqli_query($conn, $pb) or die(mysql_error());
            $qtdi = mysqli_num_rows($busca);
            
            while($c <= $qtdi ){
                $nome="SELECT descricao FROM item WHERE coditem = $c";
                $busca= mysqli_query($conn, $nome) or die(mysql_error());
                $linha = mysqli_fetch_assoc($busca);
    
                $esto="SELECT * FROM estoque WHERE coditem = $c";
                $buscae= mysqli_query($conn, $esto) or die(mysql_error()); 
        ?>

         ['<?php echo $linha['descricao']; ?>' , <?php echo mysqli_num_rows($buscae); ?> ], 
        
          <?php $c++; } 
          ?>
        ]);

        var options = {
          title: 'Itens em estoque'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>



  </head>
  <body>
    <div id="piechart" style="width: 900px; height: 500px;"></div>
  </body>
</html>
