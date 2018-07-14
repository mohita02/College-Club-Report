
 /* JDBC Java Database Connectivity

Java Program - execution - JDBC- ODBC - DSN - DB*/
package collegeclub;
import java.sql.*;
public class ConnectionClass
{

public Connection con;

public void Connect()
{
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con = DriverManager.getConnection("jdbc:odbc:clubdsn");
System.out.print("Connected");
}
catch(Exception ex)
{

System.out.print("Error in connection"+ex);
}
}

public void DisConnect()
{
try
{
con.close();
System.out.print("DisConnected");
}
catch(Exception ex)
{
System.out.print("Error in disconnecting" + ex);
}
}
public static void main(String a[])
{
ConnectionClass obj = new ConnectionClass();
obj.Connect();
obj.DisConnect();
}
}
/* To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author HP
 */
