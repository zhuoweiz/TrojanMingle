<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.ArrayList" import="user.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Browse</title>
</head>



<body>
	<%
		int count = 1; //variable to keep track of which user we're on
		//assuming parameter called "users" is an ArrayList of User objects passed from servlet	
		ArrayList<User> users = new ArrayList<User>();
		users.add(new User("Jeff", "jeff.jpg", "I am a CS teacher and proud father of soccer stars", "Computer Science", "Graduate", "Male", 
			"coffee", 40, 3));
		users.add(new User("Michael", "michael.jpg", "I am a CS teacher and love algorithms", "Computer Science", "Undergraduate", "Male", 
				"dinner", 35, 2)); 
		users.add(new User("Sandra", "sandra.jpg", "I am a CS teacher and love CS104 and pointers", "Computer Engineering", "Graduate", "female", 
				"sports", 30, 3));
		//so apostrophes are going to be an issue, if we want to care about that
		//(ArrayList<User>)request.getAttribute("users");
	%>
	<div id="outercontainer">
		<div id="user" style="margin-top: 10%; margin-left: auto; margin-right: auto; text-align: center;">
			<!-- obviously we want to clean this up, but this will be the initial user shown -->
			<p id="profilepic"><%= users.get(0).getProfilePic() %></p>
			<div id="info"><%= users.get(0).toString() %></div>
			
		</div>
	</div>
	<!-- hide all the users in the list in hidden divs -->
	<% for(int i = 1; i < users.size(); i++) { %>
		<div id="<%= i %>" style="display: none;"><%= users.get(i).toString() %></div>
	<% } %>
	
</body>

<script>
	var count = 1; //variable to keep track of which user we're on
	
	document.onkeydown = checkKey; //when any key is pressed, check it
	
	//right arrow key was pressed - send info to match servlet and display new user
	function right() {
		console.log("right arrow key pressed");
		
		//ajax call to servlet here
	}
	
	//left arrow key was pressed - display new user
	function left() {
		console.log("left arrow key pressed");
		
		if(count < <%= users.size() %>) { 
			document.getElementById("info").innerHTML = document.getElementById(String(count)).innerHTML;
			count++;
			console.log(count);
		}
		else { 
			document.getElementById("info").innerHTML = "No more users to display";
		 }
	}
	
	
	//check if key pressed was a right or left arrow key
	function checkKey(e) {
		 e = e || window.event;
		 
		if (e.keyCode == '37') { //left arrow pressed
		     left();
		}
	    
		else if (e.keyCode == '39') { //right arrow pressed
			right();
	    }
	}
	
</script>

</html>