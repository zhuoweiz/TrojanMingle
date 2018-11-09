import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Filter")
public class Filter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("In the sr_servlet------------------->");
       //get filters
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String major = request.getParameter("major");
		System.out.println("major= " + major);
		System.out.println("age= " + age);
		System.out.println("gender= " + gender);
		
		PrintWriter out = response.getWriter();
		
		response.setContentType("text/html");
        
		Connection conn = null;
	    ResultSet rs = null;
	    ResultSet friends = null;

		PreparedStatement preparedStatement = null;
		String insertTableSQL = "";
							
	    try {
	    	Class.forName("com.mysql.jdbc.Driver");
	        conn = DriverManager.getConnection("jdbc:mysql://localhost/trojanmingle?user=root&password=root&useSSL=false&AllowPublicKeyRetrieval=True");
	        
	        //search users in database based on filters
	        insertTableSQL = "SELECT * from users where major = '" + major + "' and age = '" + age  + "' and gender= '" + gender + "'";
	        
			preparedStatement = conn.prepareStatement(insertTableSQL);  
			rs = preparedStatement.executeQuery();
			//array of users that meet criteria
	        ArrayList<String> results = new ArrayList<String>();
       
	        while (rs.next()) {
	        	String potential = rs.getString("fname");
	        	results.add(potential);
	        }
	        
			//print the name of user
			for (int i = 0; i < results.size(); i++) {
				
		        insertTableSQL = "SELECT * from users where fname = '" + results.get(i) + "'";
				preparedStatement = conn.prepareStatement(insertTableSQL);  
				friends = preparedStatement.executeQuery();
				friends.next();
				String name = friends.getString("fname");
				out.println("<figcaption id = \"cap\">" + name  + "</figcaption>");								
			}					
			System.out.println("passed results...");
	        
	    } catch (SQLException sqle) {
	        System.out.println("Here1");	    	
	    	System.out.println (sqle.getMessage());
	    } catch (ClassNotFoundException cnfe) {
	        System.out.println("Here2");	    	
	    	System.out.println (cnfe.getMessage());
	    } finally {
	    	try {
	    		if (rs != null) {
	    			rs.close();
	    		}
	    		if (preparedStatement != null) {
	    			preparedStatement.close();
	    		}
	    		if (conn != null) {
	    			conn.close();
	    		}
	    	} catch (SQLException sqle) {
		        System.out.println("Here3");
	    		System.out.println(sqle.getMessage());
	    	}
	    }
	}
	
	
}