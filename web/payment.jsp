<%@page import="mysqlconnection.Connectionmaker"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="index.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.*" %>  
 <%
 	Random randomGenerator = new Random();
	int randomInt = randomGenerator.nextInt(1000000);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Merchant Check Out Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="GENERATOR" content="Evrsoft First Page">
<link rel="icon" href="https://webdevtrick.com/wp-content/uploads/logo-fb-1.png" type="image/x-icon">
	<meta name="viewport" content="width=device-width,initial-scale=1.0">
	<meta name="author" content="Anuj Sundriyal/Ayushi Sundriyal">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" integrity="sha512-vKMx8UnXk60zUwyUnUPM3HbQo8QfmNx7+ltw8Pm5zLusl1XIfwcxo8DbWCqMGKaWeNxWA8yrx5v3SaVpMvR3CA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
<style>
         
.trap  
{
	background-color:black !important; 
   
    
 
}

.up{
    margin-top:10%; 
    margin-left:10%;
    margin-right:10%; 
}
#loading
{
   
	-webkit-animation: rotation 3s infinite linear;
	font-size:50px;
        -webkit-animation: color-change 3s infinity;
       transition:all 0.5s  ease-in;
       
}

@-webkit-keyframes rotation
{
  font-variant-numeric:{
      
 -webkit-transform :rotate(0deg);
        }
   to{
-webkit-transform: rotate(360deg);
	}
}

 #loading:hover
{
   
	-webkit-animation: rotation 3s infinite linear;
	font-size:55px;
        color:deepskyblue;
       
}
@-webkit-keyframes  color-change
{
    0%{color:red;}
    50%{color:blue;}
    100%{color:red;}
    
    
    
    
    
}

  </style>
</head>
<body>
	
 <!navbar start--->   
    
      
    
    
<!---navbar end--->	
<br>
<div class="container col-sm-4" id="print">
<div class="shadow border" style="padding:20px;">
    <h5 style="color:blue">Your Detail</h5><br>
    <span>Source :  <%= request.getParameter("source") %></span><br>
    <span>Destination :  <%= request.getParameter("destination")%></span><br>
    <span>Price :  <%= request.getParameter("price")%></span><br>
    <span>Date :  <%= request.getParameter("date")%></span><br>
    <span>Invoice No  : <%=  randomInt %></span><br>
    <span>Invoice Date  : <% Date d=new Date();out.println(d); %></span><br>
    <span>Total Bill  : <%= request.getParameter("price")%></span>
    <br>
    <button class="btn btn-info" onclick="print()">Download Invoice</button>
</div>
</div>
   
<section class="up">
	<form method="post" action="pgRedirect.jsp">
	
				
				 <input id="ORDER_ID" tabindex="1" 
						name="ORDER_ID" autocomplete="off" class="form-control"readonly
						value="ORDS_<%= randomInt %>" type="hidden" >
				
					
                                            <input id="CUST_ID" tabindex="2"class="form-control"  readonly  name="CUST_ID" autocomplete="off" value="CUST001" type="hidden">
				
					
<input id="INDUSTRY_TYPE_ID"class="form-control"  readonly  name="INDUSTRY_TYPE_ID" autocomplete="off" value="Retail" type="hidden">
				
					
					<input id="CHANNEL_ID" tabindex="4" 
						 name="CHANNEL_ID"class="form-control" autocomplete="off" value="WEB" readonly type="hidden">
		       
                                       <%  
                                             
                                              
                                String orderid=request.getParameter("ORDER_ID");
                                Connection cot = null;
                           try
                      {
                           
                     cot=Connectionmaker.maker();
   
  
                       PreparedStatement pt = cot.prepareStatement("select price from booking where id=?");
                       pt.setInt(1,Integer.parseInt(request.getParameter("id")));
                    ResultSet rt = pt.executeQuery() ;
                                            if(rt.next())
                                            {
                                            %>
                             <input title="TXN_AMOUNT" class="form-control"
						type="text" name="TXN_AMOUNT"
                                                value="<%=rt.getString("price")%>" readonly type="hidden">       
                                            <%
                                            }}catch(Exception e)
                                          {}%>
                                           <input value="Continue Payment"class="btn btn-info" type="submit"> 
			
		
	</form>
                                                 
</section>
                            
  
</body>
<script>
    function print()
    {
       var printContent=document.getElementById("print").innerHTML;
       w=window.open();
       w.document.write(printContent);
       w.print();
       
    }
    </script>
</html>