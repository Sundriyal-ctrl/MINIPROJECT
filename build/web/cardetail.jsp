<%-- 
    Document   : cardetail
    Created on : 22 Oct, 2021, 7:17:38 PM
    Author     : HP
--%>

<%@page import="Mailing.InformMail"%>
<%@page import="mysqlconnection.Connectionmaker"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date"%>
<%@page import="static mysqlconnection.connection.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            System.out.println("Welcome");
           String from=request.getParameter("from");
           String destination=request.getParameter("destination");
           int seat=Integer.parseInt(request.getParameter("seat"));
           int price=Integer.parseInt(request.getParameter("price"));
           String vechialNo=request.getParameter("vehicleNo");
           String d=request.getParameter("date");
           try
           {
             Connection con=Connectionmaker.maker();
             PreparedStatement pt=con.prepareStatement("insert into booking(source,destination,daate,price,vechicle,seat,idd,status) values(?,?,?,?,?,?,?,?)");
            pt.setString(1,from);
            pt.setString(2,destination);
            pt.setString(3,d);
            pt.setInt(4,price);
            pt.setString(5,vechialNo);
            pt.setInt(6,seat);
             
           pt.setString(7,(String)application.getAttribute("idd"));
           pt.setInt(8,0);
            pt.execute();
           PreparedStatement pt1 =con.prepareStatement("select *from login1");
           ResultSet rt=pt1.executeQuery();
           while(rt.next())
           {
               InformMail m=new InformMail();
               m.send(rt.getString("Email"),rt.getString("Name"));
           }
           }
           catch(Exception e)
           {
            out.println(e);   
           } 
        %>
    </body>
</html>
