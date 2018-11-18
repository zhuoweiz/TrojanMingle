package user;

import java.util.ArrayList;

public class Chat {
	
	//save userIDs of people user is two way matched with for 
	//insertion purposes (when inserting messages into database)
	//private ArrayList<Integer> userIDs;
	private String name; //names for name on chat sidebar
	private ArrayList<Message> messages;
	
	public Chat(String n, ArrayList<Message> m) {
		//userIDs = u;
		name = n;
		messages = m;
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
}
