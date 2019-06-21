<!DOCTYPE html>

<html>
    <head>
        <title>USJ Marker</title>
        <meta http-equiv="content-language" content="pt-br" />
        <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="./app/src/css/bootstrap.css" type="text/css"/>
         <link rel="stylesheet" href="./app/src/css/myStyle0001.css" type="text/css"/>
         <link rel="stylesheet" href="./app/src/css/all.css" type="text/css"/>
         <script src="./app/src/js/all.js"></script>       
         <script src="./app/src/js/loadpage.js"></script>
         <script src="./app/src/js/jquery-3.4.1.min.js"></script>
         <script src="./app/src/js/bootstrap.js"></script>      
         <script src="./app/src/js/searchpage.js"></script>    
        
         <style>
                .bd-placeholder-img {
                  font-size: 1.125rem;
                  text-anchor: middle;
                  -webkit-user-select: none;
                  -moz-user-select: none;
                  -ms-user-select: none;
                  user-select: none;
                }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
     <link rel="stylesheet" href="./app/src/css/dashboard.css"/>
    </head>
    <body>
        <%
        String usuario = (String) session.getAttribute("usuario");
              if(usuario == null){
                  response.sendRedirect("./login.jsp");                  
              }else{
               
              }
        
        %>
        
        <nav class="navbar fixed-top flex-sm-nowrap p-0 navbar-bg-333">            
            <nav class="navbar-brand border-bottom-0 nav-link" style="width: 200px; ">         
                   <a class="text-white" style="text-decoration:none;" href="?page=painel" > 
                   <img class="mb-2" height="40px" src="./app/src/img/usj1.png"/>          
                    USJ Marker 
                   </a>             
           </nav>
           
            <nav class="navbar-text text-light">
                <a> Usuário: <%=usuario%> </a>
             </nav>
           
             <ul class="navbar-nav">
             <li class="nav-item pb-1 pt-1 pr-3 pl-3 ">
             <a class="nav-link text-light nav-link-hover" href="./app/controller/deslogarreuniao.jsp">Sair</a>
             </li>
            </ul>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <nav class="col-sm-3 d-none d-md-block bg-transparent sidebar" style="width: 200px;">
                <div class="sidebar-sticky ">
                  <ul class="nav flex-column ">
                    <li class="nav-item btn-menu ">
                      <a class="nav-link" href="?page=painel">
                      <span class="fas fa-clipboard fa-fw"> </span>
                        Painel de Reuniões
                      </a>
                    </li>
                    <li class="nav-item btn-menu">
                      <a class="nav-link"  href="" role="button" data-toggle="modal" data-target="#myModal">
                        <span class="far fa-sticky-note fa-fw"> </span>
                        Cadastro
                      </a>
                    </li>
                    <li class="nav-item btn-menu">
                      <a class="nav-link" href="?page=relatorios">
                           <span class="fas fa-file-export fa-fw"></span>
                        Relatórios
                      </a>
                   <!-- </li>
                    <li class="nav-item btn-menu ">
                      <a class="nav-link" href="#">
                      <span class="fas fa-search fa-fw"></span>
                        Procurar
                      </a>
                    </li>-->
                    <li class="nav-item btn-menu ">
                      <a class="nav-link" href="#">
                          <span class="far fa-question-circle fa-fw"></span>
                        Ajuda
                      </a>
                    </li>
                   <!-- <li class="nav-item btn-menu">
                      <a class="nav-link" href="#">
                       <span></span>

                      </a>
                    </li>-->
                  </ul>
                   </div>
              </nav>
                
                <main id="loadPageDocument" role="main" class="col-md-auto ml-200px col-xl-10 px-4"> </main>
                <script> loadPage(); </script>
     
          </body>
</html>

<script>
   $().ready(function() {
	setTimeout(function () {
		$('#infoErro').fadeIn( 600 ).delay( 1500 ).fadeOut( 2000 ); // "foo" é o id do elemento que seja manipular.
	}, 2500); // O valor é representado em milisegundos.
        });

</script>
                
      
  <script>
function myEnableArea(a) {
  document.getElementById("comArea"+a).disabled = false;
  document.getElementById("btnEnviar"+a).disabled = false;
}
</script>