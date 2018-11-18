import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Filter")
public class Filter extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("In the sr_servlet------------------->");
       //get filters
		String age1 = request.getParameter("age1");
		String age2 = request.getParameter("age2");
		String gender = request.getParameter("gender");
		String major = request.getParameter("major");
		String idealDate = request.getParameter("idealDate");
	    String yr = request.getParameter("yr");
		System.out.println("major= " + major);
		System.out.println("age1= " + age1);
		System.out.println("gender= " + gender);
		
		PrintWriter out = response.getWriter();
		
		response.setContentType("text/html");
        
		Connection conn = null;
	    ResultSet rs = null;
	    ResultSet friends = null;

		PreparedStatement preparedStatement = null;
		String query = "";
		String insertTableSQL = "";
		boolean flag = false;
							
	    try {
	    	Class.forName("com.mysql.jdbc.Driver");
	        conn = DriverManager.getConnection("jdbc:mysql://localhost/trojanmingle?user=root&password=root&useSSL=false&AllowPublicKeyRetrieval=True");
	        
	        //search users in database based on filters
	        insertTableSQL = "SELECT * from users where major = '" + major + "' and age = '" + age1  + "' and gender= '" + gender + "'";
	        System.out.println(insertTableSQL);
	        query = "SELECT * from users where ";
	        //ArrayList<String> conditions = new ArrayList<String>();
	        if(!gender.equals("Choose...")) {
	        	query += "gender = '" + gender + "'";
	        	flag = true;
	        }
	        if(!age1.equals("Age...") &&  !age2.equals("Age...")) {
	        	if(flag) {
	        	 query += " and age between '" + age1 + "'and'" + age2 + "'";
	        	} else {
	        		query += " age between '" + age1 + "'and'" + age2 + "'";
	        		flag = true;
	        	}
	        } else if(!age1.equals("Age...") &&  age2.equals("Age...")) {
	        	if(flag) {
	        	 query += " and age  = '" + age1 + "'";
	        	} else {
	        		 query += " age  = '" + age1 + "'";
	        		 flag = true;
	        	}
	        } else if(age1.equals("Age...") &&  !age2.equals("Age...")) {
	        	if(flag) {
		        	 query += " and age  = '" + age2 + "'";
		        	} else {
		        		 query += " age  = '" + age2 + "'";
		        		 flag = true;
		        	}
	        }
	        if(!major.equals("Choose...")) {
	        	if(flag) {
		        	 query += " and major  = '" + major + "'";
		        } else {
	        		 query += " major  = '" + major + "'";
	        		 flag = true;
		        }
	        }
	        if(!yr.equals("Choose...")) {
	        	if(flag) {
		        	 query += " and yr  = '" + yr + "'";
		        } else {
	        		 query += " yr  = '" + yr + "'";
	        		 flag = true;
		        }
	        }
	        if(!idealDate.equals("Choose...")) {
	        	if(flag) {
		        	 query += " and idealDate  = '" + idealDate + "'";
		        } else {
	        		 query += " idealDate  = '" + idealDate + "'";
	        		 flag = true;
		        }
	        }
	        System.out.println(query);
	       

	        preparedStatement = conn.prepareStatement(query);  
			rs = preparedStatement.executeQuery();
	        if(!rs.next()) {
	        	//no users match the criteria
	        	String result = "No results matching your criteria";
	        	out.println("<figcaption id = \"cap\">" + result  + "</figcaption>");	
	        
	        	
	        } else {
	        
                rs.beforeFirst();
			ArrayList<User> results = new ArrayList<User>();
		        System.out.println("Here");
		        while (rs.next()) {
		        	User insert = new User(rs.getInt("userID"), rs.getString("fname"), 
		        			rs.getString("picLink"), rs.getString("bio"), rs.getString("major"), 
		        			rs.getString("standing"), rs.getString("gender"), rs.getString("idealDate"), rs.getInt("age"), rs.getInt("yr"));
		        	        results.add(insert);
		        	        System.out.println(rs.getString("fname"));
		        	
		        }
		        request.setAttribute("users", results);
		       			
				System.out.println("passed results...");
		        //ArrayList<String> results = new ArrayList<String>();
		        //System.out.println("Here");
		        //while (rs.next()) {
		        	//String potential = rs.getString("fname");
		        //	System.out.println(potential);
		        //	results.add(potential);
		        //}
		        //for (int i = 0; i < results.size(); i++) {
					
			  //      query = "SELECT * from users where fname = '" + results.get(i) + "'";
			//		preparedStatement = conn.prepareStatement(query);  
			//		friends = preparedStatement.executeQuery();
			//		friends.next();
			//		String name = friends.getString("fname");
			//		out.println("<figcaption id = \"cap\">" + name  + "</figcaption>");								
			//	}					
			//	System.out.println("passed results...");
	        }
			
	        
	    } catch (SQLException sqle) {
	        System.out.println("Here1");
	        
	    	System.out.println (sqle.getMessage());
	    } catch (ClassNotFoundException cnfe) {
	        System.out.println("Here2");	    	
	    	System.out.println (cnfe.getMessage());
	    } finally {
	    	try {
	    		if (rs != null) {
	    			rs.close();
	    		}
	    		if (preparedStatement != null) {
	    			preparedStatement.close();
	    		}
	    		if (conn != null) {
	    			conn.close();
	    		}
	    	} catch (SQLException sqle) {
		        System.out.println("Here3");
	    		System.out.println(sqle.getMessage());
	    	}
	    }
	}
	
	
}
