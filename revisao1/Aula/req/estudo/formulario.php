<!DOCTYPE html>
<html lang="pt-br">

<head>

    <meta charset="UTF8">
    <title>Formulário HTML</title>

</head>

<body>


<!--<form action="metodo_get.php" method="GET">-->
<form action="metodo_post.php" method="POST">

    <fildset>
        <legend>Formulário HTML</legend>

        <p>

            <label for="nome">Nome: </label>
            <input type="text" name="nome" id="nome">

        </p>
        <p>

            <label for="email">E-mail: </label>
            <input type="text" name="email" id="email">

        </p>

    </fildset>
    <p>
        <input type="submit" value="Enviar" id="enviar">
    </p>

</form>


</body>

</html>