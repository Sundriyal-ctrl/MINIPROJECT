<%@page import="mysqlconnection.Connectionmaker"%>
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
             PreparedStatement pt=con.prepareStatement("update login1 set Password=? where id=?");
             System.out.println(request.getParameter("pass")+" "+application.getAttribute("idd"));
            pt.setString(1,request.getParameter("pass"));
            pt.setString(2,(String)application.getAttribute("idd"));
            
           pt.execute();
          }catch(Exception e)
          {
              System.out.println(e.getMessage());
          }
        %>
    </body>
</html>
