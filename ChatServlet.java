package user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
//import java.sql.PreparedStatement;
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
 * Servlet implementation class ChatServlet
 */
@WebServlet("/ChatServlet")
public class ChatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response.setContentType("text/html");
        
		Connection conn = null;
	    ResultSet twoway = null;
	    ResultSet userIDs = null;
	    ResultSet messages = null;
	    Statement st = null;
		
		//assuming userID is passed in with AJAX request
		int userID = Integer.parseInt(request.getParameter("userID"));
		
		//list to hold all the chats the current user has
		ArrayList<Chat> chats = new ArrayList<Chat>();
	    	
	    try {
	    	
	    	Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/trojanmingle?user=root&password=root&useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC");
			st = conn.createStatement();
	        
	        //select the emails (distinct keys) from two way matches with the current user
	        twoway = st.executeQuery("SELECT DISTINCT u.email FROM Matches m, Users u WHERE m.userID="+userID+" AND u.userID=m.liked AND (u.email) IN " + 
	       		"(SELECT u.email FROM Matches m, Users u WHERE m.liked="+userID+" AND u.userID=m.userID);");
			
	        //LITERALLY CAN'T DO THIS BECAUSE I CAN'T REUSE RESULT SETS
	        // AND I ALSO CAN'T DECLARE THEM DYNAMICALLY
	        
	        //for all people current user has two way matches with
	        while(twoway.next()) {
	        	String email = twoway.getString("email");
	        	//get the userID and name associated with that email
	        	userIDs = st.executeQuery("SELECT userID, fname FROM Users WHERE email='"+email+"';");
	        	userIDs.first(); //moves cursor to first result (should only be one result)
	        	int likedID = userIDs.getInt("userID");
	        	String fname = userIDs.getString("fname");
	        	
	        	//ResultSet messages = null;
	        	//get all messages sent and recieved between the two users
	        	messages = st.executeQuery("SELECT message, senderID FROM MessageHistory WHERE (senderID="+userID+" AND receiverID="+likedID+") "
	        			+ "OR (senderID="+likedID+" AND receiverID="+userID+") ORDER BY chatID;");
	        	
	        	//create new chat for this match pair
	        	Chat ch = new Chat(fname, new ArrayList<Message>());
	        	
	        	//loop through all messages between current user and matched user
	        	while(messages.next()) {
	        		
	        		int senderID = messages.getInt("senderID");
	        		String message = messages.getString("message");
	        		
	        		//add message to message list
	        		ch.addMessage(new Message(senderID, message));
	        	}
	        	
	        	chats.add(ch); //add current chat to list of chats
	        	
	        	//messages.close();
	        
	        }
	        
	        //send list of chats to chat.jsp
	        request.setAttribute("chats", chats);
			      
	        } catch(SQLException sqle) {
				System.out.println("sqle: " + sqle.getMessage());	
				
			} catch(ClassNotFoundException cnfe) {
				System.out.println("cnfe: "+ cnfe.getMessage());
			}
			finally { 
				try {
						if(twoway != null) {
							twoway.close();
						}
						if(userIDs != null) {
							userIDs.close();
						}
						if(messages != null) {
							messages.close();
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
				
				//should redirect to chat page
				String nextJSP = "/chat.jsp";
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
				dispatcher.forward(request, response);
	    	
	    	
	    }
	    
	}

}
