<%-- 
    Document   : image
    Created on : 4 Nov, 2021, 1:34:50 PM
    Author     : HP
--%>

<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
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
      
     BufferedReader f=new BufferedReader(new FileReader(request.getParameter("image")));//file is put as character stream
     Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306","root","");
     PreparedStatement pt=con.prepareStatement("insert into image values(?,?)");
     pt.setString(1,(String)application.getAttribute("idd"));
     System.out.println(f);
     pt.setCharacterStream(2,f);
     pt.executeUpdate();
     f.close();
    
     PreparedStatement stt=con.prepareStatement("select * from filename where id=34");
     ResultSet rt=stt.executeQuery();
     rt.next();
     BufferedWriter f2=new BufferedWriter(new FileWriter("C:\\Users\\HP\\Desktop\\MINIPROJECT\\profile.jpg"));
     f2.write(rt.getString(2));
     f2.close();
     BufferedReader f3=new BufferedReader(new FileReader("C:\\Users\\HP\\Desktop\\MINIPROJECT\\profile.jpg"));
     String i;
     while((i=f3.readLine())!=null)
     {
         System.out.println(i.toString());
        
     }
    f3.close();
    }catch(Exception e)
    {
      System.out.println(e.getMessage());
    }
       %>
    </body>
</html>
