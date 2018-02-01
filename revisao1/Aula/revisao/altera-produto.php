<?php include("cabecalho.php");?>
<?php include("conecta.php");?>
<?php include("banco-produto.php");?>
<?php include("banco-categoria.php");

$id = array_key_exists("id", $_GET) ? $_GET["id"] : 0;
$produto = retornaProduto($conexao, $id);

//$usado = $produto["usado"] ? "true" : "false";
$usado = $produto["usado"] ? "checked='checked'" : "";

echo $usado;

?>
    <h1>Alterando o Produto</h1>
    <form action="altera-produto-controle.php" method="post">
        <table class="table">
            <tr>
                <td>Nome</td>
                <td><input class="form-control" type="text" name="nome" value="<?=$produto['nome']?>"><br/></td>
            </tr>
            <tr>
                <td>Preço</td>
                <td><input class="form-control" type="text" name="preco" value="<?=$produto['preco']?>"><br/></td>
            </tr>
            <tr>
                <td>Descrição</td>
                <td><textarea name="descricao" class="form-control"><?=$produto['descricao']?></textarea></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="checkbox" name="usado" <?=$usado?> value="true" >Usado</td>
            </tr>
            <tr>
                <td>Categoria</td>
                <td>
                    <select name="categoria_id" class="form-control">
                        <?php
                        $categorias = listaCategorias($conexao);
                        foreach($categorias as $categoria) :
                            $selected = $produto["categoria_id"]==$categoria["id"] ? "selected='selected'" : "" ?>
                            <option value="<?=$categoria['id']?>" <?=$selected?> ><?=$categoria['nome']?></option>
                        <?php endforeach ?>
                    </select>
                </td>
            </tr>
            <tr>
                <td><input type="hidden" name="id" value="<?=$id?>"</td>
                <td><input class="btn btn-primary" type="submit" value="Alterar"></td>
            </tr>
        </table>
    </form>
<?php include("rodape.php");?>