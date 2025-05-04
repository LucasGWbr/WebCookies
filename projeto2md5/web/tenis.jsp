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
                    if (c.getName().equals(user+"_tenis")) {
                        n = Integer.parseInt(c.getValue());
                    }
                }
            Cookie tenis =  new Cookie(user+"_tenis", String.valueOf(n+1));
            tenis.setMaxAge(60*60);
            response.addCookie(tenis);
            %>
        <div class="centrali"><h1>TENIS DE MESA</h1></div>
        <div class="centrali">
        <img src="gif/tmesa.gif"> 
        <img src="gif/tmesa.gif"> 
        <img src="gif/tmesa.gif">            
        </div>
        <div style="text-align: center;padding: 20px;"><a href="menu.jsp">VOLTAR</a></div>
        

    </body>
</html>
