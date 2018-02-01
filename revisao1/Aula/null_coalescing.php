<?php
/**
 * Created by PhpStorm.
 * User: ferna
 * Date: 10/01/2018
 * Time: 13:07
 */

$ddd = $_GET['ddd'] ?? "00";
$telefone = $_GET['telefone'] ?? $_GET['celular'] ?? "0000-0000";

echo "Tel: ($ddd) $telefone";