<%@page import="br.com.app.model.Pauta"%>
<%@page import="br.com.app.model.Reuniao"%>
<%@page import="br.com.app.dao.PautaDAO"%>
<%@page import="br.com.app.dao.ReuniaoDAO"%>
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
                 
                 <table class="table text-center col-auto table-responsive-md">
                    
                         <thead class="table table-grey table-hover ">
                             <tr>
                                 <th>1</th><th>2</th><th>3</th>
                             </tr>
                         </thead>
                         <tbody>
                             <tr><td>testeste</td><td>testte</td><td>tesrte</td></tr>
                             <tr><td>testeste</td><td>testte</td><td>tesrte</td></tr>  
                          
                         </tbody>
                     </table>

                    
                 
                     
                     
                 </table>
                 
             </div>
         
      
      

