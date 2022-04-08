
<%@page  pageEncoding="UTF-8"%>
<%@include file="index.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
  #outer
    {
        height:430px;
    }
    #inner{
        height:350px;
    }  
    
</style>
    </head>
    <body>
        
        <br><br><br>
        <div id="danger"class="container">
            
        </div>
        <div class="shadow col-sm-7 container" id="outer"><br><br>
            <div class="shadow col-sm-10 container" id="inner"><br>
                <h4>FORGET PASSWORD </h4>
                <form>
                    <input type="text" placeholder="Enter Registered Email" required="" class="form-control" id="Email">
                    <strong><span id="email" style="color:red;font-size: 13px;"></span></strong>
                    <br><br>
                    <input type="number" placeholder="Enter OTP" required="" class="form-control" id="OTP">
                    <strong><span id="otp" style="color:red;font-size: 13px;"></span></strong>
                    <br><br>
                    <span>
                    <input type="submit" class="btn btn-success" value="SEND OTP TO EMAIL" id="submit">
                    <input type="submit" class="btn btn-info" value="VERIFY OTP" id="OTPP"></span>
                </form>
            </div>
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
                
	      document.getElementById("danger").innerHTML="<div class='alert alert-danger'>Wrong OTP please recheck your otp</div>";
	    }
	  }
          
          
          
          
          return false;
	 }); 
            
           
            $("#OTPP").click(function(){ 
     var Email=$("#OTP").val();
	
	  var req=new XMLHttpRequest();
	  req.open("POST","receive.jsp?otp="+Email+"",true);
          
	  req.send();
	  req.onreadystatechange =()=>{

	    if(req.readyState === 4 && req.status==200)
	    {
                
              window.location.href="Changepassword.jsp";
	 
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
