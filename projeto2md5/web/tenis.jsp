<%-- 
    Document   : tenis
    Created on : 3 de mai. de 2025, 21:34:07
    Author     : Lucas Weber
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina de tenis de mesa</title>
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
                if (c.getName().equals(user + "_tenis")) {
                    n = Integer.parseInt(c.getValue());
                }
            }
            Cookie tenis = new Cookie(user + "_tenis", String.valueOf(n + 1));
            tenis.setMaxAge(60 * 60);
            response.addCookie(tenis);
        %>
        <div class="centrali"><h1>TENIS DE MESA</h1></div>
        <div class="centrali">
            <img src="gif/tmesa.gif"> 
            <img src="gif/tmesa.gif"> 
            <img src="gif/tmesa.gif">            
        </div>
        <div style="text-align: center;padding: 20px;"><a href="menu.jsp"><button type="button" class="btn btn-danger">SAIR</button></a></div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
    </body>
</html>
