<%@page import="br.com.app.model.Usuario"%>
<%@page import="br.com.app.dao.UsuarioDAO"%>
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
           <h3 class="h3"> Ata da Reuniao - <% out.print(listaReuniao.get(num).getTitulo()); %></h3>                                     
                                                                         
          
    <div class="input-group-append">
        
            <div class="input-group-text ">
                 <h5 class="h5 m-auto">Data: <%=today%> </h5>      
             </div>                    
      </div>
        </div>
         
         <div class="container-fluid container">
                   <div class="container-no-padding border bg-light"> 
                       <div class="col-sm-auto overflow-auto p-1 " style="max-height: 800px;"> 
                         
                               <li class="list-group-item text-center ">                                                           
                                <a class="h5 text-center ">ATA da Reunião - <%out.print(listaReuniao.get(num).getTitulo());%></a> 
                                </li>
                            <table class="table table-bordered table-white table-responsive-sm" style="margin-bottom: 3px;">                                                                                          
                               <thead>
                                 <tr>
                                 <th><a class="h6">Nome: <%out.print(Usuario.getNome());%></a> </th>
                                 <th><a class="h6">Horário: <%out.print(listaReuniao.get(num).getHoraInicial()+" ~ "+listaReuniao.get(num).getHoraFinal()+" hrs");%></a></th>
                                 <th><a class="h6">Duracão: <%out.print(listaReuniao.get(num).getDuracao()+" hrs");%></th>
                                 <th><a class="h6">Data: <%out.print(listaReuniao.get(num).getData());%></a></th>                                
                             </tr>
                              </thead>                           
                           </table>
                              <li class="list-group-item text-center">
                                   <a class="h6 text-center "> Assuntos Discutidos </a> 
                              </li>                              
                          
                          <%   if(!listaPauta.isEmpty()){
                           for (int count = 0; count < listaPauta.size(); count++){                           
                           %> 
                           <ul class="list-group text-left mb-1 mt-1">
                               <li class="list-group-item text-left ">   
                          <%
                           
                           out.print("<a class='h6'> Pauta #"+(count+1)+":</a> "+listaPauta.get(count).getPauta());
                           %>
                               </li>
                            <li class="list-group-item text-left "> 
                           <%
                           out.print("<a class='h6'> Definido:</a> "+listaPauta.get(count).getComentario());
                          %>
                            </li>
                           </li>   
                           </ul>
                           <%
                           }        
                            }else{
                                   out.print("<h3 class='h5 text-center mt-5 mb-5'><i class='far fa-lg fa-edit mr-2'></i> Não foi encontrado nenhuma pauta!</h5>");
                          }                             
                      %>                       
                                                       
                         
                          </div>  
                         
                           
                  </div> 
    
         </div>
          
                                 
                                 
                                 
                                 
                                 
                                 
   <% } %> 
