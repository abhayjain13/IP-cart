package bean;

import java.sql.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.servlet.http.*;
public class LoginDao extends HttpServlet {

	public static boolean validate(LoginBean bean){
		boolean status=false;
               
		
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con= DriverManager.getConnection("jdbc:mysql:///test","root","");
			Statement stmt=con.createStatement();
			PreparedStatement ps=con.prepareStatement("select * from user where User_Name=? and User_Password=?");
			ps.setString(1,bean.getName());
			ps.setString(2, bean.getPass());
			
			ResultSet rs=ps.executeQuery();
                        status=rs.next();
                       // HttpSession session = request.getSession();
                       if(status)
                            bean.setId(rs.getInt(1));
                       
       // session.setAttribute("MyAttribute", "test value");
			
			
		}catch(Exception e){}
		return status;
	}
}
