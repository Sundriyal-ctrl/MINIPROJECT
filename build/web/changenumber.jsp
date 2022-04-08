<%-- 
    Document   : changenumber
    Created on : 31 Oct, 2021, 3:00:25 PM
    Author     : HP
--%>

<%@page import="mysqlconnection.Connectionmaker"%>
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
         long number=Long.parseLong(request.getParameter("number"));
            try{
             Connection con=Connectionmaker.maker();
             PreparedStatement pt=con.prepareStatement("update login1 set Number=? where id=?");
             System.out.println(number+" "+application.getAttribute("idd"));
           
             
            
            pt.setLong(1,number);
           
         pt.setObject(2,application.getAttribute("idd"));  
           pt.execute();
         
            }catch(Exception e)
            {
                System.out.println(e.getMessage());
            }
            
                    
        %>
    </body>
</html>
