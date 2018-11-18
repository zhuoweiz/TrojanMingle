import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

public class TestPushClient extends Thread{
	private BufferedReader br;
	private PrintWriter pw;
	
	public TestPushClient() {
		Socket s = null;
		try {
			s = new Socket("localhost", 8888);
			br = new BufferedReader(new InputStreamReader(s.getInputStream()));
			pw = new PrintWriter(s.getOutputStream());
			
			pw.println("jeff@usc.edu"); //test different user
			pw.flush();
			this.start();
			
		} catch (IOException ioe) {
			System.out.println("ioe closing studd: "+ ioe.getMessage());
		} finally {
			try {
				if (br!=null) {
					br.close();
				}
				if (pw!=null) {
					pw.close();
				}
			} catch (IOException ioe) {
				System.out.println("ioe closing studd: "+ ioe.getMessage());
			}
		}
	}
	
	public void run() {
		while (true) {
			//receive the update and change ?
		}
	}
	
	public static void main(String[] args) {
		new TestPushClient();
	}
}
