<%-- 
    Document   : Otp
    Created on : 18 Sep, 2021, 7:25:42 PM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="mysqlconnection.Connectionmaker"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="Mailing.Mail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <% 
        String Email=request.getParameter("Email");
        try{
         Connection con=Connectionmaker.maker();
        PreparedStatement pt=con.prepareStatement("select Email from login1 where Email=?");
        pt.setString(1,Email);
        ResultSet rt=pt.executeQuery();
       
         application.setAttribute("change",Email);    
        Mail m=new Mail();
        m.Email(Email);
       out.println("<div class='alert alert-success'>Otp is send to Email.....</div>");
       
        }catch(Exception e)
        {
            out.println(e);
        }
       %>
    </body>
</html>
