package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.User;

@WebServlet("/DisplayUserServlet")
public class DisplayUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 public DisplayUserServlet() {
		 super();
        // TODO Auto-generated constructor stub
    }
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//response.setContentType("text/html");
        
		Connection conn = null;
	    ResultSet rs = null;
	    ResultSet friends = null;

		PreparedStatement preparedStatement = null;
		String insertTableSQL = "";
		
		//need to know if person on the website is a guest or user
		//pass boolean parameter "guest" in from whatever page links to browse
		boolean guest = Boolean.parseBoolean(request.getParameter("guest"));
		
	    	
	    try {
	    	
	    	Class.forName("com.mysql.jdbc.Driver");
	        conn = DriverManager.getConnection("jdbc:mysql://localhost/trojanmingle?user=root&password=root&useSSL=false&AllowPublicKeyRetrieval=True");
	        
	        ArrayList<User> results = new ArrayList<User>();
	        
	        if(guest) { //only return 10 users
	        	insertTableSQL = "SELECT userID, fname, picLink, age, major, gender, yr, standing, idealDate, bio FROM Users ORDER BY RAND() LIMIT 10;"; 
	        }
	        
	        else { //return all users found in database
	        	insertTableSQL = "SELECT userID, fname, picLink, age, major, gender, yr, standing, idealDate, bio FROM Users ORDER BY RAND();";
	        	
	        	//assuming we're getting this userID passed in from sign in or sign up servlet
	        	int userID = (int) request.getAttribute("userID"); //assume current userID is also passed in
	        	request.setAttribute("userID", userID); //so we can have this on the JSP
	        
	        }
	        	preparedStatement = conn.prepareStatement(insertTableSQL);  
				rs = preparedStatement.executeQuery();
				  while (rs.next()) {
					  //testing purposes
					  //String potential = rs.getString("fname");
					  System.out.println(rs.getString("fname"));
			        	
			        	//remember to check that we're not displaying the user to themselves
			        	
			        	User insert = new User(rs.getInt("userID"), rs.getString("fname"), 
			        			rs.getString("picLink"), rs.getString("bio"), rs.getString("major"), 
			        			rs.getString("standing"), rs.getString("gender"), rs.getString("idealDate"), rs.getInt("age"), rs.getInt("yr"));
			        	results.add(insert);
			        }
				  
				  System.out.println("test");	
			      request.setAttribute("users", results);
			      
			    //so browse page knows whether this is a guest or a user
			      request.setAttribute("guest", guest); 
			      
			      
	        } catch(SQLException sqle) {
				System.out.println("sqle: " + sqle.getMessage());	
				
			} catch(ClassNotFoundException cnfe) {
				System.out.println("cnfe: "+ cnfe.getMessage());
			}
			finally { 
				try {
						if(rs != null) {
							rs.close();
						}
						if(preparedStatement != null) {
							preparedStatement.close();
						}
						if(conn != null) {
							conn.close();
						}
				} catch(SQLException sqle) {
					System.out.println("sqle closing streams: " + sqle.getMessage());
				}
	    	
	    	
	    }
	    
	    System.out.println("reached redirect");
	    
	    String nextJSP = "/newbrowse.jsp";
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
		dispatcher.forward(request, response);
	    
	}
	
	
}