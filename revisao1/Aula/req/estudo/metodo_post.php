<?php
/**
 * Created by PhpStorm.
 * User: ferna
 * Date: 10/01/2018
 * Time: 17:48
 */

//var_dump($_POST);

echo "Nome: ". $_POST["nome"] ?? "";
echo "<br>";
echo "E-mail: ". $_POST["email"] ?? "";
echo "<br>";
