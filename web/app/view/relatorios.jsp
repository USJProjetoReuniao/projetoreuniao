<%@page import="java.util.ArrayList"%>
<%@page import="br.com.app.controller.*"%>
<%@page import="br.com.app.model.*"%>
<%@page import="br.com.app.dao.*"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%               
             Date d  = new Date(); String today=DateFormat.getDateInstance().format(d);            
             ReuniaoDAO red = new ReuniaoDAO();
             PautaDAO  pad = new PautaDAO();
 %>
          
            <div class="d-flex justify-content-between  flex-wrap flex-md-nowrap  align-items-center pt-3 pb-2 mb-3 border-bottom">
           
       <h1 class="h2"> Relatórios </h1>                                     

               <div class="input-group-append">
                        <div class="input-group-text ">
                            <h5 class="h5 m-auto">Data: <%=today%> </h5>      
                        </div>                     

                 </div>
              </div>
             
             <div class="container-fluid">
                 
                 <table class="table text-center col-auto table-responsive-md shadow-sm">
                    
                         <thead class="table table-grey table-hover rounded-top  ">
                             <tr>
                                 <th>Titulo da Reunião</th><th>Data da Reunião</th><th>Inicio/Fim da Reunião</th><th>Duração da Reunião</th>
                             </tr>
                         </thead>
                         <tbody>
                            <%      
                                ArrayList<Reuniao> lista = red.listarTodos();                           
                                CalculoHoras h = new CalculoHoras();
                                    for(int num=0; num < lista.size(); num++){                                    
                                         out.print("<tr><th>"+lista.get(num).getTitulo()+"</th><th>"+lista.get(num).getData()+"</th><th>"+lista.get(num).getHoraInicial()+" ~ "+lista.get(num).getHoraFinal()+"</th><th>"+lista.get(num).getDuracao()+"</th></tr>");

                                    }                                  
                                 %>
                                 </tbody>
                                 <thead class="table table-sm table-info" >
                                      <tr><th></th><th></th><th></th><th>Total de Horas</th></tr>
                                       </thead> 
                                       <tbody class=" border-bottom table-sm  ">
                            <%    
                                for(int num=0; num < lista.size(); num++){
                                       h.Adicionar(lista.get(num).getDuracao());                                    
                                   }         
                        out.print("<tr><th></th><th></th><th></th><th>"+h.getHoras()+"</th></tr>");                                         
                           %>                          
                       </tbody>
                     </table>                     
                 </table>                 
             </div>
         
      
      

