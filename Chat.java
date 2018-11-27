package user;

import java.util.ArrayList;

//ADDED USERID AS AN INSTANCE FIELD AND GETTER FOR IT

public class Chat {
	
	//save userIDs of people user is two way matched with for 
	//insertion purposes (when inserting messages into database)
	//private ArrayList<Integer> userIDs;
	private String name; //names for name on chat sidebar
	private String profilepic;
	private ArrayList<Message> messages;
	private int userID;
	
	public Chat(int u, String n, String p, ArrayList<Message> m) {
		userID = u;
		profilepic = p;
		name = n;
		messages = m;
	}
	
	//NEW
	public int getUserID() {
		return userID;
	}
	
	public void addMessage(Message message) {
		messages.add(message);
	}

	/*public ArrayList<Integer> getUserIDs() {
		return userIDs;
	}*/

	public String getName() {
		return name;
	}

	public ArrayList<Message> getMessages() {
		return messages;
	}
	
	public String getProfilePic() {
		return profilepic;
	}
}
