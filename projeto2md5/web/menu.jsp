
<!DOCTYPE html>
<%@page import="persistencia.DAOPessoa"%>
<%@page import="negocio.Pessoa"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="pt-br">

<head>
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
            opacity: 60%;
            height: 90px;
            width: 100%;
            align-items: center;
            justify-content: space-between;
            display: flex;
            padding: 10px;
        }

        h1 {
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }

        .col-4 {
            height: 80vh;
            overflow: hidden;
            position: relative;
            align-items: center;
            justify-content: center;
            margin: 0px;
        }

        .col-4 img {
            width: auto;
            height: 100%;
            position: relative;
            left: 50%;
            transform: translateX(-50%);
            }
        

        

    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<header>
    <h1>
        MENU
    </h1>
    <div style="background-color: white; opacity:60%;"> 
        <h6 style="color:green;"> Logado como: <strong>${pessoa.nome}</strong></h6>
        <br> 
        <a href="login.jsp">LOGOUT</a>
    </div>
</header>

<body>
    <div class="container">
        <div class="row p-4">
            <div class="col-4">
                <a href="pagina"><img src="https://sempretopgames.com.br/wp-content/uploads/2023/09/melhores-Video-games.webp" alt="video-games"></a>
            </div>
            <div class="col-4">
                <a href="pagina"><img src="https://www.infoescola.com/wp-content/uploads/2013/01/t%C3%AAnis-de-mesa_340048448.jpg" alt="tenis-de-mesa"></a>
            </div>
            <div class="col-4">
                <a href="pagina"><img src="https://cinema10.com.br/upload/noticias/2019-2/2192602189.jpg" alt="cinema"></a>
            </div>
        </div>

    </div>

    <script src="js/scriptLogin.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
</body>

</html>
