<%-- 
    Document   : Data
    Created on : 17 Oct, 2021, 1:42:51 PM
    Author     : HP
--%>

<%@page import="mysqlconnection.Connectionmaker"%>
<%@page import="java.sql.*"%>
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
             PreparedStatement pt=con.prepareStatement("select *from booking where source=? and destination=? and daate=? and status=?");
            String source=request.getParameter("source");
            String destination=request.getParameter("destination");
           
        String date=request.getParameter("date");
           // String date=request.getParameter("date");
            pt.setString(1,source.toLowerCase());
            pt.setString(2,destination.toLowerCase());
            
             application.setAttribute("source",source);
             application.setAttribute("date",date);
             application.setAttribute("destination",destination);
             System.out.println();
            pt.setString(3,date);
            pt.setInt(4,0);
            ResultSet rt=pt.executeQuery();
            boolean b=rt.next();
            if(b)
            {
               
               
                %>
                <hr>
                <br><br>
                
                <%
                       response.setStatus(200);
            }
            else
            {
                response.setStatus(201);
            }
            }
            catch(Exception  e)
            {
             response.setStatus(201);
            }
         %>
    </body>
</html>
