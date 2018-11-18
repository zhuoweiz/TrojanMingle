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
    	System.out.println("ChatServlet working...");
        
		Connection conn = null;
	    ResultSet twoway = null;
	    ResultSet userIDs = null;
	    ResultSet messages = null;
	    Statement st = null;
	    
	    Statement newst = null;
		
		//assuming userID is passed in with AJAX request
		int userID = Integer.parseInt(request.getParameter("userID"));
		
		//list to hold all the chats the current user has
		ArrayList<Chat> chats = new ArrayList<Chat>();
	    	
	    try {
	    	
	    	Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/trojanmingle?user=root&password=cs201sql&useSSL=false&useLegacyDatetimeCode=false&serverTimezone=UTC");
			st = conn.createStatement();
	        
			
			newst = conn.createStatement();
	        //select the emails (distinct keys) from two way matches with the current user
	        twoway = st.executeQuery("SELECT DISTINCT u.email FROM Matches m, Users u WHERE m.userID="+userID+" AND u.userID=m.liked AND (u.email) IN " + 
	       		"(SELECT u.email FROM Matches m, Users u WHERE m.liked="+userID+" AND u.userID=m.userID);");
			
	        ArrayList<ResultSet> sets = new ArrayList<ResultSet>();
	        ArrayList<ResultSet> users = new ArrayList<ResultSet>();
	        int counter = -1;
	        int userCounter = -1;
	        
	        //for all people current user has two-way match with
	        while(twoway.next()) {
	        	String email = twoway.getString("email");
	        	
	        	//get the userID and name associated with that email
	        	users.add(newst.executeQuery("SELECT userID, fname FROM Users WHERE email='"+email+"';"));
	        	userCounter++;
	        	users.get(userCounter).first(); //should only be one user associated with given email
	        	int likedID = users.get(userCounter).getInt("userID"); //userIDs.getInt("userID");
	        	String fname = users.get(userCounter).getString("fname"); //userIDs.getString("fname");
	        	
	        	//System.out.println("userID: "+likedID+"\nname: "+fname);

	        	//get all messages sent and recieved between the two users
	        	sets.add(newst.executeQuery("SELECT message, senderID FROM MessageHistory WHERE (senderID="+userID+" AND receiverID="+likedID+") "
	        			+ "OR (senderID="+likedID+" AND receiverID="+userID+") ORDER BY chatID;"));
	        	counter++;
	        	
	        	Chat ch = new Chat(fname, new ArrayList<Message>());
	        	
	        	while(sets.get(counter).next()) {
	        		
	        		int senderID = sets.get(counter).getInt("senderID");
	        		String message = sets.get(counter).getString("message");
	        		
	        		//System.out.println("name: "+fname+"\nmessage: "+message);
	        		//add message to message list
	        		ch.addMessage(new Message(senderID, message));
	        	}
	        	
	        	chats.add(ch); //add current chat to list of chats
	        	//sets.get(counter).close();
	        }
	        
	        //printing out all messages for debugging purposes
	        for(int i = 0; i < chats.size(); i++) {
	        	ArrayList<Message> msgs = chats.get(i).getMessages();
	        	System.out.println(chats.get(i).getName());
	        	
	        	for(int j = 0; j < msgs.size(); j++) {
	        		System.out.println(msgs.get(j));
	        	}
	        }
	        
	        //send list of chats to chat.jsp
	        request.setAttribute("chats", chats);
	        request.setAttribute("userID", userID);     
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
				
//				zhuowei's edit
				response.setContentType("text.jsp");
				
				System.out.println("Finally");
				
				//should redirect to chat page
				String nextJSP = "/chat.jsp";
//				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
//				dispatcher.forward(request, response);
				RequestDispatcher dispatch = request.getRequestDispatcher(nextJSP);
				dispatch.forward(request, response);
	    	
	    	
	    }
	    
	}

}
