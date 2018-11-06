package user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class MatchServlet
 */
@WebServlet("/MatchServlet")
public class MatchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MatchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int userID = Integer.parseInt(request.getParameter("userID"));
    	int liked = Integer.parseInt(request.getParameter("liked"));
    	
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
    	PreparedStatement preparedStatement = null;
    	String check = "";
        
    	System.out.println("In the match servlet ---------------------------------------->");
    				
        try {
        	Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/trojanmingle?user=root&password=root&useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC");
            String insertTableSQL = "INSERT INTO Matches"
    					+ "(userID, liked) VALUES"
    					+ "(?,?);";
    			
    		preparedStatement = conn.prepareStatement(insertTableSQL);  
            
           	
           	//Inserting Users's info
    		preparedStatement.setInt(1, userID);
    		preparedStatement.setInt(2, liked);
    					
    		preparedStatement.executeUpdate();
            
    		//check if there exists a two way match between the users
            check = "SELECT * from Matches where userID=" + liked  + " and liked=" + userID + ";";
    		preparedStatement = conn.prepareStatement(check);  
    		rs = preparedStatement.executeQuery();
    		
    		//this returns true if it has a value, meaning the whoever the current just liked already liked them
    		if (rs.next()) { 
    			
    			//NOTIFY BOTH USERS OF A TWO WAY MATCH
    			System.out.println("two way match!");
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
