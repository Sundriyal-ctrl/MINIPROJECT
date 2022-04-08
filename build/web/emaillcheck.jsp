<%-- 
    Document   : emaillcheck
    Created on : 5 Nov, 2021, 11:46:03 AM
    Author     : HP
--%>

<%@page import="mysqlconnection.Connectionmaker"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
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
         String email=request.getParameter("Email");
         try
         {
              Connection con=Connectionmaker.maker();
             PreparedStatement pt=con.prepareStatement("select *from login1 where Email=?");
             pt.setString(1,email);
             ResultSet rt=pt.executeQuery();
             boolean a=rt.next();
             if(a)
             {
                 response.sendError(201);
             }
             else
                 response.sendError(200);
         }catch(Exception e)
         {
            response.sendError(201); 
         }
      %>
    </body>
</html>
