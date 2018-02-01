<!DOCTYPE html>
<html lang="pt-br>">

<head>

    <meta charset="UTF-8">
    <title>Ambiente para Estudo PHP</title>
</head>

<body>

<?php

    if(isset($_POST["valor1"])){
        echo $_POST["valor1"];
    }



?>


<form method="POST">
    <input type="text" name="valor1"/>
    <input type="submit"/>


</form>

</body>

</html>