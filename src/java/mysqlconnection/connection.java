/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mysqlconnection;



public interface connection {
  String driver="com.mysql.cj.jdbc.Driver";
  String url="jdbc:mysql://localhost:3306/abc";
  String user="root";
  String password="";
}
