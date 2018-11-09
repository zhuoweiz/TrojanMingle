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
		
		//assuming userID passed in from other servlet call redirecting to browse page
		int userID = 3; //(int)request.getAttribute("userID");
		
		//assuming parameter called "users" is an ArrayList of User objects passed from servlet	
		ArrayList<User> users = new ArrayList<User>(); //(ArrayList<User>)request.getAttribute("users");
		users.add(new User(1, "Jeff", "jeff.jpg", "I am a CS teacher and proud father of soccer stars", "Computer Science", "Graduate", "Male", 
			"coffee", 40, 3));
		users.add(new User(2, "Michael", "michael.jpg", "I am a CS teacher and love algorithms", "Computer Science", "Undergraduate", "Male", 
				"dinner", 35, 2)); 
		users.add(new User(3, "Sandra", "sandra.jpg", "I am a CS teacher and love CS104 and pointers", "Computer Engineering", "Graduate", "female", 
				"sports", 30, 3));
		//so apostrophes are going to be an issue, if we want to care about that
		
	%>
	<div id="outercontainer">
		<div id="user" style="margin-top: 10%; margin-left: auto; margin-right: auto; text-align: center;">
			<!-- obviously we want to clean this up, but this will be the initial user shown -->
			<p id="profilepic"><%= users.get(0).getProfilePic() %></p>
			<p id="otherID" style="display: none;"><%= users.get(0).getUserID() %></p>
			<div id="info"><%= users.get(0).toString() %></div>
			
		</div>
	</div>
	<!-- hide all the users in the list in hidden divs -->
	<% for(int i = 1; i < users.size(); i++) { %>
		<div id="<%= i %>" style="display: none;"><%= users.get(i).toString() %></div>
		<div id="<%= i %>id" style="display: none;"><%= users.get(i).getUserID() %></div>
	<% } %>
	
	<!-- put current userID in hidden form field -->
	<input type="hidden" id="userID" value="<%= userID %>">
	
</body>

<script>
	var count = 1; //variable to keep track of which user we're on
	
	document.onkeydown = checkKey; //when any key is pressed, check it
	
	function changeUserDisplayed() {
		if(count < <%= users.size() %>) { 
			document.getElementById("info").innerHTML = document.getElementById(String(count)).innerHTML;
			document.getElementById("otherID").innerHTML = document.getElementById(String(count)+"id").innerHTML;
			
			console.log("count: "+count+"\nuserID: "+document.getElementById(String(count)+"id").innerHTML);
			
			count++;
		}
		else { 
			document.getElementById("info").innerHTML = "No more users to display";
		 }
	}
	
	//right arrow key was pressed - send info to match servlet and display new user
	function right() {
		console.log("right arrow key pressed");
		var userID = document.getElementById("userID").value;
		var liked;
		
		if(count > 1) {
			liked = document.getElementById(String(count-1)+"id").innerHTML;
		}
		else { //picking the first user that shows on the browse page, which has a different div name pattern
			liked = document.getElementById("otherID").innerHTML;
		}
		
		console.log("current user: "+userID+"\nliked user: "+liked);
		
		var xhttp = new XMLHttpRequest();
		xhttp.open("POST", "MatchServlet", true);
		xhttp.onreadystatechange = function() {
			
			//probably notify the current user here?
			console.log("in callback function");
		} 
		
		xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhttp.send("userID="+userID+"&liked="+liked);
		
		changeUserDisplayed();
	}
	
	//left arrow key was pressed - display new user
	function left() {
		console.log("left arrow key pressed");
		
		changeUserDisplayed();
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