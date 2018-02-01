<?php
/**
 * Created by PhpStorm.
 * User: ferna
 * Date: 10/01/2018
 * Time: 14:45
 */

foreach(range(0,9) as $v){

    //rand pega um numero aleatório no range informado
    $x = rand(0,9);
    $rel = $v <=> $x;

    //<=> retorna -1 se for menor
    //retorna 0 se for igula
    //retorna 1 se for maior
    echo "v=$v <=> x=$x é $rel \n";

}