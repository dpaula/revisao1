<?php

function listaProdutos($conexao){

    $query = "select p.*, c.nome as categoria_nome
              from produtos p
              join categorias c
              on (p.categoria_id=c.id)";
    $produtos = [];
    $resultado = mysqli_query($conexao, $query);
    while($produto = mysqli_fetch_assoc($resultado)){
        array_push($produtos, $produto);
    }
    return $produtos;
}


function insereProduto($conexao, $nome, $preco, $descricao, $categoria_id, $usado){
    $query = "insert into produtos (nome, preco, descricao, categoria_id, usado) values ('{$nome}', {$preco}, '{$descricao}', '{$categoria_id}', {$usado})";
    return mysqli_query($conexao, $query);
}


function alteraProduto($conexao, $nome, $preco, $descricao, $categoria_id, $usado, $id){
    $query = "update produtos
                set nome = '{$nome}',
                    preco = {$preco},
                    descricao = '{$descricao}',
                    categoria_id = {$categoria_id},
                    usado = {$usado}
                 where id = $id";
    return mysqli_query($conexao, $query);
}


function deletaProduto($conexao, $id){
    return mysqli_query($conexao, "delete from produtos where id = {$id}");
}

function retornaProduto($conexao, $id){
    $resultado = mysqli_query($conexao, "select * from produtos where id = {$id}");
    return mysqli_fetch_assoc($resultado);
}