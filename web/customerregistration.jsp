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
   
</style>
    </head>
    <body style="background-color:whitesmoke">
        <%
            application.setAttribute("id1",request.getParameter("id"));
            application.setAttribute("source1",request.getParameter("source"));
            application.setAttribute("destination1",request.getParameter("destination"));
            application.setAttribute("price1",request.getParameter("price"));
            application.setAttribute("date1",request.getParameter("date"));
            String s=request.getParameter("id");
            %>
        <br>
        <div class="container  col-sm-5 shadow" style="background-color:white" id="d">
            <div id="danger"></div>
            <br>
            <div class=>
                
                <h4 class="text-center" > REGISTERED YOUR SELF</h4>
                <hr>
            </div>
            <div>
                
                <form action="customerRegistrationGet.jsp" method="post">
                    <input type="text" placeholder="Enter Name" name="Name" class="form-control" required="" id="Name">
                 <strong><span id="name" style="color:red;font-size:13px"></span></strong>
                <br>
                <input type="text" placeholder="Enter Email" name="Email" class="form-control" required="" id="Email">
                 <strong><span id="email"  style="color:red;font-size:13px"></span></strong> 
                <br>
                <input type="text" placeholder="Create Password" name="Password" class="form-control" id="Password" required="">
                  <strong><span id="pass" style="color:red;font-size:13px"></span></strong>
              <br>
                <input type="text" placeholder="Enter Adhar Number" name="Adhar" class="form-control" required="" id="Adhar">
                 <strong><span id="adhar" style="color:red;font-size:13px"></span></strong>
                <br>
                <input type="text" placeholder="Enter Number" name="Number" class="form-control" required="" id="Number">
                <strong><span id="num" style="color:red;font-size:13px"></span></strong>
                <br>
                <input type="text" placeholder="Enter Vechicle Nnumber" name="VehicleNo" class="form-control" required="" id="VehicleNo">
                <strong><span id="veh" style="color:red;font-size:13px"></span></strong>
               
                <details>
                    <summary>Declareation</summary>   
                <span><strong>I hereby declare that the information given in this application is true and correct to the best of my knowledge and belief. In case any information given in this application proves to be false or incorrect, I shall be responsible for the consequences.</strong></span>
                </details>
                <br>
               
                <input type="submit" value="Submit" class="btn bg-warning" id="regsub" style="width:100%">
                <br><br>
               
                
                </form>
                <span>if already have account ?<% out.println("<a href='PayLogin.jsp?id="+s+"'>Login</a>");%></span>
                <br><br>
            </div>
        </div>
        
    </body>
    <script>
        let nu=0;
        let em=0;
        let ve=0;
        let pa=0;
        let ad=0;
        let d=0;
        let na=0;
        $(document).ready(function(){
            
        
      
	 
        
        
        $('#Email').keyup(function(){
   var pass=$('#Email').val();
    var pass1=/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+[.]([a-zA-Z0-9-])*$/;
    if(pass1.test(pass))
    {
        document.getElementById("email").innerHTML="";
        em=1;
    }
    else if(pass=="")
    {
        document.getElementById("email").innerHTML="***Empty Field not allowed.";
em=0;
        return false;
    }
    else
    {
        document.getElementById("email").innerHTML="***email should be correct.";
em=0;
        return false;
    }
    return false;
    
});

//Password validation


$('#Password').keyup(function(){
    var pass=$('#Password').val();
    var pass1=/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[@#@$])(?=.{8,})/;
    if(pass1.test(pass))
    {
        document.getElementById("pass").innerHTML="";
        pa=1;
    }
    else if(pass=="")
    {
        document.getElementById("pass").innerHTML="***Empty Field not allowed.";
pa=0;
        return false;
    }
    else
    {
        document.getElementById("pass").innerHTML="***Enter 1 capital letter and atleast 1 number and length should be 8 and One Special Character";
        pa=0;
            return false;
    }
 });


//Adhar
$('#Adhar').keyup(function(){
	var pass=$('#Adhar').val();
	 var pass1=/^[0-9]{12}$/;
    if(pass1.test(pass))
    {
        document.getElementById("adhar").innerHTML="";
        ad=1;
    }
    else if(pass=="")
    {
       document.getElementById("adhar").innerHTML="***Empty Filed not Allowed";
       ad=0;
        return false;
        }
    else
    {
        document.getElementById("adhar").innerHTML="***length must 12";
        ad=0;
        return false;
    }
 });
 $('#Number').keyup(function(){
	var pass=$('#Number').val();
	 var pass1=/^[0-9]{10}$/;
    if(pass1.test(pass))
    {
        document.getElementById("num").innerHTML="";
        nu=1;
    }
    else if(pass=="")
    {
       document.getElementById("num").innerHTML="***Empty Filed not Allowed";
          nu=0;
            return false;
        }
    else
    {
        document.getElementById("num").innerHTML="***length must 10";
        nu=0;
        return false;
    }
 });
 $('#VehicleNo').keyup(function(){
	var pass=$('#VehicleNo').val();
	 var pass1=/^[A-Z]{2}[0-9]{2}[A-Z]{2}[0-9]{4}$/;
    if(pass1.test(pass))
    {
        document.getElementById("veh").innerHTML="";
        ve=1;
    }
   
    else
    {
        document.getElementById("veh").innerHTML="***length must 10";
        ve=0;
        return false;
    }
 });
  $('#Name').keyup(function(){
	var pass=$('#Name').val();
	 var pass1=/^[A-Za-z ]{4,}$/;
    if(pass1.test(pass))
    {
        document.getElementById("name").innerHTML="";
        na=1;
    }
    else if(pass=="")
    {
       document.getElementById("name").innerHTML="***Empty Filed not Allowed";
       na=0;
        return false;
        }
    else
    {
        document.getElementById("name").innerHTML="***length must be 4 and maximum 10";
        na=0;
            return false;
    }
 });
 return false;
	});
         
         $(document).ready(function(){
      $("#regsub").click(function(e){
          if(nu==0)
          {
              alert("Number Validation Fail");
              e.preventDefault();
              return false;
          }
           else if(em==0)
          {
              alert("Email Validation Fail");
              e.preventDefault();
              return false;
          }
            else if(na==0)
          {
              alert("Name Validation Fail");
              e.preventDefault();
              return false;
          }
            else if(ad==0)
          {
              alert("Adhar Validation Fail");
              e.preventDefault();
              return false;
          }
            else if(ve==0)
          {
              alert("Vechicle Validation Fail");
              e.preventDefault();
              return false;
          }
            else if(pa==0)
          {
              alert("Password Validation Fail");
              e.preventDefault();
              return false;
          }
            else if(da==0)
          {
              alert("DOB Validation Fail");
              e.preventDefault();
              return false;
          }
      });  
    });
                
        
  
    </script>
</html>
