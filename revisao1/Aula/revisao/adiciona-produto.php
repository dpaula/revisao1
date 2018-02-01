<?php include("cabecalho.php");?>
<?php include("conecta.php");?>
<?php include("banco-produto.php");?>
    <?php

    $nome = $_POST["nome"];
    $preco = $_POST["preco"];
    $descricao = $_POST["descricao"];
    $categoria_id = $_POST["categoria_id"];
    $usado = array_key_exists("usado", $_POST) ? "true": "false";

    //conexao

    if(insereProduto($conexao, $nome, $preco, $descricao, $categoria_id, $usado)){ ?>
        <p class="text-success"> Produto <?= $nome; ?>, <?= $preco ?> adicionado com sucesso!! </p>
    <?php }else{
        $msg = mysqli_error($conexao); ?>
        <p class="text-danger"> Produto <?= $nome; ?>, Não foi adicionado!! Erro: <?= $msg ?> </p>
    <?php
    }

    include("rodape.php");?>

