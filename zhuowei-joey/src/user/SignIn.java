package user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignIn
 */
@WebServlet("/SignIn")
public class SignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignIn() {
        super();
        // TODO Auto-generated constructor stub
    }

	
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("Trying to login");
    	String userName = request.getParameter("userName");
    	String password = request.getParameter("pw");
    	
    	Connection conn = null;
	    Statement st = null;
	    ResultSet rs = null;
	    PreparedStatement ps = null;
	    
	    try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/trojanmingle?user=root&password=cs201sql&useSSL=false");
			System.out.println("Found the driver");
			
			ps = conn.prepareStatement("SELECT userID FROM Users WHERE email=? AND hashedpw=?");
			ps.setString(1, userName+"@usc.edu");
			ps.setString(2, password);
			
			System.out.println(userName);
			System.out.println(password);
			
			rs = ps.executeQuery();
			
			if (rs.next()) {
				// XXX
				// Redirect
				// Session storage and multithreading 
				System.out.println("Logged in!");
				//TODO
				int userID = rs.getInt("userID");
				
				request.setAttribute("userID", userID);
				request.setAttribute("guest", "false");
				
				try {
					RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/DisplayUserServlet");
//					RequestDispatcher rd = request.getRequestDispatcher("/DisplayUserServlet");
					dispatcher.forward(request,response);
				} catch (java.lang.NumberFormatException e) {
					// TODO: handle exception
					System.out.println("exception: " + e.getMessage());
				}
				
				
//				RequestDispatcher dispatcher = request.getRequestDispatcher("DisplayUserServlet?guest=false");
//				dispatcher.forward(request, response);     
			} else {
				System.out.println("Not logged in!");
				//TODO
				request.setAttribute("fail", "Invalid username or password");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/Signin.jsp");
				dispatcher.forward(request, response);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	    
	    
    }

}

