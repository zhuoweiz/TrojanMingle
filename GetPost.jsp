
<script>
// PUTTING A NEW USER WHO SIGNS UP INTO THE DATABASE
// CREATE USER SERVLET on diagram
	
var serve = "Servlet";
var requeststr = "";
requeststr += "fname="+ fname;
requeststr += "&hashedpw=" + hashedpw;
requeststr += "&picLink="+ picLink;
requeststr += "&email="+ email;
requeststr += "&major=" + major;
requeststr += "&age=" + age;
requeststr += "&gender=" + gender;
requeststr += "&yr=" + yr;
requeststr += "&standing=" + standing;
requeststr += "&idealDate=" + idealDate;
requeststr += "&lastLogin=" + lastLogin;
requeststr += "&bio=" + bio;

var xhttp = new XMLHttpRequest();
xhttp.open("POST", serve, true);
xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xhttp.send(requeststr);
</script>

<%
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String fname = request.getParameter("fname");
	String email = request.getParameter("email");
	String picLink = request.getParameter("picLink");
	String age = request.getParameter("age");
	String major = request.getParameter("major");
	
	//deal with hashing this password somehow maybe?
	String hashedpw = request.getParameter("hashedpw");
	String gender = request.getParameter("gender");
	
	String yr = request.getParameter("yr");
	String standing = request.getParameter("standing");
	String idealDate = request.getParameter("idealDate");
	String lastLogin = request.getParameter("lastLogin");
	
		
    Connection conn = null;
    Statement st = null;
    ResultSet rs = null;
	PreparedStatement preparedStatement = null;
    
	System.out.println("In the user adding servlet ---------------------------------------->");
				
    try {
    	Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost/userdatabase?user=root&password=root&useSSL=false");
        
	//checking if user already exists in our database
        String insertTableSQL = "SELECT * from Users where email='" + email + "'";
		preparedStatement = conn.prepareStatement(insertTableSQL);  
		rs = preparedStatement.executeQuery();
		
		if (!rs.next()) {// If user doesn't already exist in our database
			
		
			insertTableSQL = "INSERT INTO Users"
					+ "(fname, email, picLink, age, major, hashedpw, gender, yr, standing, idealDate, lastLogin, bio) VALUES"
					+ "(?,?,?,?,?,?,?,?,?,?,?,?)";
			
			preparedStatement = conn.prepareStatement(insertTableSQL);  
	        
        	
        	//Inserting User's info
			preparedStatement.setString(1, fname);
			preparedStatement.setString(2, email);
			preparedStatement.setString(3, picLink);
			
			preparedStatement.setString(4, age);
			preparedStatement.setString(5, major);
			preparedStatement.setString(6, hashedpw);
			preparedStatement.setString(7, gender);
			preparedStatement.setString(8, yr);
			preparedStatement.setString(9, standing);
			preparedStatement.setString(10, idealDate);
			preparedStatement.setString(11, lastLogin);
			preparedStatement.setString(12, bio);
			
			
			preparedStatement.executeUpdate();
			
			
			// REDIRECT TO BROWSE PAGE
			
		} else {
			System.out.println("User already exists in the database");
			// SHOW ERROR MESSAGE THROUGH AJAX CALLBACK?
		}
			} catch (SQLException sqle) {
	      	    	
	    	System.out.println (sqle.getMessage());
	    } catch (ClassNotFoundException cnfe) {
	        	    	
	    	System.out.println (cnfe.getMessage());
	    } finally {
	    	try {
	    		if (rs != null) {
	    			rs.close();
	    		}
	    		if (st != null) {
	    			st.close();
	    		}
	    		if (conn != null) {
	    			conn.close();
	    		}
	    	} catch (SQLException sqle) {
		       
	    		System.out.println(sqle.getMessage());
	    	}
	    }
	    // --------------------------------------------------------------------->
	}
}
%>
