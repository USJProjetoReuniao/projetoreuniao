<%-- 
    Document   : logarreuniao
    Created on : 17/06/2019, 15:56:29
    Author     : Luandre Bernardi
--%>

<%@page import="br.com.app.model.Usuario"%>
<%@page import="br.com.app.controller.UsuarioErro"%>
<%@page import="br.com.app.dao.UsuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logando...</title>
    </head>
    <body>
         <% 
       Usuario usa = new Usuario();
       UsuarioDAO usd = new UsuarioDAO();
       UsuarioErro use = new UsuarioErro();        
         
           usa.setNome(request.getParameter("usuario"));
           usa.setSenha(request.getParameter("senha"));
         
           
         if(usa.getNome()!=null && usa.getSenha()!=null && !usa.getNome().isEmpty() && !usa.getSenha().isEmpty()){
            if(usd.Consultar(usa)){
             session.setAttribute("usuario", usa.getNome());
             response.sendRedirect("../../?page=painel");
             
         } else{
                    use.setInfo("");
                    use.setInfo("Usuário ou Senha invalida.");
                    use.setCtrl(false);
                  response.sendRedirect("../../login.jsp");
            }
         }else{             
             response.sendRedirect("../../login.jsp");
         }
       %>
         
    </body>
</html>
