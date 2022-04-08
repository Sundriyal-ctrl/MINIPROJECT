<%-- 
    Document   : personalinfo
    Created on : 31 Oct, 2021, 2:47:22 PM
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
        <%! ResultSet rt=null; %>
       <%   
           int id=Integer.parseInt(request.getParameter("id"));
        try{
             Connection con=Connectionmaker.maker();
            PreparedStatement pt=con.prepareStatement("select *from login1 where id=?");
            pt.setInt(1,id);
            rt=pt.executeQuery();
             while(rt.next()){
            %>
            <div class="card shadow alert alert-success" style="width:400px;height:230px;margin:20px">
 <h5>PERSONAL INFORMATION</h5>
 <hr>
 <%  System.out.println(rt.getString("Number")); %>
 <span><strong>UserName            : <%=rt.getString("Name")%></strong></span><br>
 <span><strong>Email            : <%=rt.getString("Email")%></strong></span><br>
 <span><strong>Phone      :<%=rt.getString("Number")%></strong> </span>
</div>
            <%
             }
        }catch(Exception e)
        {
            
        }
       %> 
       
    </body>
</html>
