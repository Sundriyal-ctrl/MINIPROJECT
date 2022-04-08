<%@page import="Mailing.QueryMail"%>
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
            try
            {
               
                Connection con=Connectionmaker.maker();
                PreparedStatement pt=con.prepareStatement("insert into Message(Email,UserName,Message) values(?,?,?)");
                String mail=request.getParameter("Email");
                String name=request.getParameter("UserName");
                pt.setString(1,mail);
                pt.setString(2,name);
                pt.setString(3,request.getParameter("Message"));
                int a=pt.executeUpdate();
                if(a>0){
                    QueryMail m=new QueryMail();
                    m.send(mail,name);
                    response.sendError(200);
                }
                else
                    response.sendError(201);
            }catch(Exception e)
            {
              response.sendError(201);   
            }
            
            %>
    </body>
</html>
