<%-- 
    Document   : Dashboard
    Created on : 25 Sep, 2021, 9:14:35 PM
    Author     : HP
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="mysqlconnection.*" import="java.sql.*"%>
 <%
 if(session.isNew())
 {
	 
	 %>
	 <jsp:forward page="loginn.jsp"></jsp:forward>
	 <%
 }
 %>
   
<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/jquery/1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
 <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" integrity="sha512-vKMx8UnXk60zUwyUnUPM3HbQo8QfmNx7+ltw8Pm5zLusl1XIfwcxo8DbWCqMGKaWeNxWA8yrx5v3SaVpMvR3CA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <title>Start Up</title>
  <style>
    body
    {
      margin:0;
      padding:0;
      font-family:"Roboto",sans-serif; 
    }
    header
    {
      position:fixed;
      background:white;
      padding:10px;
      width:100%;
      height:70px; 
    }
    .left-area h3
    {
          color:#fff;
          margin:0;
          text-transform:uppercase;
          font-size:22px;
          font-weight: 900;  
    }
    .left-area1 h3
    {
          color:black;
          margin:0;
          text-transform:uppercase;
          font-size:22px;
          font-weight: 900;  
    }
    .left-area span
    {
      color:#1DC4E7;

    }
    .left-area1 span
    {
      color:#1DC4E7;

    }
    .logout_btn
    {
          padding:5px;
          background:#19B3D3;
          text-decoration: none;
          float:right;
          margin-top:-30px;
          margin-right:40px;
          border-radius:2px;
          font-size:15px;
          font-weight: 600;
          color:#fff; 
          transition: 0.5s;
          transition-property: background; 
    }
    .logout_btn:hover
    {
           background-color: #0D9D6B;

    }
    .sidebar
    {
             background:#2F323A;
             margin-top:70px;
             padding-top: 30px;
             position:fixed;
             left:0;
             width:250px;
             height:100%;
             transition: 0.5s;
             transition-property: left; 
    }
    .sidebar .profile_image
    {
          width:100px;
          height:100px;
          border-radius:100px;
          margin-bottom:10px;  
    }
    .sidebar h4
    {
      color:#ccc;
      margin-top:0;
      margin-bottom:20px;  
    }
    .sidebar a
    {
      color:#fff;
      display:block;
      width:100%;
      line-height:60px;
      text-decoration:none;
      padding-left:40px;
      box-sizing:border-box;  
      border-bottom:2px solid transparent; 
      transition:0.5s;
      transition-property:border;  

    }
    .sidebar a:hover
    {
        transition:1.25s ;
        border-bottom:2px solid #22242A;
        padding-left:10px; 
       
    }
    .sidebar i
    {
          padding-right:10px;


    }
      label #sidebar_btn
      {
        z-index:1;
        color:black;
        position:fixed;
        cursor:pointer;
        left:300px;
        font-size:25px;
        margin:5px 0;
        transition:0.5s;
     transition-property:color;    
      }
      label #sidebar_btn:hover
      {
        color:#19B3D3;
      }
      #check:checked ~ .sidebar
      {
        left:-190px;
      }
      #check:checked ~ .sidebar a span
      {
        display:none;
      }
      #check:checked ~ .sidebar a {
        font-size:20px;
        margin-left:170px;
        width:80px;
      }
      .content
      {
        
        height:100%;
        margin-left:250px;
        /*background:url(3.jpg)no-repeat;*/
        background-position:center;
        background-size:cover;
     
        padding-top:70px; 
        transition:0.5s;
      
      }
      #check:checked ~ .content
      {
        margin-left: 60px;
      }
      #check
      {

        display:none;
      }
     #ddata
     {
      margin-left:100px;
     }
     #btt{
         border:2px solid white;
         border-radius:70%;
         padding:15px;
         text-decoration:none;
         background-color: deepskyblue;
     }
     #btt span
     {
         font-weight:600;
         font-size:18px;
         color:white
     }
     #loo
     {
         width:300px;
         z-index:2;
     }
     
     #loo a
     {
         margin-left:120px;
         margin-top:40px;
         text-decoration:none;
     }
     #err{
         margin-top:100px;
         border:2px solid white;
         border-radius:70%;
         padding:15px;
        
         text-decoration:none;
         background-color: deepskyblue;
     }
     #err span
     {
         font-weight:800;
         font-size:20px;
         color:white
     }
     #loo #fop
     {
         padding-top:300px;
     }
  </style>
</head>
<body >
  <input type="checkbox" id="check">
   <header class="shadow">
 
    <label for="check">
      <i class="fa fa-bars" aria-hidden="true" id="sidebar_btn"></i>
    </label>
    <div class="left-area">
      <h3>IT <span>FETCH</span></h3>

    </div>
       <div style="float:right;margin-top:-30px;margin-right:30px">
           <%! String f; 
           char a; 
           
           %>
           <%
            f=session.getAttribute("name").toString().toUpperCase();
            
          a=f.charAt(0);
            %>
            <a href="" id="btt"><span><% out.println(a);%></span></a>
          
       </div>
          <div style="height:400px;float:right;background-color:white;margin:30px;margin-left:30px;display:none" class=" shadow" id="loo">
              <div style="background-color:gray">
                  <br><br>
                  <a href="" id="err"><span><% out.println(a);%></span></a> 
                  
              </div>
                  <br>
                  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span><% out.println(session.getAttribute("Email"));%></span>
                  
                  <br><br><br><br><br><br><br>
                  <hr>
              <a href="logout.jsp" id="fop"><i class="fa fa-sign-out"></i><span>Logout</span></a>
           </div>   
   </header>
   <div class="sidebar">
    <center>
        <img src="<%out.println("profile.jpg"); %>" alt="" class="profile_image">
       
      <h4><%out.println(session.getAttribute("name")); %></h4>
    </center>
    <hr style="height:2px;border-width:2px;">
    <a href="#dis" id="dash"><i class="fa fa-desktop"></i><span>Dashboard</span></a>
    <a href="#myv" id="data"><i class="fa fa-sliders"></i><span>Component</span></a>
    <a href="#upl" id="update"><i class="fa fa-plus-circle"></i><span>Form</span></a>
    <a href="#about" id="aboutme"><i class="fa fa-info-circle"></i><span>My Booking</span></a>
    <a href="#pass" id="password"><i class="fa fa-cog"></i><span>Setting</span></a>
    
   </div>
 
 <div class="content card-footer ">

<div id="myv" >
    <div id="danger">
        
    </div>
    
    <br>
    <div class="container shadow col-sm-9" style="background-color:white">
        
        <br>
    <div class="container shadow col-sm-10" style="background-color:white">
        <br>
        <h4>UPLOAD DRIVE DETAIL</h4>
        <hr>
        <br>
        <form >
            <input type="text" placeholder="From" class="form-control" required="required" id="from">
            <br>
           <input type="text" placeholder="Destination" class="form-control" required="required" id="destination">
           <br>
            <input type="number" placeholder="Price" class="form-control" required="required" id="price">
           <br>
           <select id="seat" class="form-control">
               <option readOnly>Select No. of Seats Available</option>
               <option value="1">1</option>
               <option value="2">2</option>
               <option value="3">3</option>
               <option value="4">4</option>
           </select> 
           <br>
            <input type="text" placeholder="vechicleNo" class="form-control" required="required" id="vehicleNo">
           <br>
          
            <input type="date" placeholder="Date" class="form-control" required="required" id="date">
           <br>
           <input type="submit" value="Submit" class="btn btn-info" id="regsub">
           <input type="reset" value="Reset" class="btn btn-success">
         
        </form>
       <br>
    </div>
         <br>
    </div>
</div>


     
     
<div id="pass" >
    <br>
    <h4 class="text-center">SETTING</h4>
<div class="col-sm-6" >

<form>
    <span><strong>Change Number</strong><input type="text" class="form-control" value="<%=session.getAttribute("phone") %>" id="cnumber"><br>
        <input type="checkbox" id="1c" class="form-check-input">
        <input type="submit" value="Update Number" id="unum" class="btn btn-info"></span>
        </form>
        <br><br>
        <strong>
            Upload Profile Image
        </strong>   
        <form>
            <input type="file" id="img" value="Upload Profile Picture" class="form-control"><br>
            <input type="submit" value="Upload Profile" id="pp" class="btn btn-info">
        </form>
        <br>
        <br>
        <strong>
            Change Password
        </strong>  
        <br><br>
        <form>
        <input type="text" placeholder="Enter Password" class="form-control" id="pass1"><br>
        <input type="submit" value="Change Password" id="pp1" class="btn btn-info" >
        
</form>

</div>

</div>

 <div id="upl" >
     
     
     
     
 </div>

<div id="dis" style="z-index:0">
  <marquee><strong>Welcome to Our site if you have any query feel free to call in 7895433045</strong></marquee>
  <div id="personal">
  
  </div>


</div>

        
<div id="about" >
    <br>
    <h3 class="text-center">My Booking</h3>
    <div id="myb">
       
    </div>
</div>

 
 
 </div>
</body>

<script >

$(document).ready(function(){
	 $("#about").hide();
   	 $("#upl").hide();
   	 $("#pass").hide();
   	 $("#myv").hide();
   	 $("#dis").show();
   	 $("#cnumber").attr('readonly',true);
	
});
  $(document).ready(function(){
	 $("#dash").click(function(){
	   	 $("#about").hide();
	   	 $("#upl").hide();
	   	 $("#pass").hide();
	   	 $("#myv").hide();
	   	 $("#dis").show();
	});
  });
  $(document).ready(function(){
		 $("#data").click(function(){
		   	 $("#about").hide();
		   	 $("#upl").hide();
		   	 $("#pass").hide();
		   	 $("#myv").show();
		   	 $("#dis").hide();
		});
	  });
	 $(document).ready(function(){
		 $("#update").click(function(){
		   	 $("#about").hide();
		   	 $("#upl").show();
		   	 $("#pass").hide();
		   	 $("#myv").hide();
		   	 $("#dis").hide();
		}); 
	  
  });
	 $(document).ready(function(){
		 $("#aboutme").click(function(){
		   	 $("#about").show();
		   	 $("#upl").hide();
		   	 $("#pass").hide();
		   	 $("#myv").hide();
		   	 $("#dis").hide();
		}); 
	  
  });
	 $(document).ready(function(){
		 $("#password").click(function(){
		   	 $("#about").hide();
		   	 $("#upl").hide();
		   	 $("#pass").show();
		   	 $("#myv").hide();
		   	 $("#dis").hide();
		}); 
	  
  });
	 
	 $(document).ready(function(){
		 $("#1c").click(function(){
			 if($('#cnumber').is('[readonly]'))
			  $("#cnumber").attr('readonly',false);
			 else
				 $("#cnumber").attr('readonly',true); 
		 });
	 });
</script>
<script>
$(document).ready(function(){
	function disabledPrev(){window.history.forward()}
	window.onload=disabledPrev();
	window.onpageshow = function(evt){if(evt.persisted)disabledBack()}
 	
});
</script>
<script>
$(document).ready(function(){
     $("#regsub").click(function(e){
		 e.preventDefault();
	  var from=$("#from").val();
     var destination=$("#destination").val();
     var seat=$("#seat").val();
     var price=$("#price").val();
	  var date=$("#date").val();
	 var vehicleNo=$("#vehicleNo").val();
        
	  var req=new XMLHttpRequest();
	  req.open("POST","cardetail.jsp?from="+from+"&destination="+destination+"&seat="+seat+"&price="+price+"&date="+date+"&vehicleNo="+vehicleNo+"",true);
          
	  req.send();
	  req.onreadystatechange =()=>{

	    if(req.readyState === 4 && req.status==200)
	    {
	      toastr.success('inserted');
	      $("#from").val(" ");
              $("#destination").val(" ");
              $("#seat").val(" ");
              $("#price").val(" ");
              $("#date").val(" ");
              $("#vehicleNo").val(" ");
                detail()
              
	    }
	    else if(req.status!=200)
	    {
	      toastr.error(req.responseText);
              detail()
	    }
	  }
	  return false;
	  });
    
    
    
    
    
    
    
    
    
	$("#unum").click(function(){
		 
	  var number=$("#cnumber").val();
	 
	  var req=new XMLHttpRequest();
	  req.open("POST","changenumber.jsp?number="+number+"",true);
	  req.send();
	  req.onreadystatechange =()=>{
     if(req.readyState === 4 && req.status==200)
	    {
	      
    	 swal("Good job!","Update will be show when you again login", "success")
	    per();
	    }
	    else
	    {
	    	
	    	sweetAlert("Oops...", "Something went wrong!", "error");
             per();
	    }
            return false;
	  }
	return false;
	
        });
        $("#btt").click(function(e){
            e.preventDefault();
            $("#loo").toggle();
            return false;
        });
        return false;
        
        
        
        
            
        
      
	 
        
        
        
        
        
        
        
        
        
        });
        
        
        
        
        
        
        
        
	function per()
        {
            var req=new XMLHttpRequest();
	  req.open("POST","personalinfo.jsp?id="+<%= application.getAttribute("idd")%>+"",true);
	  req.send();
	  req.onreadystatechange =()=>{
     if(req.readyState === 4 && req.status==200)
	    {
	      
    	 document.getElementById("personal").innerHTML=req.responseText;
	    
	    }
	    else
	    {
	    	
	    	
	    }
            return false;
	  }
         
        }
            
	
        
        	function detail()
        {
            var req=new XMLHttpRequest();
	  req.open("POST","detailpage.jsp?",true);
	  req.send();
	  req.onreadystatechange =()=>{
     if(req.readyState === 4 && req.status==200)
	    {
	      
    	 document.getElementById("upl").innerHTML=req.responseText;
	    
	    }
	    else
	    {
	    	
	    	
	    }
            return false;
	  }
         
        }
        
        
        
        
        
        
        
        
        
        
        
	</script>
        <script>
           $(document).ready(function(){
             per();
             detail();
        return false;
           });
        function per()
        {
            var req=new XMLHttpRequest();
	  req.open("POST","personalinfo.jsp?id="+<%= application.getAttribute("idd")%>+"",true);
	  req.send();
	  req.onreadystatechange =()=>{
        if(req.readyState === 4 && req.status==200)
	    {
	      
    	 document.getElementById("personal").innerHTML=req.responseText;
	    
	    }
	    else
	    {
	    	
	     document.getElementById("personal").innerHTML=req.responseText;
             
	    }
            return false;
	  }
         
        }
            
            
            
           	function detail()
        {
            var req=new XMLHttpRequest();
	  req.open("POST","detailpage.jsp?",true);
	  req.send();
	  req.onreadystatechange =()=>{
     if(req.readyState === 4 && req.status==200)
	    {
	      
    	 document.getElementById("upl").innerHTML=req.responseText;
	    
	    }
	    else
	    {
	    	
	    	
	    }
            return false;
	  }
         
        } 
            
        </script>
        <script>
          
          $(document).ready(function(){
        $(document).on("click","#regsub1",function(){
		 
	  var number=$(this).data("id");
	 
	  var req=new XMLHttpRequest();
	  req.open("POST","deletion.jsp?number="+number+"",true);
	  req.send();
	  req.onreadystatechange =()=>{
     if(req.readyState === 4 && req.status==200)
	    {
	      
    	 swal("Deleted!","Booking Deleted", "success")
	    detail();
	    }
	    else
	    {
	    	
	    	sweetAlert("Oops...", "Something went wrong!", "error");
            detail();
	    }
            return false;
	  }
	return false;
	
        });
        
        function detail()
        {
            var req=new XMLHttpRequest();
	  req.open("POST","detailpage.jsp?",true);
	  req.send();
	  req.onreadystatechange =()=>{
     if(req.readyState === 4 && req.status==200)
	    {
	      
    	 document.getElementById("upl").innerHTML=req.responseText;
	    
	    }
	    else
	    {
	    	
	    	
	    }
            return false;
	  }
         
        } 
            
    });
    
    
        </script>

        <script>
            
        $(document).ready(function(){
           
        $("#pp1").click(function(e){
		  e.preventDefault();
	  var pass=$("#pass1").val();
	 
	  var req=new XMLHttpRequest();
	  req.open("POST","cpassword.jsp?pass="+pass+"",true);
	  req.send();
	  req.onreadystatechange =()=>{
          if(req.readyState === 4 && req.status==200)
	    {
	      swal("Changed!","Password Changed Successfully", "success");
              $("#pass1").val(" ");
	    }
	    else if(req.status!=200)
	    {
	    	
	    	sweetAlert("Oops...", "Something went wrong!", "error");
            
	    }
            return false;
	  }
	return false;
	
        });
        return false;
    });
        </script>
        <script>
            $(document).ready(function(){
               $("#pp").click(function(e){
                  e.preventDefault();
                   var pass=$("#img").val();
	 
	  var req=new XMLHttpRequest();
	  req.open("POST","image.jsp?image="+pass+"",true);
	  req.send();
	  req.onreadystatechange =()=>{
          if(req.readyState === 4 && req.status==200)
	    {
	      swal("Changed!","Profile Changed Successfully", "success");
              $("#pass1").val(" ");
	    }
	    else if(req.status!=200)
	    {
	    	
	    	sweetAlert("Oops...", "Something went wrong!", "error");
            
	    }
            return false;
	  }
	return false;
                 
               }); 
            });
        </script>
        <script>
            $(document).ready(function(){
               details(); 
            });
            
            
            function details()
        {
            var req=new XMLHttpRequest();
	  req.open("POST","bookingdetails.jsp?",true);
	  req.send();
	  req.onreadystatechange =()=>{
     if(req.readyState === 4 && req.status==200)
	    {
	      
    	 document.getElementById("myb").innerHTML=req.responseText;
	    
	    }
	    else
	    {
	    	
	    	
	    }
            return false;
	  }
         
        }
        
            
            </script>

</html>
