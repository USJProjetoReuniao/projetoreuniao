<%-- 
    Document   : deslogarexit
    Created on : 17/06/2019, 13:24:49
    Author     : Luandre Bernardi
--%>

<%@page import="br.com.app.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sainda...</title>
    </head>
    <body>
        <%
        Usuario.setNome("");;
        session.invalidate();
        response.sendRedirect("../../login.jsp");
        %>
        
    </body>
</html>
