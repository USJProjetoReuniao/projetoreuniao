<%-- 
    Document   : logarreuniao
    Created on : 17/06/2019, 15:56:29
    Author     : Luandre Bernardi
--%>

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
       UsuarioDAO usd = new UsuarioDAO();
       UsuarioErro use = new UsuarioErro();        
         
         String usuario = request.getParameter("usuario");
         String senha = request.getParameter("senha");
         
           
         if(usuario!=null && senha!=null && !usuario.isEmpty() && !senha.isEmpty()){
            if(usd.Consultar(usuario,senha)){
             session.setAttribute("usuario", usuario);
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
