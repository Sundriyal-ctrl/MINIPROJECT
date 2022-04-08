
package mysqlconnection;
import java.sql.*;
import mysqlconnection.*;
public class Connectionmaker implements connection {
    public static Connection maker()
    {
        Connection con=null;
        try{
        Class.forName(driver);
       con=DriverManager.getConnection(url,user,password);
        }catch(Exception e)
        {
            System.out.println(e);
        }
       return con;         
    }
}
