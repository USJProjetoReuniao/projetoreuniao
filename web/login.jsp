<%@page import="br.com.app.controller.UsuarioErro"%>
<%@page import="br.com.app.model.Usuario"%>
<%@page import="br.com.app.dao.UsuarioDAO"%>
<!DOCTYPE html>

<html>
    <head>
        <title>USJ Marker</title>
        <meta http-equiv="content-language" content="pt-br" />
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./app/src/css/login.css" type="text/css"/>  
        <link rel="stylesheet"  href="./app/src/css/fontawesome.min.css" type="text/css"/>
        <link rel="stylesheet"  href="./app/src/css/bootstrap.min.css" type="text/css"/>     
        <link rel="stylesheet"  href="./app/src/css/myStyle0001.css" type="text/css"/>    
         <script src="./app/src/js/all.js"></script>
         <script src="./app/src/js/jquery-3.4.1.min.js" type="text/javascript"></script>       
         <script src="./app/src/js/bootstrap.min.js" type="text/javascript"></script>
   
    </head>    
   
    <body>
      <div class="main">          
      
         
       <div class="container ">    
                
       <% UsuarioErro use = new UsuarioErro();   
       if(use.getCtrl().equals(false)){
          out.print("<div id='infoErro' class='infologin text-center text-white'>"+use.getInfo()+"</div>");  
          use.setCtrl(true); 
       }    %>            
        <center>          
        <div class="middle">
       
        <div id="login" class="pr-5 login">             
        <form method="POST">
            <fieldset class="clearfix ">  
                 <div class="border-0 bg-light mb-3  rounded"><i class="fas fw fa-user"></i> <input type="text"  name="usuario" Placeholder="Usuário" required></div>
                 <div class="border-0 bg-light mb-3 rounded"><i class="fa fw fa-lock"></i> <input type="password" name="senha"  Placeholder="Senha" required></div>            
                       <div class="list-group mt-5">
                                <span style="width:100%; text-align:left;  display: inline-block;"><a class="small-text text-light" href="#">Esqueceu a senha?</a>
                                <button formaction="./app/controller/logarreuniao.jsp" class="btn btn-sm btn-primary float-right pr-3 pl-3">Entrar</button></span>
                          </div>                      
            </fieldset>      
             <div class="clearfix"></div>
        </form>
     
      </div> <!-- end login -->
            <div class="logo ml-4">
                <img class="" src="./app/src/img/usj1.png" width="120" height="120"/>
                <h5 class="h6 font-weight-normal">Centro Universitário Municipal de São José</h5>
                <h3 class="h3 font-weight-normal">USJ Marker</h3>            
                <div class="clearfix"></div>
            </div>     
     </center>
     </div>
              </div>     
          </div>
       </body>
    </html>
    
    
    
<script>
   $().ready(function() {
	setTimeout(function () {
		$('#infoErro').fadeIn( 600 ).delay( 1500 ).fadeOut( 2000 ); // "foo" é o id do elemento que seja manipular.
	}, 2500); // O valor é representado em milisegundos.
});
</script>
    