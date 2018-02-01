<?php include("cabecalho.php");?>
<?php include("conecta.php");
include("banco-produto.php");

//$removido = $_GET['removido'];
$produtos = listaProdutos($conexao);
$novo = "Novo";
$usado = "Usado";
?>

<?php if(array_key_exists("removido", $_GET) && $_GET['removido'] == true){ ?>
<p class="alert-success">Produto apagado com sucesso!</p>
<?php } ?>
<table class="table table-striped table-bordered">
<?php foreach($produtos as $produto){ ?>
    <tr>
        <td><?=$produto["nome"] ?></td>
        <td><?=$produto["preco"] ?></td>
        <td><?=$produto["categoria_nome"] ?></td>
        <td><?=$produto["usado"] == 0 ? $novo : $usado  ?></td>
        <td><?=substr($produto["descricao"], 0, 30) ?></td>
        <td>
            <a class="btn btn-primary" href="altera-produto.php?id=<?=$produto['id']?>">Alterar</a>
<!--            <form action="remove-produto.php" method="post">-->
<!--                <input type="hidden" name="id" value="--><?//=$produto["id"]?><!--">-->
<!--                <button class="btn-danger">Remover</button>-->
<!--            </form>-->
        </td>
        <td>
            <form action="remove-produto.php" method="post">
                <input type="hidden" name="id" value="<?=$produto["id"]?>">
                <button class="btn btn-danger">Remover</button>
            </form>
        </td>
    </tr>
<?php } ?>
</table>


<?php include("rodape.php");?>
