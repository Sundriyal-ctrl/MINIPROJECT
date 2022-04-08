/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class confirm extends HttpServlet {

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
            {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter() ;
        
             
    }

     

}
