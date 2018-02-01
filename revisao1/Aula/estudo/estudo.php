<?php
/**
 * Created by PhpStorm.
 * User: ferna
 * Date: 10/01/2018
 * Time: 14:53
 */

//importa um arquivo caso ele exista, não da erro se não achar
include("code.php");
//define que só será importado o arquivo, caso o mesmo ainda não foi importado
include_onde("code.php");

//importa um arquivo, mas o mesmo é requerido para a execução do programa, se não encontrar da erro
require("code.php");
//define que só será importado o arquivo, caso o mesmo ainda não foi importado
require_once("code.php");

echo "testando..";