

<%@page import="br.com.app.dao.PautaDAO"%>
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
           
            try {
                PautaDAO pad = new PautaDAO();
                ReuniaoDAO red = new ReuniaoDAO();
                
                pad.excluirTodas(Integer.parseInt(request.getParameter("id")));               
                red.excluir(Integer.parseInt(request.getParameter("id")));
                                
                response.sendRedirect("../../?page=painel");
                              
             }catch(Exception error){
             throw  new RuntimeException("Erro Excluir: "+ error);
            }
          
        %>
        
    </body>
</html>
