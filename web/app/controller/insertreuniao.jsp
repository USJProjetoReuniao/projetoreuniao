<%@page import="br.com.app.controller.ReuniaoErro"%>
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
                Reuniao reu = new Reuniao();
                ReuniaoErro rec = new ReuniaoErro();
                ReuniaoDAO red = new ReuniaoDAO();
                
                if(!(request.getParameter("InputTitle").equals("") || request.getParameter("InputHour").equals("") || request.getParameter("InputCategory").equals("") ||request.getParameter("InputLocal").equals("")) ){
                
                reu.setTitulo(request.getParameter("InputTitle"));
                reu.setDuracao(request.getParameter("InputHour"));
                reu.setCategoria(request.getParameter("InputCategory"));
                reu.setLocalizacao(request.getParameter("InputLocal"));
                //reu.setAta(request.getParameter("InputAta"));
                reu.setData(request.getParameter("InputData"));
                reu.setCancelada(false);
                reu.setProcurar("");
                red.Inserir(reu);
                response.sendRedirect("../../?page=painel");
                } else {
                   rec.setInfo("");
                    rec.setInfo("Cadastro de Reuniao -> Algum campo está vazio!");
                    rec.setCtrl(false);                    
                    response.sendRedirect("../../?page=painel#");
                                       
                }             
             }catch(Exception error){
             throw  new RuntimeException("Erro 6: "+ error);
            }
          
        %>
        
    </body>
</html>
