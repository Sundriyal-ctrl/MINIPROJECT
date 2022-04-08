package Mailing;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {
     Double dd;
    public void Email(String Email) throws ClassNotFoundException, SQLException, InterruptedException
          {
        String destmailid = Email; 
	String sendrmailid = "anujsundriyal1234@gmail.com"; 
	final String uname = "anujsundriyal1234@gmail.com"; 
	final String pwd = "Sundriyal28@"; 
	String smtphost = "smtp.gmail.com"; 
	Properties propvls = new Properties(); 
	propvls.put("mail.smtp.auth", "true"); 
	propvls.put("mail.smtp.starttls.enable", "true"); 
	propvls.put("mail.smtp.host", smtphost); 
	propvls.put("mail.smtp.port", "25"); 
	Session sessionobj =Session.getInstance(propvls,new javax.mail.Authenticator() { 
        @Override
	protected PasswordAuthentication getPasswordAuthentication() { 
	return new PasswordAuthentication(uname, pwd); }
	}
	); 
	try { 
        int min=2000;
        int max=4000;
        Message messageobj = new MimeMessage(sessionobj); 
	messageobj.setFrom(new InternetAddress(sendrmailid)); 
	messageobj.setRecipients(Message.RecipientType.TO,InternetAddress.parse(destmailid)); 
	messageobj.setSubject("ITFETCH"); 
        dd=Math.random()*(max-min+1)+min;
         Integer sd=dd.intValue();
         messageobj.setContent("<div style='padding:20px;color:black;min-height:250px;width:250px;border:1px solid black;border-radius:10px;margin-left:10%;background-color:#001f3f;color:white'><span style='font-weight:800'>IT</span><span style='font-weight:800;color:deepskyblue;'>FETCH</span><hr></span><br><br>Your OTP is<br><strong>"+sd.toString()+"</strong><br><br><br>Please note that this code is valid for 3 minutes and can be used only once.For optimum security.please don't share OTP with anyone<br><h5>CONTACT US HERE</h5><hr><br>ayushinegi232@gmail.com<br>7895433045</div>","text/html");
	 
	Transport.send(messageobj); 
	System.out.println("Your email sent successfully...."); 
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/abc","root","");
        PreparedStatement pt=con.prepareStatement("insert into opt values(?)");
        pt.setInt(1,sd);
        pt.execute();
        Thread.sleep(300000);
            deletion(sd);
	} 
	catch (MessagingException exp) { 
	 System.out.println(exp.getMessage());
	}
          }
     void deletion(int otp)
          {
              try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/abc","root","");
        PreparedStatement pt=con.prepareStatement("delete from opt where ott=?");
        pt.setInt(1,otp);
        pt.execute();
              }catch(Exception e)
              {
                  System.out.println(e.getMessage());
              }
              
              }
   
}
