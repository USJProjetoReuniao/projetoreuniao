

<%@page import="br.com.app.model.Pauta"%>
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
                Pauta pat = new Pauta();              
                
                pad.excluir(Integer.parseInt(request.getParameter("id")));
         
                response.sendRedirect("../../?page=visualizar&id="+request.getParameter("id_r"));
                              
             }catch(Exception error){
             throw  new RuntimeException("Erro Excluir: "+ error);
            }
          
        %>
        
    </body>
</html>
