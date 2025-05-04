<%-- 
    Document   : login
    Created on : 21 de mar. de 2025, 10:16:35
    Author     : lweber
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <%
        session.invalidate();
        %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagina web</title>
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
            justify-content: flex-end;
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
        Login
    </h1>
</header>

<body>
    <div class="container">
        <div class="row">
            <div class="col-2">

            </div>
            <div class="col-8 px-4 py-4 ">
                <form name="login" action="login" method="post">
                    <div>
                        <div class="form-floating mb-3">
                            <input name="nome" type="text" class="form-control" id="nome" placeholder="Nome" onkeyup="verify()">
                            <label for="nome">Nome</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input name="pass" type="password" class="form-control" id="pass" placeholder="Senha" onkeyup="verify()">
                            <label for="pass">Senha</label>
                        </div>
                    </div>
                    <div class="botao">
                        <button disabled id="enviar" type="submit" class="btn btn-primary">Login</button>
                    </div>
                </form>
            </div>
            <div class="col-2">
                <script>
                    <% if (request.getAttribute("mensagem") != null) { %>
                      alert('<%= request.getAttribute("mensagem") %>');
                    <% } %>
                    </script>
            </div>
        </div>

    </div>

    <script src="js/scriptLogin.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>
