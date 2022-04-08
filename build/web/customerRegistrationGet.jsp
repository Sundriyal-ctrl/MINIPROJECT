


<%@page import="java.util.Base64"%>
<%@page import="java.io.Serializable"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.Date"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.cfg.*"%>
<%@page import="JavaBean.RegistrationBean"%>
<%@page  import="Mailing.Mail"%>
<%@page  autoFlush="true" buffer="1094kb" %>
<%@include file="index.jsp" %>
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
    #danger1 a{
        text-decoration:none;
    }
</style>
    </head>
    <body>
        <jsp:useBean id="log" class="JavaBean.RegistrationBean"></jsp:useBean>
      <%
            int min=200;
            int max=400;
            Double dd=Math.random()*(max-min+1)+min;
            session.setAttribute("Regis",log);
           Random r=new Random();
           String Name= request.getParameter("Name");
           String Password1=request.getParameter("Password");
           Base64.Encoder en=Base64.getEncoder();
           String Password=en.encodeToString(Password1.getBytes());
           String Email=request.getParameter("Email");
           application.setAttribute("sending",Email);
           long Number=Long.parseLong(request.getParameter("Number"));
           long Adhar=Long.parseLong(request.getParameter("Adhar"));
           String VehicleNo1=request.getParameter("VehicleNo");
            String VehicleNo=en.encodeToString(VehicleNo1.getBytes());
           String check[]=request.getParameterValues("check");
           Date d=new Date();
          
           log.setId(dd);
           log.setName(Name);
           log.setPassword(Password);
           log.setEmail(Email);
           log.setAdhar(Adhar);
           log.setVehicleNo(VehicleNo);
           log.setNumber(Number);
           log.setDate(d);
          
            
        %>
        <br>
        <br>
        <div id="danger"></div>
         <div class="shadow col-sm-7 container" id="outer"><br><br>
            <div class="shadow col-sm-10 container" id="inner"><br>
                <h4>EMAIL VERIFICATION</h4>
                <form>
                    <input type="text"  required="" class="form-control" id="Email" value="<% out.println(Email);%>" readonly="true">
                    <strong><span id="email" style="color:red;font-size: 13px;"></span></strong>
                    <br><br>
                    <input type="number" placeholder="Enter OTP" required="" class="form-control" id="OTP">
                    <strong><span id="otp" style="color:red;font-size: 13px;"></span></strong>
                    <br><br>
                    <span>
                    <input type="submit" class="btn btn-success" value="SEND OTP TO EMAIL" id="submit">
                    <input type="submit" class="btn btn-info" value="VERIFY OTP" id="OTPP"></span>
                </form>
                <br>
            </div>
                    <br>
                     <div id="danger1"></div>
             <br><br>
         </div>
        
    </body>
    <script>
      $(document).ready(function(){
            
            
            
            $("#submit").click(function(){ 
     var Email=$("#Email").val();
	
	  var req=new XMLHttpRequest();
	  req.open("POST","Otp.jsp?Email="+Email+"",true);
          
	  req.send();
	  req.onreadystatechange =()=>{

	    if(req.readyState === 4 && req.status==200)
	    {
                
              document.getElementById("danger").innerHTML=req.responseText;
	 
	     }
	    else
	    {
                
	      document.getElementById("danger").innerHTML="<div class='alert alert-danger'>Wrong Email</div>";
	    }
	  }
          
          
          
          
          return false;
	 }); 
            
           
            $("#OTPP").click(function(){ 
     var Email=$("#OTP").val();
	
	  var req=new XMLHttpRequest();
	  req.open("POST","customerverification.jsp?otp="+Email+"",true);
          
	  req.send();
	  req.onreadystatechange =()=>{

	    if(req.readyState === 4 && req.status==200)
	    {
                
              document.getElementById("danger").innerHTML="<div class='alert alert-success'>Otp Verified Successfully</div>";
              $("#OTP").val(" ");
              document.getElementById("danger1").innerHTML=req.responseText;
	 
	     }
	    else if(req.status==201)
	    {
                
	      document.getElementById("danger").innerHTML="<div class='alert alert-danger'>Wrong OTP please recheck your otp</div>";
	    }
	  }
          
          
          
          
          return false;
	 });     
          
        
        
        
        
            
            
            
            
            
            
            
            
            
          $('#Email').keyup(function(){
	var pass=$('#Email').val();
	 var pass1=/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+[.]([a-zA-Z0-9-])*$/;
    if(pass1.test(pass))
    {
        document.getElementById("email").innerHTML="";
    }
    else if(pass=="")
    {
       document.getElementById("email").innerHTML="***Empty Field not Allowed";
        return false;
        }
    else
    {
        document.getElementById("email").innerHTML="***Email Should in Correct Patter example Itfetch1234@gmail.com";
        return false;
    }
 });
 
   $('#OTP').keyup(function(){
	var pass=$('#OTP').val();
	 var pass1=/^[0-9]{4}$/;
    if(pass1.test(pass))
    {
        document.getElementById("otp").innerHTML="";
    }
    else if(pass=="")
    {
       document.getElementById("otp").innerHTML="***Empty Field not Allowed";
        return false;
        }
    else
    {
        document.getElementById("otp").innerHTML="***Enter your 4 digit OTP";
        return false;
    }
 });
 
 return false;
        });
    </script>
</html>