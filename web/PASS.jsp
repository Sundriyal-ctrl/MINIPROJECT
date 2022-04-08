<%-- 
    Document   : PASS
    Created on : 16 Dec, 2021, 12:52:31 PM
    Author     : HP
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="mysqlconnection.Connectionmaker"%>
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
            String pass=request.getParameter("Pass");
            Base64.Encoder en=Base64.getEncoder();
           String Password=en.encodeToString(pass.getBytes());
             try{
         Connection con=Connectionmaker.maker();
        PreparedStatement pt=con.prepareStatement("update login1 set Password=? where Email=?");
        pt.setString(1,Password);
        pt.setObject(2,application.getAttribute("change"));
        boolean f=pt.execute();
       %>
             <div class="alert alert-success">Password Changed Successfully</div>
         <%   
             }catch(Exception e)
             {
                  response.sendError(201);  
                  System.out.println(e.getMessage());
             }
            %>
    </body>
</html>
