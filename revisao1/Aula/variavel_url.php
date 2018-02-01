<?php
/**
 * Created by PhpStorm.
 * User: ferna
 * Date: 09/01/2018
 * Time: 12:06
 */


$txt = isset($_GET["texto"]) ? $_GET["texto"] : "A CHAVE NÃO EXISTE!";

echo $txt;