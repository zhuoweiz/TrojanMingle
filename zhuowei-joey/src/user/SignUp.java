package user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SignUp
 */

@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

    

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    System.out.println("Trying to update info from frontEnd page");
	    
	    
    	String fname = request.getParameter("fullname");
	    String email = request.getParameter("email");
	   	    
	    String picLink = request.getParameter("imgurl");
	    
	    System.out.println(picLink);
	    
	    int age = Integer.parseInt(request.getParameter("age"));
	    String major = request.getParameter("major");
	    String hashedpw = request.getParameter("hashedpw");
	    String gender = request.getParameter("gender");
	    
	    int yr = Integer.parseInt(request.getParameter("yr"));
	    String standing = request.getParameter("standing");
	    String idealDate = request.getParameter("idealDate");
	    
	    // format the date to stor in the database
	    Date date = new Date();
	    String strDateFormat = "E, MMM dd yyyy HH:mm:ss z";
	    DateFormat dateFormat = new SimpleDateFormat(strDateFormat);
	    String lastLogin= dateFormat.format(date);
	    
	    String bio = request.getParameter("bio");
	        
	    Connection conn = null;
	    Statement st = null;
	    ResultSet rs = null;
	    PreparedStatement preparedStatement = null;
	    
	    System.out.println("In the user adding servlet ---------------------------------------->");
	    
	    RequestDispatcher dispatcher = request.getRequestDispatcher("DisplayUserServlet?guest=false");
		dispatcher.forward(request, response); 
		
	    try {
	        Class.forName("com.mysql.jdbc.Driver");
	        //SQL configuration
	        conn = DriverManager.getConnection("jdbc:mysql://localhost/trojanmingle?user=root&password=cs201sql&useSSL=false");
	        
	        String insertTableSQL = "SELECT * from Users where email='" + email + "@usc.edu'";
	        preparedStatement = conn.prepareStatement(insertTableSQL);  
	        rs = preparedStatement.executeQuery();
	        
	        if (!rs.next()) {// If user doesnt exist in our database, insert into database
	            
	        
	            insertTableSQL = "INSERT INTO Users"
	                    + "(fname, email, picLink, age, major, hashedpw,gender, yr, standing,idealDate, lastLogin, bio) VALUES"
	                    + "(?,?,?,?,?,?,?,?,?,?,?,?)";
	            
	            preparedStatement = conn.prepareStatement(insertTableSQL);  
	            
	            //Inserting Users's info
	            preparedStatement.setString(1, fname);
	            preparedStatement.setString(2, email+"@usc.edu");
	            preparedStatement.setString(3, picLink);
	            
	            preparedStatement.setInt(4, age);
	            preparedStatement.setString(5, major);
	            preparedStatement.setString(6, hashedpw);
	            preparedStatement.setString(7, gender);
	            preparedStatement.setInt(8, yr);
	            preparedStatement.setString(9, standing);
	            preparedStatement.setString(10, idealDate);
	            preparedStatement.setString(11, lastLogin);
	            preparedStatement.setString(12, bio);

	            preparedStatement.executeUpdate();
	        } else {
	            System.out.println("User already exists in the database");
	        }
	            } catch (SQLException sqle) {
	                    
	            System.out.println (sqle.getMessage());
	        } catch (ClassNotFoundException cnfe) {
	                        
	            System.out.println (cnfe.getMessage());
	        } finally {
	            try {
	                if (rs != null) {
	                    rs.close();
	                }
	                if (st != null) {
	                    st.close();
	                }
	                if (conn != null) {
	                    conn.close();
	                }
	            } catch (SQLException sqle) {
	               
	                System.out.println(sqle.getMessage());
	            }
	        }
	        // --------------------------------------------------------------------->
	    }
}
