package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SendMessageServlet
 */
@WebServlet("/SendMessageServlet")
public class SendMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//MAKE SURE THESE ARE PROVIDED BY CHAT PAGE
		int currentUser = Integer.parseInt(request.getParameter("userID"));
		int otherUser = Integer.parseInt(request.getParameter("otherID"));
		String message = request.getParameter("message");
		
		
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/trojanmingle?user=root&password=root&useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC");
			st = conn.createStatement();
			
			st.executeUpdate("INSERT INTO MessageHistory(senderID, receiverID, message) VALUES ('"+currentUser+"', '"+otherUser+"', '"+message+"');");
			
			System.out.println("inserted message: '"+message+"' into database");
			
		
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
					if(st != null) {
						st.close();
					}
					if(conn != null) {
						conn.close();
					}
			} catch(SQLException sqle) {
				System.out.println("sqle closing streams: " + sqle.getMessage());
			}
		}
		
		
	}


}
