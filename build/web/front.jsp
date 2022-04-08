<%-- 
    Document   : front
    Created on : 14 Oct, 2021, 3:49:09 PM
    Author     : HP
--%>
<%@page import="mysqlconnection.Connectionmaker"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@include file="index.jsp" %>
<%@page  autoFlush="true" buffer="1094kb" %>
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
<script src="https://app.enzuzo.com/apps/enzuzo/static/js/__enzuzo-cookiebar.js?uuid=9d699b0a-3d96-11ec-88f8-f35b8daf9bd5"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<style>
    #ss span a
    {
        text-decoration: none;
        color:white;
    }
    #r{
       padding-top:20px;
       padding-bottom:20px;
       
       
    }
   @media (max-width:600px)
   {
       #r .row .col-sm-3
       {
           padding-top:10px;
       }
   }
   #img
   {
       background-image:url("33120.jpg");
       
   }
    button a
    {
        text-decoration:none;
        color:white;
    }
    #footer1 ul{
        margin-top:70px;
    } 
   #footer1 ul li
    {
        display:inline;
        padding:30px;
    }
   #footer1 ul li a
    {
        text-decoration: none;
        font-size:22px;
    }
    #pp
    {
        
    }
    @media (max-width:600px){
    #latest #rr
    {
        margin-right: 50px;
    }
    }
    #changing
    {
         
        position:fixed;
       
    }
</style>
    </head>
    <body id="about">
        
   
        
        <div style="background-color:#00b8e6" id="img"><br>
           
             <br><br>
             <div id="pp">
             <h2 class="text-center" style="color:white;">Car Hire ? Search, Compare & Save</h2>
              <h4 style="color:white;" class="text-center">Search Best Deal For You & Free Cancle Service Full Customer Support </h4>
             </div>
             <div id="r" class="container shadow bg-warning">
        <div class="row " >
            
            <div class="col-sm-3">
                <input type="text" class="form-control" placeholder="SOURCE" id="source"/>
            </div>
            <div class="col-sm-3">
                <input type="text"class="form-control" placeholder="DESTINATION" id="destination"/>
            </div>
            <div class="col-sm-3" >
                <input type="text" class="form-control" placeholder="RIDING DATE" onfocus="(this.type='date')" id="date"/>
            </div>
            <div class="col-sm-3">
                <button class="btn btn-secondary"><i class="fa fa-search" id="submit"> SEARCH FOR RIDE</i> </button>
            </div>
                </div>
            
            
            
        </div>
             <br><br>
    </div>
        
       
       
        
        
        
         
        <br><br><br>
        <div class="container" style="margin:auto" >
            <div class="row" >
                <div class="col-sm-4 ">
                    
                    <i class="fa fa-calendar" aria-hidden="true" style="font-size:50px"></i>
                       <hr>
                       <h5>Flexible Rentals</h5>
                    <p>Cancle Booking within 48 hours before Journey is available and refundable</p>
                   
                </div><br>
                <div class="col-sm-4">
                    
                    <i class="fa fa-money" aria-hidden="true" style="font-size:50px"></i>
                    <hr>
                     <h5>No Hidden Fees</h5>
                    <p>10 percent of money deducted from the car owner account but not from buyer account</p>
                   
                </div><br>
                <div class="col-sm-4 ">
                     
                    <i class="fa fa-check" aria-hidden="true" style="font-size:50px"></i>
                       <hr>
                       <h5>Full Verification</h5>
                    <p>We Verified All documents of Both Party After That We Confirm The Booking </p>
                   
                </div>
            </div>
        </div>
        <br><br><br><br><br>
        <div class="container" id="latest">
            <h3 class="text-center">Latest Added Journey</h3>
            <div class="row text-center" style="margin-left:50px;" id="rr">
                <%  
                try
                {
              Connection con=Connectionmaker.maker();
              PreparedStatement pt=con.prepareStatement("select *from booking limit 4");
            ResultSet rt=pt.executeQuery();
            while(rt.next())
            {
                if(rt.getInt("status")==0){
                
                %>
                <div class="col-sm-2 card shadow"style="font-weight:600;font-size:18px;width:330px" id="dd">
                    <br>
                    <span class="text-center"> <%=rt.getString("source")%> &nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-arrow-right"></i> &nbsp;&nbsp;&nbsp;&nbsp;<%=rt.getString("destination")%></span>
                    <span  class="text-center"> <%=rt.getString("daate")%> </span>
                <span  class="text-center"><i class="fa fa-dollar"></i> &nbsp;&nbsp;<%=rt.getString("price")%> </span>
                 <span><% out.println("<td><button class='btn bg-warning'><a href='PayLogin.jsp?id="+rt.getInt("id")+"'>Confirm Payment</a></button></td>");
                         %></span>
                         <br><br>
                </div>&nbsp;&nbsp;<br><br><br>
                <%
                }
            }
                }catch(Exception e)
                {
                    
                }
                %>
            </div><br><br>
            
        </div>
            <hr>
            <div class="container">
                <h4 class="text-center">Mostly Asking Question</h4>
                <div>
                    <details>
                        <summary>How To Use This Site?</summary>
                        You Just need to put Your source place and destination place and date when you want to go
                        and just click on button"SEARCH FOR RIDE" and you were redirect to the page where you get more then 2 choices you can choose any of one which is in your bugdet
                    </details>
                     <details>
                        <summary>Why Their is Latest Added Journey?</summary>
                       We add most searching journey in latesh added journey where you donot need to put search destination date you directly book the ride for you without wasting time on search the ride    
                     </details>
                     <details>
                        <summary>Is their is refund policy?</summary>
                       Yes if you or car owner cancle the drive the money will refund in 24 hours 
                     </details>
                    <details>
                        <summary>Is it complusory to pay online?</summary>
                      Yes this is a complusory part.but donot affriad your money is total save   
                    </details>
                    <details>
                        <summary>What about Safety?</summary>
                         we provide full safety to our customer.we verified both customer adhar card manually. 
                    </details>
                    <details>
                        <summary>How i added ride?</summary>
                       You just need to click on login button and registered your self.after registration you can add journey from your dashboard     
                    </details>
                </div>
                
            </div>
        
        
        
        
        
        
        
        <br>
        <div>
        <div class="footerstart" style="height:80px;background-color:deepskyblue;padding-top:30px;">
            <div class="container text-center" id="ss" >
                <span><a href="privacy.jsp">Privacy Notice</a></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <span><a href="https://portal.termshub.io/hoteltechfix.000webhostapp.com/website_tos/">Terms&Condition</a></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               
            </div>
         </div>
            <div style="background-color:whitesmoke;min-height:30px" class="row">
                <br>
               
                <div style="float:left" id="footer1" class="col-sm-7">
                    <ul>
                        <li><a href=""><i class="fa fa-facebook circle"></i></a></li>
                         <li><a href=""><i class="fa fa-twitter circle"></i></a></li>
                          <li><a href=""><i class="fa fa-google-plus circle"></i></a></li>
                           <li><a href=""><i class="fa fa-dribbble circle"></i></a></li>
                          
                            
                    </ul>
                    <h5 class="text-center">Service</h5>
                    <div style="">
                        <a href="https://studio.youtube.com/channel/UCfYUlExFbB-zibr7bZcHvkQ/videos/upload?filter=%5B%5D&sort=%7B%22columnType%22%3A%22date%22%2C%22sortOrder%22%3A%22DESCENDING%22%7D"><p class="text-center">Car Polling</p></a>
                        <a href="https://studio.youtube.com/channel/UCfYUlExFbB-zibr7bZcHvkQ/videos/upload?filter=%5B%5D&sort=%7B%22columnType%22%3A%22date%22%2C%22sortOrder%22%3A%22DESCENDING%22%7D"><p class="text-center">Web Development</p></a>
                        <a href="https://studio.youtube.com/channel/UCfYUlExFbB-zibr7bZcHvkQ/videos/upload?filter=%5B%5D&sort=%7B%22columnType%22%3A%22date%22%2C%22sortOrder%22%3A%22DESCENDING%22%7D"><p class="text-center">Java Learning</p><br></a>
                    </div>
                </div>
                <br>
                 <div style="float:right;padding:30px;" class="col-sm-4 border border-left " id="j">
                     
                     <h4 class="text-center">Query Section</h4>
                     <hr>
                    <div style="background-color:white;padding:10px">
                        <br>
                        <form >
                        <input type="text" class="form-control" placeholder="Email Id" id="Email"><br>
                          <input type="text" class="form-control" placeholder="UserName" id="UserName"><br>
                          <textarea class="form-control" placeholder="Message" id="Message"></textarea><br>
                          <input type="submit" value="Submit" class="btn bg-warning" id="regsub2" style="width:100%;color:white"><br>
                        </form>
                          
                          </div>
                </div>
            </div>
        </div>
    </body>
    <script>
      $(document).ready(function(){
         $("#submit").click(function(){
            var source=$("#source").val(); 
            var destination=$("#destination").val(); 
            var date=$("#date").val(); 
             var req=new XMLHttpRequest();
	  req.open("POST","Data.jsp?source="+source+"&destination="+destination+"&date="+date+"",true);
          
	  req.send();
	  req.onreadystatechange =()=>{

	    if(req.readyState === 4 && req.status===200)
	    {
                
	       //document.getElementById("danger").innerHTML=req.responseText;
	       window.location.href="show.jsp";
            }
            
	    if(req.status===201)
	    {
	      toastr.error('No Car Available.');}
	  }
	  return false;
        
         }); 
      });    
    </script>
    <script>
         $(document).ready(function(){
         $("#regsub2").click(function(){
            var Email=$("#Email").val(); 
            var UserName=$("#UserName").val(); 
            var Message=$("#Message").val(); 
             var req=new XMLHttpRequest();
	  req.open("POST","message.jsp?Email="+Email+"&UserName="+UserName+"&Message="+Message+"",true);
          
	  req.send();
	  req.onreadystatechange =()=>{

	    if(req.readyState === 4 && req.status===200)
	    {
                
	       //document.getElementById("danger").innerHTML=req.responseText;
	      toastr.success('Your message is saved Successfully we will contact you soon');
              $("#Email").val(" ");
              $("#Message").val(" ");
              $("#UserName").val(" ");
              return false;
          }
            else if(req.status===201)
	    {
	      toastr.error('Something is wrong .');
          }
	  }
	  return false;
        
         }); 
      }); 
      $(document).ready(function(){
        var a=0; 
        $("#changing1").click(function(){
             
             
             $("#about").css("background-color",$("#changing1").val());
             $("#about").css("color","white");
             
         });
         
         }); 
     
    </script>
</html>
