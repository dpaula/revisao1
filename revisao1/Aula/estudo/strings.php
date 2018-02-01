<?php
/**
 * Created by PhpStorm.
 * User: ferna
 * Date: 10/01/2018
 * Time: 15:54
 */

$str = "abc";

echo $str[2];
echo "\n";
echo $str{0};

echo "\n\n";

for($i=0; $i<strlen($str); $i++){
    echo $str[$i];
}

echo "\n\n\n";
//Variável variável utiliza o valor da variável como nome para uma nova variável
$teste = "va";
$$teste = "joao";

echo $va;
echo "\n\n\n";
//////// HEREDOC
/// utilizado para textos grandes..
///

$x = 50;

$heredoc =
    <<<TESTE
    
    <div>O valor da variável x é: $x</div>

TESTE;

echo $heredoc;

echo "\n\n\n";
//////// NOWDOC
/// utilizado para textos que não identificam palavras reservadas
///

$nowdoc = <<<'EOT'


    class NowDoc{
        function construction(){}
    }

EOT;

echo $nowdoc;

echo "\n\n\n";



#FUNÇÕES PARA MANIPULAR STRINGS

#Função - substr(<str>, <indice>, <len>) - retorna um pedaço da string
# aaabbbccc substr(str, 3, 3)

$str = "aaabbbccc";
$sub = substr($str, 3, 3);
echo $sub;
echo "\n\n";
#Sem usar o parametro <len>
$sub = substr($str, 3);
echo $sub;
echo "\n\n";

#Função - strtoupper(<str>) - converte para maiusculas

$str = "fernando";
echo strtoupper($str);
echo "\n\n";

#Função - strtolower(<str>) - converte para minuscula

$str = "FERNANDO";
echo strtolower($str);
echo "\n\n";

#Função - str_replace(<caracteres a ser substituidos>, <novos>, <str>) - substitui parte da string

$str = "aaabbbccc";
echo str_replace('bbb', 'xxx', $str);
echo "\n\n";
