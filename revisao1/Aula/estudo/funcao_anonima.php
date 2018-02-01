<?php
/**
 * Created by PhpStorm.
 * User: ferna
 * Date: 10/01/2018
 * Time: 15:05
 */

$func = function($nome="Zé"){
    echo "O nome é = $nome";
};

//$func("Fernando");
//$func();

function teste($f){
    $f("Carla");
}

teste($func);
echo "\n\n\n";
/////

$num = 100;
$num2 = 10;

$fu = function() use(&$num, $num2){

    $num = 555;
};

echo $num ."\n";

$fu();

echo $num ."\n";
///////////
///
echo "\n\n\n";

function processaLista($lista, $fuck){
    foreach($lista as &$item){
        $item = $fuck($item);
    }
    return $lista;
}

print_r(processaLista(
    range(10,15),
    function($item){
        return $item * 100;
    }
));
echo "\n\n\n";

$quadrado = function($item){
    return $item * $item;
};

$cubo = function($item) use ($quadrado){
    return $quadrado($item) * $item;
};

$soma = function($item){
    return $item + $item;
};


print_r(processaLista(range(1,5), $quadrado));
echo "\n\n";
print_r(processaLista(range(1, 5), $cubo));
echo "\n\n";
print_r(processaLista(range(1, 5), $soma));

//////////////////FUNÇÃO array_map
///

echo "\n\n\n";

$lista = range(1,5);

$f = function($x){
    return $x * $x;
};

$lista_p = array_map($f, $lista);

print_r($lista_p);

echo "\n\n\n";

/////FUNÇÃO array_filter
///

$filtro = function($x){
    return $x % 2 == 0;
};

print_r(array_filter($lista, $filtro));