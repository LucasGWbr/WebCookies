<%-- 
    Document   : cinema
    Created on : 3 de mai. de 2025, 21:34:16
    Author     : Lucas Weber
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina de cinema</title>
        <style>
            .centrali{
                justify-content: center; display: flex;
            }
            </style>
    </head>
    <body>
        <%
            String user= (String) session.getAttribute("user");
            Cookie[] cookies = null;
            cookies = request.getCookies();
            int n = 0;
                for (Cookie c : cookies) {
                    if (c.getName().equals(user+"_cinema")) {
                        n = Integer.parseInt(c.getValue());
                    }
                }
            Cookie cinema =  new Cookie(user+"_cinema", String.valueOf(n+1));
            cinema.setMaxAge(60*60);
            response.addCookie(cinema);
            %>
        <div class="centrali"><h1>CINEMA</h1></div>
        <div class="centrali">
        <img src="gif/cinema.gif"> 
        <img src="gif/cinema.gif"> 
        <img src="gif/cinema.gif">            
        </div>
        <div style="text-align: center;padding: 20px;"><a href="menu.jsp">VOLTAR</a></div>

    </body>
</html>
