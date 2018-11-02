<script>
var serve = "Match_servlet?";
var requeststr = "";
requeststr += "userID="+ userID;
requeststr += "&liked=" + liked;


var xhttp = new XMLHttpRequest();
xhttp.open("POST", serve, true);
xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xhttp.send(requeststr);

</script>

<%



protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String userID = request.getParameter("userID");
	String liked = request.getParameter("liked");		
    Connection conn = null;
    Statement st = null;
    ResultSet rs = null;
	PreparedStatement preparedStatement = null;
	String check = "";
    
	System.out.println("In the user adding servlet ---------------------------------------->");
				
    try {
    	Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost/trojanmingle?user=root&password=root&useSSL=false");
        String insertTableSQL = "INSERT INTO Matches"
					+ "(userID, liked) VALUES"
					+ "(?,?)";
			
		preparedStatement = conn.prepareStatement(insertTableSQL);  
        
       	
       	//Inserting Users's info
		preparedStatement.setString(1, userID);
		preparedStatement.setString(2, liked);
					
		preparedStatement.executeUpdate();
        
        check = "SELECT * from userdata where userID='" + liked  + "' and liked= '" + userID + "'";
		preparedStatement = conn.prepareStatement(check);  
		rs = preparedStatement.executeQuery();
		
			if (rs.next()) {
				//if other person liked you also, notify both users
			
			
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