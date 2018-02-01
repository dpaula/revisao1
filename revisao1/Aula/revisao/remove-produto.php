<?php include("cabecalho.php");?>
<?php include("conecta.php");
include("banco-produto.php");

$id = $_POST["id"]; //pega a variável da url


deletaProduto($conexao, $id);//chamando função pra deletar produto, passando conexão e o id do produto
header("Location: produto-lista.php?removido=true");//volta pra lista e recarrega
die();//explicitando que não faz mais nada a partir daqui
?>