<%-- 
    Document   : videogame
    Created on : 2 de mai. de 2025, 21:59:38
    Author     : Lucas Weber
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina de videogames</title>
        <style>
            .centrali{
                justify-content: center;
                display: flex;
            }
        </style>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <%
            String user = (String) session.getAttribute("user");
            Cookie[] cookies = null;
            cookies = request.getCookies();
            int n = 0;
            for (Cookie c : cookies) {
                if (c.getName().equals(user + "_videogame")) {
                    n = Integer.parseInt(c.getValue());
                }
            }
            Cookie vg = new Cookie(user + "_videogame", String.valueOf(n + 1));
            vg.setMaxAge(60 * 60);
            response.addCookie(vg);
        %>
        <div class="centrali"><h1>CS 2</h1></div>
        <div class="centrali">
            <img src="gif/cs1.gif"> 
            <img src="gif/cs2.gif"> 
            <img src="gif/cs3.gif">            
        </div>
        <div style="text-align: center;padding: 20px;"><a href="menu.jsp"><button type="button" class="btn btn-danger">SAIR</button></a></div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

    </body>
</html>
