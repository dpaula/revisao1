<?php
/**
 * Created by PhpStorm.
 * User: ferna
 * Date: 11/01/2018
 * Time: 09:48
 */

class SuperClasse{

    public function funcPublica(){
        echo "Função pública!\n";
    }
    protected function funcProtegida(){
        echo "Função protegida!\n";
    }
    private function funcPrivada(){
        echo "Função privada!\n";
    }

    function super(){
        $this->funcPublica();
        $this->funcProtegida();
        $this->funcPrivada();
    }
}

$super = new SuperClasse();
$super->funcPublica();
//$super->funcProtegida(); --Acesso somente dentro da classe e suas derivadas
//$super->funcPrivada();  --Acesso somente dentro da classe

class SubClasse extends SuperClasse{

    function __construct(){
        $this->funcPublica();
        $this->funcProtegida();
//        $this->funcPrivada(); -- Acesso somente dentro da classe em q foi criada
    }
}

echo "\n\n";
$sub = new SubClasse();
