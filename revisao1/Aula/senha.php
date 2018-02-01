<!DOCTYPE html>
<html lang="pt-br>">

<head>

    <meta charset="UTF-8">
    <title>Ambiente para Estudo PHP</title>
</head>

<body>

<?php

$login = "fernando";
$senha = "123";

if(isset($_POST["login"])&&$_POST["senha"]){

    if($_POST["login"] == $login && $_POST["senha"] == $senha){
        echo "LOGIN EFETUADO COM SUCESSO!!";
    }else{
        echo "LOGIN errado";
    }


}



?>


<form method="post">

    Login:<input type="text" name="login"><br>
    Senha:<input type="password" name="senha">
    <input type="submit">

</form>

</body>

</html>