<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
            session.getAttribute("sessionUser");
            session.removeAttribute("sessionUser");
            session.getAttribute("qtd");
            session.removeAttribute("qtd");
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
