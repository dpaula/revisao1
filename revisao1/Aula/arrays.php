<?php
/**
 * Created by PhpStorm.
 * User: ferna
 * Date: 10/01/2018
 * Time: 09:57
 */

$a = array(1,2,3);

//print_r($a);

$cores = array("Azul", "Amarelo", "verde", "Branco");

$cores2[0] = "Azul";
$cores2[1] = "Amarelo";

$cores3[] = "Azul";
$cores3[] = "Branco";

//definindo um array
$cores4 = ["Azul", "Amarelo", "Branco"];

//adicionando elementos
$cores4[] = "violeta";

//alterando elementos
$cores4[0] = "cinza";

//excluindo elementos
unset($cores4[2]);

//range

$x = range(1,11);
//print_r($x);
$x2 = range(1,11,2);
//print_r($x2);

$c = range("a", "z");
//print_r($c);


////

$lista = ["Segunda", "terça", "quarta", "quinta", "sexta", "sábado", "domingo"];


for($i=0; $i<count($lista); $i++){
    echo $i . " : " . $lista[$i] . "\n";
}

echo "\n\n\n";

foreach($lista as $item){
    echo "$item\n";
}

echo "\n\n\n";

foreach($lista as $chave => $valor){
    echo "$chave : $valor\n";
}

echo "\n\n\n";
$valores = range(0,10);

foreach($valores as $chave => &$valor){
    $valor *=10;
}

print_r($valores);

echo "\n\n\n";

/////////ASSOCIATIVOS
///

$pontos = ["Carla"=>22, "Fer"=>45, "Cassio"=>11];

//print_r($pontos);
echo "Carla: ".$pontos["Carla"]."\n";
echo "Cassio: ".$pontos["Cassio"];

echo "\n\n\n";

/////MULTIDIMENSIONAIS
///

$jogo = array(
    array(1, "Carla", 22),
    array(2, "Fer", 35),
    array(3, "Cassio", 11)
);

print_r($jogo);
echo "\n";
echo $jogo[2][1];

$achou = false;
foreach($jogo as $chave => $valor){
    foreach($valor as $chave2 => $valor2){
        if($achou){
            echo "Pontuação da Carla é: ".$valor2;
        }
        if($valor2 == "Carla"){
            $achou = true;
        }
    }
    if($achou){
        break;
    }
}

echo "\n\n\n"; 
///
$jogo = [
            ["ID"=>1, "NOME"=>"Carla", "PONTOS"=>22],
            ["ID"=>2, "NOME"=>"Fer",   "PONTOS"=>35],
            ["ID"=>3, "NOME"=>"Cassio","PONTOS"=> 11]
        ];

echo $jogo[2]["NOME"];


foreach($jogo as $chave => $valor){
   // foreach($valor as $chave2 => $valor2){
        if(in_array("Carla", $valor)){
            echo $valor["PONTOS"];
        }
  //  }
}

///////
echo "\n\n\n"; 
echo is_array($jogo);

//ordenação
echo "\n\n\n"; 
$list = [2, 5, 1, 10, 4];

sort($list);

print_r($list);

//reverse

$list = array_reverse($list);
print_r($list);