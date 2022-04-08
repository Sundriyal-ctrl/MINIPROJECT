<%-- 
    Document   : Loginn
    Created on : 25 Sep, 2021, 8:18:16 PM
    Author     : HP
--%>

<%@page import="java.util.Base64"%>
<%@page import="mysqlconnection.Connectionmaker"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.List"%>
<%@page import="JavaBean.LoginBean"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%@page import="org.hibernate.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <jsp:useBean id="log" class="JavaBean.LoginBean"></jsp:useBean>
         
         <% 
         String Email=request.getParameter("Email");  
           String Password1=request.getParameter("Password");
           Base64.Encoder en=Base64.getEncoder();
           String Password=en.encodeToString(Password1.getBytes());
           log.setEmail(Email);
          log.setPassword(Password);
         try{
       
        Connection con=Connectionmaker.maker();
        PreparedStatement pt=con.prepareStatement("select * from login1 where Email=? and Password=?");
        pt.setString(1,Email);
        pt.setString(2,Password);
        ResultSet rt=pt.executeQuery();
        boolean b=rt.next();
         if(b)
         {
          session.setAttribute("name",rt.getString("Name"));
         session.setAttribute("Email",Email);
          session.setAttribute("phone",rt.getString("Number"));
          application.setAttribute("idd",rt.getString("id"));
         response.sendError(200);
         }
         else
         {
             response.sendError(201);
             out.println("<div class='alert alert-danger'>Wrong Creditional</div>");
              
         }
         }catch(Exception e)
         {
              out.println("<div class='alert alert-danger'>"+e.getMessage()+"</div>");
         }
         %>
    </body>
</html>
