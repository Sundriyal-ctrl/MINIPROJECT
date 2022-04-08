<%-- 
    Document   : deletion
    Created on : 31 Oct, 2021, 6:51:15 PM
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
            Connection con=Connectionmaker.maker();
            PreparedStatement pt=con.prepareStatement("delete from booking where id=?");
             pt.setString(1,request.getParameter("number"));
            
           // System.out.println(application.getAttribute("source")+" "+application.getAttribute("destination")+""+application.getAttribute("date"));
           pt.execute();
          }catch(Exception e)
          {
              
          }
        %>
    </body>
</html>
