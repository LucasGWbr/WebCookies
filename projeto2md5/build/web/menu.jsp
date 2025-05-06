
<!DOCTYPE html>
<%@page import="persistencia.DAOPessoa"%>
<%@page import="negocio.Pessoa"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.HashMap, java.util.Map" %>

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
                height: 10vh;
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
            .col {
                height: 10vh;
                overflow: hidden;
                position: relative;
                align-items: center;
                justify-content: center;
            }
            .col img {
                width: auto;
                height: 100%;
                padding: 10px;
                display: inline-block;
            }
            .row{
                padding-top: 0px;
            }
            .caixalg{
                background-color: whitesmoke;
                display: grid;
                justify-items: center;
                border-radius: 5px;
                padding-left: 5px;
                padding-right: 5px;
            }




        </style>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <header>
        <h1>
            MENU
        </h1>
        <div class="caixalg"> 
            <%
                String p = (String) session.getAttribute("user");
                request.setAttribute("pessoa", p);
            %>
            <h6> Bem vindo <strong>${pessoa}</strong></h6>
            <br> 
            <a href="login.jsp"><button type="button" class="btn btn-danger">LOGOUT</button></a>
        </div>
    </header>

    <body>
        <div class="container">
            <div class="row">
                <div class="col d-flex justify-content-center align-items-center">
                    <!-- ad
                    out.println("<p>User: "+user+"</p>");-->
                    <%
                        String user= (String) session.getAttribute("user");
                        if(request.getCookies()!=null){
                        Cookie[] cookies = null;
                        cookies = request.getCookies();
                        HashMap<String, Integer> map = new HashMap<>();
                        for (Cookie c : cookies) {
                            if (c.getName().equals(user+"_cinema")) {
                                map.put("cinema",Integer.parseInt(c.getValue()));
                            }else
                                if (c.getName().equals(user+"_tenis")) {
                                    map.put("tenis",Integer.parseInt(c.getValue()));
                                }else
                                    if (c.getName().equals(user+"_videogame")) {
                                        map.put("videogame",Integer.parseInt(c.getValue()));
                                    }
                        }
                        
                        String chave = null;
                        int maxValue = -1;
                        
                        //done with gpt, because i didnt know how to do it efficiently
                        
                        for (Map.Entry<String, Integer> entry : map.entrySet()) {
                            if (entry.getValue() > maxValue) {
                                maxValue = entry.getValue();
                                chave = entry.getKey();
                            }
                        }
                        if (chave != null) {
                            for(int i =0 ; i<6;i++){
                                out.println("<img src='img/" + chave + ".png'>");
                        }  
                            }
                        }
                    
                    %>
                </div>
            </div>
            <div class="row">
                <div class="col-4">
                    <a href="videogame.jsp"><img src="img/videog.png" alt="video-games"></a>
                </div>
                <div class="col-4">
                    <a href="tenis.jsp"><img src="img/tenisdemesa.jpg" alt="tenis-de-mesa"></a>
                </div>
                <div class="col-4">
                    <a href="cinema.jsp"><img src="img/filme.jpg" alt="cinema"></a>
                </div>
            </div>

        </div>

        <script src="js/scriptLogin.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    </body>

</html>
