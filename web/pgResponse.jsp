<%@page import="mysqlconnection.Connectionmaker"%>
<%@page import="Mailing.Mailing2"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Mailing.Mail"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="paytm_java.PaytmConstants"%>
<%@include file="index.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.paytm.merchant.CheckSumServiceHelper"%>

     



<%
Enumeration<String> paramNames = request.getParameterNames();

Map<String, String[]> mapData = request.getParameterMap();
TreeMap<String,String> parameters = new TreeMap<String,String>();
String paytmChecksum =  "";
while(paramNames.hasMoreElements()) {
	String paramName = (String)paramNames.nextElement();
	if(paramName.equals("CHECKSUMHASH")){
		paytmChecksum = mapData.get(paramName)[0];
	}else{
		parameters.put(paramName,mapData.get(paramName)[0]);
	}
}
boolean isValideChecksum = false;
String outputHTML="";
try{
	isValideChecksum = CheckSumServiceHelper.getCheckSumServiceHelper().verifycheckSum(PaytmConstants.MERCHANT_KEY,parameters,paytmChecksum);
	if(isValideChecksum && parameters.containsKey("RESPCODE")){
		if(parameters.get("RESPCODE").equals("01")){
			outputHTML = parameters.toString();
                        Mailing2 m=new Mailing2();
                        try
                        {
                            Connection con=Connectionmaker.maker();
        PreparedStatement pt=con.prepareStatement("select *from login1 where id=?");
         pt.setString(1,(String)application.getAttribute("idd"));
         ResultSet rt=pt.executeQuery();
         rt.next();
         String email=rt.getString("Email");
         String name=rt.getString("name");
         String phone=rt.getString("Number");
         System.out.println(application.getAttribute("idd")+"  "+rt.getString("email"));
         String msg="Car Information is Shared with you Please Donot Share this information With any one else If suppose you share Car owner detail with any one else and they confirm the detail then we are not responsible for this issue "
                 + ""+"\nEmail Id : "+email+"\nName :"+name+"\nPhone : "+phone;
         m.Email((String)application.getAttribute("sending"),msg);
          PreparedStatement pt1=con.prepareStatement("update booking set status=1 where idd=?");
           pt1.setString(1,(String)application.getAttribute("idd"));
           pt1.execute();
         %>
        
             
         </div>        
                 
                 
                 
         <%
                        }catch(Exception e)
                        {
                            
                        }
                        
		}else{
                    
                        try
                        {
                             Mailing2 m=new Mailing2();
                             Connection con=Connectionmaker.maker();
        PreparedStatement pt=con.prepareStatement("select *from login1 where id=?");
         pt.setString(1,(String)application.getAttribute("idd"));
         ResultSet rt=pt.executeQuery();
         rt.next();
         String email=rt.getString("Email");
         String name=rt.getString("name");
         String phone=rt.getString("Number");
         System.out.println(application.getAttribute("idd")+"  "+rt.getString("email"));
         String msg="Car Informatio is Shared with you Please Donot Share this information With any one else If suppose you share Car owner detail with any one else and they confirm the detail then we are not responsible for this issue "
                 + ""+"\nEmail Id : "+email+"\nName :"+name+"\nPhone : "+phone;
         m.Email((String)application.getAttribute("sending"),msg);
         PreparedStatement pt1=con.prepareStatement("update booking set status=1 where idd=?");
           pt1.setString(1,(String)application.getAttribute("idd"));
           pt1.execute();
                        }
                        catch(Exception e)
                        {
                            
                        }
			outputHTML="<b>Payment Failed.</b>";
		}
	}else{
            
            
              
		outputHTML="<b>Checksum mismatched.</b>";
	}
}catch(Exception e){
	outputHTML=e.toString();
}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <link rel="icon" href="https://webdevtrick.com/wp-content/uploads/logo-fb-1.png" type="image/x-icon">
	<meta name="viewport" content="width=device-width,initial-scale=1.0">
	<meta name="author" content="Anuj Sundriyal/Ayushi Sundriyal">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" integrity="sha512-vKMx8UnXk60zUwyUnUPM3HbQo8QfmNx7+ltw8Pm5zLusl1XIfwcxo8DbWCqMGKaWeNxWA8yrx5v3SaVpMvR3CA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

</head>
<body>
    <div class="container col-sm-7">
        <div class="bg-warning"  style=padding:40px;margin:50px;">
            <h5 style="color:white">YOUR BOOKING IS SUCCESSFULLY DONE.ENJOY YOUR BOOKING</h5>
            <span style="padding-left:50%;font-size:35px;"><i class="fa fa-car"></i></span>
        </div>
    </div>
    <div class="container">
        <p style="font-weight:700"> If you have any query please fell free to call me and email me my Email is ayushinegi232@gmail.com and my phone Number is 7895433045
        </p> </div>
</body>
</html>
