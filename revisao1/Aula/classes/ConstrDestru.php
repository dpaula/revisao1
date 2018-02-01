<?php
/**
 * Created by PhpStorm.
 * User: ferna
 * Date: 11/01/2018
 * Time: 09:10
 */

class ConstrDestru{

    public function __construct(){
        echo "Função construtora envocada! \n";
    }
    public function __destruct(){
        echo "Função destrutoda envocada!";
    }
}

$c = new ConstrDestru;
unset($c);