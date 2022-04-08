<%-- 
    Document   : Changepassword
    Created on : 16 Dec, 2021, 9:03:42 AM
    Author     : HP
--%>
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
    .col-sm-6{
        margin:auto;
        margin-top:50px;
    }
    </style>
    </head>
    <body>
        <div id="danger"></div>
        <div class="col-sm-6 shadow" style="padding:30px;">
        <div class="shadow" style="padding:40px">
            
            <div>
                <form>
                <input type="text" autocomplete="true" placeholder="New Password" class="form-control" id="npass"><br>
                <span id="npass"></span>
                <br>
                <input type="text" autocomplete="true" placeholder="Confirm Password" class="form-control"id="cpass"><br>
                <span id="npass"></span>
                <br>
                <input type="submit" value="Change Password" class="btn btn-warning" style="color:white" id="regsub">
                </form>
                </div>
            
        </div>
        </div>
    </body>
    <script>
     $(document).ready(function(){
        $("#regsub").click(function(e){
            e.preventDefault();
           var a=$("#npass").val();
           var req=new XMLHttpRequest();
	  req.open("POST","PASS.jsp?Pass="+a+"",true);
          
	  req.send();
	  req.onreadystatechange =()=>{

	    if(req.readyState === 4 && req.status==200)
	    {
                
              document.getElementById("danger").innerHTML=req.responseText;
              $("#npass").val(" ");
	      $("#cpass").val(" ");
	     }
	    else
	    {
                
	      document.getElementById("danger").innerHTML="<div class='alert alert-danger'>Passwor Not Changed</div>";
	    }
            return false;
	  }
           return false;
        }); 
        return false;
     });   
    </script>
</html>
