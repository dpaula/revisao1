<?php
/**
 * Created by PhpStorm.
 * User: ferna
 * Date: 11/01/2018
 * Time: 08:59
 */

class Documentos{

    public $rg;
    public $cpf;

    public function __construct($rg=0, $cpf=0){
        if(!is_numeric($rg) || !is_numeric($cpf)){
            return;
        }
        $this -> rg = $rg;
        $this -> cpf = $cpf;
    }
}

$d = new Documentos(555, "e4444");
var_dump($d);