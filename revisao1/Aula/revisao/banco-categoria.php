<?php

function listaCategorias($conexao){
    $categorias = [];
    $resultado = mysqli_query($conexao, "select * from categorias");
    while($categoria = mysqli_fetch_assoc($resultado)){
        array_push($categorias, $categoria);
    }
    return $categorias;
}