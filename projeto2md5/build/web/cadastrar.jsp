<%-- 
    Document   : login
    Created on : 21 de mar. de 2025, 10:16:35
    Author     : lweber
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro</title>
    <style>
        body {
            width: 100%;
            height: 100vh;
        }

        header {
            background-color: gray;
            opacity: 90%;
            height: 90px;
            width: 100%;
            align-items: center;
            justify-content: center;
            display: flex;
        }

        h1 {
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }

        .col-8 {
            align-items: center;
            justify-content: center;
        }

        .botao {
            justify-content: space-between;
            display: flex;
            padding: 15px;
        }
        .verde{
            border-color: green!important;
        }
        .vermelho{
            border-color: red!important;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<header>
    <h1>
        Cadastro de usuário
    </h1>
</header>

<body>
    <div class="container">
        <div class="row">
            <div class="col-2">

            </div>
            <div class="col-8 px-4 py-4 ">
                <form name="cadastro" action="cadastro" method="post">
                    <div>
                        <div class="form-floating mb-3">
                            <input name="nome" type="text" class="form-control" id="nome" placeholder="Nome" onkeyup="verify()">
                            <label for="nome">Nome</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input name="email" type="email" class="form-control" id="email" placeholder="nome@exemplo.com"
                                autocomplete="email" onkeyup="verify(),verifyEmail()">
                            <label for="email">Email</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input name="numero" type="tel" class="form-control" pattern="\([0-9]{2}\)[\s][0-9]{5}-[0-9]{4}"
                                id="numero" placeholder="(xx) xxxxx-xxxx" autocomplete="tel" onkeyup="verify(),formatarNumero()">
                            <label for="numero">Número de telefone -> (xx) xxxxx-xxxx</label>
                        </div>
                    </div>
                    <div class="botao">
                        <button disabled id="enviar" type="submit" class="btn btn-primary">Cadastrar</button>
                        <a href="index.jsp" class="btn btn-outline-danger" role="button">VOLTAR</a>
                        <button type="reset" class="btn btn-primary" onclick="clean()">Limpar</button>
                    </div>
                </form>
            </div>
            <div class="col-2">

            </div>
        </div>

    </div>

    <script src="js/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>
