<?php
/**
 * Created by PhpStorm.
 * User: ferna
 * Date: 11/01/2018
 * Time: 10:08
 */
class Pessoa2{
    private $nome;
    private $sobreNome;

    public function getNome(){
        return $this->nome;
    }
    public function setNome(string $nome){
        $this->nome=$nome;
    }
    public function getSobreNome(){
        return $this->sobreNome;
    }
    public function setSobreNome(string $sobreNome){
        $this->sobreNome=$sobreNome;
    }

    public function getNomeCompleto(){
        echo "O nome é: {$this->getNome()} {$this->getSobreNome()}";
    }

}

$p = new Pessoa2();
$p->setNome("Fernando");
$p->setSobreNome("de Paula");
$p->getNomeCompleto();
echo "\n\n";
