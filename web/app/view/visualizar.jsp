<%@page import="javax.management.RuntimeErrorException"%>
<%@page import="javafx.scene.input.DataFormat"%>
<%@page import="br.com.app.model.Pauta"%>
<%@page import="br.com.app.dao.PautaDAO"%>
<%@page import="java.text.*,java.util.*"%>
<%@page import="br.com.app.model.Reuniao" %>
<%@page import="br.com.app.dao.ReuniaoDAO" %>
      
<%               
             Date d  = new Date(); String today=DateFormat.getDateInstance().format(d);
            
             ReuniaoDAO red = new ReuniaoDAO();
             PautaDAO  pad = new PautaDAO();
             
             ArrayList<Reuniao> listaReuniao = red.visualizar(Integer.parseInt(request.getParameter("id")));
             ArrayList<Pauta> listaPauta = pad.listarTodas(Integer.parseInt(request.getParameter("id")));
              
             
             for (int num = 0; num < listaReuniao.size(); num++){ %>
        
         
       <div class="d-flex justify-content-between  flex-wrap flex-md-nowrap  align-items-center pt-3 pb-2 mb-3 border-bottom">
           <h3 class="h3"> Reunião - <% out.print(listaReuniao.get(num).getTitulo()); %></h3>                                     
                                                                         
          
     <div class="btn-toolbar mb-3">
          <form method="POST">
         <div class="btn-group mr-3" role="group" aria-label="First group">         
             <% out.print("<button  formaction='./app/controller/iniciarreuniao.jsp?id="+listaReuniao.get(num).getId()+"' class='btn  btn-success btn-secondary '>Iniciar Reuniao</button>"); %>
             <% out.print("<button  formaction='./app/controller/cancelreuniao.jsp?id="+listaReuniao.get(num).getId()+"' class='btn  btn-info btn-secondary '>Cancelar</button>"); %>   
             <% out.print("<button  formaction='./app/controller/deletereuniao.jsp?id="+listaReuniao.get(num).getId()+"' class='btn  btn-danger btn-secondary '>Excluir</button>"); %>           
         </div>  
               </form>
            <label  class="h5 m-auto">Data: <%=today%> </label>                        
      </div>
        </div>
         
         <div class="container-fluid">
             <div class="col-md-5 float-right">           
                 <h1 class="h4 mt-2 pb-2 mb-4 border-bottom"><i class="fas fa-lg fa-tasks fa-fw mr-1"> </i> Detalhes </h1> 
              
             <form>
              <fieldset disabled>
                  <div class="form-group ">
                    <label for="disabledTextInput">Titulo</label>
                    <input type="text" id="" class="form-control" placeholder="" value="<%out.print(listaReuniao.get(num).getTitulo());%>">
                  </div>
                  <div class="form-group">
                    <label for="disabledTextInput">Categoria</label>
                    <input type="text" id="" class="form-control" placeholder="" value="<%out.print(listaReuniao.get(num).getCategoria());%>">
                  </div>
                  <div class="form-group">
                    <label for="disabledTextInput">Data</label>
                    <input type="text" id="" class="form-control" placeholder="" value="<%out.print(listaReuniao.get(num).getData());%>">
                  </div>
                 <fieldset disabled>
                  <div class="form-row mb-3">
                      <div class="col-md-6 mb-4 m-auto">
                    <label for="disabledTextInput">Inicio da Reunião</label>
                    <input type="text" id="" class="form-control" placeholder=""> 
                   
                      </div> 
                      <div class="col-md-6 mb-4 m-auto">
                          <label>Fim da Reunião</label>   
                      <input type="text" id="" class="form-control" placeholder="">    
                      </div>

                  </div>
                     
                      <div class="form-group">
                          <label>Duração Estimada</label>   
                          <input type="text" id="duracao" class="form-control " value="<%out.print(listaReuniao.get(num).getDuracao());%>">   </input> 
                      </div>
                    </fieldset>
             </form> 
             </div> 
                     
                   <div class="col-md-7 mr-lg-auto float-left">      
                       <h1 class="h4 mt-2 pb-2 mb-4 border-bottom"><i class='far fa-lg fa-clipboard mr-1'></i> Pautas </h1>   
                       
                       <div class="col-md-auto overflow-auto" style="max-height: 500px; "> 
                          <%   if(!listaPauta.isEmpty()){
                           for (int count = 0; count < listaPauta.size(); count++){ 
                          
                              out.print("<div class='card box p-2 bg-light border mt-2 mb-3'>"
                                         + "<form method='POST'>"
                                         + "<ul class='list-group'>"                                        
                                         + "<h2 class='h6 ml-2 mt-2'>Pauta #"+(count+1) 
                                         + "<button formaction='./app/controller/deletepauta.jsp?id="+listaPauta.get(count).getId()+"&id_r="+listaReuniao.get(num).getId()+"'class='close mr-2'>x</button>"+"</h2>"
                                         + "<li class='list-group-item rounded text-justify'>"+listaPauta.get(count).getPauta()+"</li>"  
                                         + "</ul>"
                                         + "</form>"
                                         + "</div>");                            
                                     }
                            }else{
                                   out.print("<h3 class='h5 text-center mt-5 mb-5'><i class='far fa-lg fa-edit mr-2'></i>Vamos adicionar alguma pauta? :)</h5>");
                          }
                             
                      %>
                       
                         </div>
                          <form method="POST">
                          <div class="input-group mb-3 mt-4">                         
                             <% out.print("<textarea class='form-control rounded box' name='InputPauta' placeholder='Escreva sua pauta...' rows='5'></textarea>"); %>
                                 <div class="input-group-append">
                                     <% out.print("<button type='submit' formaction='./app/controller/insertpauta.jsp?id="+listaReuniao.get(num).getId()+"' class='btn btn-outline-success'>Enviar</button>"); %>
                                 </div>
                         
                          </div>  
                          </form>  
                               
                  </div> 
                                 
                
                
                      <!-- <table class="mr-auto ml-auto mt-5 text-center">                                 
                             <tr><td><img src="./app/src/img/task.png" height="50%"></img></td></tr>
                               <tr> 
                                  <td>   
                                      <div class="mt-4">  
                                         <h3> Essa Reunião foi cancelada ou não existe!</h3>
                                          <a style="font-size: 52px;">  :(  </a>                          
                                    </div>
                                 </td>
                              </tr>
                        </table> -->
           
           
                   
         </div>
          
            <% } %> 

