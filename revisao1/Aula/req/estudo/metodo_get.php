<?php
/**
 * Created by PhpStorm.
 * User: ferna
 * Date: 10/01/2018
 * Time: 17:49
 */

if(count($_GET)){

    echo "Nome: ". $_GET["nome"] ?? "";
    echo "<br>";
    echo "E-mail: ".$_GET["email"] ?? "";

}