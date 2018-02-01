<?php
/**
 * Created by PhpStorm.
 * User: ferna
 * Date: 10/01/2018
 * Time: 11:30
 */

function falaGalera(){
    echo "Fala galerinha!!";
}

falaGalera();
echo "\n\n\n";

function soma($num1, $num2){
    echo ($num1 + $num2);
}

soma(5,10);
echo "\n\n\n";

function login($user="root", $key="123"){
    echo "user = ".$user ."\n";
    echo "key = ".$key;
}

login("fernando");

echo "\n\n\n";

/// lista de parametros
///

function soma2(){
    $total = func_get_arg(0)+func_get_arg(1);
    echo $total;
}
soma2(10,2);

echo "\n\n\n";

function somaTudo(){
    $lista = func_get_args();
    $qtd = func_num_args();
    $total = 0;

    for($i=0; $i<$qtd; $i++){
        $total += $lista[$i];
    }

    echo "O resultado da soma é = ".$total;
}

somaTudo(2,2,2);

echo "\n\n\n";

function media(...$valores){
    return array_sum($valores)/count($valores);
}

echo media(5,10,5,10);

echo "\n\n\n";

//ACESSO A VARIÁVEIS GLOBAIS

$a = 10;
$b = "fernando";

function variavelGlobal1(){
    global $a;

    echo $a."\n";
}
function variavelGlobal2(){


    echo $GLOBALS["b"];
}

variavelGlobal1();
variavelGlobal2();

echo "\n\n\n";

//variáveis por referência

$a = [1,2,3];
$b = &$a;

$a[0] = 5;

print_r($a);
print_r($b);

echo "\n\n\n";

$li = range(1,5);

function ref(&$lis){
    $lis[2] = 555;
    print_r($lis);
}

ref($li);
print_r($li);
