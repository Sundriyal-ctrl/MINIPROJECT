<%-- 
    Document   : receive
    Created on : 18 Sep, 2021, 7:34:18 PM
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
       
       <% 
           try{
        int opt=Integer.parseInt(request.getParameter("otp"));
         Connection con=Connectionmaker.maker();
        PreparedStatement pt=con.prepareStatement("select ott from opt where ott=?");
        pt.setInt(1,opt);
        ResultSet rt=pt.executeQuery();
        boolean b=rt.next();
         if(b){
             response.sendError(200);
            
         }
         else{
             response.sendError(201);
         }
           }catch(Exception e)
           {
                   
                   }
       %>
    </body>
</html>
