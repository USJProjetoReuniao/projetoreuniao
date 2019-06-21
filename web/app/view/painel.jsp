
<%@page import="br.com.app.controller.ReuniaoErro"%>
<%@page import="javax.management.RuntimeErrorException"%>
<%@page import="javafx.scene.input.DataFormat"%>
<%@page import="java.text.*,java.util.*"%>
<%@page import="br.com.app.model.Reuniao" %>
<%@page import="br.com.app.dao.ReuniaoDAO" %>


<% 
   Date d  = new Date(); String today=DateFormat.getDateInstance().format(d);
      
%>

     <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
     <h1 class="h2">Painel de Reuniões</h1>  
     
       <% 
           ReuniaoErro rec = new ReuniaoErro();   
           Reuniao reu = new Reuniao();
           
           
            if(rec.getCtrl().equals(false)){
               out.print("<span id='infoErro' class='box border p-2 text-danger shadow-0'>"+rec.getInfo()+"</span>");  
               rec.setCtrl(true);                    
            }       

       %>     
       
      <div class="input-group-append">
          <form method="post">              
             <div class="rounded border mr-2"> 
                 
                 <input type="text" name="InputSearch" class="p-2 border-0" id="filtro" placeholder="Procurar..." required>                  
        
                <% out.print("<button formaction='./app/controller/procurarreuniao.jsp' class='btn btn-md float-right btn-secondary'> OK </button>");%>
                
            </div>            
          </form>  
             <div class="input-group-text ">
                 <h5 class="h5 m-auto">Data: <%=today%> </h5>      
             </div>
         </div>     
            
      </div>
      
   <div class="modal fade bd-example-modal-lg" id="myModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
           <h4 class="modal-title"><span class="far fa-sticky-note mr-2 fa-1x"></span>Cadastro de Reunião</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
       
        <!-- Modal body -->
       <div class="modal-body">
           <form method="post">
                <div class="form-group">
                   <label for="inputTitle"> Titulo </label>
                   <input type="text" class="form-control" name="InputTitle" maxlength="12" placeholder="Entre com o titulo da reunião." required></input>
                </div>   
                <div class="form-group">
                   <label for="inputTitle">  Data </label>
                   <input type="date" class="form-control" name="InputData"  placeholder="" required ></input>
                </div>
                
                <div class="form-group">
                     
                     <label for="inputTitle"> Inicio da Reunião </label>
                     <div class="form-inline ">
                     <input type="time" class="form-control mr-2" name="InputHour"  placeholder="Entre com a duração programada." required></input>
                     <input type="time" class="form-control" name="InputHour"  placeholder="Entre com a duração programada." required></input>
                     </div>
                </div>
                
                <div class="form-group">
                   <label for="inputTitle">  Categoria </label>
                   <input type="text" class="form-control" name="InputCategory"  placeholder="Entre com a categoria que deseja." required></input>
                </div>
                
                 <div class="form-group">
                   <label for="inputTitle"> Localização </label>
                   <input type="text" class="form-control" name="InputLocal" maxlength="23"   placeholder="Entre com a localização." required></input>
                </div>
               
               
                <!-- Modal footer -->
                <div class="modal-footer ">
                    <button formaction="./app/controller/insertreuniao.jsp" id="btnCadastro "class="btn btn-success">OK</input>
              
                     </form>
                  <button type="button" class="btn btn-danger" data-dismiss="modal">Fechar</button>
                </div>
                </div>
              
            </div>
            </div>
           </div>
          </div>
       
   
          <!-- puxando os Cards do banco de dados -->
        
          
            <%  try{   
                
                 ReuniaoDAO red = new ReuniaoDAO();
                      
                 ArrayList<Reuniao> lista = red.listarTodos();
                       
                  if(!lista.isEmpty()){  %>
                 <div class="container-fluid">
                  <h5 class='mt-3'>Reuniões Ativas:</h5>
                  <div class='border-bottom'></div>
                  <div class="row">  

          <%
                    
                 
                      for(int num=0; num < lista.size(); num++){
               
                      //Se as reunioes estiverem ativas...
                          if(lista.get(num).getCancelada().equals(false)){                                        
                            if(lista.get(num).getTitulo().startsWith(reu.getProcurar()) || lista.get(num).getLocalizacao().startsWith(reu.getProcurar())){                     
                    
                                out.print("<div id='card' class='col-xs-2 col-sm-0 '>");
                                out.print("<div class='card box-shadow m-3 box' style='width: 19rem;'>");
                                out.print("<div class='card-header'>");
                                out.print("<a class='h6 font-weight-bold'><span class='fas fa-lg fa-tasks fa-fw mr-2' ></span> Reunião - "+lista.get(num).getTitulo()
                                           
                                            + "<a role='button' href='?page=visualizar&id="+lista.get(num).getId()+"'' class='float-right'>"
                                            + "<i class='fas fa-lg fa-search-plus fa-fw'></i>"                                               
                                            + "</a>"
                                            + "<a href='./app/controller/cancelreuniao.jsp?id="+lista.get(num).getId()+"' class='text-right float-right mr-2'>"
                                            + "<i class='fas fa-lg fa-ban fa-fw'></i>"
                                            + "</a>"
                                            + "</a>");

                                out.print("</div>");

                                // componente aonde se encontra os dados do cartão.

                                out.print("<div class='card-body'>"
                                        + "<ul class='list-group list-group-flush'>"
                                        + "<li class='list-group-item'><i class='far fa-lg fa-clipboard fa-fw mr-2'></i>"+lista.get(num).getCategoria()+"</li>"
                                        + "<li class='list-group-item'><i class='far fa-lg fa-calendar-alt fa-fw mr-2'></i>"+lista.get(num).getData()+"</li>"
                                        + "<li class='list-group-item'><i class='far fa-lg fa-hourglass fa-fw mr-2'></i>"+lista.get(num).getDuracao()+"</li>"
                                        + "<li class='list-group-item'><i class='fas fa-lg fa-map-marked-alt fa-fw mr-2'></i>"+lista.get(num).getLocalizacao()+"</li>"
                                        + "</ul>"                   
                                        + "</div>");

                               // Link de Visualizar a Ata. 

                                out.print("<div class='card-footer'>"
                                        + "<a role='button' class='list-group-item list-group-item-action' href=''>"
                                        + "<i class='far fa-lg fa-comment-alt fa-fw mr-2'></i>"
                                        + "Visualizar Ata"
                                        + "</a>"                                                                            
                                        + "</div>");
                               
                                out.print("</div>");
                                out.print("</div>");
                                     }                      
                          }
                         
                      }
                       
                   %> </div> 
                   <h5 class='mt-3'>Reuniões Canceladas:</h5>
                   <div class='border-bottom'></div>
                   <div class='row'>
             
                 <%   
                 for(int num=0; num < lista.size(); num++){
                     if(lista.get(num).getCancelada().equals(true)){  
                          if(lista.get(num).getTitulo().startsWith(reu.getProcurar()) || lista.get(num).getLocalizacao().startsWith(reu.getProcurar())){      
           // Caso a reunião estiver cancelada.
                             
                                out.print("<div id='card_r_"+lista.get(num).getId()+"' class='col-xs-2 col-sm-0'>");
                                out.print("<div class='card box-shadow m-3' style='width: 19rem; opacity:0.3;'>");
                                out.print("<div class='card-header'>");
                                out.print("<a class='h6 font-weight-bold'><span class='fas fa-lg fa-tasks fa-fw mr-2' ></span> Reunião - "+lista.get(num).getTitulo()
                                           
                                            + "<a href='' class='float-right'>"
                                            + "<i class='fas fa-lg fa-search-plus fa-fw'></i>"                                               
                                            + "</a>"
                                            + "<a href='./app/controller/ativarreuniao.jsp?id="+lista.get(num).getId()+"' class='text-right float-right mr-2'>"
                                            + "<i class='fas fa-lg fa-ban fa-fw'></i>"
                                            + "</a>"
                                            + "</a>");

                                out.print("</div>");

                                 // Componente aonde se encontra os dados do cartão.

                                out.print("<div class='card-body'>"
                                        + "<ul class='list-group list-group-flush'>"
                                        + "<li class='list-group-item'><i class='far fa-lg fa-clipboard fa-fw mr-2'></i>"+lista.get(num).getCategoria()+"</li>"
                                        + "<li class='list-group-item'><i class='far fa-lg fa-calendar-alt fa-fw mr-2'></i>"+lista.get(num).getData()+"</li>"
                                        + "<li class='list-group-item'><i class='far fa-lg fa-hourglass fa-fw mr-2'></i>"+lista.get(num).getDuracao()+"</li>"
                                        + "<li class='list-group-item'><i class='fas fa-lg fa-map-marked-alt fa-fw mr-2'></i>"+lista.get(num).getLocalizacao()+"</li>"
                                        + "</ul>"                   
                                        + "</div>");

                                 // Componente de Visualizar a Ata. 

                              out.print("<div class='card-footer'>"
                                        + "<a role='button' class='list-group-item list-group-item-action' href=''>"
                                        + "<i class='far fa-lg fa-comment-alt fa-fw mr-2'></i>"
                                        + "Visualizar Ata"
                                        + "</a>"                                                                            
                                        + "</div>");
                                out.print("</div>");
                                out.print("</div>");
                                              }                    
                                       }
                     }
                 reu.setProcurar("");
                               }else{   
                         
                             %>

                                <table class="mr-auto ml-auto mt-5 text-center">                                 
                                     <tr><td><img src="./app/src/img/task.png" height="50%"></img></td></tr>
                                       <tr> 
                                          <td>   
                                              <div class="mb-4">  
                                                 <h3> Nenhuma reunião cadastrada.</h3>
                                                  <a> Adicione alguma reunião clicando no botão </a>
                                              <button type="button" data-toggle="modal" data-target="#myModal" class="btn btn-sm btn-success mr-2 rounded">Adicionar</button>.
                                            </div>
                                         </td>
                                      </tr>
                                </table>
                             </div>

                                     <%            
                                              }

                                       }catch (Exception error) {
                                                     throw new RuntimeException("Erro 10: "+error);
                                                 }

                                   %>       
                      </div>
   
