<%@page import="mysqlconnection.Connectionmaker"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page  autoFlush="true" buffer="1094kb" %>
<%@include file="index.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel="icon" href="https://webdevtrick.com/wp-content/uploads/logo-fb-1.png" type="image/x-icon">
	<meta name="viewport" content="width=device-width,initial-scale=1.0">
	<meta name="author" content="Anuj Sundriyal/Ayushi Sundriyal">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" integrity="sha512-vKMx8UnXk60zUwyUnUPM3HbQo8QfmNx7+ltw8Pm5zLusl1XIfwcxo8DbWCqMGKaWeNxWA8yrx5v3SaVpMvR3CA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style>
    
    button a
    {
        text-decoration:none;
        color:white;
    }
    #b{
        background-color:whitesmoke;
    }
    </style>
    </head>
    <body id="b">
        <br><br>
        <%!  int id=0; %>
        <%
             try{
             Connection con=Connectionmaker.maker();
            PreparedStatement pt=con.prepareStatement("select *from booking where source=? and destination=? and daate=?");
             pt.setString(1,(String)application.getAttribute("source"));
            pt.setString(2,(String)application.getAttribute("destination"));
             pt.setString(3,(String)application.getAttribute("date"));
           // System.out.println(application.getAttribute("source")+" "+application.getAttribute("destination")+""+application.getAttribute("date"));
           ResultSet rt=pt.executeQuery();
            
            %>
        <div class="container " style="margin-right:100px">
            <div class="container   shadow">
            <br>
            <h4 class="text-center" style="font-weight:800">AVAILABLE CARS CHECK CHOOSE AND BOOK YOUR DRIVE</h4>
            <br>
            </div>
            <hr>
            <table class="table table-responsive ">
                <thead  class="table-dark">
                    <tr>
                <th>FROM</th>
                <th>DESTINATION</th>
                <th>SEAT</th>
                <th>DATE</th>
                <th>PRICE</th>
                <th>ORDER</th>
                    </tr>
                </thead>
                <tbody style="background-color:white">
                    <%
               
                   while(rt.next())
                   {
                       if(rt.getInt("status")==0){
                      id=(int)rt.getInt("id");
                       %>
                     
                    <tr>
                        <td><%=rt.getString("source")%></td>
                         
                         <td><%=rt.getString("destination")%></td> 
                         <td><%=rt.getString("seat")%></td> 
                          <td><%=rt.getString("daate")%></td> 
                         <td><%=rt.getString("price")%></td> 
                        <%
                          int s=rt.getInt("id");
                          String source=rt.getString("source");
                          String destination=rt.getString("destination");
                          int price=rt.getInt("price");
                          String date=rt.getString("daate");
                          application.setAttribute("idd",rt.getInt("idd"));
 out.println("<td><button class='btn btn-info'><a href='customerregistration.jsp?id="+s+"&source="+source+"&destination="+destination+"&price="+price+"&date="+date+"'>Confirm</a></button></td>");
                         %>
                    </tr>
                    <%  
                       }
                   }
                   System.out.println("Hello");
                    %>
                    
            </tbody>
                 </table>
                <%
                   
             con.close();
             }
             catch(Exception e)
             {
                 out.println(e.getMessage());
             } 
             
                %>
           
        </div>
    </body>
</html>
