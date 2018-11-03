<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.ArrayList" import="user.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Browse</title>
</head>

<script>
	var count = 1; //variable to keep track of which user we're on
	
	document.onkeydown = checkKey; //when any key is pressed, check it
	
	//right arrow key was pressed - send info to match servlet and display new user
	function right() {
		console.log("right arrow key pressed");
		
		
	}
	
	//left arrow key was pressed - display new user
	function left() {
		console.log("left arrow key pressed");
		
		
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

<body>
	<%
		//assuming parameter called "users" is an ArrayList of User objects passed from servlet	
		ArrayList<User> users = new ArrayList<User>();
		users.add(new User("Jeff", "jeff.jpg", "I'm a CS teacher and proud father of soccer stars", "Computer Science", "Graduate", "Male", 
			"coffee", 40, 3));
		users.add(new User("Michael", "michael.jpg", "I'm a CS teacher and love algorithms", "Computer Science", "Undergraduate", "Male", 
				"dinner", 35, 2));
		//(ArrayList<User>)request.getAttribute("users");
	%>
	<div id="outercontainer">
		<div id="user" style="margin-top: 10%; margin-left: auto; margin-right: auto; text-align: center;">
			<!-- obviously we want to clean this up, but this will be the initial user shown -->
			<p><%= users.get(0).getProfilePic() %></p>
			<p><%= users.get(0).getName() %></p>
			<p><%= users.get(0).getGender() %></p>
			<p><%= users.get(0).getAge() %></p>
			<p><%= users.get(0).getBio() %></p>
			<p><%= users.get(0).getMajor() %></p>
			<p><%= users.get(0).getStanding() %></p>
			<p><%= users.get(0).getYear() %></p>
			<p><%= users.get(0).getIdealDate() %></p>
			
		</div>
	</div>
</body>
</html>