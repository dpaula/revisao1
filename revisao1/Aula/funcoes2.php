<?php
/**
 * Created by PhpStorm.
 * User: ferna
 * Date: 10/01/2018
 * Time: 12:30
 */

//declara que deve ser respeitada a tipagem dos parametros
declare(strict_types=1);

function area(int $x, int $y){

    return $x * $y;
}

echo area(10, 50);

echo "\n\n\n";
////

function cubo(float $num) : float
{
    return $num * $num * $num;
}

echo cubo(12.2);

echo "\n\n\n";

function testeArray() : array
{
    return [22, "Fernando", 22.33];
}

var_dump(testeArray());
