<!DOCTYPE html>
<html lang="pt-br>">

<head>

    <meta charset="UTF-8">
    <title>Ambiente para Estudo PHP</title>
</head>

<body>

<?php

if(isset($_POST["num"])){
    echo $_POST["num"];

    if($_POST["num"] % 2 == 0){
        echo "\n É PAR..";
    }else{
        echo "\n NÃO É PAR..";
    }
}



?>


<form method="POST">
    <input type="text" name="num"/>
    <input type="submit"/>


</form>

</body>

</html>