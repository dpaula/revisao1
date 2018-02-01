<?php
/**
 * Created by PhpStorm.
 * User: ferna
 * Date: 11/01/2018
 * Time: 10:16
 */

require_once("Pessoa2.php");

class PFisica extends Pessoa2 {

    public function getNomeCompleto(){
        return "PFisica: {$this->getNome()} {$this->getSobreNome()}";
    }
}

$pf = new PFisica();
$pf->setNome("Carla");
$pf->setSobreNome("Weitzel");

echo $pf->getNomeCompleto();