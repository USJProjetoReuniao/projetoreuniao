<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.com.app.dao.PautaDAO"%>
<%@page import="br.com.app.model.Pauta"%>
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
              SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
              Date hora = Calendar.getInstance().getTime();
              String dataFormatada = sdf.format(hora);
              
                Pauta pat = new Pauta();
                PautaDAO pad = new PautaDAO(); 
                pat.setPauta(request.getParameter("InputPauta"));   
                pat.setHorario(dataFormatada);   
                pat.setIdReuniao(Integer.parseInt(request.getParameter("id")));             
                pad.inserir(pat);
                
                response.sendRedirect("../../?page=visualizar&id="+pat.getIdReuniao());
                              
             }catch(Exception error){
             throw  new RuntimeException("Erro 6: "+ error);
            }
          
        %>
        
    </body>
</html>
