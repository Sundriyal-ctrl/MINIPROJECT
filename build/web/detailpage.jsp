<%-- 
    Document   : detailpage
    Created on : 31 Oct, 2021, 6:37:40 PM
    Author     : HP
--%>

<%@page import="mysqlconnection.Connectionmaker"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">     
      <%
             try{
             Connection con=Connectionmaker.maker();
            PreparedStatement pt=con.prepareStatement("select *from booking where idd=?");
             pt.setString(1,(String)application.getAttribute("idd"));
            
           // System.out.println(application.getAttribute("source")+" "+application.getAttribute("destination")+""+application.getAttribute("date"));
           ResultSet rt=pt.executeQuery();
            
            %>
        <div >
            <br>
            <h4 class="text-center">UPLOAD HISTORY</h4>
            <br>
            <hr>
            <table class="table table-responsive">
                <thead  class="table-light">
                    <tr>
                <th>FROM</th>
                <th>DESTINATION</th>
                <th>DATE</th>
                <th>PRICE</th>
                <th>SEAT</th>
                <th>VECHILE NUMBER</th>
                <th>DELETE</th>
                    </tr>
                </thead>
              
                    <%
               
                   while(rt.next())
                   {
              
                       %>
                       <div>
                    <tr style="background-color:white">
                        <td><%=rt.getString("source")%></td>
                         
                         <td><%=rt.getString("destination")%></td> 
                         <td><%=rt.getString("daate")%></td> 
                         <td><%=rt.getString("price")%></td> 
                         <td><%=rt.getString("seat")%></td> 
                         <td><%=rt.getString("vechicle")%></td> 
                        
                    <form>
                       
                        <td><button id="regsub1" data-id="<%=rt.getString("id")%>" class="btn btn-info">DELETE</button></td>
                    </form>
                    </tr>
                       </div>
                    <%  
                   
                   }
                   System.out.println("Hello");
                    %>
              
                 </table>
                <%
                   
             
             }
             catch(Exception e)
             {
                 out.println(e.getMessage());
             } 
             
                %>
           
     </div>
     
     
 </div>
    </body>
</html>
