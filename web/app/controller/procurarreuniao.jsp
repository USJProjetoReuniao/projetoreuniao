<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.app.model.Reuniao" %>
<%@page import="br.com.app.dao.ReuniaoDAO" %>

<html>
       <head>
        <title>APP Reuniao</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
       </head>
    <body>
        <%   
                Reuniao reu = new Reuniao();           
                ReuniaoDAO red = new ReuniaoDAO();
                reu.setProcurar(request.getParameter("InputSearch"));
                response.sendRedirect("../../?page=painel");         
        %>
        
    </body>
</html>
