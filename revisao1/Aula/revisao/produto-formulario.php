<?php include("cabecalho.php");?>
<?php include("conecta.php");?>
<?php include("banco-categoria.php");?>
        <h1>Formulário</h1>
    <form action="adiciona-produto.php" method="post">
        <table class="table">
            <tr>
                <td>Nome</td>
                <td><input class="form-control" type="text" name="nome"><br/></td>
            </tr>
            <tr>
                <td>Preço</td>
                <td><input class="form-control" type="text" name="preco"><br/></td>
            </tr>
            <tr>
                <td>Descrição</td>
                <td><textarea name="descricao" class="form-control"></textarea></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="checkbox" name="usado" value="true">Usado</td>
            </tr>
            <tr>
                <td>Categoria</td>
                <td>
                    <select name="categoria_id" class="form-control">
                        <?php
                        $categorias = listaCategorias($conexao);
                        foreach($categorias as $categoria) : ?>
                            <option value="<?=$categoria['id']?>"><?=$categoria['nome']?></option>
                        <?php endforeach ?>
                    </select>
                </td>
            </tr>
            <tr>
                <td><input class="btn btn-primary" type="submit" value="Cadastrar"></td>
            </tr>
        </table>
    </form>
<?php include("rodape.php");?>