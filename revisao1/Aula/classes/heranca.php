<?php
/**
 * Created by PhpStorm.
 * User: ferna
 * Date: 11/01/2018
 * Time: 09:23
 */

class SuperClasse{
    public $publico = 0;
    protected $protegida = 0;
    private $privado = 0;

    public function ini(){
        echo "SuperClassse->ini()";
    }

    public function super(){
        echo "O valor de public é : {$this->publico} \n";
        echo "O valor de protected é : {$this->protegida} \n";
        echo "O valor de private é : {$this->privado} \n";
    }
}

class SubClasse extends SuperClasse{

    //referencia o mesmo ponto de memória da variável pai &
    public $publico;
    //referencia o mesmo ponto de memória da variável pai &
    protected $protegida;

    //Não tem acesso a variável pai, uma nova variável é criada
    private $privado;

    public function sub(int $a){
        $this -> publico = $a;
        $this -> protegida = $a;
        $this -> privado = $a;
    }
}

$sub = new SubClasse();
$sub -> sub(10);
$sub ->super();
