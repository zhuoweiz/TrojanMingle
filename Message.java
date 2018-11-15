package user;

public class Message {
	
	//if == to current user, sent message
	//else, received messages
	private int senderID;
	private String message;
	
	public Message(int s, String m) {
		senderID = s;
		message = m;
	}

	public int getSenderID() {
		return senderID;
	}

	public String getMessage() {
		return message;
	}
	
	public String toString() {
		return message;
	}
}
