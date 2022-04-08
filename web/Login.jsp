
<%@include file="index.jsp" %>
<%@page  autoFlush="true" buffer="1094kb" %>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <link rel="icon" href="https://webdevtrick.com/wp-content/uploads/logo-fb-1.png" type="image/x-icon">
	<meta name="viewport" content="width=device-width,initial-scale=1.0">
	<meta name="author" content="Anuj Sundriyal/Ayushi Sundriyal">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://app.creatopy.com/share/d/eg7lm3dxznkq"></script>
<style>
    body
    {
        background-color:#E5E4E2;
    }
    
    #inner{
        background-color:white;
        min-width:250px;
        height:450px;
        padding:40px;
    }
</style>
    </head>
    <body>
        <% 
         response.setContentType("text/html");
        %>
        <div id="danger" class="container">
            
        </div>
        <br>
        
            <br>
            <div class="container shadow col-sm-4" id="inner">
                
                
            <form>
                <br><br><br>
                <div>
                    <input type="text" placeholder="Enter Your Email" required="required" id="Email" class="form-control">
                    <strong><span id="email" style="color:red;font-size:13px"></span></strong><br>
                </div> 
                <br>
                 <div>
                    <input type="password" placeholder="Enter Your Password" required="required" id="password" class="form-control">
                    <strong><span id="pass" style="color:red;font-size:13px"></span></strong><br>
                </div>
                <br>
                <div class="d-grid gap-2" >
                    <input type="Submit" value="Sign In" class="btn btn-info" id="submit" style="color:white;font-weight:600;">
                </div>
                <div><br>
                    <a href="forget.jsp">Forget Password ?</a>
                </div>
            </form>
            </div>
       
    </body>
    <script>
        $(document).ready(function(){
            
            	 
	$("#submit").click(function(){ 
     var Email=$("#Email").val();
    
	  var Password=$("#password").val();
	
	  var req=new XMLHttpRequest();
	  req.open("POST","Loginn.jsp?Email="+Email+"&Password="+Password+"",true);
          
	  req.send();
	  req.onreadystatechange =()=>{
           
	     if(req.readyState === 4 && req.status==200)
	    {
                
              location.href="Dashboard.jsp";
	     }
            
	    else if(req.status==201)
	    {
                
	      document.getElementById("danger").innerHTML="<div class='alert alert-danger'>Wrong Creditional</div>";
	    }
	  }
          return false;
	 }); 
            
            
            
            
            
            
            
            
            
            
            
            
            
            
           $('#Email').keyup(function(){
	var pass=$('#Email').val();
	 var pass1=/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+[.]([a-zA-Z0-9-])*$/;
    
     if(pass==" ")
    {
       document.getElementById("email").innerHTML="***Empty Field not Allowed";
        return false;
        }
    else if(pass1.test(pass))
    {
        document.getElementById("email").innerHTML="";
    }
   
    else
    {
        document.getElementById("email").innerHTML="***Email Should in Correct Patter example Itfetch1234@gmail.com";
        return false;
    }
 });
 
 
 $('#password').keyup(function(){
	var pass=$('#password').val();
	 var pass1=/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@#@$])(?=.{8,})/;
    if(pass==" ")
    {
       document.getElementById("pass").innerHTML="***Empty Field not Allowed";
        return false;
        }
        else if(pass1.test(pass))
    {
        document.getElementById("pass").innerHTML="";
    }
    
    else
    {
        document.getElementById("pass").innerHTML="***Password must have 1 Capital letter atleast 1 number and 1 special character";
        return false;
    }
 });
 return false;
	}); 
       
    </script>
</html>
