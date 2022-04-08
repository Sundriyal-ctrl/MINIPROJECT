package Mailing;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class InformMail {
    public void send(String mail,String name) throws MessagingException
     {
         String destmailid = mail; 
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
        int min=2000;
        int max=4000;
        Message messageobj = new MimeMessage(sessionobj); 
	messageobj.setFrom(new InternetAddress(sendrmailid)); 
	messageobj.setRecipients(Message.RecipientType.TO,InternetAddress.parse(destmailid)); 
	messageobj.setSubject("NEW JOURNEY IS ADDED"); 
        messageobj.setContent("<div style='padding:20px;background-color:deepskyblue;border:2px;color:white;height:250px;font-size:18px;'><h6>Hey "+name+"<br>I do this mail regarding to Update you that someone upload new journey details.check and enjoy journey</h6><br></div>","text/html");
	 
	Transport.send(messageobj); 
	System.out.println("Your email sent successfully...."); 
   }
}
