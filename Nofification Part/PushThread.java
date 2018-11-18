import java.net.Socket;
import java.sql.*;


public class PushThread extends Thread{

	private PushServer ps;
	private String userEmail;
	
	public PushThread(Socket s, PushServer ps, String userEmail) {
			this.ps = ps;
			this.userEmail = userEmail;
			this.start();
	}
	
	public void run() {
		while (true) {
			int currentNum = findLikes();
			while (true) {
				int newLike = findLikes();
				synchronized (this) {
					if (newLike>currentNum) {
						System.out.println("Find new likes for" + userEmail); //ps.notify(userEmail)
						currentNum = newLike;
					}
				}
			}
		}
	}
	
	private synchronized int findLikes() {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		int count = 0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/trojanmingle?user=root&password=201&useSSL=false");
		} catch (ClassNotFoundException cnfe) {
			cnfe.printStackTrace();
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}
		
		try {
			ps = conn.prepareStatement("SELECT m.userID FROM Users u, Matches m WHERE m.liked=u.userID AND u.email=?");
			ps.setString(1, userEmail);
			rs = ps.executeQuery();
			
			while (rs.next()) {
				count++;
			}
			
		} catch (SQLException sqle) {
			System.out.println("SQLException in function getFollowProfile");
			sqle.printStackTrace();
		} finally {
			try{
				if (rs!=null){
					rs.close();
					rs = null;
				}
				if(conn != null){
					conn.close();
					conn = null;
				}
				if(ps != null ){
					ps = null;
				}
			}catch(SQLException sqle){
				System.out.println("connection close error");
				sqle.printStackTrace();
			}
		}
		
		return count;
	}
}
