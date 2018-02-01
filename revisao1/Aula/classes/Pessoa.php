<?php
/**
 * Created by PhpStorm.
 * User: ferna
 * Date: 10/01/2018
 * Time: 18:40
 */

class Pessoa
{
    public $nome = "Fernando";
    public $idade = 33;

    var $teste;

    function __construct(){
        var_dump($this);
    }

    public function set_idade($idade)
    {
        if ($idade > 0) {
        $this->idade = $idade;
        }else{
            echo "idade inválida";
        }
    }

    public function get_idade(){
        return $this->idade;
    }

    /**
     *
     */
    public function detalhesPessoa(){
        echo "Nome: ". $this -> nome.", Idade: ".$this -> idade." anos";
    }


}

$objetoA = new Pessoa();
var_dump($objetoA);

$objetoB = new Pessoa();
var_dump($objetoB);

//remove objeto da memória
unset($objetoA);

echo "\n\n\n";

$objetoB -> nome = "Carla";

echo $objetoB -> nome;

echo "\n\n\n";

echo $objetoB -> detalhesPessoa();

echo "\n\n\n";

$p = new Pessoa();

$p -> set_idade(15);

echo "A idade do {$p ->nome} é {$p->get_idade()}";

echo "\n\n\n";

new Pessoa();