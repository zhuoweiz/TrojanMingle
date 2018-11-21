import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.HashMap;

public class PushServer {
	private HashMap<String, PushThread> map;
	private BufferedReader br;
	
	public PushServer(int port) {
		ServerSocket ss = null;
		map = new HashMap<>();
		try {
			System.out.println("Trying to bind port " + port);
			ss = new ServerSocket(port);
			System.out.println("Bound to port "+port);
			
			while (true) {
				Socket s = ss.accept();
				System.out.println("Connection from " + s.getInetAddress());
				br = new BufferedReader(new InputStreamReader(s.getInputStream()));
				String userEmail = br.readLine();
				
				System.out.println("Connecting from: " + userEmail);
				
				PushThread pt = new PushThread(s, this, userEmail);
				map.put(userEmail, pt);
			}
			
		}catch (IOException ioe) {
			System.out.println("ioe: " + ioe.getMessage());
			ioe.printStackTrace();
		} finally {
			try {
				if (ss!=null) {
					ss.close();
				}
			} catch (IOException ioe) {
				System.out.println("ioe: " + ioe.getMessage());
			}
		}
		
	}
	
	
	
	public static void main(String[] args) {
		new PushServer(8888);
	}
}
